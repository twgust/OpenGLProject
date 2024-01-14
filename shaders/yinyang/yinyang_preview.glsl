#ifdef GL_ES
precision mediump float;
#endif
uniform vec2 u_resolution;
uniform float u_time;
#define pow
#define TWO_PI 6.28318530718
#define PI 3.14
#define sPlot

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
    vec2 st = gl_FragCoord.xy/u_resolution;
    vec2 toCenter = (0.5) - st;
    float angle = atan(toCenter.x, toCenter.y);
    float radius = length(toCenter) * 8.;
    float hue = angle / TWO_PI;
    vec3 colorMix = vec3(hue, radius, angle);
    vec4 colorOut = vec4(
        vec3(
            mix(
                abs(sin(colorMix.r) - cos(u_time)),
                smoothstep(cos(colorMix.g), 0.5, sin(st.x * st.y) * cos(st.x * st.y)),
                sin(colorMix.b) * cos(u_time)
            )
        ),
        0.5
    );

    gl_FragColor = colorOut;
}