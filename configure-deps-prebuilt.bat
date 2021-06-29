pushd %cd%
call %KRITA_SCRIPTS_DIR%\env.bat

@REM otherwise we might accidentally build in the folder this is run from
mkdir "%DEPS_BUILD_DIR%"
cd /D "%DEPS_BUILD_DIR%"

@REM Using -G "MinGW Makefiles" because using ninja has no advantage. In fact it has the disadvantage that you must do ninja clean && ninja to force re-install if, for example, you had to delete the install folder for some reason.

cmake ^
%SOURCE_DIR%\build-tools\ci-deps ^
-G "MinGW Makefiles" ^
-DCMAKE_INSTALL_PREFIX=%INSTALL_DIR%
if %errorlevel% neq 0 exit /b %errorlevel%

popd
