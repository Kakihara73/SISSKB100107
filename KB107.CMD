@ECHO OFF
FOR /f "tokens=3 delims= " %%p in ('REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ReleaseId') do ECHO %%p > C:\idver
ECHO.
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ReleaseId" /t REG_SZ /d "2004" /f
SCHTASKS /Create /SC daily /TN IDVER /ST 15:40 /TR c:\IDVER.cmd /RU ""