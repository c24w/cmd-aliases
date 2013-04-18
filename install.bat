@echo off
set dir=%~dp0
set autorunfilename=cmd-autorun.bat
set autorunfile="%USERPROFILE%\%autorunfilename%"
set aliasfilename=aliases
set aliasfile="%dir%%aliasfilename%"
set regLoc=HKLM\Software\Microsoft\Command Processor

echo Creating %autorunfile%
(
	echo @echo off
	echo doskey /macrofile=%aliasfile%
	echo set ~=%USERPROFILE%
) > %autorunfile%

echo Adding to registry
reg add "%regLoc%" /v Autorun /t reg_sz /d \"%autorunfile%\"