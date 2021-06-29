pushd %cd%
call %KRITA_SCRIPTS_DIR%\env.bat

cd /D %BUILD_DIR%

ninja
if %errorlevel% neq 0 exit /b %errorlevel%
ninja install
if %errorlevel% neq 0 exit /b %errorlevel%

popd
