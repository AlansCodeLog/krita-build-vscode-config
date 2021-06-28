pushd %cd%
call %KRITA_SCRIPTS_DIR%\tools\incremental-copy.bat ^
%LOCALAPPDATA%\kritarc %KRITA_SCRIPTS_DIR%\backups\kritarc

call %KRITA_SCRIPTS_DIR%\tools\incremental-copy.bat ^
%LOCALAPPDATA%\kritashortcutsrc %KRITA_SCRIPTS_DIR%\backups\kritashortcutsrc

call %KRITA_SCRIPTS_DIR%\tools\incremental-copy.bat ^
%APPDATA%\Krita\resourcecache.sqlite %KRITA_SCRIPTS_DIR%\backups\resourcecache.sqlite


