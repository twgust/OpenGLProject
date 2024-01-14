#version 330 core
#ifdef GL_ES
precision mediump float;
#endif
uniform vec2 u_resolution;
uniform float u_time;
#define TWO_PI 6.28318530718
#define PI 3.14
#define sPlot
out vec4 fragColor;

vec3 hsb2rgb( in vec3 c ){
    vec3 rgb = clamp(
        abs(
            mod(
                c.x*6.0+vec3(0.0,4.0,2.0),
                6.0
            ) 
            -3.0
        )
        -1.0,
        0.0,
        1.0 
    );
    rgb = rgb*rgb*(3.0-2.0*rgb);
    return c.z * mix(vec3(1.0), rgb, c.y);
}

void main () { 
    // normalize, 
    vec2 uv = gl_FragCoord.xy/u_resolution;
    // start == 0.0, end == 1.
    vec2 toCenter = (0.5) - uv;
    float angle = atan(toCenter.x, toCenter.y);
    float radius = length(toCenter) * 8.;
    float hue = angle / TWO_PI;
    // hue radius angle
    vec3 hueRadAngleVec = vec3(hue, radius, angle);
    vec4 colorOut = vec4(
        vec3(
             mix(
                // firuvvec
                abs(sin(hueRadAngleVec.x) - cos(u_time)),
                // second vec
                smoothstep(
                    cos(hueRadAngleVec.y),
                    sin(hueRadAngleVec.y),
                    sin(uv.x) * cos(uv.x)
                )* (sin(u_time) * 10.),
                // third vec
                sin(hueRadAngleVec.b) * sin(50.)
            )
        ),
        1.
    );
    fragColor = colorOut;
}