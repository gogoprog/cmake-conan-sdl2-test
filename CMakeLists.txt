cmake_minimum_required(VERSION 2.8)
project(cmakeconan)

set(CMAKE_CXX_STANDARD 17)

if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
   message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
   file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/master/conan.cmake"
                  "${CMAKE_BINARY_DIR}/conan.cmake")
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

conan_cmake_run(
   REQUIRES
      sdl2/2.0.8@bincrafters/stable
   OPTIONS
      sdl2:nas=False
   BASIC_SETUP
   CMAKE_TARGETS
   BUILD missing
   )

add_executable(main src/main.cpp)
target_link_libraries(main CONAN_PKG::sdl2)
