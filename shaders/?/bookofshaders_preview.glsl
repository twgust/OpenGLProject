#ifdef GL_ES
precision mediump float;
#endif
uniform vec2 u_resolution;
uniform float u_time;
#define pow
#define TWO_PI 6.28318530718
#define PI 3.141592653589793
#define sPlot
#define ceiling

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

void main () { 
    // normalize, 
    vec2 uv = gl_FragCoord.xy/u_resolution;
    float speed = 2.0;
    float startOffset = 2.;
    float iterations = 1.;
    float smoothTime = startOffset + iterations * sin(u_time * speed);

    // start == 0.0, end == 1.
    vec2 toCenter = (0.5) - uv;
    float angle = atan(toCenter.x, toCenter.y);
    float radius = length(toCenter) * 8.;
    float hue = angle / TWO_PI;
    vec3 hueRadAngleVec = vec3(hue, radius, angle);
    
    // MIX 1) red channels
    vec4 inMixOne = vec4(
            // R
            sinc(
                cos(radius  * radius) * smoothTime,
                radius * smoothTime
            ) * wave(uv.x, uv.y)
            ,
            // G
            0.0,
            // B
            0.0,
            1.
        );
        
    // MIX 2) blue channel
    vec4 inMixTwo = vec4(
        // R
        sinc(
            cos(radius * radius) * smoothTime, 
            radius * smoothTime
        ) * wave(uv.x, uv.y),
        // G
        0.0,
        // B,
        0.0,
        0.0
    );
    float dots = dot(inMixOne, inMixTwo);
    vec4 reflect = reflect(inMixOne, inMixTwo);
    // dont modify the rgb channels of mixed vectors, modify the mix channel itself
    vec4 colorMix = vec4(
        mix(
            vec4(
                // set color of inMixOneEffect, all r = white
                vec3(
                    inMixOne.r,
                    inMixOne.g,
                    inMixOne.b
                    ), 
                1.0
            ),
            vec4(
                // set color of inMixTwoEffect, all r = white
                vec3(
                    inMixTwo.r,
                    inMixTwo.g,
                    inMixTwo.b
                ),
                1.0
            ),
            // modify this to change the mix weight
            // 0.0 == inMixOne, 1.0 == inMixTwo
            .5
        )
    );
    vec4 colorMixTwo = vec4(
        mix(
            vec4(
                // set color of inMixOneEffect, all r = white
                vec3(
                    colorMix.r - sin(dots * radius * radius * radius),
                    colorMix.r,
                    colorMix.r
                    ), 
                1.0
            ),
            vec4(
                vec3(
                    dots,
                    0.0,
                    0.0
                    ), 
                1.0
            ),
            // modify this to change the mix weight
            // 0.0 == inMixOne, 1.0 == inMixTwo
            0.0
        )
    );

    // OUT
    vec4 colorMixThree = vec4(
        mix(
            vec4(colorMix),
            vec4(colorMixTwo),
            0.5
        )
    );

    gl_FragColor = colorMixTwo;
}