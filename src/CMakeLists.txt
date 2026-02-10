set(SRC_FILES
    "cpp/file.cpp"
    "cpp/async.cpp"
    "cpp/process.cpp"
)

add_library(IAPlatformOps STATIC ${SRC_FILES})

target_include_directories(IAPlatformOps PRIVATE hpp)
target_include_directories(IAPlatformOps PUBLIC ${PLATFORM_OPS_ROOT}/include)

target_link_libraries(IAPlatformOps PUBLIC
    IACrux
)
