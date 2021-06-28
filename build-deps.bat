pushd %cd%
call %KRITA_SCRIPTS_DIR%\env.bat

cd /D %DEPS_BUILD_DIR%

ninja

popd
