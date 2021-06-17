@echo off

@REM #region CONFIGURATION
@REM NOTE: The following env variables are set externally system wide for convenience: DEV_*, _*.

set PYTHON=C:/Python38
set MINGW_BASE=C:/Tools/mingw64
set CMAKE_BIN=%PROGRAMFILES%/CMake/bin
set NINJA=%DEV_CLONES_DIR%/ninja
@REM I installed this with the wrong folder name.
set QT_CREATOR=T:/Programs/Qt/bin

set BUILDROOT=%DEV_CLONES_DIR%/kritadev
set BUILD_DIR=%BUILDROOT%/b_krita
set INSTALL_DIR=%BUILDROOT%/i
@REM for deps
set DOWNLOAD_DIR=%BUILDROOT%/d
set DEPS_BUILD_DIR=%BUILDROOT%/b
@REM is this even used?
set DEPS_INSTALL_DIR=%BUILDROOT%/is
set SOURCE_DIR=%BUILDROOT%/krita
set "WindowsSdkDir=%ProgramFiles(x86)%/Windows Kits/10"
@REM There might be several, latest will do
set "WindowsSdkVerBinPath=%WindowsSdkDir%/bin/10.0.19041.0"

@REM Only add the absolute minimum to path.
@REM The following should be enough:
@REM C:\Windows\System32\WindowsPowerShell\v1.0;C:\Windows\System32\Wbem;C:\Windows\system32;C:\Windows
set CLEAN_PATH=^
%_WINDOWS%;^
%DEV_TOOLS%;^
%_VERSION_CONTROL%;

@REM #endregion

@REM #region SCRIPT
set PYTHON_PATHS=%PYTHON%;%PYTHON%/Scripts

set MINGW_GCC_BIN=%MINGW_BASE%/bin
set MINGW_BIN_DIR=%MINGW_BASE%/bin
set DLLTOOL_EXE=%MINGW_BASE%/bin/dlltool.exe


@REM Remove any other paths if needed:
@REM set CLEANPATH=%CLEANPATH:[paths]=%

set PATH=^
%INSTALL_DIR%/bin;^
%INSTALL_DIR%/lib;^
%PYTHON_PATHS%;^
%MINGW_BIN_DIR%;^
%CMAKE_BIN%;^
%QT_CREATOR%;^
%NINJA%;^
%CLEAN_PATH%;

echo PATH:
echo.
call neatpath

echo CONFIG:
echo.
echo PYTHON: %PYTHON%
echo MINGW_BASE: %MINGW_BASE%
echo CMAKE_BIN: %CMAKE_BIN%
echo NINJA: %NINJA%
echo QT_CREATOR: %QT_CREATOR%
echo WindowsSdkDir: %WindowsSdkDir%
echo WindowsSdkVerBinPath: %WindowsSdkVerBinPath%
echo.
echo BUILDROOT: %BUILDROOT%
echo SOURCE_DIR: %SOURCE_DIR%
echo BUILD_DIR: %BUILD_DIR%
echo INSTALL_DIR: %INSTALL_DIR%
echo DOWNLOAD_DIR: %DOWNLOAD_DIR%
echo DEPS_BUILD_DIR: %DEPS_BUILD_DIR%
echo DEPS_INSTALL_DIR: %DEPS_INSTALL_DIR%

echo.

@REM Assure all dirs exist.
mkdir "%BUILD_DIR%"
mkdir "%INSTALL_DIR%"
mkdir "%DEPS_BUILD_DIR%"
mkdir "%DOWNLOAD_DIR%"
mkdir "%DEPS_INSTALL_DIR%"
mkdir "%SOURCE_DIR%"

echo.

@REM #endregion
