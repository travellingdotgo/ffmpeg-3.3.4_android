#!/bin/bash 
SYSROOT=$NDK_ROOT/platforms/android-9/arch-arm/
TOOLCHAIN=$NDK_ROOT/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/
function build_one { 
./configure \
     --prefix=$PREFIX \
     --enable-shared \
     --disable-static \
     --disable-doc \
     --disable-ffmpeg \
     --disable-ffplay \
     --disable-ffprobe \
     --disable-ffserver \
     --disable-avdevice \
     --disable-doc \
     --disable-symver \
     --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
     --target-os=linux \
     --arch=arm \
     --enable-neon \
     --enable-cross-compile \
     --sysroot=$SYSROOT \
     --extra-cflags="-Os -fpic $ADDI_CFLAGS" \
     --extra-ldflags="$ADDI_LDFLAGS" \
     $ADDITIONAL_CONFIGURE_FLAG 
     make clean 
     make -j 4 
     make install
 }
 CPU=arm
 PREFIX=$(pwd)/android/$CPU
 ADDI_CFLAGS="-marm" 
 build_one
