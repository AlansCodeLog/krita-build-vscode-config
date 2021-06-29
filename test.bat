pushd %cd%
call %SCRIPTS%\env.bat

xcopy %BUILD_DIR%\bin\Test*.exe %INSTALL_DIR%\bin \Y

cd /D %BUILD_DIR% 

ninja test
if %errorlevel% neq 0 exit /b %errorlevel%

popd
