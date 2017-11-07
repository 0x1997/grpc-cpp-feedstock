#!/usr/bin/env bash
set -e -x

sed -ri 's|(libgrpc\+\+[^\]*?so)\.5$|\1.1|g' Makefile
export CFLAGS='-Wno-error -Wno-error=expansion-to-defined'
make $MAKEFLAGS prefix=$PREFIX "EXTRA_CFLAGS=$FLAGS" "EXTRA_CXXFLAGS=$CFLAGS"
make $MAKEFLAGS prefix=$PREFIX install
