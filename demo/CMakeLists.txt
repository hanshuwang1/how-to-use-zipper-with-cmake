cmake_minimum_required(VERSION 3.25)
project(Zipper_demo)

# find zipper package 
find_package(zipper REQUIRED CONFIG)

# add demo executable
add_executable(zipper_demo
    main.cpp
)

# link zipper library to demo executable
target_link_libraries(zipper_demo
    PRIVATE
        zipper::zipper
)
