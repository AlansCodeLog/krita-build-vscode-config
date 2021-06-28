pushd %cd%
call %KRITA_SCRIPTS_DIR%\env.bat

%INSTALL_DIR%\bin\krita.exe ^
--new-image RGBA,U8,1000,1000 ^
--nosplash

popd
