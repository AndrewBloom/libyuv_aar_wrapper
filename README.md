# libyuv_aar_wrapper
A convenience aar wrapper for libyuv, to use the library in an Android Project.

These *.so were compiled with the NDK 26.1.10909125. Commit of libyuv: 532126bf7034b0f5f9778bca43e8f944d6f62f0a

## How to update the library:

You'll need to have depot tools installed: https://www.chromium.org/developers/how-tos/install-depot-tools Refer to chromium instructions for each platform for other prerequisites.

Create a working directory, enter it, and run:

```
gclient config --name src https://chromium.googlesource.com/libyuv/libyuv
gclient sync
```

The following may not be needed:

add `; target_os = ["android"];` to .gclient
```
solutions = [
  { "name"        : 'src',
    "url"         : 'https://chromium.googlesource.com/libyuv/libyuv',
    "deps_file"   : 'DEPS',
    "managed"     : True,
    "custom_deps" : {
    },
    "custom_vars": {},
  },
];
target_os = ["android"];
```
run
```
gclient sync
```

be sure to have set your ANDROID_NDK_HOME appropriately, then run the `build_libyuv.sh` script.

Update the *.so files (take them from the out/Release/{arch} folders) and the include source folder.

