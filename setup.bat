@echo off
setlocal enabledelayedexpansion
cd /D "%~dp0"

:: --- Unpack Arguments ----------------------------------------
for %%a in (%*) do set "%%a=1"
if not "%emacs%"=="1" if not "%wezterm%"=="1" (
   set emacs=1
   set wezterm=1
)

:: --- Emacs Setup ---------------------------------------------
if "%emacs%"=="1" (
   echo [emacs setup]
   copy .\.emacs %APPDATA%\.emacs

   if not exist %APPDATA%\.emacs.d\themes mkdir %APPDATA%\.emacs.d\themes
   copy .\excalibur-theme.el %APPDATA%\.emacs.d\themes\excalibur-theme.el
   copy .\excalibur-metal-theme.el %APPDATA%\.emacs.d\themes\excalibur-metal-theme.el
)

:: --- Wezterm Setup -------------------------------------------
if "%wezterm%"=="1" (
   echo [wezterm setup]
   copy .\.wezterm.lua %USERPROFILE%\.wezterm.lua
)
