cls
@echo off
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b
rem this part means if the window isn't already maximised, close the script and rerun maximised.
:start
echo.
 
echo please note that the script will error out if the path is invalid 
echo or if spaces are represented with quotation marks instead of the single ones.
set /p variable1="please enter in the the full path (including file name/extension) of the file you want to get the hashes for: "
cls
 
echo path to get hashes for: "%variable1%"
echo 1. get MD5 only (insecure)
echo 2. get SHA1 only (insecure)
echo 3. get SHA256 only
echo 4. get all hashes (MD5/SHA1/SHA256)
echo 5. get all hashes (files in a folder) - note it cannot do subfolders.
set choice=
set /p choice=type the number for your result.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto MD5ONLY
if '%choice%'=='2' goto SHA1ONLY
if '%choice%'=='3' goto SHA256ONLY
if '%choice%'=='4' goto GETALLHAHSES
if '%choice%'=='5' goto GETALLHASHESFOLDER
echo "%choice%" is not a valid selection, please try again
 
:MD5ONLY
cls
echo please wait while hashes are calculated. 
echo depending on your computer's processing power and the size of the file, 
echo this could take a few seconds to a few hours.
echo finding MD5...
powershell Get-FileHash "%variable1%" -Algorithm MD5
echo MD5 found. calculation complete.
goto end
 
:SHA1ONLY
cls
echo please wait while hashes are calculated. 
echo depending on your computer's processing power and the size of the file, 
echo this could take a few seconds to a few hours.
echo finding SHA1...
powershell Get-FileHash "%variable1%" -Algorithm SHA1
echo SHA1 found. calculation complete.
goto end
 
:SHA256ONLY
cls
echo please wait while hashes are calculated. 
echo depending on your computer's processing power and the size of the file, 
echo this could take a few seconds to a few hours.
echo.
powershell Get-FileHash "%variable1%" -Algorithm SHA256
echo SHA256 found. calculation complete.
goto end
 
:GETALLHAHSES
cls
echo please wait while hashes are calculated. 
echo depending on your computer's processing power and the size of the file, 
echo this could take a few seconds to a few hours.
echo finding MD5...
powershell Get-FileHash "%variable1%" -Algorithm MD5
echo MD5 found. Finding SHA1
powershell Get-FileHash "%variable1%" -Algorithm SHA1
echo SHA1 found. Finding SHA256
powershell Get-FileHash "%variable1%" -Algorithm SHA256
echo SHA256 found. calculation complete.
goto end
:GETALLHASHESFOLDER
cls
echo please wait while hashes are calculated. 
echo depending on your computer's processing power and the size of the file, 
echo this could take a few seconds to a few hours.
echo finding MD5...
powershell Get-FileHash "'%variable1%\*.*'" -Algorithm MD5
echo MD5 found. Finding SHA1
powershell Get-FileHash "'%variable1%\*.*'" -Algorithm SHA1
echo SHA1 found. Finding SHA256
powershell Get-FileHash "'%variable1%\*.*'" -Algorithm SHA256
echo SHA256 found. calculation complete.
goto end
:end
pause
