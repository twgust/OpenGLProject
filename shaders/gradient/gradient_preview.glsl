#ifdef GL_ES
precision mediump float;
#endif
uniform vec2 u_resolution;
uniform float u_time;
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
    vec3 color = hsb2rgb(vec3(0));

    vec2 toCenter = (0.5) - st;
    float angle = atan(toCenter.x, toCenter.y);
    float radius = length(toCenter) * 6.;
    float hue = angle / TWO_PI;
    

    float topBar = step(0.1, 1.0 - st.y); // 1.0 - st.y inverts the y-coordinate
    float bottomBar = step(0.1, st.y);
    float blackBars = topBar * bottomBar;

    float pct = distance(st,vec2(0.5));

    vec3 blackBarsColor = vec3(0.0, 0.0, 0.0); // Blue, for example

    color = hsb2rgb(
        vec3(        
            hue, // HUE
            radius , // SATURATION
            1. // BRIGHTNESS
        )
    );
    vec3 barColor = mix(blackBarsColor, blackBarsColor, blackBars);
    vec3 pctColor = vec3(0.);

    float reversedTime = 10. - u_time;
    if (reversedTime < 15.) {
        float reversedTime = 7.5 - u_time; // This will count down from 25 to 0
        pctColor = vec3(cos(u_time * sin(pct * (reversedTime * 2.))));
        //pctColor = vec3(cos(u_time * sin(pct * (u_time * 2.))));
    } else {
        // After 25 seconds, start reversing the effect
        float reversedTime = 15.0 - u_time; // This will count down from 25 to 0
        pctColor = vec3(cos(reversedTime * sin(pct * (reversedTime * 2.))));
    }

    vec3 finalColor = mix(
            mix(vec3(st.y * st.x, 1.0, 1.), pctColor, vec3(st.y, 1., st.y)),
            barColor,
            // this works perfectly
            ((bottomBar - topBar) * (topBar + bottomBar)) * 
            ((bottomBar - topBar) * (topBar + bottomBar))
        );
    vec4 colorOut = vec4(finalColor, 1.0);

    gl_FragColor = colorOut;
}