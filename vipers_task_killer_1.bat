@echo off

:menu
title Vipers Process Terminator VERSION 1.4
cls
echo Select a process to terminate:
echo 1. Discord client
echo 2. Equalizer Apo
echo 3. Roblox
echo 4. Browsers
echo 5. FL Studio
echo 6. Kill a specific application

REM Set the color
color 0E


REM Set the window always on top using PowerShell
powershell -command "$process = (New-Object -ComObject Shell.Application).Windows() | ? { $_.Name -eq 'Vipers Process Terminator' }; if($process) { $process.TopMost = $true }"


REM Reset the color back to default
color

echo 7. Kill all apps [CAN BE DANGEROUS]
echo 8. Exit

set /p choice=Enter the number corresponding to the process you want to kill (8 to exit): 

if "%choice%"=="1" (
    taskkill /f /im discord.exe
    taskkill /f /im discordcanary.exe
    taskkill /f /im discordptb.exe
    taskkill /f /im ripcord.exe
    taskkill /f /im lightcord.exe
) else if "%choice%"=="2" (
    taskkill /f /im editor.exe
) else if "%choice%"=="3" (
    taskkill /f /im robloxplayerbeta.exe
) else if "%choice%"=="4" (
    taskkill /f /im msedge.exe
    taskkill /f /im chrome.exe
    taskkill /f /im opera.exe
    taskkill /f /im operagx.exe
    taskkill /f /im brave.exe
) else if "%choice%"=="5" (
    taskkill /f /im fl64.exe
    taskkill /f /im fl32.exe
    taskkill /f /im fl.exe
) else if "%choice%"=="6" (
    set "appname="
    timeout /t 0 /nobreak >nul
    set /p appname=Enter the name of the application you want to terminate: 
    taskkill /f /im %appname%.exe
) else if "%choice%"=="7" (

    REM Killing all running apps except Task Manager and File Explorer...
    echo Killing all running apps except Task Manager and File Explorer...

    
    REM Get the list of running applications
    tasklist /fi "STATUS eq running" /fi "IMAGENAME ne explorer.exe" /fi "IMAGENAME ne Taskmgr.exe" > temp.txt

    
    REM Parse the list and kill the processes
    for /F "skip=3 tokens=1" %%i in (temp.txt) do (
        taskkill /f /pid %%i >nul 2>nul
    )

    
    REM Clean up temporary file
    del temp.txt
    
    echo All non-essential apps have been terminated.
    
    goto menu
) else if "%choice%"=="8" (
    exit
) else (
    echo Invalid choice. Please select a valid process.
    pause
    goto menu
)

echo Process terminated.

choice /c yn /m "Do you want to terminate another task? (y/n)"
if errorlevel 2 goto close
if errorlevel 1 goto menu

:close
echo Exiting...
pause
exit
