#!/bin/bash

set -e
shopt -s nullglob

. ./config

cd "$BUILD_DIR/proot-$PROOT_V/src"

for ARCH in $ARCHS
do

set-arch $ARCH

make distclean || true

export CFLAGS="-I$STATIC_ROOT/include -Werror=implicit-function-declaration"
export LDFLAGS="-L$STATIC_ROOT/lib"
export PROOT_UNBUNDLE_LOADER='libexec/proot'

make V=1 "PREFIX=$INSTALL_ROOT" install

done
