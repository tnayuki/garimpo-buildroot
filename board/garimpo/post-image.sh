#!/bin/sh

GENIMAGE_CFG="`dirname $0`/genimage-raspberrypi0.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

# Use initramfs
sed -i 's/#\(initramfs rootfs.cpio.gz\)/\1/' ${BINARIES_DIR}/rpi-firmware/config.txt

# Enable I2C
if [ x`grep "dtparam=i2c_arm=on" ${BINARIES_DIR}/rpi-firmware/config.txt | wc -l` = "x0" ]; then echo "dtparam=i2c_arm=on" >> ${BINARIES_DIR}/rpi-firmware/config.txt; fi

rm -rf "${GENIMAGE_TMP}"

genimage                           \
	--rootpath "${TARGET_DIR}"     \
	--tmppath "${GENIMAGE_TMP}"    \
	--inputpath "${BINARIES_DIR}"  \
	--outputpath "${BINARIES_DIR}" \
	--config "${GENIMAGE_CFG}"

exit $?
