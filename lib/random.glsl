/** 1D Random **/
float rand(in float x) {
    float y = fract(sin(x)*42301.208);
    return y;
}

/** 2D Random **/
float random (in vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))
                 * 43758.409);
}