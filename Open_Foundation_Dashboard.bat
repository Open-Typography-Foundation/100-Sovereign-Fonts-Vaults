@echo off
title Open Typography Foundation - Master 100 Vaults Dashboard
cls
echo ==============================================================================
echo       OPEN TYPOGRAPHY FOUNDATION -- 100 SOVEREIGN MEGA-VAULTS ARCHIVE
echo       Curated by Mohammad Golamrabbii -- 100% Free Public Digital Heritage
echo       Total Verified Fonts: 334,627 across 100 Sovereign Vaults
echo ==============================================================================
echo.
echo Launching Interactive Offline Specimen Browser in default browser...
start "" "%~dp0font_browser.html"
echo Opening Vaults Directory in Windows Explorer...
start "" "%~dp0"
echo.
echo Dashboard successfully launched! Press any key to exit this console window.
pause >nul
