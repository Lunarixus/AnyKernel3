# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=XenialV2-rc1 BETA for wahoo by Lunarixus
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=taimen
device.name2=walleye
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=1;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## Warn user that this is the beta kernel
ui_print " "; ui_print "This is a BETA kernel, this means you may have unintended issues"; ui_print " "; ui_print "Please flash stable Xenial from Lunarixus.party/kernels/Xenial if you don't know what you're doing";

# Get Android version
android_version="$(file_getprop /system/build.prop "ro.build.version.release")";

# Warn user to reflash magisk on android 10
if [ "$android_version" != "9" ]; then
  if [ -d $ramdisk/.backup ]; then
    ui_print " "; ui_print "PLEASE REFLASH MAGISK TO PRESERVE IT";
  fi;
fi;

## AnyKernel install

# Edit kernel
split_boot;

# Flash kernel
flash_boot;
flash_dtbo;

## end install

