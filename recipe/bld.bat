set CMAKE_GENERATOR_PLATFORM=
set CMAKE_GENERATOR_TOOLSET=
set CMAKE_GENERATOR=Ninja

REM add -DUSEGPU=ON if nvcc is present
where nvcc > nul 2>&1
if %errorlevel% == 0 (
    set CMAKE_ARGS=-DALLEXTRAS=ON -DUSEGPU=ON
) else (
    set CMAKE_ARGS=-DALLEXTRAS=ON
)

python -m pip install . -vv