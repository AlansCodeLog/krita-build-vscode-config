pushd %cd%
call %KRITA_SCRIPTS_DIR%\env.bat

cd /D %BUILD_DIR%

ninja
ninja install

popd
