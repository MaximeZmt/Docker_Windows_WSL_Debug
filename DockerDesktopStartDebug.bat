@echo off
:: 'net session' command is used to check admin privileges
net session >nul 2>&1
if NOT %errorlevel% == 0 (
    echo No admin rights. Please run as administrator.
    pause
    exit /b 1
)

:: Is docker already running
echo Admin rights detected.
tasklist /FI "IMAGENAME eq Docker Desktop.exe" | findstr /I "Docker Desktop.exe" >nul
if %errorlevel% == 0 (
    echo Docker Desktop is already running.
    pause
    exit /b 1
) else (
    :: Apply patch and start Docker
    wsl --unregister docker-desktop
    start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"
    pause
    exit /b 0
)
