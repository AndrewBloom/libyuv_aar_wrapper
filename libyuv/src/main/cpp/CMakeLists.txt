cmake_minimum_required(VERSION 3.22.1)

project("libyuv")

# Declare the prebuilt shared library
add_library(libyuv SHARED IMPORTED)

# Set the path to the prebuilt library for the current architecture
set_target_properties(libyuv PROPERTIES
        IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/../jniLibs/${CMAKE_ANDROID_ARCH_ABI}/libyuv.so)

