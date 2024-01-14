#include <iostream>
#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <string>
#include <fstream>
#include <sstream>
#include <imgui.h>
#include <imgui_impl_glfw.h>
#include <imgui_impl_opengl3.h>
#include <sstream> 
#include <vector>

const float SquareFloat = 640.0 * 10;
const float sizeXf = 480.0;
const float sizeYf = 640.0;

const int SquareInt = 640;
const int sizeXi = SquareInt;
const int sizeYi = 480;
// modify to choose shader
const std::vector<std::string> items = {
    "../shaders/gradient/gradient.glsl", 
    "../shaders/yinyang/yinyang.glsl",
    "../shaders/yinyangg/yinyang2.glsl",
    "../shaders/?/example.glsl"
};

GLuint parseProgram(int selectedItem, std::vector<GLuint> shaderPrograms) {
    GLuint currentShaderProgram; 
    return shaderPrograms[selectedItem];
}

std::string ReadShaderFile(const std::string& shaderPath) {
    std::string code;
    std::ifstream shaderFile;

    // Ensure ifstream objects can throw exceptions:
    shaderFile.exceptions(std::ifstream::failbit | std::ifstream::badbit);
 
    try {
        // Open file
        shaderFile.open(shaderPath);
        std::stringstream shaderStream;

        // Read file's buffer contents into stream
        shaderStream << shaderFile.rdbuf();

        // Close file handler
        shaderFile.close();

        // Convert stream into string
        code = shaderStream.str();
    } catch (std::ifstream::failure& e) {
        std::cerr << "ERROR::SHADER::FILE_NOT_SUCCESFULLY_READ: " << shaderPath << std::endl;
    }

    return code;
}

GLuint CompileShader(const std::string& shaderCode, GLenum shaderType) {
    GLuint shader = glCreateShader(shaderType);
    const char* shaderCodeCStr = shaderCode.c_str();
    glShaderSource(shader, 1, &shaderCodeCStr, NULL);
    glCompileShader(shader);

    // Check for shader compile errors
    int success;
    char infoLog[512];
    glGetShaderiv(shader, GL_COMPILE_STATUS, &success);
    if (!success) {
        glGetShaderInfoLog(shader, 512, NULL, infoLog);
        std::string shaderTypeStr = (shaderType == GL_VERTEX_SHADER) ? "VERTEX" : "FRAGMENT";
        std::cerr << "ERROR::SHADER::" << shaderTypeStr << "::COMPILATION_FAILED\n" << infoLog << std::endl;
    }

    return shader;
}
void LogToConsole(const char* string) {
    std::cout << string; 
}

const char* vertexShaderSource = "#version 330 core\n"
    "layout (location = 0) in vec3 aPos;\n"
    "void main()\n"
    "{\n"
    "   gl_Position = vec4(aPos, 1.0);\n"
    "}\0";

GLuint createFragmentShaderProgram(const std::string& path, bool isFragmentShader) { 
    std::string fragmentShaderCode = ReadShaderFile(path);
    GLuint compiledShader; 
    if(isFragmentShader) {
        compiledShader = CompileShader(fragmentShaderCode, GL_FRAGMENT_SHADER);
    } else {
        compiledShader = CompileShader(fragmentShaderCode, GL_VERTEX_SHADER);
    }
    return compiledShader;
}

void renderComponentA(const std::string& textContent) {

}


/**
 * functions which takes a lists of paths, any given path is assumed to be a valid path,
 * for each path; it creates and compiles a shaderProgram, attaches a shader file of the given path to aforementioned 
 * shaderProgram, and finally links it.
 * returns the array of compiled and linked shaderPrograms 
*/
std::vector<GLuint> myVectorPopulator(const std::vector<std::string> shaderPaths) {
    std::vector<GLuint> compiledShaders;

    // generic arbitrary vertex shader
    GLuint vertexShader = glCreateShader(GL_VERTEX_SHADER);
    glShaderSource(vertexShader, 1, &vertexShaderSource, nullptr);
    glCompileShader(vertexShader);
    
    compiledShaders.reserve(shaderPaths.size());
    int index = 0;
    for (const std::string path : shaderPaths)
    {
        std::stringstream stream;
        stream << path;
        stream << "CompiledAndReady";
        GLuint fragmentShaderCompiled = createFragmentShaderProgram(path, true);

        GLuint program = glCreateProgram();
        glAttachShader(program, vertexShader);
        glAttachShader(program, fragmentShaderCompiled);
        glLinkProgram(program);     

        compiledShaders.push_back(program);
    }
    
    return compiledShaders;
} 

void RenderUI() { 

}

int main() {
    // Initialize GLFW
    if (!glfwInit()) {
        std::cerr << "Failed to initialize GLFW" << std::endl;
        return -1;
    }
    #ifdef __APPLE__
        glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE); // Required on Mac
    #endif
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    GLFWwindow* window = glfwCreateWindow(480, 640, "Gradient Window", nullptr, nullptr);
    if (!window) {
        std::cerr << "Failed to create GLFW window" << std::endl;
        glfwTerminate();
        return -1;
    }
    glfwMakeContextCurrent(window);



    // Initialize GLEW
    if (glewInit() != GLEW_OK) {
        std::cerr << "Failed to initialize GLEW" << std::endl;
        return -1;
    }

    // setup imgui after glew is initialized
    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); (void)io;
    ImGui::StyleColorsDark();
    ImGui_ImplGlfw_InitForOpenGL(window, true);
    ImGui_ImplOpenGL3_Init("#version 330");

    // Vertex shader, hardcoded stirng
    GLuint vertexShader = glCreateShader(GL_VERTEX_SHADER);
    glShaderSource(vertexShader, 1, &vertexShaderSource, nullptr);
    glCompileShader(vertexShader);
    
    // Fragment shader - Gradient 
    GLuint fragmentShaderGradientCompiled = createFragmentShaderProgram(items[0], true);
    // Fragment shader - Ripple
    GLuint fragmentShaderRippleCompiled = createFragmentShaderProgram(items[1], true);
    GLuint fragmentYinYangCompiled = createFragmentShaderProgram(items[2], true);

    //shader program vector
    std::vector<GLuint> programVec = myVectorPopulator(items);
    
    // Create a vertex array and vertex buffer object
    GLuint VAO, VBO;
    glGenVertexArrays(1, &VAO);
    glGenBuffers(1, &VBO);

    // Bind the VAO and VBO
    glBindVertexArray(VAO);
    glBindBuffer(GL_ARRAY_BUFFER, VBO);

    // Define vertices for a full-screen quad
    GLfloat vertices[] = {
        -1.0f, -1.0f,
         1.0f, -1.0f,
        -1.0f,  1.0f,
         1.0f,  1.0f
    };
    // Store the vertices in the VBO
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    // Specify the layout of the vertex data
    glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, 2 * sizeof(float), (void*)0);
    glEnableVertexAttribArray(0);
    
    /** STATE VARIABLES **/
    // can update state variables outside of render loop to save state in a semi hacky way
    bool buttonClicked = false;

    // Declare a ptr to the boolean variable and assign it the address of showDemoWindow
    bool showDemoWindow = true;
    bool* showDemoWindowPtr = &showDemoWindow; 

    GLuint currentShaderProgram;
    int selectedItem = -1; 
    /** STATE VARIABLES END **/
    
    // Render loop
    while (!glfwWindowShouldClose(window)) {
        glfwPollEvents();        
        glClear(GL_COLOR_BUFFER_BIT);
        std::stringstream stream;
    
        // insertion of integer variable to stream
        stream << selectedItem;
    
        // variable to hold the new variable from the stream
        std::string age_as_string;
    
         // extraction of string type of the integer variable
         stream >> age_as_string;
        const char* myCStr = age_as_string.c_str();
        currentShaderProgram = parseProgram(selectedItem, programVec);


        glUseProgram(currentShaderProgram);

        int resolutionLocation = glGetUniformLocation(currentShaderProgram, "u_resolution");
        int timeLocation = glGetUniformLocation(currentShaderProgram, "u_time");

        float mouseX, mouseY;
        double xpos, ypos;
        glfwGetCursorPos(window, &xpos, &ypos);
        mouseX = static_cast<float>(xpos);
        mouseY = static_cast<float>(ypos);
        int mouseLocation = glGetUniformLocation(currentShaderProgram, "u_mouse");
        
        float timeValue = static_cast<float>(glfwGetTime());
        glUniform1f(timeLocation,  glfwGetTime()); // uniform time
        int display_ww, display_hh;
        glfwGetFramebufferSize(window, &display_ww, &display_hh);
        glUniform2f(resolutionLocation, static_cast<float>(display_ww), static_cast<float>(display_hh));
        glUniform2f(mouseLocation, mouseX -1.0, mouseY + 1.0);
        glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
        
        // Simple ImGui display
        ImGui_ImplOpenGL3_NewFrame();
        ImGui_ImplGlfw_NewFrame();
        ImGui::NewFrame();
    
 
        ImGui::Begin("Hello, world!");
        if(*showDemoWindowPtr == true){
            ImGui::ShowDemoWindow(showDemoWindowPtr);
        }
        ImGui::Text("This is some useful text.");

        if(ImGui::Button("Reset Time", ImVec2(150.0, 55.0))) {
            buttonClicked = !buttonClicked;
            glfwSetTime(0.0);
            *showDemoWindowPtr = !*showDemoWindowPtr;
        }
        // Start the ListBox
        if (ImGui::BeginListBox("##ListBox")) {
            // Iterate over all items
            for (int i = 0; i < items.size(); i++) {
                // Check if the item is the selected item
                const bool isSelected = (selectedItem == i);

                // Render the item and check if it is selected
                if (ImGui::Selectable(items[i].c_str(), isSelected)) {
                    selectedItem = i; // Update the selected item index
                    
                }

                // If the item is selected, scroll to it
                if (isSelected) {
                    selectedItem = i;
                    ImGui::SetItemDefaultFocus();
                }
            }

        ImGui::EndListBox();
        }

        ImGui::End();

        // Rendering ImGui
        ImGui::Render();
        int display_w, display_h;
        glfwGetFramebufferSize(window, &display_w, &display_h);
        glViewport(0, 0, display_w,display_h);
        ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());
        glfwSwapBuffers(window);
    }
    ImGui_ImplOpenGL3_Shutdown();
    ImGui_ImplGlfw_Shutdown();
    ImGui::DestroyContext();
    // Clean up
    glDeleteVertexArrays(1, &VAO);
    glDeleteBuffers(1, &VBO);
    glDeleteProgram(currentShaderProgram);
    glfwTerminate();
    return 0;
}