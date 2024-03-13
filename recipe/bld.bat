
REM add -DUSEGPU=ON if nvcc is present
where nvcc > nul 2>&1
if %errorlevel% == 0 (
    set CMAKE_ARGS=-DCMAKE_PREFIX_PATH=%PREFIX% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DALLEXTRAS=ON -DUSEGPU=ON
) else (
    set CMAKE_ARGS=-DCMAKE_PREFIX_PATH=%PREFIX% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DALLEXTRAS=ON
)

python -m pip install . -vv