include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO google/re2
    REF c6945bedb469c6d4275584a3c4e605dc15771614
    SHA512 582d39ddfea0708ac92aef7653a90f09b406a3e693a2c838ad0ecafb8cf975b9a77f036ed9fed74ea6131027a0fe6571a26eff55be89b6f17a2a55c630ada9f8
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS -DRE2_BUILD_TESTING=OFF
)

vcpkg_install_cmake()

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/re2 RENAME copyright)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
