# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.28.1/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.28.1/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/gustav.floren/OpenGLProject

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/gustav.floren/OpenGLProject/build

# Include any dependencies generated for this target.
include CMakeFiles/OpenGLProject.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/OpenGLProject.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/OpenGLProject.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/OpenGLProject.dir/flags.make

CMakeFiles/OpenGLProject.dir/main.cpp.o: CMakeFiles/OpenGLProject.dir/flags.make
CMakeFiles/OpenGLProject.dir/main.cpp.o: /Users/gustav.floren/OpenGLProject/main.cpp
CMakeFiles/OpenGLProject.dir/main.cpp.o: CMakeFiles/OpenGLProject.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/gustav.floren/OpenGLProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/OpenGLProject.dir/main.cpp.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/OpenGLProject.dir/main.cpp.o -MF CMakeFiles/OpenGLProject.dir/main.cpp.o.d -o CMakeFiles/OpenGLProject.dir/main.cpp.o -c /Users/gustav.floren/OpenGLProject/main.cpp

CMakeFiles/OpenGLProject.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/OpenGLProject.dir/main.cpp.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gustav.floren/OpenGLProject/main.cpp > CMakeFiles/OpenGLProject.dir/main.cpp.i

CMakeFiles/OpenGLProject.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/OpenGLProject.dir/main.cpp.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gustav.floren/OpenGLProject/main.cpp -o CMakeFiles/OpenGLProject.dir/main.cpp.s

CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_glfw.cpp.o: CMakeFiles/OpenGLProject.dir/flags.make
CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_glfw.cpp.o: /Users/gustav.floren/OpenGLProject/imgui/backends/imgui_impl_glfw.cpp
CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_glfw.cpp.o: CMakeFiles/OpenGLProject.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/gustav.floren/OpenGLProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_glfw.cpp.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_glfw.cpp.o -MF CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_glfw.cpp.o.d -o CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_glfw.cpp.o -c /Users/gustav.floren/OpenGLProject/imgui/backends/imgui_impl_glfw.cpp

CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_glfw.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_glfw.cpp.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gustav.floren/OpenGLProject/imgui/backends/imgui_impl_glfw.cpp > CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_glfw.cpp.i

CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_glfw.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_glfw.cpp.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gustav.floren/OpenGLProject/imgui/backends/imgui_impl_glfw.cpp -o CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_glfw.cpp.s

CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_opengl3.cpp.o: CMakeFiles/OpenGLProject.dir/flags.make
CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_opengl3.cpp.o: /Users/gustav.floren/OpenGLProject/imgui/backends/imgui_impl_opengl3.cpp
CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_opengl3.cpp.o: CMakeFiles/OpenGLProject.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/gustav.floren/OpenGLProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_opengl3.cpp.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_opengl3.cpp.o -MF CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_opengl3.cpp.o.d -o CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_opengl3.cpp.o -c /Users/gustav.floren/OpenGLProject/imgui/backends/imgui_impl_opengl3.cpp

CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_opengl3.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_opengl3.cpp.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gustav.floren/OpenGLProject/imgui/backends/imgui_impl_opengl3.cpp > CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_opengl3.cpp.i

CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_opengl3.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_opengl3.cpp.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gustav.floren/OpenGLProject/imgui/backends/imgui_impl_opengl3.cpp -o CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_opengl3.cpp.s

CMakeFiles/OpenGLProject.dir/imgui/imgui.cpp.o: CMakeFiles/OpenGLProject.dir/flags.make
CMakeFiles/OpenGLProject.dir/imgui/imgui.cpp.o: /Users/gustav.floren/OpenGLProject/imgui/imgui.cpp
CMakeFiles/OpenGLProject.dir/imgui/imgui.cpp.o: CMakeFiles/OpenGLProject.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/gustav.floren/OpenGLProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/OpenGLProject.dir/imgui/imgui.cpp.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/OpenGLProject.dir/imgui/imgui.cpp.o -MF CMakeFiles/OpenGLProject.dir/imgui/imgui.cpp.o.d -o CMakeFiles/OpenGLProject.dir/imgui/imgui.cpp.o -c /Users/gustav.floren/OpenGLProject/imgui/imgui.cpp

CMakeFiles/OpenGLProject.dir/imgui/imgui.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/OpenGLProject.dir/imgui/imgui.cpp.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gustav.floren/OpenGLProject/imgui/imgui.cpp > CMakeFiles/OpenGLProject.dir/imgui/imgui.cpp.i

CMakeFiles/OpenGLProject.dir/imgui/imgui.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/OpenGLProject.dir/imgui/imgui.cpp.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gustav.floren/OpenGLProject/imgui/imgui.cpp -o CMakeFiles/OpenGLProject.dir/imgui/imgui.cpp.s

CMakeFiles/OpenGLProject.dir/imgui/imgui_demo.cpp.o: CMakeFiles/OpenGLProject.dir/flags.make
CMakeFiles/OpenGLProject.dir/imgui/imgui_demo.cpp.o: /Users/gustav.floren/OpenGLProject/imgui/imgui_demo.cpp
CMakeFiles/OpenGLProject.dir/imgui/imgui_demo.cpp.o: CMakeFiles/OpenGLProject.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/gustav.floren/OpenGLProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/OpenGLProject.dir/imgui/imgui_demo.cpp.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/OpenGLProject.dir/imgui/imgui_demo.cpp.o -MF CMakeFiles/OpenGLProject.dir/imgui/imgui_demo.cpp.o.d -o CMakeFiles/OpenGLProject.dir/imgui/imgui_demo.cpp.o -c /Users/gustav.floren/OpenGLProject/imgui/imgui_demo.cpp

CMakeFiles/OpenGLProject.dir/imgui/imgui_demo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/OpenGLProject.dir/imgui/imgui_demo.cpp.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gustav.floren/OpenGLProject/imgui/imgui_demo.cpp > CMakeFiles/OpenGLProject.dir/imgui/imgui_demo.cpp.i

CMakeFiles/OpenGLProject.dir/imgui/imgui_demo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/OpenGLProject.dir/imgui/imgui_demo.cpp.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gustav.floren/OpenGLProject/imgui/imgui_demo.cpp -o CMakeFiles/OpenGLProject.dir/imgui/imgui_demo.cpp.s

CMakeFiles/OpenGLProject.dir/imgui/imgui_draw.cpp.o: CMakeFiles/OpenGLProject.dir/flags.make
CMakeFiles/OpenGLProject.dir/imgui/imgui_draw.cpp.o: /Users/gustav.floren/OpenGLProject/imgui/imgui_draw.cpp
CMakeFiles/OpenGLProject.dir/imgui/imgui_draw.cpp.o: CMakeFiles/OpenGLProject.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/gustav.floren/OpenGLProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/OpenGLProject.dir/imgui/imgui_draw.cpp.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/OpenGLProject.dir/imgui/imgui_draw.cpp.o -MF CMakeFiles/OpenGLProject.dir/imgui/imgui_draw.cpp.o.d -o CMakeFiles/OpenGLProject.dir/imgui/imgui_draw.cpp.o -c /Users/gustav.floren/OpenGLProject/imgui/imgui_draw.cpp

CMakeFiles/OpenGLProject.dir/imgui/imgui_draw.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/OpenGLProject.dir/imgui/imgui_draw.cpp.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gustav.floren/OpenGLProject/imgui/imgui_draw.cpp > CMakeFiles/OpenGLProject.dir/imgui/imgui_draw.cpp.i

CMakeFiles/OpenGLProject.dir/imgui/imgui_draw.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/OpenGLProject.dir/imgui/imgui_draw.cpp.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gustav.floren/OpenGLProject/imgui/imgui_draw.cpp -o CMakeFiles/OpenGLProject.dir/imgui/imgui_draw.cpp.s

CMakeFiles/OpenGLProject.dir/imgui/imgui_tables.cpp.o: CMakeFiles/OpenGLProject.dir/flags.make
CMakeFiles/OpenGLProject.dir/imgui/imgui_tables.cpp.o: /Users/gustav.floren/OpenGLProject/imgui/imgui_tables.cpp
CMakeFiles/OpenGLProject.dir/imgui/imgui_tables.cpp.o: CMakeFiles/OpenGLProject.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/gustav.floren/OpenGLProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/OpenGLProject.dir/imgui/imgui_tables.cpp.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/OpenGLProject.dir/imgui/imgui_tables.cpp.o -MF CMakeFiles/OpenGLProject.dir/imgui/imgui_tables.cpp.o.d -o CMakeFiles/OpenGLProject.dir/imgui/imgui_tables.cpp.o -c /Users/gustav.floren/OpenGLProject/imgui/imgui_tables.cpp

CMakeFiles/OpenGLProject.dir/imgui/imgui_tables.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/OpenGLProject.dir/imgui/imgui_tables.cpp.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gustav.floren/OpenGLProject/imgui/imgui_tables.cpp > CMakeFiles/OpenGLProject.dir/imgui/imgui_tables.cpp.i

CMakeFiles/OpenGLProject.dir/imgui/imgui_tables.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/OpenGLProject.dir/imgui/imgui_tables.cpp.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gustav.floren/OpenGLProject/imgui/imgui_tables.cpp -o CMakeFiles/OpenGLProject.dir/imgui/imgui_tables.cpp.s

CMakeFiles/OpenGLProject.dir/imgui/imgui_widgets.cpp.o: CMakeFiles/OpenGLProject.dir/flags.make
CMakeFiles/OpenGLProject.dir/imgui/imgui_widgets.cpp.o: /Users/gustav.floren/OpenGLProject/imgui/imgui_widgets.cpp
CMakeFiles/OpenGLProject.dir/imgui/imgui_widgets.cpp.o: CMakeFiles/OpenGLProject.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/gustav.floren/OpenGLProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/OpenGLProject.dir/imgui/imgui_widgets.cpp.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/OpenGLProject.dir/imgui/imgui_widgets.cpp.o -MF CMakeFiles/OpenGLProject.dir/imgui/imgui_widgets.cpp.o.d -o CMakeFiles/OpenGLProject.dir/imgui/imgui_widgets.cpp.o -c /Users/gustav.floren/OpenGLProject/imgui/imgui_widgets.cpp

CMakeFiles/OpenGLProject.dir/imgui/imgui_widgets.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/OpenGLProject.dir/imgui/imgui_widgets.cpp.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gustav.floren/OpenGLProject/imgui/imgui_widgets.cpp > CMakeFiles/OpenGLProject.dir/imgui/imgui_widgets.cpp.i

CMakeFiles/OpenGLProject.dir/imgui/imgui_widgets.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/OpenGLProject.dir/imgui/imgui_widgets.cpp.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gustav.floren/OpenGLProject/imgui/imgui_widgets.cpp -o CMakeFiles/OpenGLProject.dir/imgui/imgui_widgets.cpp.s

# Object files for target OpenGLProject
OpenGLProject_OBJECTS = \
"CMakeFiles/OpenGLProject.dir/main.cpp.o" \
"CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_glfw.cpp.o" \
"CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_opengl3.cpp.o" \
"CMakeFiles/OpenGLProject.dir/imgui/imgui.cpp.o" \
"CMakeFiles/OpenGLProject.dir/imgui/imgui_demo.cpp.o" \
"CMakeFiles/OpenGLProject.dir/imgui/imgui_draw.cpp.o" \
"CMakeFiles/OpenGLProject.dir/imgui/imgui_tables.cpp.o" \
"CMakeFiles/OpenGLProject.dir/imgui/imgui_widgets.cpp.o"

# External object files for target OpenGLProject
OpenGLProject_EXTERNAL_OBJECTS =

OpenGLProject: CMakeFiles/OpenGLProject.dir/main.cpp.o
OpenGLProject: CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_glfw.cpp.o
OpenGLProject: CMakeFiles/OpenGLProject.dir/imgui/backends/imgui_impl_opengl3.cpp.o
OpenGLProject: CMakeFiles/OpenGLProject.dir/imgui/imgui.cpp.o
OpenGLProject: CMakeFiles/OpenGLProject.dir/imgui/imgui_demo.cpp.o
OpenGLProject: CMakeFiles/OpenGLProject.dir/imgui/imgui_draw.cpp.o
OpenGLProject: CMakeFiles/OpenGLProject.dir/imgui/imgui_tables.cpp.o
OpenGLProject: CMakeFiles/OpenGLProject.dir/imgui/imgui_widgets.cpp.o
OpenGLProject: CMakeFiles/OpenGLProject.dir/build.make
OpenGLProject: /Library/Developer/CommandLineTools/SDKs/MacOSX13.3.sdk/System/Library/Frameworks/OpenGL.framework
OpenGLProject: /opt/homebrew/Cellar/glew/2.2.0_1/lib/libGLEW.2.2.0.dylib
OpenGLProject: /opt/homebrew/Cellar/glfw/3.3.9/lib/libglfw.3.3.dylib
OpenGLProject: CMakeFiles/OpenGLProject.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/gustav.floren/OpenGLProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX executable OpenGLProject"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/OpenGLProject.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/OpenGLProject.dir/build: OpenGLProject
.PHONY : CMakeFiles/OpenGLProject.dir/build

CMakeFiles/OpenGLProject.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/OpenGLProject.dir/cmake_clean.cmake
.PHONY : CMakeFiles/OpenGLProject.dir/clean

CMakeFiles/OpenGLProject.dir/depend:
	cd /Users/gustav.floren/OpenGLProject/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/gustav.floren/OpenGLProject /Users/gustav.floren/OpenGLProject /Users/gustav.floren/OpenGLProject/build /Users/gustav.floren/OpenGLProject/build /Users/gustav.floren/OpenGLProject/build/CMakeFiles/OpenGLProject.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/OpenGLProject.dir/depend
