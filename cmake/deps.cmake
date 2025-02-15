if(NOT HPCC_DEPS_DIR)
    set(HPCC_DEPS_DIR ${CMAKE_CURRENT_SOURCE_DIR}/deps)
endif()

include(FetchContent)

set(FETCHCONTENT_BASE_DIR ${HPCC_DEPS_DIR})
set(FETCHCONTENT_QUIET OFF)

if(PPLCOMMON_HOLD_DEPS)
    set(FETCHCONTENT_UPDATES_DISCONNECTED ON)
endif()

FetchContent_Declare(hpcc
    GIT_REPOSITORY https://github.com/openppl-public/hpcc.git
    GIT_TAG 1b714b9f895374413e3c4b7f33ff24e34bd71d71
    SOURCE_DIR ${HPCC_DEPS_DIR}/hpcc
    BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/hpcc-build
    SUBBUILD_DIR ${HPCC_DEPS_DIR}/hpcc-subbuild)

FetchContent_GetProperties(hpcc)
if(NOT hpcc_POPULATED)
    FetchContent_Populate(hpcc)
    include(${hpcc_SOURCE_DIR}/cmake/hpcc-common.cmake)
endif()

# --------------------------------------------------------------------------- #

set(PYBIND11_INSTALL OFF CACHE BOOL "disable pybind11 installation")
set(PYBIND11_TEST OFF CACHE BOOL "disable pybind11 tests")
set(PYBIND11_NOPYTHON ON CACHE BOOL "do not find python")
set(PYBIND11_FINDPYTHON OFF CACHE BOOL "do not find python")

hpcc_declare_pkg_dep(pybind11
    https://github.com/pybind/pybind11/archive/refs/tags/v2.8.1.zip
    9a6be23096afcafe9f4124a5054776eb)

# --------------------------------------------------------------------------- #

set(LUACPP_INSTALL OFF CACHE BOOL "")
set(LUACPP_BUILD_TESTS OFF CACHE BOOL "")

hpcc_declare_pkg_dep(luacpp
    https://github.com/ouonline/lua-cpp/archive/7f2cb9fdfa208b8757b2d490ff943c78700bc882.zip
    87332cd233dcad8b750ec4dbec7d1b9e)

# --------------------------------------------------------------------------- #

set(INSTALL_GTEST OFF CACHE BOOL "")
set(BUILD_SHARED_LIBS OFF CACHE BOOL "")

hpcc_declare_pkg_dep(googletest
    https://github.com/google/googletest/archive/refs/tags/release-1.10.0.zip
    82358affdd7ab94854c8ee73a180fc53)

# --------------------------------------------------------------------------- #

set(BENCHMARK_ENABLE_TESTING OFF CACHE BOOL "disable benchmark tests")
set(BENCHMARK_ENABLE_INSTALL OFF CACHE BOOL "")

hpcc_declare_pkg_dep(benchmark
    https://github.com/google/benchmark/archive/refs/tags/v1.5.5.zip
    a63769bd25b5c924b5f4210603fec191)
