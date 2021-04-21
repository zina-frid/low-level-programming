# cmake_minimum_required(VERSION <specify CMake version here>)
project(llp4 C)

set(CMAKE_C_STANDARD 99)

add_executable(llp4 main.c merge.c merge.h)