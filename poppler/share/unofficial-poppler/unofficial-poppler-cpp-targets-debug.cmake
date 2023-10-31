#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "unofficial::poppler::poppler-cpp" for configuration "Debug"
set_property(TARGET unofficial::poppler::poppler-cpp APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::poppler::poppler-cpp PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/poppler-cpp.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/poppler-cpp.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::poppler::poppler-cpp )
list(APPEND _cmake_import_check_files_for_unofficial::poppler::poppler-cpp "${_IMPORT_PREFIX}/debug/lib/poppler-cpp.lib" "${_IMPORT_PREFIX}/debug/bin/poppler-cpp.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
