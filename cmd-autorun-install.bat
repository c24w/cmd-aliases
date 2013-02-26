@echo off
set dir=%~dp0
set autorunfilename=cmd-autorun.bat
set autorunfile="%dir%%autorunfilename%"
set aliasfilename=cmd-aliases
set aliasfile="%dir%%aliasfilename%"

(
	echo cls
	echo @echo off
	echo doskey /macrofile=%aliasfile%
	echo dir
) > %autorunfile%

(
	echo test=echo test!
) > %aliasfile%

reg add "hklm\software\microsoft\command processor" /v Autorun /t reg_sz /d \"%autorunfile%\"

DEL "%~f0"