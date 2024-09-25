@echo off
:: Try to use the 'net session' command which requires admin privileges
net session >nul 2>&1
if NOT %errorlevel% == 0 (
    echo No admin rights. Please run as administrator.
    pause
    exit /b 1
)

echo Admin rights detected.
tasklist /FI "IMAGENAME eq Docker Desktop.exe" | findstr /I "Docker Desktop.exe" >nul
if %errorlevel% == 0 (
    echo Docker Desktop is already running.
    pause
    exit /b 1
) else (
    wsl --unregister docker-desktop
    start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"
    pause
    exit /b 0
)
