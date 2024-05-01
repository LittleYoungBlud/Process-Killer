@echo off

REM Download the latest version of the batch file
powershell -command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/LittleYoungBlud/Process-Killer/main/vipers_task_killer_1.bat' -OutFile 'vipers_task_killer_1.bat'"

REM Replace the current batch file with the new one
move /y newbatchfile.bat yourbatchfile.bat

REM Clean up
del newbatchfile.bat

echo Update complete.
