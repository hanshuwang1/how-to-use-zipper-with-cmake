
####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was zipperConfig.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

# Zipper CMake Configuration File
# This file is configured during the build process to help find_package(zipper) work

# Set the version
set(ZIPPER_VERSION 3.0.2)

# Include the target definitions
include("${CMAKE_CURRENT_LIST_DIR}/zipperTargets.cmake")

# Set the include directories
set_and_check(ZIPPER_INCLUDE_DIRS "${PACKAGE_PREFIX_DIR}/include")

# Set the libraries
set(ZIPPER_LIBRARIES zipper::zipper)

# Check that all required components are available
check_required_components(zipper)
