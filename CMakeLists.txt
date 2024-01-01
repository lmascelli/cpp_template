cmake_minimum_required(VERSION 3.20)


cmake_path(GET CMAKE_CURRENT_SOURCE_DIR FILENAME ProjectName)
string(REPLACE " " "_" PROJECT_NAME ${ProjectName})
project(${PROJECT_NAME}
VERSION 0.1
DESCRIPTION "A c++ library for signal processing"
LANGUAGES CXX)

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
endif()

set(CMAKE_INCLUDE_CURRENT_DIR ON)

include(FetchContent)
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})
include("compiler.cmake")

# FORMAT LIBRARY
set(FMT_TAG 10.1.1)
FetchContent_Declare(
  fmt
  GIT_REPOSITORY https://github.com/fmtlib/fmt.git
  GIT_TAG ${FMT_TAG})

FetchContent_MakeAvailable(fmt)

set(SOURCES main.cpp)

list(TRANSFORM SOURCES PREPEND "src/")

add_executable(${PROJECT_NAME} ${SOURCES})
target_include_directories(${PROJECT_NAME}
                           PRIVATE "${CMAKE_SOURCE_DIR}/include")
target_link_libraries(${PROJECT_NAME} PRIVATE all_warnings warnings_are_errors
                                              fmt::fmt)
