set CMAKE_GENERATOR_PLATFORM=
set CMAKE_GENERATOR_TOOLSET=
set CMAKE_GENERATOR=Ninja

REM Keep conda-build's CMAKE_ARGS (it carries -DCMAKE_BUILD_TYPE=Release, the install
REM prefix, etc.). Overwriting it leaves the single-config Ninja build without a build type.
set CMAKE_ARGS=%CMAKE_ARGS% -DALLEXTRAS=ON -DCMAKE_BUILD_TYPE=Release

REM add -DUSEGPU=ON if nvcc is present
where nvcc > nul 2>&1
if %errorlevel% == 0 (
    set CMAKE_ARGS=%CMAKE_ARGS% -DUSEGPU=ON
    REM CCCL in CUDA 13 requires the conforming MSVC preprocessor
    set "CUDAFLAGS=-Xcompiler /Zc:preprocessor"
)

python -m pip install . -vv