@echo off
REM Master Sync Control Script for Windows with ANSI color support

setlocal enabledelayedexpansion

REM Enable ANSI escape sequences (Windows 10+)
for /f "tokens=2 delims=:." %%a in ('chcp') do if %%a neq 65001 chcp 65001 >nul 2>nul
reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul 2>nul 2>&1
echo %MODE%
set MODE=%1

if /i "%MODE%"=="status" (
    echo.
    echo ========== CURRENT DOCKER STATE ==========
    echo.
    echo [CONTAINERS]
    docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Image}}" 2>nul
    if errorlevel 1 echo No containers.
    echo.
    echo [VOLUMES]
    docker volume ls --format "table {{.Name}}\t{{.Driver}}" 2>nul
    if errorlevel 1 echo No volumes.
    echo.
    echo [IMAGES]
    docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}" 2>nul
    if errorlevel 1 echo No images.
    echo.
    pause
    exit /b 0
)

if /i "%MODE%"=="backup" (
    echo [BACKUP MODE] Creating backup...
    call docker-backup.bat
    exit /b !errorlevel!
)

if /i "%MODE%"=="restore" (
    echo [RESTORE MODE] Looking for latest backup...

    set "LATEST_BACKUP="
    for /f "delims=" %%D in ('dir .docker-backup\backup_* /ad /b /o:n 2^>nul') do set "LATEST_BACKUP=%%D"

    if "!LATEST_BACKUP!"=="" (
        echo [ERROR] No backup found in .docker-backup\
        echo Please copy backup folder first.
        pause
        exit /b 1
    )

    echo [OK] Found backup: !LATEST_BACKUP!

    REM Get short name (8.3 format) to avoid spaces
    for %%F in (".docker-backup\!LATEST_BACKUP!") do set "BACKUP_SHORT=%%~sF"

    echo [INFO] Using path: !BACKUP_SHORT!
    call docker-restore.bat "!BACKUP_SHORT!"

    exit /b !errorlevel!
)

if "%MODE%"=="" (
    cls
    echo ========================================
    echo   DOCKER AUTO-SYNC TOOL (Windows)
    echo ========================================
    echo.
    echo Two-step automated sync between HOME and WORK machines.
    echo.
    echo STEP 1 - On HOME machine:
    echo    sync-both.bat backup
    echo.
    echo    This creates a backup in .docker-backup\
    echo    Copy the entire .docker-backup folder to USB
    echo.
    echo STEP 2 - On WORK machine:
    echo    Paste .docker-backup folder here
    echo    sync-both.bat restore
    echo.
    echo    This restores all changes (merge mode)
    echo.
    echo OPTIONS:
    echo    backup      - Create backup from current machine
    echo    restore     - Apply backup to current machine
    echo    status      - Show current Docker state
    echo.
    echo EXAMPLE:
    echo    HOME:  sync-both.bat backup
    echo    USB:   Copy .docker-backup to USB
    echo    WORK:  Paste .docker-backup folder
    echo    WORK:  sync-both.bat restore
    echo.
    pause
    exit /b 0
)

echo [ERROR] Unknown command: %MODE%
echo Use 'sync-both.bat' for options
pause
exit /b 1