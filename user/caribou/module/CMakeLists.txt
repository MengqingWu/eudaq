aux_source_directory(src MODULE_SRC)
INCLUDE_DIRECTORIES(include)

ADD_LIBRARY(${EUDAQ_MODULE} SHARED ${MODULE_SRC})
TARGET_LINK_LIBRARIES(${EUDAQ_MODULE} PUBLIC ${EUDAQ_CORE_LIBRARY})
target_link_libraries(${EUDAQ_MODULE} PRIVATE Caribou::peary Caribou::devices)
TARGET_INCLUDE_DIRECTORIES(${EUDAQ_MODULE} SYSTEM PRIVATE ${Peary_INCLUDE_DIRS})


install(TARGETS
  ${EUDAQ_MODULE}
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib)
