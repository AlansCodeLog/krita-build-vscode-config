pushd %cd%
call %KRITA_SCRIPTS_DIR%\env.bat
@REM otherwise we might accidentally build in the folder this is run from
mkdir "%BUILD_DIR%"
cd /D %BUILD_DIR%

@REM This is basically the command the following build script command runs + some slight modifications
@REM krita\build-tools\windows\build.cmd --no-interactive --jobs 8 --skip-deps --src-dir %SOURCE_DIR% --download-dir %DOWNLOAD_DIR% --deps-build-dir %DEPS_BUILD_DIR% --deps-install-dir %DEPS_INSTALL_DIR% --krita-build-dir %BUILD_DIR% --krita-install-dir %INSTALL_DIR%
@REM Modifications:
@REM -DCMAKE_EXPORT_COMPILE_COMMANDS=ON for vscode
@REM -DFETCH_TRANSLATIONS=OFF for slightly faster builds
@REM -G Ninja - so much faster

cmake ^
%SOURCE_DIR% ^
-Wno-dev ^
-DBoost_DEBUG=OFF ^
-DBOOST_INCLUDEDIR=%DEPS_INSTALL_DIR%\include ^
-DBOOST_ROOT=%DEPS_INSTALL_DIR% ^
-DBOOST_LIBRARYDIR=%DEPS_INSTALL_DIR%\lib ^
-DCMAKE_PREFIX_PATH=%DEPS_INSTALL_DIR% ^
-DCMAKE_INSTALL_PREFIX=%INSTALL_DIR% ^
-DBUILD_TESTING=ON ^
-DHAVE_MEMORY_LEAK_TRACKER=OFF ^
-DFOUNDATION_BUILD=ON ^
-DUSE_QT_TABLET_WINDOWS=ON ^
-DHIDE_SAFE_ASSERTS=ON ^
-DFETCH_TRANSLATIONS=OFF ^
-G Ninja ^
-DCMAKE_BUILD_TYPE=RelWithDebInfo ^
-DCMAKE_EXPORT_COMPILE_COMMANDS=ON

popd
