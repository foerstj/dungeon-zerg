:: name of mod, case-sensitive
set mod_cs=Dungeon Zerg
:: path of DS installation
set ds=%DungeonSiege%

:: Cleanup resources so as not to confuse Siege Editor
del "%ds%\DSLOA\%mod_cs% - LoA.dsres"
del "%ds%\Resources\%mod_cs% - Vanilla.dsres"
