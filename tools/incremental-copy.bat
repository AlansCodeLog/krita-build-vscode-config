@echo off
set SOURCE=%1
set DESTINATION=%2
set i=0
setlocal EnableDelayedExpansion

if exist "%DESTINATION%" (
	set /A "i+=1"
	echo "%DESTINATION%!i!" 
	:loop
	if exist "%DESTINATION%!i!" (
		set /A "i+=1"
		goto :loop
	)
)
if "%i%"=="0" (
	echo F|xcopy "%SOURCE%" "%DESTINATION%"
) else (
	echo F|xcopy "%SOURCE%" "%DESTINATION%%i%"
)
pause
