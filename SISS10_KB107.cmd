@ECHO OFF
SET cj=
SET sorgenti=\\ich.techosp.it\Programmi$\Programs\DRIVERS\IFI\SILENT\SISS10
SET destinazione=c:\Windows\Temp\SISS10
SET kb=KB100107
FOR /F "delims=\" %%j in ('whoami') do SET dominio=%%j
IF "%dominio%"=="humanitas" GOTO dom
NET USE %sorgenti% /u:humanitas\execute Hum6245$
:dom
ECHO.
IF NOT EXIST C:\AppSISS\SISS>PdL_Info.exe GOTO nosiss
FOR /f "tokens=2 delims={}" %%p in ('REG QUERY HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall /f java /s') DO IF "%%p"=="26A24AE4-039D-4CA4-87B4-2F83216030FF" SET cj=OK
IF "%cj%" NEQ "OK" GOTO nojava
ROBOCOPY %sorgenti%\%kb% %destinazione%\%kb% /E
FOR /f "tokens=3 delims= " %%p in ('REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ReleaseId') do ECHO %%p > C:\idver
ECHO.
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ReleaseId" /t REG_SZ /d "2004" /f
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO ...::::: AGGIORNAMENTO SISS - VERSIONE 4.1       :::::...
ECHO.
ECHO ...::::: KB 100107 CON FORZATURA VERSIONE WIN 10 :::::...
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO ...::::: INSTALLAZIONE KB 100107 		      :::::...
ECHO.
ECHO.
ECHO.
ECHO.
ping 127.0.0.1 > nul
C:
CD \Windows\Temp\SISS10\%kb%
START /wait SISSKB100107.EXE
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO ...::::: INSTALLAZIONE COMPLETATA - RIAVVIARE IL PC :::::...
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
FOR /f %%i IN (C:\idver) DO SET idver=%%i
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ReleaseId" /t REG_SZ /d %idver% /f
DEL C:\idver
GOTO fine
:nojava
ECHO.
ECHO.
ECHO    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO    :::::                                            :::::
ECHO    ::::: ATTENZIONE!!! ATTENZIONE!!! ATTENZIONE!!!  :::::
ECHO    :::::                                            :::::
ECHO    :::::         JAVA 1.6.30 NON PRESENTE!!!        :::::
ECHO    :::::                                            :::::
ECHO    :::::                                            :::::
ECHO    :::::                                            :::::
ECHO    :::::  INSTALLARE O VERIFICARE LA PRESENZA DELLA :::::
ECHO    :::::                                            :::::
ECHO    :::::   JAVA 1.6.30 SUL COMPUTER ED IN SEGUITO   :::::
ECHO    :::::                                            :::::
ECHO    :::::    RIPROVARE A RILANCIARE IL TAGLIANDO     :::::
ECHO    :::::                                            :::::
ECHO    :::::                                            :::::
ECHO    :::::                             GRAZIE         :::::
ECHO    :::::                                            :::::
ECHO    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
GOTO fine
:nosiss
ECHO.
ECHO.
ECHO    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO    :::::                                            :::::
ECHO    ::::: ATTENZIONE!!! ATTENZIONE!!! ATTENZIONE!!!  :::::
ECHO    :::::                                            :::::
ECHO    :::::   NESSUNA VERSIONE SEL SISS PRESENTE!!!    :::::
ECHO    :::::                                            :::::
ECHO    :::::                                            :::::
ECHO    :::::                                            :::::
ECHO    :::::   PER INSTALLARE IL SISS USARE LO SCRIPT   :::::
ECHO    :::::                                            :::::
ECHO    :::::       SISS FULL SUL COMPUTER               :::::
ECHO    :::::                                            :::::
ECHO    :::::                                            :::::
ECHO    :::::                             GRAZIE         :::::
ECHO    :::::                                            :::::
ECHO    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
:fine
ping 127.0.0.1 -n 60 > nul