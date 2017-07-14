cmake_minimum_required(VERSION 3.0)
project(gamejam2017)

add_definitions("-g -Wall -Wextra -pedantic -Werror -std=c++14 -Wno-unused-parameter")

file(GLOB_RECURSE sources src/*.cpp src/*.hpp)
add_executable(game ${sources})

include(FindPkgConfig)
pkg_check_modules(SDL2 REQUIRED sdl2 SDL2_image SDL2_mixer SDL2_ttf)

# What does this do?
set(ENTITYX_BUILD_TESTING false CACHE BOOL "")
add_subdirectory(entityx)

include_directories(SYSTEM
    ${SDL2_INCLUDE_DIRS}
    glm/
    entityx/
    src/
)

target_link_libraries(gamejam2017 ${SDL2_LIBRARIES} entityx)
