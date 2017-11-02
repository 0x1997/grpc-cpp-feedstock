#!/usr/bin/env bash
set -e -x

export CFLAGS='-Wno-error -Wno-error=expansion-to-defined'
make $MAKEFLAGS prefix=$PREFIX "EXTRA_CFLAGS=$FLAGS" "EXTRA_CXXFLAGS=$CFLAGS"
make $MAKEFLAGS prefix=$PREFIX install
