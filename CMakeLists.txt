cmake_minimum_required(VERSION 3.20)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_BUILD_TYPE "Debug")

project(<PROJECT_NAME> LANGUAGES CXX)

include("cmake/compiler.cmake")

set(SOURCES
  main.cpp)

list(TRANSFORM SOURCES PREPEND "src/")

add_executable(${PROJECT_NAME} ${SOURCES})
target_link_libraries(${PROJECT_NAME} PRIVATE)
