@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Server 2019 By mohammadali" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v Wallpaper /t REG_SZ /d D:\a\wallpaper.bat
net user mohammadali mmd@123 /add >nul
net localgroup administrators mohammadali /add >nul
net user mohammadali /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant mohammadali:F >nul
ICACLS C:\Windows\installer /grant mohammadali:F >nul
echo Successfully installed! If RDP is dead, rebuild again.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && ngrok tcp 3389 --host-header=localhost:4040 | findstr "tcp://" || echo "Failed to retrieve NGROK authtoken - check your authtoken again"
echo Username: mohammadali
echo Password: mmd@123
echo You can log in now
ping -n 10 127.0.0.1 >nul
