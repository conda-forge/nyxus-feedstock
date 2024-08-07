#!/bin/bash

set -eux # Abort on error.

PY_ABIFLAGS=$(python -c "import sys; print('' if sys.version_info.major == 2 else sys.abiflags)")
PY_ABI=${PY_VER}${PY_ABIFLAGS}

if [[ "$target_platform" == osx-* ]]; then
	export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

# add -DUSEGPU=ON if nvcc is present
if command -v nvcc &> /dev/null; then
    CMAKE_ARGS="-DALLEXTRAS=ON -DUSEGPU=ON" python -m pip install . -vv
else
    CMAKE_ARGS="-DALLEXTRAS=ON" python -m pip install . -vv
fi
