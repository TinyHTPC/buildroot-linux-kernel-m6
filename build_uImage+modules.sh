#/bin/sh
make meson6_g18_itv05_defconfig
make -j4 LOCALVERSION=-MX

mkdir -p output
#make modules -j4 LOCALVERSION=-MX
make modules_install LOCALVERSION=-MX INSTALL_MOD_PATH=output
#cp -rvf output/amlogic/mali/mali.ko ramdisk/root_release/boot/
cp -rfv output/lib/modules/* output/
rm -rfv output/lib

make uImage -j4 LOCALVERSION=-MX
cp -rf arch/arm/boot/uImage output/
