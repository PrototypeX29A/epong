# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/peter/stellarium-0.10.5

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/peter/stellarium-0.10.5

# Include any dependencies generated for this target.
include plugins/EPong/src/CMakeFiles/EPongStelModule.dir/depend.make

# Include the progress variables for this target.
include plugins/EPong/src/CMakeFiles/EPongStelModule.dir/progress.make

# Include the compile flags for this target's objects.
include plugins/EPong/src/CMakeFiles/EPongStelModule.dir/flags.make

plugins/EPong/src/CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.o: plugins/EPong/src/CMakeFiles/EPongStelModule.dir/flags.make
plugins/EPong/src/CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.o: plugins/EPong/src/EPongStelModule.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/peter/stellarium-0.10.5/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object plugins/EPong/src/CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.o"
	cd /home/peter/stellarium-0.10.5/plugins/EPong/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.o -c /home/peter/stellarium-0.10.5/plugins/EPong/src/EPongStelModule.cpp

plugins/EPong/src/CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.i"
	cd /home/peter/stellarium-0.10.5/plugins/EPong/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/peter/stellarium-0.10.5/plugins/EPong/src/EPongStelModule.cpp > CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.i

plugins/EPong/src/CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.s"
	cd /home/peter/stellarium-0.10.5/plugins/EPong/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/peter/stellarium-0.10.5/plugins/EPong/src/EPongStelModule.cpp -o CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.s

plugins/EPong/src/CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.o.requires:
.PHONY : plugins/EPong/src/CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.o.requires

plugins/EPong/src/CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.o.provides: plugins/EPong/src/CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.o.requires
	$(MAKE) -f plugins/EPong/src/CMakeFiles/EPongStelModule.dir/build.make plugins/EPong/src/CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.o.provides.build
.PHONY : plugins/EPong/src/CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.o.provides

plugins/EPong/src/CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.o.provides.build: plugins/EPong/src/CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.o
.PHONY : plugins/EPong/src/CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.o.provides.build

plugins/EPong/src/CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.o: plugins/EPong/src/CMakeFiles/EPongStelModule.dir/flags.make
plugins/EPong/src/CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.o: plugins/EPong/src/moc_EPongStelModule.cxx
	$(CMAKE_COMMAND) -E cmake_progress_report /home/peter/stellarium-0.10.5/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object plugins/EPong/src/CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.o"
	cd /home/peter/stellarium-0.10.5/plugins/EPong/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.o -c /home/peter/stellarium-0.10.5/plugins/EPong/src/moc_EPongStelModule.cxx

plugins/EPong/src/CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.i"
	cd /home/peter/stellarium-0.10.5/plugins/EPong/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/peter/stellarium-0.10.5/plugins/EPong/src/moc_EPongStelModule.cxx > CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.i

plugins/EPong/src/CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.s"
	cd /home/peter/stellarium-0.10.5/plugins/EPong/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/peter/stellarium-0.10.5/plugins/EPong/src/moc_EPongStelModule.cxx -o CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.s

plugins/EPong/src/CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.o.requires:
.PHONY : plugins/EPong/src/CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.o.requires

plugins/EPong/src/CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.o.provides: plugins/EPong/src/CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.o.requires
	$(MAKE) -f plugins/EPong/src/CMakeFiles/EPongStelModule.dir/build.make plugins/EPong/src/CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.o.provides.build
.PHONY : plugins/EPong/src/CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.o.provides

plugins/EPong/src/CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.o.provides.build: plugins/EPong/src/CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.o
.PHONY : plugins/EPong/src/CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.o.provides.build

plugins/EPong/src/moc_EPongStelModule.cxx: plugins/EPong/src/EPongStelModule.hpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/peter/stellarium-0.10.5/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating moc_EPongStelModule.cxx"
	cd /home/peter/stellarium-0.10.5/plugins/EPong/src && /usr/bin/moc-qt4 -I/usr/include/qt4 -I/usr/include/qt4/QtOpenGL -I/usr/include/qt4/QtScript -I/usr/include/qt4/QtGui -I/usr/include/qt4/QtTest -I/usr/include/qt4/QtSql -I/usr/include/qt4/QtNetwork -I/usr/include/qt4/QtCore -I/home/peter/stellarium-0.10.5 -I/home/peter/stellarium-0.10.5/src -I/home/peter/stellarium-0.10.5/src/core -I/home/peter/stellarium-0.10.5/src/core/modules -I/home/peter/stellarium-0.10.5/src/core/planetsephems -I/home/peter/stellarium-0.10.5/src/core/external -I/home/peter/stellarium-0.10.5/src/core/external/kfilter -I/home/peter/stellarium-0.10.5/src/core/external/glues_stel/source -I/home/peter/stellarium-0.10.5/src/core/external/glues_stel/source/libtess -I/home/peter/stellarium-0.10.5/src/gui -I/home/peter/stellarium-0.10.5/src/scripting -I/usr/include -I/home/peter/stellarium-0.10.5/plugins/EPong/src/. -DPACKAGE_VERSION="0.10.5" -DHAVE_POW10 -DENABLE_NLS -DENABLE_SCRIPT_CONSOLE -DDEFAULT_GRAPHICS_SYSTEM="raster" -DQT_DLL -DQT_OPENGL_LIB -DQT_SCRIPT_LIB -DQT_GUI_LIB -DQT_TEST_LIB -DQT_SQL_LIB -DQT_NETWORK_LIB -DQT_CORE_LIB -DINSTALL_DATADIR="/usr/local/share/stellarium" -DINSTALL_LOCALEDIR="/usr/local/share/locale" -DQT_NO_DEBUG -DNDEBUG -DQT_PLUGIN -DQT_DLL -D_REENTRANT -o /home/peter/stellarium-0.10.5/plugins/EPong/src/moc_EPongStelModule.cxx /home/peter/stellarium-0.10.5/plugins/EPong/src/EPongStelModule.hpp

# Object files for target EPongStelModule
EPongStelModule_OBJECTS = \
"CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.o" \
"CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.o"

# External object files for target EPongStelModule
EPongStelModule_EXTERNAL_OBJECTS =

plugins/EPong/src/libEPongStelModule.so: plugins/EPong/src/CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.o
plugins/EPong/src/libEPongStelModule.so: plugins/EPong/src/CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.o
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libQtOpenGL.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libQtScript.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libQtGui.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libpng.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libSM.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libICE.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libXrender.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libfreetype.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libXext.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libX11.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libm.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libQtSql.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libQtNetwork.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libQtCore.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libz.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libgthread-2.0.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libglib-2.0.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libgobject-2.0.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/librt.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libGLU.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libGL.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libSM.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libICE.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libX11.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libXext.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libc.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libc.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libXrender.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libfreetype.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libm.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libQtSql.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libQtNetwork.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libQtCore.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libz.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libgthread-2.0.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libglib-2.0.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libgobject-2.0.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/librt.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libGLU.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libGL.so
plugins/EPong/src/libEPongStelModule.so: /usr/lib/libc.so
plugins/EPong/src/libEPongStelModule.so: plugins/EPong/src/CMakeFiles/EPongStelModule.dir/build.make
plugins/EPong/src/libEPongStelModule.so: plugins/EPong/src/CMakeFiles/EPongStelModule.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module libEPongStelModule.so"
	cd /home/peter/stellarium-0.10.5/plugins/EPong/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/EPongStelModule.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
plugins/EPong/src/CMakeFiles/EPongStelModule.dir/build: plugins/EPong/src/libEPongStelModule.so
.PHONY : plugins/EPong/src/CMakeFiles/EPongStelModule.dir/build

plugins/EPong/src/CMakeFiles/EPongStelModule.dir/requires: plugins/EPong/src/CMakeFiles/EPongStelModule.dir/EPongStelModule.cpp.o.requires
plugins/EPong/src/CMakeFiles/EPongStelModule.dir/requires: plugins/EPong/src/CMakeFiles/EPongStelModule.dir/moc_EPongStelModule.cxx.o.requires
.PHONY : plugins/EPong/src/CMakeFiles/EPongStelModule.dir/requires

plugins/EPong/src/CMakeFiles/EPongStelModule.dir/clean:
	cd /home/peter/stellarium-0.10.5/plugins/EPong/src && $(CMAKE_COMMAND) -P CMakeFiles/EPongStelModule.dir/cmake_clean.cmake
.PHONY : plugins/EPong/src/CMakeFiles/EPongStelModule.dir/clean

plugins/EPong/src/CMakeFiles/EPongStelModule.dir/depend: plugins/EPong/src/moc_EPongStelModule.cxx
	cd /home/peter/stellarium-0.10.5 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/peter/stellarium-0.10.5 /home/peter/stellarium-0.10.5/plugins/EPong/src /home/peter/stellarium-0.10.5 /home/peter/stellarium-0.10.5/plugins/EPong/src /home/peter/stellarium-0.10.5/plugins/EPong/src/CMakeFiles/EPongStelModule.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : plugins/EPong/src/CMakeFiles/EPongStelModule.dir/depend

