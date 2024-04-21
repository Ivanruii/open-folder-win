@echo off
setlocal enabledelayedexpansion

if "%~1" == "" (
    echo Error: You have to enter the path address absolutely or relatively
    goto :end
)

set "disk=%~d1"

dir %disk% >nul 2>&1
if errorlevel 1 (
    echo Error: The specified disk does not exist
    goto :end
)

set "current_dir=%cd%"
set "target_dir=%~1"

if "%target_dir:~1,1%"==":" (
    if "%target_dir:~2%"=="" (
        set "full_path=%target_dir%\"
    ) else (
        set "full_path=%target_dir%"
    )
) else (
    if "!target_dir:~0,1!"=="\" (
        set "full_path=!target_dir!"
    ) else (
        set "full_path=!current_dir!\!target_dir!"
    )
)

:start
echo Opened %full_path% in file explorer
start "" "%full_path%"

:end
endlocal
