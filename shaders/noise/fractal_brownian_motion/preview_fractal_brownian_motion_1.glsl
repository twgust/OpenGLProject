#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
#define TWO_PI 6.28318530718
#define PI 3.141592653589793
/** misc_begin **/
float gain(float x, float k) {
    float a = 0.5 * pow(2.0 *((x<0.5) ?x:1.0-x), k);
    return (x<0.5) ?a:1.0-a;
}

float sinc(float x, float k) {
    float a = PI * ((k*x -1.0));
    return sin(a)/a;
}

float wave(float x, float y) {
    float wave = x / y *  y + x;
    return wave;

}
/** misc_end **/

/** TIME_BEGIN **/
float speedFactor = .5; // Adjust this to speed up or slow down the time
float repetitionFactor = 5.; // The duration before repeating
float startOffset = 0.; // Starting offset for the time

float smoothTime(in float time) {
    float scaledTime = (time + startOffset) * speedFactor;
    float phase = mod(scaledTime, repetitionFactor); // Create a repeating pattern
    float triangularWave = 2.0 * abs(phase - repetitionFactor * 0.5) / repetitionFactor;
    return triangularWave * repetitionFactor; // Scale to repetitionFactor
}
/** TIME_END **/

/** SHAPES_BEGIN **/
vec2 truchetPattern(in vec2 _st, in float _index){
    _index = fract(((_index-0.5)*2.0));
    if (_index > 0.75) {
        _st = vec2(1.0) - _st;
    } else if (_index > 0.5) {
        _st = vec2(1.0-_st.x,_st.y);
    } else if (_index > 0.25) {
        _st = 1.0-vec2(1.0-_st.x,_st.y);
    }
    return _st;
}
float box(in vec2 _st, in vec2 _size){
    _size = vec2(0.5) - _size*0.5;
    vec2 uv = smoothstep(_size,
                        _size+vec2(0.001),
                        _st);
    uv *= smoothstep(_size,
                    _size+vec2(0.001),
                    vec2(1.0)-_st);
    return uv.x*uv.y;
}
/** SHAPES_END **/

/** RANDOM_BEGIN **/
float rand(float x){
    float y = fract(sin(x)* 20.0);
    return y;
}

float random (vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))*
        43758.5453123);
}
/** RANDOM_END **/

/** NOISE_BEGIN **/ 
// smooth noise 
float noise(in float x){
    float i = floor(x / u_time);
    float f = fract(x);
    float y = rand(i);
    y = mix(rand(i), rand(i + 1.0), smoothstep(0., 1.0, f));
    return y;
}
// organic smooth noise 
float organicNoise(in float x) { 
    float i = floor(x / u_time);
    float f = fract(x);
    float y = rand(i);
    float u = f * f * (3.0 - 2.0 * f ); // custom cubic curve
    y = mix(rand(i), rand(i + 1.0), u); // using it in the interpolation
    return y;
}
// ----
float mySpecialNoise(in float x){ 
    float i = floor(x / smoothTime(u_time));
    float f = fract(x);
    float y = rand(i);
    float u = f * f * (3.0 - 2.0 * f ); // custom cubic curve
    y = mix(rand(i), rand(i + 1.0), u); // using it in the interpolation
    return y;
}
// ----
float noise(in vec2 st) {
    vec2 i = floor(st);
    vec2 f = fract(st);

    // Four corners in 2D of a tile
    float a = random(i);
    float b = random(i + vec2(1.0, 0.0));
    float c = random(i + vec2(0.0, 1.0));
    float d = random(i + vec2(1.0, 1.0));

    // Cubic Hermine Curve.  Same as SmoothStep()
    vec2 u = f*f*(3.0-2.0*f);
    // u = smoothstep(0.,1.,f);

    // Mix 4 coorners percentages
    return mix(a, b, u.x) +
            (c - a)* u.y * (1.0 - u.x) +
            (d - b) * u.x * u.y;
}
// ----
float pixelatedNoise(in float x){
    float i = floor(x / smoothTime(u_time));
    float f = fract(x);
    float y = rand(i);
    y = mix(rand(i), rand(i + 1.0), smoothstep(0., 1.0, f));
    return y;
}
/** NOISE_END **/

/** COLOR_BEGIN **/
vec3 hsv2rgb(vec3 c) {
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}
/** COLOR_END **/

/** TRANSFORMATION_BEGIN **/
/* 
    usage:
        move space from the center to the vec2(0.0)
        st -= vec2(0.5);
        rotate the space, cross will look like an x
        st = rotate2d(sin(u_time - st.x) * (rand(3.14) * 2.  + st.y) ) * st;
        move it back to the original place
        st += vec2(0.5);
*/
mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
}
/** TRANSFORMATION_END **/

float fractalBrownianMotionOne(in float x) { 
    const int octaves = 10;
    float lacunarity = 2.0;
    float gain = 0.5;
    
    float amplitude = 0.5;
    float frequency = 1.0;

    float y = 0.5;

    for(int i = 0; i < octaves; i++) {
        y += amplitude * organicNoise(frequency * x);
        frequency *= lacunarity;
        amplitude *= gain;
    }
    return y;
}

float fbm(in vec2 st) { 
    const int octaves = 5;

    float value = 0.0;
    float amplitude = 1.;
    float frequency = 0.0;

    for (int i = 0; i < octaves; i++) {
        value += amplitude * noise(st);
        st *= 2.0;
        amplitude *= 0.5;
    }
    return  value;
}

void main() { 
    vec2 st = gl_FragCoord.xy / u_resolution.xy;

    // HUE/RAD/ANGLE
    vec2 toCenter = (0.5) - st;
    float angle = atan(toCenter.x, toCenter.y);
    float radius = length(toCenter) * 8.;
    float hue = angle / (3.14  * 2.0);
    vec3 hueRadAngleVec = vec3(hue, radius, angle);

    
    st *= 1.;
    // move space from the center to the vec2(0.0)
    st -= vec2(.5);
    // rotate the space
    st = rotate2d(sin(smoothTime(u_time * 0.005)) + (TWO_PI)) * st;
    // move it back to the original place
    st += vec2(.5);
    
    float x = st.x;
    float myNoise  = mySpecialNoise(x);
    st *= 2.5;

    vec2 point[5];
    point[0] = vec2(0.83,0.75);
    point[1] = vec2(0.60,0.07);
    point[2] = vec2(0.28,0.64);
    point[3] =  vec2(0.31,0.26);
    point[4] = vec2(u_mouse / u_resolution) * st;
    float m_dist_vec[5];
    float alpha;
    float m_dist = 1.;  // initialize dist var to minimum distance

    float first_distance = distance(st * radius, point[0]);
    float second_distance = distance(st * radius, point[1]);
    float third_distance = distance(st *radius, point[2]);
    float fourth_distance = distance(st * radius, point[3]);
    m_dist_vec[0] = first_distance;
    m_dist_vec[1] = second_distance;
    m_dist_vec[2] = third_distance;
    m_dist_vec[3] = fourth_distance;

    float f = st.x;
    f *= second_distance * fbm(st * 0.5);
    m_dist = second_distance;
    f *= first_distance * fbm(st * 0.5);
    f *= fourth_distance * fbm(st * 0.5);

    // fractal brownian motion
    float corePattern = 
                // 1) generate pattern from fractal noise
                fbm(st + fbm(st + fbm(st + fbm(st)))) +
                // 2) animate said noise 
                sin(st.x + u_time);

    // set the desired color of the core pattern
    vec3 patternColor = vec3(0.7137, 0.0, 0.0);
    // final pattern color 
    patternColor += corePattern;

    vec3 background = vec3(1.0, 1.0, 1.0);    
    vec3 myColor = mix(
        patternColor,
        background,
        smoothstep(0.0, 1., corePattern)
    );
    gl_FragColor = vec4(
        vec3(myColor),
        1.0
    ); 
}

