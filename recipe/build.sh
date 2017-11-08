#!/usr/bin/env bash
set -e -x

sed -ri 's|(libgrpc\+\+[^\]*?so)\.5$|\1.1|g' Makefile
export CFLAGS='-Wno-error -Wno-error=expansion-to-defined'
make $MAKEFLAGS prefix=$PREFIX \
    HAS_SYSTEM_PERFTOOLS=false \
    HAS_SYSTEM_ZLIB=true \
    HAS_SYSTEM_PROTOBUF=true \
    HAS_SYSTEM_CARES=true \
    "EXTRA_CFLAGS=$FLAGS" \
    "EXTRA_CXXFLAGS=$CFLAGS"
make $MAKEFLAGS prefix=$PREFIX install
