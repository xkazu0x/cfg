:: @echo off
setlocal enabledelayedexpansion
cd /D "%~dp0"

:: --- Emacs Setup ---------------------------------------------
copy .\.emacs %APPDATA%\.emacs

if not exist %APPDATA%\.emacs.d\themes mkdir %APPDATA%\.emacs.d\themes
copy .\excalibur-theme.el %APPDATA%\.emacs.d\themes\excalibur-theme.el

:: --- Wezterm Setup -------------------------------------------
copy .\.wezterm.lua %USERPROFILE%\.wezterm.lua
