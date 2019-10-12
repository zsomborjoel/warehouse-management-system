@ECHO OFF

SET SQLCMD="C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\130\Tools\Binn\SQLCMD.EXE"
SET PATH="C:\DB_Backup"
SET SERVER="WIN-4KDTJSTNBNO\SQLEXPRESS"
SET DB="PROD_DB"
SET LOGIN="sa"
SET PASSWORD="pass"
SET OUTPUT="C:\DB_Backup\Log\OutputLog_%date%.txt"

CD %PATH%

ECHO %date% %time% > %OUTPUT%

for %%f in (DB_BACKUP.sql) do (
%SQLCMD% -S %SERVER% -d %DB% -U %LOGIN% -P %PASSWORD% -i %%~f >> %OUTPUT%
)

if NOT ["%errorlevel%"]==["0"] pause