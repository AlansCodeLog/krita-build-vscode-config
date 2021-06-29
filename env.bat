@echo off

@REM #region TOCONFIGURE
@REM NOTE: The following env variables are set externally system wide for convenience: DIR_*, PATH_*.

set BEEP_ON_BUILD_ERROR=TRUE

set PYTHON=C:\Python38
set MINGW_BASE=%DIR_DEV_TOOLS%\mingw64
set CMAKE_BIN=%PROGRAMFILES%\CMake\bin
set NINJA=%DIR_DEV_CLONES%\ninja
@REM I'm not 100% sure why the build instructions say to put this in the path when it's supposed to be optional.
set QT_CREATOR=T:\Programs\Qt5\Tools\QtCreator\bin

set BUILDROOT=%DIR_DEV_CLONES%\kritadev
set BUILD_DIR=%BUILDROOT%\b_krita
set INSTALL_DIR=%BUILDROOT%\i
@REM for deps
set DOWNLOAD_DIR=%BUILDROOT%\d
set DEPS_BUILD_DIR=%BUILDROOT%\b
@REM is this even used?
set DEPS_INSTALL_DIR=%BUILDROOT%\is
set SOURCE_DIR=%BUILDROOT%\krita
set WindowsSdkDir=%ProgramFiles(x86)%\Windows Kits\10
@REM There might be several, latest will do
set WindowsSdkVerBinPath=%WindowsSdkDir%\bin\10.0.19041.0

@REM Only add the absolute minimum to path to avoid anything interfering.
@REM The following should be enough, though you might also want to include git and anything else you're likely to use if using the scripts from the command line.
@REM set CLEAN_PATH=C:\Windows\System32\WindowsPowerShell\v1.0;C:\Windows\System32\Wbem;C:\Windows\system32;C:\Windows;
set CLEAN_PATH=^
%PATH_WINDOWS%;^
%PATH_VERSION_CONTROL%;^
%PATH_PROGRAMS_BASE%;
@REM #endregion

@REM Remove any paths if needed:
@REM set CLEANPATH=%CLEANPATH:Path\To\Remove;=%

@REM #region SCRIPT
set PYTHON_PATHS=%PYTHON%;%PYTHON%\Scripts

set MINGW_GCC_BIN=%MINGW_BASE%\bin
set MINGW_BIN_DIR=%MINGW_BASE%\bin
set DLLTOOL_EXE=%MINGW_BASE%\bin\dlltool.exe


set PATH=^
%INSTALL_DIR%\bin;^
%INSTALL_DIR%\lib;^
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
