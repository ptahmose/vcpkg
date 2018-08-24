include(vcpkg_common_functions)
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vurtun/nuklear
    REF 956d33b89a28cc95351d6fcc91bf729be552019f
    SHA512 71c2278eeb50f06e935ebe9b3956bed9bcf68f20392994b9c4a76cb7f5214b15cb87f82ac3d4b009a696cc8f40b704513f9126e759f3893405a11ddab927b5c4
    HEAD_REF master
)
file(INSTALL ${SOURCE_PATH}/nuklear.h DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/Readme.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/nuklear RENAME copyright)
vcpkg_copy_pdbs()
