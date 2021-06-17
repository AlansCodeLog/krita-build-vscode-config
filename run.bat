call %SCRIPTS%/env.bat
pushd %cd%
%INSTALL_DIR%/bin/krita.exe ^
--new-image RGBA,U8,1000,1000 ^
--nosplash
popd
