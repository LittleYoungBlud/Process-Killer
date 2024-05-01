@echo off

REM Deleting the old version of the batch file
echo Deleting old version...
del "vipers_task_killer_1.bat" > nul

REM Download the latest version of the batch file
echo Checking for updates...
powershell -command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/LittleYoungBlud/Process-Killer/main/vipers_task_killer_1.bat' -OutFile 'new_version.bat' -UseBasicParsing"

REM Check if there are changes
fc "vipers_task_killer_1.bat" "new_version.bat" > nul
if errorlevel 1 (
    echo Installing new updated batch file...
    move /y "new_version.bat" "vipers_task_killer_1.bat" > nul
    
    REM Flash blue 3 times
    for /l %%i in (1,1,3) do (
        color 1F
        timeout /t 1 /nobreak >nul
        color 0F
        timeout /t 1 /nobreak >nul
    )

    echo Update complete.
    pause
) else (
    echo You have the latest version. Check back later.
    pause
)
