@echo off
title ELF to CIA Convertor
@echo ------------------------------------------
@echo          ELF to CIA Convertor
@echo -Special Thanks to 1000pcrack provide some code-
@echo   Icon Image name must be "icon.png"
@echo   Banner Image name must be "bannner.png"
@echo   Wave faile name must be "audio.wav"
@echo ------------------------------------------
@echo Press any key to start.
pause>nul
if not exist banner.png goto error1
if not exist icon.png goto error2
if not exist *.rsf goto error3
if not exist audio.wav goto error4
@echo Create benner.bnr for cia
bannertool.exe makebanner -i banner.png -a audio.wav -o banner.bnr
pause>nul
@echo Create icon.ico for cia
@echo type app title whatever you like.
set /p title=Introduce app title:
@echo type deveploper Name.
set /p author=Introduce app author:
bannertool.exe makesmdh -s "%title%" -l "%title%" -p "%author%" -i icon.png  -o icon.icn
@echo finished Press any key!
pause>nul
@echo Building CIA
makerom -f cia -o install-me.cia -DAPP_ENCRYPTED=false -rsf AppInfo.rsf -target t -exefslogo -elf *.elf -icon icon.icn -banner banner.bnr
@echo Finished!
ping 127.0.0.1 -n 10 > nul
exit

:error1
cls
@echo banner.png does not exist or maybe the file name incorrect.
ping 127.0.0.1 -n 5 > nul
exit

:erorr2
cls
@echo icon.png does not exist or maybe the file name incorrect. 
ping 127.0.0.1 -n 5 > nul
exit

:error3
cls
@echo.rsf does not exist.
ping 127.0.0.1 -n 5 > nul
exit

:error4
cls
@echo audio.wav does not exist or maybe the file name incorrect. 
@echo.rsf does not exist.
ping 127.0.0.1 -n 5 > nul
exit