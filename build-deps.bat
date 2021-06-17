pushd %cd%
call %SCRIPTS%/env.bat
cd /D %DEPS_BUILD_DIR%
ninja
popd
