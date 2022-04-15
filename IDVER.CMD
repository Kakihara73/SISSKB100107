@ECHO OFF
IF NOT EXIST C:\AppSISS\SISS\Update\SUCCESS\SISSKB100107.exe GOTO fine
FOR /f %%i IN (C:\idver) DO SET idver=%%i
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ReleaseId" /t REG_SZ /d %idver% /f
DEL C:\idver
SCHTASKS /Delete /TN IDVER /F
DEL C:\IDVER.CMD
:fine