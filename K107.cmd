@ECHO OFF
SET sorgenti=\\ich.techosp.it\Programmi$\Programs\DRIVERS\IFI\SILENT\SISS10\KB100107
COPY /Y %sorgenti%\SISSKB100107.* \\%1\c$\AppSISS\SISS\Update
IF %ERRORLEVEL% NEQ 0 GOTO err
IF EXIST \\%1\c$\IDVER GOTO attesa
COPY /Y C:\SYS\IDVER.CMD \\%1\c$
PSEXEC \\%1 -h -c -s KB107.cmd
GOTO fine
:attesa
ECHO %1 >> C:\TMP\KB107_ATTESA.TXT
GOTO fine
:err
ECHO %1 >> C:\TMP\KB107_SPENTE.TXT
:fine