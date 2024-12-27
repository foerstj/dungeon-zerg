:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%

:: Compile main resource file
call "%bits%\build.bat" %*

::pause

:: Run it!
"%ds%\DSLOA.exe" nointro=true map=map_world

:: Cleanup resources so as not to confuse Siege Editor
call "%bits%\cleanup.bat" %*
