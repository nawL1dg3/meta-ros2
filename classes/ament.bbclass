DEPENDS_append = " \
    ament-tools-native \
    ament-cmake-native \
    ament-cmake-export-definitions-native \
    ament-cmake-export-dependencies-native \
    ament-cmake-export-include-directories-native \
    ament-cmake-export-interfaces-native \
    ament-cmake-export-libraries-native \
    ament-cmake-export-link-flags-native \
    ament-cmake-libraries-native \
    ament-cmake-python-native \
    ament-cmake-target-dependencies-native \
    ament-cmake-include-directories-native \
    ament-cmake-test-native \
"

ROS_BPN ?= "${@d.getVar('BPN', True).replace('-', '_')}"

S = "${WORKDIR}/git/${ROS_BPN}"

EXTRA_OECMAKE_append = " -DBUILD_TESTING=OFF"
export AMENT_PREFIX_PATH="${STAGING_DIR_HOST}${prefix};${STAGING_DIR_NATIVE}${prefix}"

inherit cmake python3native

do_install_append() {
    rm -rf ${D}${datadir}/${ROS_BPN}/environment
    rm -f ${D}${datadir}/${ROS_BPN}/local_setup.bash
    rm -f ${D}${datadir}/${ROS_BPN}/local_setup.sh
    rm -f ${D}${datadir}/${ROS_BPN}/local_setup.zsh
    rm -f ${D}${prefix}/local_setup.bash
    rm -f ${D}${prefix}/local_setup.sh
    rm -f ${D}${prefix}/local_setup.zsh
    rm -f ${D}${prefix}/setup.bash
    rm -f ${D}${prefix}/setup.sh
    rm -f ${D}${prefix}/setup.zsh
    rm -f ${D}${prefix}/_order_packages.py
}

FILES_${PN} = " \
    ${datadir}/${ROS_BPN}/package.xml \
    ${datadir}/${ROS_BPN}/resource/* \
    ${datadir}/ament_index/* \
    ${libdir}/${PYTHON_DIR}/* \
    ${libdir}/${ROS_BPN}/* \
    ${libdir}/lib*.so \
"

FILES_${PN}-dev = " \
    ${datadir}/${ROS_BPN}/cmake/* \
    ${datadir}/${ROS_BPN}/msg/* \
    ${datadir}/${ROS_BPN}/srv/* \
    ${includedir} \
"
