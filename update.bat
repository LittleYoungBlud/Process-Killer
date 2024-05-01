@echo off

REM Deleting the old version of the batch file
echo Deleting old version...
del "vipers_task_killer_1.bat" > nul

REM Download the latest version of the batch file
echo Installing new updated batch file...
powershell -command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/LittleYoungBlud/Process-Killer/main/vipers_task_killer_1.bat' -OutFile 'vipers_task_killer_1.bat'"

REM Flash blue 3 times
for /l %%i in (1,1,3) do (
    color 1F
    timeout /t 1 /nobreak >nul
    color 0F
    timeout /t 1 /nobreak >nul
)

echo Update complete. You can close this window.
