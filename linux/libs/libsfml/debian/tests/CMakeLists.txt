# Test CMake project to ensure FindSFML.cmake works properly

cmake_minimum_required(VERSION 3.7.2)
project(SFMLTest CXX)

# Try to find SFML using CMake config file
#  Even though this test doesn't need them, request all components to check they exist
find_package(SFML 2 COMPONENTS audio graphics network system window REQUIRED CONFIG)

# Build the exexutable
add_executable(sfml_test sfml_test.cpp)
target_link_libraries(sfml_test sfml-network sfml-system)
