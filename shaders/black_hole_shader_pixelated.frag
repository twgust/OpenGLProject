// Author:
// Title:

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;



#define reflect
mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
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

float cross(in vec2 _st, float _size){
    return  box(_st, vec2(_size,_size/4.)) +
            box(_st, vec2(_size/4.,_size));
}

// 2D Random
float random (in vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))
                 * 43758.409);
}
float rand(in float x) {
    float y = fract(sin(x)*42301.208);
    return y;
}



// Parameters
float speedFactor = 1.; // Adjust this to speed up or slow down the time
float repetitionFactor = 250.; // The duration before repeating
float startOffset = 100.; // Starting offset for the time

// Function to calculate smoothTime
float smoothTime() {
    float scaledTime = (u_time + startOffset) * speedFactor;
    float phase = mod(scaledTime, repetitionFactor); // Create a repeating pattern
    float triangularWave = 2.0 * abs(phase - repetitionFactor * 0.5) / repetitionFactor;
    return triangularWave * repetitionFactor; // Scale to repetitionFactor
}

// HSV to RGB conversion function
vec3 hsv2rgb(vec3 c) {
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

float noise(in float x){
    float i = floor(x * smoothTime());
    float f = fract(x);
    float y = rand(i);
    y = mix(rand(i), rand(i + 1.0), smoothstep(0., 1.0, f));
    return y;
}

float pixelatedNoise(in float x){
    float i = floor(x / smoothTime());
    float f = fract(x);
    float y = rand(i);
    y = mix(rand(i), rand(i + 1.0), smoothstep(0., 1.0, f));
    return y;
}

float noise(in vec2 st) {
    vec2 i = floor(st);
    vec2 f = fract(st);

    // Four corners in 2D of a tile
    float a = random(i);
    float b = random(i + vec2(1.0, 0.0));
    float c = random(i + vec2(0.0, 1.0));
    float d = random(i + vec2(1.0, 1.0));

    // Smooth Interpolation

    // Cubic Hermine Curve.  Same as SmoothStep()
    vec2 u = f*f*(3.0-2.0*f);
    // u = smoothstep(0.,1.,f);

    // Mix 4 coorners percentages
    return mix(a, b, u.x) +
            (c - a)* u.y * (1.0 - u.x) +
            (d - b) * u.x * u.y;
}

void main()
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
	vec2 uv = gl_FragCoord.xy/u_resolution.xy;
    // start == 0.0, end == 1.
    vec2 toCenter = (0.5) - st;
    float angle = atan(toCenter.x, toCenter.y);
    float radius = length(toCenter) * 8.;
    float hue = angle / (3.14  * 2.0);
    vec3 hueRadAngleVec = vec3(hue, radius, angle);

    float scalingFactorNoise = u_time;
    vec2 pos = vec2(st * 5.240);
    float noiseS = noise(pos);
    // move space from the center to the vec2(0.0)
    st -= vec2(0.5);
    // rotate the space, cross will look like an x
    st = rotate2d(sin(u_time - st.x) * (rand(3.14) * 2.  + st.y) ) * st;
    // move it back to the original place
    st += vec2(0.5);
    
    
    const int octaves = 1;
	float lacunarity = 2.0;
	float gain = 0.5;
    
    float x = uv.x * 6.034  * radius;
    
    float amplitude = 1.;
	float frequency = 1.15;
	float fractalBrownMotion = sin(x * frequency);
    float t = 0.01*(-u_time*130.0);
	for (int i = 0; i < octaves; i++) {
	fractalBrownMotion += amplitude * noise(frequency*x);
	frequency *= lacunarity;
	amplitude *= gain;
	}
	fractalBrownMotion = fractalBrownMotion * 0.5 + 0.5;
    // so we're drawing a line between the 0.005, 0.015 for the absolute value of y -  fractalBrownMotion
    float alpha = smoothstep(0.005, 0.015, abs(uv.y - fractalBrownMotion));
    
    
    // init col to noise
    vec3 col = vec3(0.0);
    vec3 waveColor = vec3(0.0);
    col = vec3(
        fractalBrownMotion * alpha
    );    
    
    vec3 backgroundColor = vec3(1.0); // White background
	vec3 colOut = mix(backgroundColor, waveColor, alpha);
    if (alpha < 0.01) discard;

    // Output to screen
    gl_FragColor = vec4(colOut,1.0);
}


/* 
void main()
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 st = gl_FragCoord.xy/u_resolution.xy;

    // start == 0.0, end == 1.
    vec2 toCenter = (0.5) - st;
    float angle = atan(toCenter.x, toCenter.y);
    float radius = length(toCenter) * 8.;
    float hue = angle / (3.14  * 2.0);
    vec3 hueRadAngleVec = vec3(hue, radius, angle);

    float scalingFactorNoise = u_time;
    vec2 pos = vec2(st * 5.240);
    float noiseS = noise(pos);
	    // move space from the center to the vec2(0.0)
    st -= vec2(0.5);
    // rotate the space, cross will look like an x
    st = rotate2d(sin(u_time - st.x) * (3.14 * 2.  + st.y) ) * st;
    // move it back to the original place
    st += vec2(0.5);
    
    float x = smoothTime() * cos(noise(st) / radius) * sin(radius);
    float i = floor(x);  // integer
	float f = fract(x);  // fraction
	float y = mix(rand(i), rand(i + 1.), smoothstep(0., 1.,f));
    
    // init col to noise
    vec3 col = vec3(0.0);
    col = vec3(
       y + (st.x - pos.y * 0.2)
    );
    
    // Output to screen
    gl_FragColor = vec4(col, 1.0);
}
*/

/*
	<--- CROSSES --->
    vec2 crossSpace = gl_FragCoord.xy/u_resolution.xy;
    // cross rotation animation, new vec so bkg doesn't animate
    vec2 centerCross = crossSpace;
    vec2 crossTwo = crossSpace;
    vec2 crossThree = crossSpace;
	
    // move space from the center to the vec2(0.0)
    centerCross -= vec2(0.5);
    // rotate the space, cross will look like an x
    centerCross = rotate2d(sin(u_time * 0.12)* (3.14 * 2.) ) * centerCross;
    // move it back to the original place
    centerCross += vec2(0.5);
    
    
    crossTwo -= vec2(0.2);
    // rotate the space, cross will look like an x
    crossTwo = rotate2d(cos(u_time * 0.12)* (3.14 * 2.) ) * crossTwo;
    // move it back to the original place
    crossTwo += vec2(0.5);
    
    
    crossThree -= vec2(0.8);
    // rotate the space, cross will look like an x
    crossThree = rotate2d(cos(u_time *0.12)* (3.14 * 2.) ) * crossThree;
    // move it back to the original place
    crossThree += vec2(0.5);
    
	vec3 crosses = vec3(cos(x *radius) * sin(x  * radius));
	
    // first we add each cross, then we modify the color of it by utilizing vector multiplication
    crosses += vec3(
        cross(centerCross, 0.3) * reflect(st.x),
        cross(centerCross, 0.3) * reflect(st.x),
        0.0
    ) * 
        vec3(
        1.0,
     	1.0,
        0.0
        
    );
	crosses += vec3(
        cross(crossTwo, 0.3),
        0.0,
        0.0
    ) * 
        vec3(
      	1.0,
        0.0,
        1.0
    );
    // add cross to red channel, 
    // and multiply it with vector where red channel is set 
    crosses += vec3(
        0.0,
        cross(crossThree, 0.3),
        0.0
       
    ) * 
        vec3(
       	0.0,
        1.0,
        0.0
    );
	
    vec4 colorOut = vec4(
        mix(
            vec3(
                col.r,
                col.g,
                col.b
            ),
            vec3(
                crosses.r,
                crosses.g,
                crosses.b
            ),
            0.5
        ),
        1.
	);
    */