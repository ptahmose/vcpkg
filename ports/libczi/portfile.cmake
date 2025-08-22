set(LIBCZI_REPO_NAME HakanAcundas/libczi)
set(LIBCZI_REPO_REF fa12b8d9dc465e89722ad4ee0e6c0ffce31caf1a)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ${LIBCZI_REPO_NAME}
    REF ${LIBCZI_REPO_REF}
    SHA512 84d3efe4490851bcb86485b4c60c03fff7f37e592e83accba55b435ebb273b0bce376a6e492c4983ad62d9396b59284d97115a98bf5a45d2b2496b171ba29cb2
)

# Translate enabled vcpkg features into CMake -D flags:
vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTS
    FEATURES
        azureblobstore  LIBCZI_BUILD_AZURESDK_BASED_STREAM
        curl            LIBCZI_BUILD_CURL_BASED_STREAM 
        curl            LIBCZI_BUILD_PREFER_EXTERNALPACKAGE_LIBCURL
)

string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "dynamic" BUILD_SHARED_LIBCZI)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTS}
        -DLIBCZI_DO_NOT_SET_MSVC_RUNTIME_LIBRARY=ON  # set by vcpkg
        -DLIBCZI_BUILD_CZICMD=OFF  # could be feature
        -DLIBCZI_BUILD_DYNLIB=${BUILD_SHARED_LIBCZI}
        -DLIBCZI_BUILD_PREFER_EXTERNALPACKAGE_EIGEN3=ON
        -DLIBCZI_BUILD_PREFER_EXTERNALPACKAGE_ZSTD=ON
        -DLIBCZI_BUILD_UNITTESTS=OFF
        -DLIBCZI_ENABLE_INSTALL=ON
        # for cross-compilation scenarios, prevent execution of test-programs inside the libCZI-build-scripts
        -DCRASH_ON_UNALIGNED_ACCESS=FALSE
        -DIS_BIG_ENDIAN=FALSE
        -DNEON_INTRINSICS_CAN_BE_USED=TRUE        
        # VCS metadata injection
        -DLIBCZI_REPOSITORY_HASH=${LIBCZI_REPO_REF}   
        -DLIBCZI_REPOSITORY_BRANCH=unknown
        -DLIBCZI_REPOSITORY_REMOTE=https://github.com/${LIBCZI_REPO_NAME}.git
    MAYBE_UNUSED_VARIABLES        
        CRASH_ON_UNALIGNED_ACCESS
        IS_BIG_ENDIAN
        NEON_INTRINSICS_CAN_BE_USED
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH share/libczi)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")
