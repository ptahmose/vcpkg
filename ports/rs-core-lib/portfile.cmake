include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO CaptainCrowbar/rs-core-lib
    REF afae23ef7cce7afb5c95c8320f7e2db370f28f19
    SHA512 d587fdd23dbeb80f11b092eaf82dcdc791a789eda91af651988ebafb8613ac81bbab9f6b9c3b63ad6518567c248deb7faad54a5b446be583ef2a7fa6932b6afe
    HEAD_REF master
)

file(INSTALL ${SOURCE_PATH}/rs-core DESTINATION ${CURRENT_PACKAGES_DIR}/include FILES_MATCHING PATTERN "*.hpp")

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE.TXT DESTINATION ${CURRENT_PACKAGES_DIR}/share/rs-core-lib RENAME copyright)