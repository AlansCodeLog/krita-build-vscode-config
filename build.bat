pushd %cd%
call %KRITA_SCRIPTS_DIR%\env.bat

cd /D %BUILD_DIR%

ninja
if %errorlevel% neq 0 (
	if "%BEEP_ON_BUILD_ERROR%"=="TRUE" rundll32 user32.dll,MessageBeep
	exit /b %errorlevel%
)
ninja install
if %errorlevel% neq 0 (
	if "%BEEP_ON_BUILD_ERROR%"=="TRUE" rundll32 user32.dll,MessageBeep
	exit /b %errorlevel%
)

popd
