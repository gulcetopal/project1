# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gulce/project1/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gulce/project1/build

# Utility rule file for odom_gennodejs.

# Include the progress variables for this target.
include odom/CMakeFiles/odom_gennodejs.dir/progress.make

odom_gennodejs: odom/CMakeFiles/odom_gennodejs.dir/build.make

.PHONY : odom_gennodejs

# Rule to build all files generated by this target.
odom/CMakeFiles/odom_gennodejs.dir/build: odom_gennodejs

.PHONY : odom/CMakeFiles/odom_gennodejs.dir/build

odom/CMakeFiles/odom_gennodejs.dir/clean:
	cd /home/gulce/project1/build/odom && $(CMAKE_COMMAND) -P CMakeFiles/odom_gennodejs.dir/cmake_clean.cmake
.PHONY : odom/CMakeFiles/odom_gennodejs.dir/clean

odom/CMakeFiles/odom_gennodejs.dir/depend:
	cd /home/gulce/project1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gulce/project1/src /home/gulce/project1/src/odom /home/gulce/project1/build /home/gulce/project1/build/odom /home/gulce/project1/build/odom/CMakeFiles/odom_gennodejs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : odom/CMakeFiles/odom_gennodejs.dir/depend

