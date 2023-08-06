@echo off
setlocal enabledelayedexpansion

set /p "SourceFolder=Enter the source folder location: "

for %%F in ("%SourceFolder%\*.*") do (
    set "FileName=%%~nxF"
    set "FirstLetter=!FileName:~0,1!"
    
    REM Determine the section based on the first letter's ASCII value
    set "Section="
    if "!FirstLetter!" geq "0" if "!FirstLetter!" leq "9" set "Section=0 - 9"
    if "!FirstLetter!" geq "A" if "!FirstLetter!" leq "H" set "Section=A - H"
    if "!FirstLetter!" geq "I" if "!FirstLetter!" leq "P" set "Section=I - P"
    if "!FirstLetter!" geq "Q" if "!FirstLetter!" leq "Z" set "Section=Q - Z"

    if defined Section (
        if not exist "!SourceFolder!\!Section!" mkdir "!SourceFolder!\!Section!"
        if not exist "!SourceFolder!\!Section!\!FirstLetter!" mkdir "!SourceFolder!\!Section!\!FirstLetter!"
        move "%%F" "!SourceFolder!\!Section!\!FirstLetter!\"
    )
)

echo File organization completed.
pause
