/** 1D Noise **/ 
float noise(in float x){
    float i = floor(x / u_time);
    float f = fract(x);
    float y = rand(i);
    y = mix(rand(i), rand(i + 1.0), smoothstep(0., 1.0, f));
    return y;
}

/** 2D noise **/
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

/** deps: smoothTime.glsl **/
float pixelatedNoise(in float x, in float time){
    float i = floor(x / smoothTime(time));
    float f = fract(x);
    float y = rand(i);
    y = mix(rand(i), rand(i + 1.0), smoothstep(0., 1.0, f));
    return y;
}

