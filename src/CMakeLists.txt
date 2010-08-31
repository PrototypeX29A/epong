INCLUDE_DIRECTORIES(.)

LINK_DIRECTORIES(${BUILD_DIR}/src)

SET(EPongStelModule_SRCS
  EPongStelModule.hpp
  EPongStelModule.cpp)

# Add here all the files which require moc compilation
# that is, all the headers with SIGNAL/SLOTS/PLUGIN_INTERFACE etc..
SET(EPongStelModule_MOC_HDRS
 EPongStelModule.hpp)

# After this call, HelloStelModule_MOC_SRCS = moc_HelloStelModule.cxx
QT4_WRAP_CPP(EPongStelModule_MOC_SRCS ${EPongStelModule_MOC_HDRS})

SET(extLinkerOption ${QT_LIBRARIES} ${JPEG_LIBRARIES} ${PNG_LIBRARIES} ${OPENGL_LIBRARIES} ${ICONV_LIBRARIES} ${INTL_LIBRARIES})

############### For building the dynamic library ######################
IF(BUILD_DYNAMIC_PLUGINS)
	ADD_LIBRARY(EPongStelModule MODULE ${EPongStelModule_SRCS} ${EPongStelModule_MOC_SRCS})
	IF(APPLE)
		FIND_LIBRARY(OPENGL_LIBRARY OpenGL)
		MARK_AS_ADVANCED(OPENGL_LIBRARY)
		SET_TARGET_PROPERTIES(EPongStelModule PROPERTIES LINK_FLAGS "-undefined dynamic_lookup" SUFFIX ".dylib")
	ENDIF()

	IF(WIN32)
		SET_TARGET_PROPERTIES(EPongStelModule PROPERTIES LINK_FLAGS "-enable-runtime-pseudo-reloc -Wl,--allow-multiple-definition" )
		SET(StelMain stelMainEPong)
	ELSE(WIN32)
		SET(StelMain )
	ENDIF(WIN32)

	TARGET_LINK_LIBRARIES(EPongStelModule ${StelMain} ${extLinkerOption})
	INSTALL(TARGETS EPongStelModule DESTINATION "modules/EPongStelModule")
ENDIF()

############### For building the static library ######################
IF(BUILD_STATIC_PLUGINS)
	ADD_LIBRARY(EPongStelModule-static STATIC ${EPongStelModule_SRCS} ${EPongStelModule_MOC_SRCS})
	# The library target "HelloStelModule-static" has a default OUTPUT_NAME of "HelloStelModule-static", so change it.
	SET_TARGET_PROPERTIES(EPongStelModule-static PROPERTIES OUTPUT_NAME "EPongStelModule")
	TARGET_LINK_LIBRARIES(EPongStelModule-static ${extLinkerOption})
	IF(WIN32EPong)
		SET_TARGET_PROPERTIES(EPongStelModule-static PROPERTIES COMPILE_FLAGS "-DQT_STATICPLUGIN")
	ELSE()
		SET_TARGET_PROPERTIES(EPongStelModule-static PROPERTIES COMPILE_FLAGS "-fPIC -DQT_STATICPLUGIN")
	ENDIF()
	ADD_DEPENDENCIES(AllStaticPlugins EPongStelModule-static)
ENDIF()
