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