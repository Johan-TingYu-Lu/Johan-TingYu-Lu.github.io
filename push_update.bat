@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ==========================================
echo  Portfolio Site - Push to GitHub Pages
echo ==========================================
echo.

echo [1/4] Removing stale git lock file...
if exist ".git\index.lock" (
    del /f ".git\index.lock"
    echo       Lock file removed.
) else (
    echo       No lock file found. OK.
)

echo.
echo [2/4] Staging all changes...
git add -A
echo       Done.

echo.
echo [3/4] Creating commit...
git commit -m "Add defence R&D sections, credentials block, UAV thesis images, and CV download"
echo.

echo [4/4] Pushing to GitHub...
git push origin main
echo.

echo ==========================================
if %ERRORLEVEL% EQU 0 (
    echo  SUCCESS! Site will update in ~1 minute.
    echo  https://johan-tingyu-lu.github.io
) else (
    echo  Push failed. Check your git credentials.
)
echo ==========================================
echo.
pause
