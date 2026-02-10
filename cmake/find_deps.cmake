include(FetchContent)

FetchContent_Declare(
    IATest
    GIT_REPOSITORY https://github.com/I-A-S/IATest
    GIT_TAG        main
    OVERRIDE_FIND_PACKAGE
)

FetchContent_MakeAvailable(IATest)