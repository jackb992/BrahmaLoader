echo off
title ELF to CIA Convertor
echo ------------------------------------------
echo          ELF to CIA Convertor
echo -Special Thanks to 1000pcrack provide some code-
echo   Icon Image name must be "icon.png"
echo   Banner Image name must be "bannner.png"
echo   Wave faile name must be "audio.wav"
echo ------------------------------------------
read -n1 -r -p "Press any key to continue..."
./bannertool makebanner -i banner.png -a audio.wav -o banner.bnr
read -n1 -r -p
echo Create icon.ico for cia
./bannertool makesmdh -s “Decrypt9WIP” -l "Decrypt9WIP" -p "Archshift, d0k3, Shadowtrance & others" -i icon.png  -o icon.icn 
echo finished Press any key!
read -n1 -r -p
echo Building CIA
./makerom -f cia -o install-me.cia -DAPP_ENCRYPTED=false -rsf AppInfo.rsf -target t -exefslogo -elf *.elf -icon icon.icn -banner banner.bnr
echo Finished!
exit