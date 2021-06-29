pushd %cd%
call %KRITA_SCRIPTS_DIR%\env.bat

cd /D %DEPS_BUILD_DIR%

cmake --build .
if %errorlevel% neq 0 (
	if "%BEEP_ON_BUILD_ERROR%"=="TRUE" rundll32 user32.dll,MessageBeep
	exit /b %errorlevel%
)

popd
