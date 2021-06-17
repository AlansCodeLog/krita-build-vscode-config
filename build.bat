pushd %cd%
call %SCRIPTS%/env.bat
cd /D %BUILD_DIR%
ninja
ninja install
popd
