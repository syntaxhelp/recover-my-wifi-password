@echo off
setlocal DisableDelayedExpansion
title Recover My Wi-Fi Password
color 0A

echo ==========================================
echo      Recover My Wi-Fi Password
echo ==========================================
echo Shows the passwords of Wi-Fi networks
echo already saved on THIS computer.
echo.

net session >nul 2>&1
if errorlevel 1 echo [!] Tip: right-click this file and choose "Run as administrator" if some passwords are missing.
echo.

set "SAVE=N"
set /p "SAVE=Save results to a text file on your Desktop? [Y/N]: "
set "OUT=%USERPROFILE%\Desktop\WiFi_Passwords.txt"
if /i "%SAVE%"=="Y" call :init_file
echo.

set "COUNT=0"
for /f "tokens=1* delims=:" %%a in ('netsh wlan show profiles ^| findstr /C:"All User Profile" /C:"Profil Tous les utilisateurs"') do call :show "%%b"

echo.
if "%COUNT%"=="0" echo No saved Wi-Fi profiles were found.
if /i "%SAVE%"=="Y" echo Saved to: %OUT%
echo.
pause
exit /b

:init_file
> "%OUT%" echo Saved Wi-Fi Passwords
>> "%OUT%" echo ---------------------
exit /b

:show
set "NAME=%~1"
set "NAME=%NAME:~1%"
set "PW=[none]"
for /f "tokens=1* delims=:" %%k in ('netsh wlan show profile name^="%NAME%" key^=clear ^| findstr /C:"Key Content" /C:"Contenu de la cl"') do set "PW=%%l"
setlocal EnableDelayedExpansion
if "!PW:~0,1!"==" " set "PW=!PW:~1!"
echo !NAME!  :  !PW!
if /i "%SAVE%"=="Y" >> "%OUT%" echo !NAME!  :  !PW!
endlocal
set /a COUNT+=1
exit /b
