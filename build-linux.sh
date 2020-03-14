#!/bin/sh
set -e
BITS=`getconf LONG_BIT`
UNAME=`uname`
UNAMELC=`echo $UNAME | awk '{print tolower($0)}'`

mkdir -p build-$UNAMELC-$BITS
cd build-$UNAMELC-$BITS
# TODO: Don't need configure each time
if [ "$UNAME" = "Darwin" ]; then
	../configure --enable-render-metal=no CFLAGS="-mmacosx-version-min=10.7 -arch x86_64"
else
	../configure
fi
make
cp build/.libs/libSDL2.a ../../libs/SDL2$UNAME$BITS.a
