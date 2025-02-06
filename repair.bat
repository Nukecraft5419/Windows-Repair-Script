@echo off

echo Checking and repairing system files...
sfc /scannow
echo Operation completed.

echo PC reboot...
pause
shutdown /r /t 30

echo Windows Image Integrity Check (CheckHealth)...
DISM /Online /Cleanup-Image /CheckHealth
echo Operation completed.

echo Windows image integrity scanning (ScanHealth)...
DISM /Online /Cleanup-Image /ScanHealth
echo Operation completed.

echo Restoring Windows image integrity (RestoreHealth)...
DISM /Online /Cleanup-Image /RestoreHealth
echo Operation completed.

echo PC reboot...
pause
shutdown /r /t 30

echo Disk control (chkdsk)...
chkdsk /f /r
echo Operation completed. The disk check will be performed on the next reboot.

echo Reboot the PC to complete the disk check...
pause
shutdown /r /t 30

echo Repair process completed.
pause