
if (CMAKE_VERSION VERSION_LESS 2.8.3)
    message(FATAL_ERROR "Qt 5 requires at least CMake version 2.8.3")
endif()

get_filename_component(_qt5AxBase_install_prefix "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

# For backwards compatibility only. Use Qt5AxBase_VERSION instead.
set(Qt5AxBase_VERSION_STRING 5.6.3)

set(Qt5AxBase_LIBRARIES Qt5::AxBase)

macro(_qt5_AxBase_check_file_exists file)
    if(NOT EXISTS "${file}" )
        message(FATAL_ERROR "The imported target \"Qt5::AxBase\" references the file
   \"${file}\"
but this file does not exist.  Possible reasons include:
* The file was deleted, renamed, or moved to another location.
* An install or uninstall procedure did not complete successfully.
* The installation package was faulty and contained
   \"${CMAKE_CURRENT_LIST_FILE}\"
but not all the files it references.
")
    endif()
endmacro()

macro(_populate_AxBase_target_properties Configuration LIB_LOCATION IMPLIB_LOCATION)
    set_property(TARGET Qt5::AxBase APPEND PROPERTY IMPORTED_CONFIGURATIONS ${Configuration})

    set(imported_location "${_qt5AxBase_install_prefix}/lib/${LIB_LOCATION}")
    _qt5_AxBase_check_file_exists(${imported_location})
    set_target_properties(Qt5::AxBase PROPERTIES
        "INTERFACE_LINK_LIBRARIES" "${_Qt5AxBase_LIB_DEPENDENCIES}"
        "IMPORTED_LOCATION_${Configuration}" ${imported_location}
        # For backward compatibility with CMake < 2.8.12
        "IMPORTED_LINK_INTERFACE_LIBRARIES_${Configuration}" "${_Qt5AxBase_LIB_DEPENDENCIES}"
    )

    set(imported_implib "${_qt5AxBase_install_prefix}/lib/${IMPLIB_LOCATION}")
    _qt5_AxBase_check_file_exists(${imported_implib})
    if(NOT "${IMPLIB_LOCATION}" STREQUAL "")
        set_target_properties(Qt5::AxBase PROPERTIES
        "IMPORTED_IMPLIB_${Configuration}" ${imported_implib}
        )
    endif()
endmacro()

if (NOT TARGET Qt5::AxBase)

    set(_Qt5AxBase_OWN_INCLUDE_DIRS "${_qt5AxBase_install_prefix}/include/" "${_qt5AxBase_install_prefix}/include/ActiveQt")
    set(Qt5AxBase_PRIVATE_INCLUDE_DIRS
        "${_qt5AxBase_install_prefix}/include/ActiveQt/5.6.3"
        "${_qt5AxBase_install_prefix}/include/ActiveQt/5.6.3/ActiveQt"
    )

    foreach(_dir ${_Qt5AxBase_OWN_INCLUDE_DIRS})
        _qt5_AxBase_check_file_exists(${_dir})
    endforeach()

    # Only check existence of private includes if the Private component is
    # specified.
    list(FIND Qt5AxBase_FIND_COMPONENTS Private _check_private)
    if (NOT _check_private STREQUAL -1)
        foreach(_dir ${Qt5AxBase_PRIVATE_INCLUDE_DIRS})
            _qt5_AxBase_check_file_exists(${_dir})
        endforeach()
    endif()

    set(Qt5AxBase_INCLUDE_DIRS ${_Qt5AxBase_OWN_INCLUDE_DIRS})

    set(Qt5AxBase_DEFINITIONS -DQT_AXBASE_LIB)
    set(Qt5AxBase_COMPILE_DEFINITIONS QT_AXBASE_LIB)
    set(_Qt5AxBase_MODULE_DEPENDENCIES "Widgets;Gui;Core")


    set(_Qt5AxBase_FIND_DEPENDENCIES_REQUIRED)
    if (Qt5AxBase_FIND_REQUIRED)
        set(_Qt5AxBase_FIND_DEPENDENCIES_REQUIRED REQUIRED)
    endif()
    set(_Qt5AxBase_FIND_DEPENDENCIES_QUIET)
    if (Qt5AxBase_FIND_QUIETLY)
        set(_Qt5AxBase_DEPENDENCIES_FIND_QUIET QUIET)
    endif()
    set(_Qt5AxBase_FIND_VERSION_EXACT)
    if (Qt5AxBase_FIND_VERSION_EXACT)
        set(_Qt5AxBase_FIND_VERSION_EXACT EXACT)
    endif()

    set(Qt5AxBase_EXECUTABLE_COMPILE_FLAGS "")

    foreach(_module_dep ${_Qt5AxBase_MODULE_DEPENDENCIES})
        if (NOT Qt5${_module_dep}_FOUND)
            find_package(Qt5${_module_dep}
                5.6.3 ${_Qt5AxBase_FIND_VERSION_EXACT}
                ${_Qt5AxBase_DEPENDENCIES_FIND_QUIET}
                ${_Qt5AxBase_FIND_DEPENDENCIES_REQUIRED}
                PATHS "${CMAKE_CURRENT_LIST_DIR}/.." NO_DEFAULT_PATH
            )
        endif()

        if (NOT Qt5${_module_dep}_FOUND)
            set(Qt5AxBase_FOUND False)
            return()
        endif()

        list(APPEND Qt5AxBase_INCLUDE_DIRS "${Qt5${_module_dep}_INCLUDE_DIRS}")
        list(APPEND Qt5AxBase_PRIVATE_INCLUDE_DIRS "${Qt5${_module_dep}_PRIVATE_INCLUDE_DIRS}")
        list(APPEND Qt5AxBase_DEFINITIONS ${Qt5${_module_dep}_DEFINITIONS})
        list(APPEND Qt5AxBase_COMPILE_DEFINITIONS ${Qt5${_module_dep}_COMPILE_DEFINITIONS})
        list(APPEND Qt5AxBase_EXECUTABLE_COMPILE_FLAGS ${Qt5${_module_dep}_EXECUTABLE_COMPILE_FLAGS})
    endforeach()
    list(REMOVE_DUPLICATES Qt5AxBase_INCLUDE_DIRS)
    list(REMOVE_DUPLICATES Qt5AxBase_PRIVATE_INCLUDE_DIRS)
    list(REMOVE_DUPLICATES Qt5AxBase_DEFINITIONS)
    list(REMOVE_DUPLICATES Qt5AxBase_COMPILE_DEFINITIONS)
    list(REMOVE_DUPLICATES Qt5AxBase_EXECUTABLE_COMPILE_FLAGS)

    set(_Qt5AxBase_LIB_DEPENDENCIES "Qt5::Widgets;Qt5::Gui;Qt5::Core")


    add_library(Qt5::AxBase STATIC IMPORTED)
    set_property(TARGET Qt5::AxBase PROPERTY IMPORTED_LINK_INTERFACE_LANGUAGES CXX)

    set_property(TARGET Qt5::AxBase PROPERTY
      INTERFACE_INCLUDE_DIRECTORIES ${_Qt5AxBase_OWN_INCLUDE_DIRS})
    set_property(TARGET Qt5::AxBase PROPERTY
      INTERFACE_COMPILE_DEFINITIONS QT_AXBASE_LIB)

    _populate_AxBase_target_properties(RELEASE "libQt5AxBase.a" "" )



    _populate_AxBase_target_properties(DEBUG "libQt5AxBased.a" "" )



    file(GLOB pluginTargets "${CMAKE_CURRENT_LIST_DIR}/Qt5AxBase_*Plugin.cmake")

    macro(_populate_AxBase_plugin_properties Plugin Configuration PLUGIN_LOCATION)
        set_property(TARGET Qt5::${Plugin} APPEND PROPERTY IMPORTED_CONFIGURATIONS ${Configuration})

        set(imported_location "${_qt5AxBase_install_prefix}/plugins/${PLUGIN_LOCATION}")
        _qt5_AxBase_check_file_exists(${imported_location})
        set_target_properties(Qt5::${Plugin} PROPERTIES
            "IMPORTED_LOCATION_${Configuration}" ${imported_location}
        )
    endmacro()

    if (pluginTargets)
        foreach(pluginTarget ${pluginTargets})
            include(${pluginTarget})
        endforeach()
    endif()




_qt5_AxBase_check_file_exists("${CMAKE_CURRENT_LIST_DIR}/Qt5AxBaseConfigVersion.cmake")

endif()
