#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "zipper::zipper" for configuration "Release"
set_property(TARGET zipper::zipper APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(zipper::zipper PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/libzipper.dll.a"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/libzipper.dll"
  )

list(APPEND _cmake_import_check_targets zipper::zipper )
list(APPEND _cmake_import_check_files_for_zipper::zipper "${_IMPORT_PREFIX}/lib/libzipper.dll.a" "${_IMPORT_PREFIX}/bin/libzipper.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
