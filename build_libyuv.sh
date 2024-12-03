#!/bin/bash

# Default build type is Release if not provided
BUILD_TYPE=${1:-Release}
ARCHS=("armeabi-v7a" "arm64-v8a" "x86" "x86_64")

# Ensure Android NDK path is set
if [ -z "$ANDROID_NDK_HOME" ]; then
  echo "Error: ANDROID_NDK_HOME is not set. Please set it to your Android NDK path."
  exit 1
fi

for ARCH in "${ARCHS[@]}"; do
  OUT_DIR="../out/${BUILD_TYPE}/${ARCH}"
  BUILD_DIR="build_${ARCH}_${BUILD_TYPE}"

  echo "Building for architecture: ${ARCH}, build type: ${BUILD_TYPE}"

  # Create build directory
  mkdir -p ${BUILD_DIR}
  pushd ${BUILD_DIR}

  # Run CMake configuration
  cmake .. \
    -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_HOME/build/cmake/android.toolchain.cmake \
    -DANDROID_ABI=${ARCH} \
    -DANDROID_PLATFORM=android-21 \
    -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
    -DCMAKE_LIBRARY_OUTPUT_DIRECTORY=${OUT_DIR}

  # Build the project
  cmake --build . --config ${BUILD_TYPE}

  popd
done

