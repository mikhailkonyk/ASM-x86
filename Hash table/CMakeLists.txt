cmake_minimum_required(VERSION 3.13)
project(Hash_table C)

set(CMAKE_C_STANDARD 11)

include_directories(List)

add_executable(Hash_table
        List/List.c
        List/List.h
        hash_table.c
        hash_table.h
        DataLib.h
        DataLib.c
        HashFunctions.c
        HashFunctions.h)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O0")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0")
set(GCC_COVERAGE_COMPILE_FLAGS "-masm=intel ")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${GCC_COVERAGE_COMPILE_FLAGS}" )
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -no-pie")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -S")



