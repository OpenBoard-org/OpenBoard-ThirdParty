#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "unofficial::poppler::poppler-private" for configuration "Release"
set_property(TARGET unofficial::poppler::poppler-private APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::poppler::poppler-private PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/poppler.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "openjp2"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/poppler.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::poppler::poppler-private )
list(APPEND _cmake_import_check_files_for_unofficial::poppler::poppler-private "${_IMPORT_PREFIX}/lib/poppler.lib" "${_IMPORT_PREFIX}/bin/poppler.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
