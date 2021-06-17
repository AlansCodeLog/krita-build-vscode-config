call %SCRIPTS%/env.bat
pushd %cd%
xcopy %BUILD_DIR%\bin\Test*.exe %INSTALL_DIR%\bin /Y
cd /D %BUILD_DIR% 
ninja test
popd
