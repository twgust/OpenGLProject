set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
cmake_minimum_required(VERSION 3.5)
project(OpenGlProject)

find_package(OpenGL REQUIRED)

# Manually set GLEW paths
set(GLEW_INCLUDE_DIR "/opt/homebrew/Cellar/glew/2.2.0_1/include")
set(GLEW_LIBRARY "/opt/homebrew/Cellar/glew/2.2.0_1/lib/libGLEW.2.2.0.dylib")

# Manually set GLFW paths
set(GLFW_INCLUDE_DIR "/opt/homebrew/Cellar/glfw/3.3.9/include")
set(GLFW_LIBRARY "/opt/homebrew/Cellar/glfw/3.3.9/lib/libglfw.3.3.dylib")
# Add the path to the ImGui source files
# Add the path to the ImGui source files and backends
file(GLOB IMGUI_SOURCES 
     "${CMAKE_SOURCE_DIR}/imgui/*.cpp"
     "${CMAKE_SOURCE_DIR}/imgui/backends/imgui_impl_glfw.cpp"
     "${CMAKE_SOURCE_DIR}/imgui/backends/imgui_impl_opengl3.cpp")

include_directories(${GLEW_INCLUDE_DIR} ${GLFW_INCLUDE_DIR} "${CMAKE_SOURCE_DIR}/imgui" "${CMAKE_SOURCE_DIR}/imgui/backends")
add_executable(OpenGLProject main.cpp ${IMGUI_SOURCES})
target_link_libraries(OpenGLProject PRIVATE OpenGL::GL ${GLEW_LIBRARY} ${GLFW_LIBRARY})
