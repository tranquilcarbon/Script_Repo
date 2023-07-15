@echo off
setlocal enabledelayedexpansion

set "source=C:\Path\to\Source\Folder"
set "destination=C:\Path\to\Destination\Folder"
REM source - where files are located
REM destination - where wiles will be copied to

echo Now copying files from "%source%" To "%destination%" ...

REM Copy files from source to destination
xcopy /Y /Q /E "%source%" "%destination%"

echo Files copied. 
pause
