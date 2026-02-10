cmake_minimum_required(VERSION 3.20)

project(PlatformOps)
enable_testing()

if(CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_SOURCE_DIR)
    set(PLATFORM_OPS_IS_TOP_LEVEL ON)
else()
    set(PLATFORM_OPS_IS_TOP_LEVEL OFF)
endif()

set(PLATFORM_OPS_ROOT "${CMAKE_CURRENT_LIST_DIR}" CACHE INTERNAL "")

if(TARGET IACrux)
    message(STATUS "PlatformOps: Using external IACrux provided by parent project")
else()
    message(STATUS "PlatformOps: Building standalone, using local IACrux submodule")
    if(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/IACrux/CMakeLists.txt")
        message(FATAL_ERROR "IACrux submodule missing! Run: git submodule update --init --recursive")
    endif()
    add_subdirectory(IACrux)
endif()

crux_setup_project()

option(PlatformOps_BUILD_TESTS "Build unit tests" ${PLATFORM_OPS_IS_TOP_LEVEL})

include(cmake/find_deps.cmake)

add_subdirectory(src/)

if(PlatformOps_BUILD_TESTS)
    add_subdirectory(tests)
endif()
