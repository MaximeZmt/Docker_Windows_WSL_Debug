# Docker Desktop WSL Debug

## Overview

If you're encountering the following error on Windows while using Docker Desktop with WSL:


```
Docker Desktop distro installation failed

deploying WSL 2 distributions...
```

This error is discussed in detail in the [Docker forum thread](https://forums.docker.com/t/docker-desktop-distro-installation-failed-after-upgradation-to-4-32-0/142393).

I've developed a script that automates fixing this issue by unregistering `docker-desktop` from WSL and starting Docker Desktop afterward.

## Script Workflow

The script performs the following steps:

1. **Check if running as Administrator:** The script verifies if it's being run with administrator privileges.
2. **Check if Docker is already running:** If Docker is already running, it skips unnecessary steps.
3. **Unregister Docker Desktop from WSL:** If Docker is not running, it executes the command `wsl --unregister docker-desktop`.
4. **Start Docker Desktop:** After unregistering, the script automatically starts Docker Desktop.

## How to Use

1. Ensure you're running the script as an administrator.
2. The script will automatically handle the rest, including checking Docker's status, unregistering `docker-desktop`, and restarting Docker.

## Troubleshooting

- **Permission Issues:** Make sure you're running the script with administrative privileges.
- **Docker Still Fails to Start:** If Docker continues to fail after running the script, consider resetting WSL or reinstalling Docker Desktop.

Feel free to customize the script according to your setup, and don't hesitate to raise an issue if you encounter any problems.

---
Happy coding! 🚀

