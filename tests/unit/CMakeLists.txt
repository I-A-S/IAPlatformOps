set(SRC_FILES
  main.cpp

  file.cpp
  async.cpp
  process.cpp
)

add_executable(PlatformOps_Test_Suite ${SRC_FILES})

target_link_libraries(PlatformOps_Test_Suite PRIVATE
  IATest
  IAPlatformOps
)

set_target_properties(PlatformOps_Test_Suite PROPERTIES USE_EXCEPTIONS ON)
