#!/usr/bin/env bash
platform=$1
if [ -z $platform ];
then
  gyp --depth . -D library=static_library -G output_dir=bin -D platform=desktop -G config=desktop --generator-output=bin/desktop wd.gyp
  cd bin/desktop
  make
  cd ../..
  gyp --depth . -D library=static_library -G output_dir=bin -D platform=flip -G config=flip --generator-output=bin/flip wd.gyp
  cd bin/flip
  make
else
  gyp --depth . -D library=static_library -G output_dir=bin -D platform=$platform -G config=$platform --generator-output=bin/$platform wd.gyp
  cd bin/$platform
  make
fi