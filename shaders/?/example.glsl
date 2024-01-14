#version 330 core
#ifdef GL_ES
precision mediump float;
#endif
uniform vec2 u_resolution;
uniform float u_time;
uniform vec2 u_mouse;
#define pow
#define TWO_PI 6.28318530718
#define PI 3.141592653589793
out vec4 fragColor;



// Function to calculate smoothTime
float smoothTime() {
    // Parameters
    float speedFactor = 0.25; // Adjust this to speed up or slow down the time
    float repetitionFactor = 1000.0; // The duration before repeating
    float startOffset = 2.0; // Starting offset for the time

    float scaledTime = (u_time + startOffset) * speedFactor;
    float phase = mod(scaledTime, repetitionFactor); // Create a repeating pattern
    float triangularWave = 2.0 * abs(phase - repetitionFactor * 0.5) / repetitionFactor;
    float smoothtime = triangularWave * repetitionFactor;
    return smoothtime;
}

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

float rand(float x){
    float y = fract(sin(x)* 20.0);
    return y;
}

float random (vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))*
        43758.5453123);
}


void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    st.x *= u_resolution.x/u_resolution.y;

    vec3 color = vec3(.0);
    // start == 0.0, end == 1.
    vec2 toCenter = (0.5) - st;
    float angle = atan(toCenter.x, toCenter.y);
    float radius = length(toCenter) * 8.;
    float hue = angle / TWO_PI;
    vec3 hueRadAngleVec = vec3(hue, radius, angle);


    /** DISTANCE BEGIN **/
    // Cell positions
    vec2 point[5];
    point[0] = vec2(0.83,0.75);
    point[1] = vec2(0.60,0.07);
    point[2] = vec2(0.28,0.64);
    point[3] =  vec2(0.31,0.26);
    point[4] = u_mouse/u_resolution;

    vec2 myExamplePoints[5];
    myExamplePoints[0] = vec2(0.83,0.75);
    myExamplePoints[1] = vec2(0.60,0.07);
   myExamplePoints[2] = vec2(0.28,0.64);
    myExamplePoints[3] =  vec2(0.31,0.26);
    myExamplePoints[4] = u_mouse / u_resolution;

    float m_dist = 1.;  // initialize dist var to minimum distance
    for (int i = 0; i < 5; i++) {
        float dist = distance(st, myExamplePoints[i]);
        // Keep the closer distance by updating the dist
        m_dist = min(m_dist, dist);
    }

    
    /*
    // Iterate through the points positions
    for (int i = 0; i < 5; i++) {
        float dist = distance(st, point[i]);
        // Keep the closer distance by updating the dist
        m_dist = min(m_dist, dist);
    }
    */
    
    st *= 10.0; // Scale the coordinate system by 10
    vec2 ipos = floor(st);  // get the integer coords
    vec2 fpos = fract(st);  
    // Draw the min distance (distance field)
    color += m_dist;
    /** DISTANCE END **/

    // Show isolines
    // color -= step(.7,abs(sin(50.0*m_dist)))*.3;

    fragColor = vec4(vec3(color), 1.0);
}