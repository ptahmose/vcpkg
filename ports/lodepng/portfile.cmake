include(vcpkg_common_functions)

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO lvandeve/lodepng
  REF 75ba85fe0b58c008a3b150eadfdfe1cb393bab04
  SHA512 a0f731c917e2fdc796dac409aa8487a3ec8a0217304fedd37f0ea1711db3c9f6b85e29931a806d2bec3b4fef463cd7925c169fb8f19f6d3cd145a228dec3ae44
  HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS_DEBUG
    -DDISABLE_INSTALL_HEADERS=ON
    -DDISABLE_INSTALL_TOOLS=ON
    -DDDISABLE_INSTALL_EXAMPLES=ON
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

vcpkg_copy_tool_dependencies(${CURRENT_PACKAGES_DIR}/tools/lodepng)


file(INSTALL ${SOURCE_PATH}/lodepng.h DESTINATION ${CURRENT_PACKAGES_DIR}/share/lodepng RENAME copyright)
