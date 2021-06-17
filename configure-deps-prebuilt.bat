pushd %cd%
call %SCRIPTS%/env.bat
@REM otherwise we might accidentally build in the folder this is run from
mkdir "%DEPS_BUILD_DIR%"
cd /D "%DEPS_BUILD_DIR%"
cmake ^
%SOURCE_DIR%\build-tools\ci-deps ^
-G Ninja ^
-DCMAKE_INSTALL_PREFIX=%INSTALL_DIR%
popd
