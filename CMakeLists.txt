cmake_minimum_required(VERSION 2.8.8)
project(postfix)

find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

# Set your project compile flags.
# E.g. if using the C++ header files
# you will need to enable C++11 support
# for your compiler.
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -fno-rtti -v")

include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

set(exe_name "postfix")
set(source_files postfix.cpp ast.cpp sexp/sexp.cpp)

# Now build our tools
add_executable(${exe_name} ${source_files})

# Find the libraries that correspond to the LLVM components
# that we wish to use
llvm_map_components_to_libnames(llvm_libs support core interpreter)

message(STATUS "LLVM libnames needed: ${llvm_libs}")

# Link against LLVM libraries
target_link_libraries(${exe_name} ${llvm_libs})
