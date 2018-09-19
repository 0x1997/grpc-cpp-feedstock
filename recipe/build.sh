#!/usr/bin/env bash
set -e -x

patch -p1 -i "$RECIPE_DIR/arg-list-too-long.patch"

unset CC
unset CXX
unset LD
unset AR

CFLAGS="$CFLAGS -g -Wno-error -Wno-error=expansion-to-defined"
MAKEFLAGS="V=1 prefix=$PREFIX HAS_SYSTEM_PERFTOOLS=false HAS_SYSTEM_ZLIB=true HAS_SYSTEM_PROTOBUF=true HAS_SYSTEM_CARES=true CONFIG=opt STRIP=echo $MAKEFLAGS"

make $MAKEFLAGS EXTRA_CFLAGS="$CFLAGS" EXTRA_CXXFLAGS="$CFLAGS" EXTRA_LDFLAGS="$LDFLAGS"
make $MAKEFLAGS install
