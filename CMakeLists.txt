cmake_minimum_required(VERSION 3.0)
project(verilator-project-template)

find_package(Threads REQUIRED)
find_package(verilator HINTS $ENV{VERILATOR_ROOT})

include_directories(external/doctest/doctest)

set(CMAKE_CXX_STANDARD 20)
set(TEST_SRC
    test/ArithCircuitTest.cpp)

add_executable(unittests ${TEST_SRC})
target_link_libraries(unittests Threads::Threads)
verilate(
    unittests
    COVERAGE
    TRACE
    DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/verilator
    SOURCES verilog/ArithCircuit.v)

