@echo off
set /p "ZIP_PATH=Enter full path to 7z.exe (e.g. C:\Program Files\7-Zip\7z.exe): "

:: إزالة علامات التنصيص في حال قام المستخدم بإضافتها عند اللصق
set "ZIP_PATH=%ZIP_PATH:"=%"

if not exist "%ZIP_PATH%" (
    echo Error: 7z.exe was not found at the specified path.
    pause
    exit /b
)

"%ZIP_PATH%" a -t7z project_backup.7z * -xr!.pytest_cache -xr!__pycache__ -xr!venv -xr!node_modules
pause