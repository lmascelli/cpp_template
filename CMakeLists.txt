cmake_minimum_required(VERSION 3.20)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_BUILD_TYPE "Debug")

cmake_path(GET CMAKE_CURRENT_SOURCE_DIR FILENAME ProjectName)   
string(REPLACE " " "_" PROJECT_NAME ${ProjectName})
project(${PROJECT_NAME} LANGUAGES CXX)

include("cmake/compiler.cmake")

set(SOURCES
  main.cpp)

list(TRANSFORM SOURCES PREPEND "src/")

add_executable(${PROJECT_NAME} ${SOURCES})
target_link_libraries(${PROJECT_NAME} PRIVATE)
