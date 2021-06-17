pushd %cd%
call %SCRIPTS%/env.bat
@REM otherwise we might accidentally build in the folder this is run from
mkdir "%DEPS_BUILD_DIR%"
cd /D "%DEPS_BUILD_DIR%"

@REM This is basically the command the following build script command runs
@REM krita\build-tools\windows\build.cmd --no-interactive --jobs 8 --skip-krita --src-dir %SOURCE_DIR% --download-dir %DOWNLOAD_DIR% --deps-build-dir %DEPS_BUILD_DIR% --deps-install-dir %INSTALL_DIR%
@REM Currently this is not working with ninja due to some syntax error???
cmake ^
%SOURCE_DIR%\3rdparty ^
-DSUBMAKE_JOBS=8 ^
-DQT_ENABLE_DEBUG_INFO=OFF ^
-DQT_ENABLE_DYNAMIC_OPENGL=ON ^
-DEXTERNALS_DOWNLOAD_DIR=%DOWNLOAD_DIR% ^
-DINSTALL_ROOT=%INSTALL_DIR% ^
-G "MinGW Makefiles" ^
-DCMAKE_BUILD_TYPE=RelWithDebInfo
popd
