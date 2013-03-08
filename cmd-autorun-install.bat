@echo off
set dir=%~dp0
set autorunfilename=cmd-autorun.bat
set autorunfile="%dir%%autorunfilename%"
set aliasfilename=cmd-aliases
set aliasfile="%dir%%aliasfilename%"
set regLoc=HKLM\Software\Microsoft\Command Processor

echo Creating %autorunfile%
(
	echo @echo off
	echo doskey /macrofile=%aliasfile%
	echo set ~=%USERPROFILE%
) > %autorunfile%

echo Creating %aliasfile%
(
	echo test=echo test!
) > %aliasfile%

echo Adding to registry
reg add "%regLoc%" /v Autorun /t reg_sz /d \"%autorunfile%\"

echo Deleting "%~f0"
DEL "%~f0"