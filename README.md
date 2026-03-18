# how-to-use-zipper-with-cmake
Introduction of how to install zipper library with cmake in project for beginers 

# Guide
## Step1 clone

```shell
git clone https://github.com/hanshuwang1/how-to-use-zipper-with-cmake.git --recursive
```
--recursive is necessary, if you forget it, fix with
```shell
git submodule update --init --recursive
```
## Step2 Configure
according to [zipper](https://github.com/lecrapouille/zipper.git)
```shell
cd zipper
mkdir build
cd build
cmake .. -DZIPPER_SHARED_LIB=ON -DZIPPER_BUILD_DEMOS=ON -DZIPPER_BUILD_TESTS=ON
```
Optional options:

- DZIPPER_SHARED_LIB=ON allows creating a shared lib instead of static lib.
- DZIPPER_BUILD_DEMOS=ON allows compiling zipper and unzipper "hello world" demos.
- DZIPPER_BUILD_TESTS=ON allows compiling unit tests (if you are a developer).
 
Tips:
- In case of accessing github problem, turn DZIPPER_BUILD_TESTS to OFF

## Step3 build
```shell
cmake --build . --config Release
```
Tips:
- Error: The opendir() API is provided by this compiler, so should not be built here
  go to zipper/CMakeList.txt, 

```cmake
# Add platform-specific dependencies
if(WIN32)
    if(MSVC) # MSYS2 already has a dirent interface, so confict
        target_sources(zipper PRIVATE
            src/utils/dirent.c
        )
    endif()
    target_compile_definitions(zipper PRIVATE
        # Prevent Windows' min/max macros from conflicting with std::min/max
        NOMINMAX=ON
    )
endif()
```

## Step4 install

```shell
cd .. 
# now you are in zipper/
cmake --install build/ --prefix ../demo/external/zipper
```

## Step5 use it with cmake
- goto demo
```shell
cd ../demo
```
- modify CMakeLists.txt
```shell
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

```
- modify CMakePresets.json
```json
{
    "version": 1,
    "configurePresets": [
        {
            "name": "zipper_demo",
            "displayName": "zipper_demo Preset",
            "description": "Preset to use zipper",
            "binaryDir": "${sourceDir}/build",
            "generator": "Ninja",
            "cacheVariables": {
                "zipper_DIR": "./external/zipper/lib/cmake/zipper"
            }
        }
    ]
}

```

- Configure and build demo project
```shell
cmake --preset zipper_demo
cmake --build build
```

- test 
```shell
./build/zipper_demo.exe
```
  - now you can will see a error: error while loading shared        libraries: libzipper.dll: cannot open shared object file: No such file or directory which means exe can not find dynamic lib, you should put libzipper.dll and exe in same directory or compile a static lib, feel free to explore.
  - libzipper.dll is in demo/external/zipper/bin/
    run ./build/zipper_demo.exe again, then you can see a zip under root directory.