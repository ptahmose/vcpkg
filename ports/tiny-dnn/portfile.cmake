#header-only library
include(vcpkg_common_functions)
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO tiny-dnn/tiny-dnn
    REF e05f0c95636edb3b5ae30e830972ca708ed6733e
    SHA512 b727a6782f6386bd457771cf9bed57075aa10f74bc0d6aebf7e25461bb19314d2a99039d0bc9fdc8e385ab80dcb0cb0a41fb07ea4f27f280c952832a9d1db3a6
    HEAD_REF master
)

file(COPY ${SOURCE_PATH}/tiny_dnn DESTINATION ${CURRENT_PACKAGES_DIR}/include/)

file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/tiny-dnn)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/tiny-dnn/LICENSE ${CURRENT_PACKAGES_DIR}/share/tiny-dnn/copyright)
