:: name of mod, case-sensitive
set mod_cs=Dungeon Zerg

:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%
:: path of TankCreator
set tc=%TankCreator%

set copyright=CC-BY-SA 2025
set author=Johannes Förstner

:: param
set mode=%1
echo %mode%

:: Compile main resource file - Vanilla
setlocal EnableDelayedExpansion
if not "%mode%"=="loa" (
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%bits%\art" "%tmp%\Bits\art" /S /xf *.psd /xf *.bat /xf *.exe /xf *.lqd20
  robocopy "%bits%\sound" "%tmp%\Bits\sound" /E
  robocopy "%bits%\world\contentdb\components" "%tmp%\Bits\world\contentdb\components" /E
  robocopy "%bits%\world\contentdb\templates" "%tmp%\Bits\world\contentdb\templates" /E
  robocopy "%bits%\world\contentdb\templates-vanilla" "%tmp%\Bits\world\contentdb\templates" /E
  "%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\Resources\%mod_cs% - Vanilla.dsres" -copyright "%copyright%" -title "%mod_cs%" -author "%author%"
  if !errorlevel! neq 0 pause
)
endlocal

:: Compile main resource file - LoA
setlocal EnableDelayedExpansion
if not "%mode%"=="vanilla" (
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%bits%\world\contentdb\components" "%tmp%\Bits\world\contentdb\components" /E
  robocopy "%bits%\world\contentdb\templates" "%tmp%\Bits\world\contentdb\templates" /E
  robocopy "%bits%\world\contentdb\templates-loa" "%tmp%\Bits\world\contentdb\templates" /E
  "%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs% - LoA.dsres" -copyright "%copyright%" -title "%mod_cs%" -author "%author%"
  if !errorlevel! neq 0 pause
)
endlocal

:: Cleanup
rmdir /S /Q "%tmp%\Bits"
