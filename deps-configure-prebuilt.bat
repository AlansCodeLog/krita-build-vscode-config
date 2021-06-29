pushd %cd%
call %KRITA_SCRIPTS_DIR%\env.bat

@REM otherwise we might accidentally build in the folder this is run from
mkdir "%DEPS_BUILD_DIR%"
cd /D "%DEPS_BUILD_DIR%"

cmake ^
%SOURCE_DIR%\build-tools\ci-deps ^
-G "MinGW Makefiles" ^
-DCMAKE_INSTALL_PREFIX=%INSTALL_DIR%
if %errorlevel% neq 0 exit /b %errorlevel%

popd
