@echo off
set "TARGET=%~1"
if "%TARGET%"=="" (
    set /p "TARGET=Enter the directory path to backup: "
)
if "%TARGET%"=="" exit

set /p "ZIP_PATH=Enter full path to 7z.exe (e.g. C:\Program Files\7-Zip\7z.exe): "

:: إزالة علامات التنصيص إن أضافها المستخدم بالخطأ
set "ZIP_PATH=%ZIP_PATH:"=%"

if not exist "%ZIP_PATH%" (
    echo Error: 7z.exe was not found at the specified path.
    pause
    exit /b
)

cd /d "%TARGET%"
"%ZIP_PATH%" a -t7z "%TARGET%.7z" "*" -xr!.pytest_cache -xr!__pycache__ -xr!venv -xr!node_modules

pause