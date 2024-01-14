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
float speedFactor = 2.; // Adjust this to speed up or slow down the time
float repetitionFactor = 500.; // The duration before repeating
float startOffset = 0.; // Starting offset for the time

// Function to calculate smoothTime
float smoothTime(in float time) {
    float scaledTime = (time + startOffset) * speedFactor;
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
    float i = floor(x / u_time);
    float f = fract(x);
    float y = rand(i);
    y = mix(rand(i), rand(i + 1.0), smoothstep(0., 1.0, f));
    return y;
}

float pixelatedNoise(in float x, in float time){
    float i = floor(x / smoothTime(time));
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