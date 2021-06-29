pushd %cd%
call %KRITA_SCRIPTS_DIR%\env.bat

@REM otherwise we might accidentally build in the folder this is run from
mkdir "%DEPS_BUILD_DIR%"
cd /D "%DEPS_BUILD_DIR%"
cmake --build . --target clean

popd
