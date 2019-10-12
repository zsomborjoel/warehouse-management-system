@ECHO OFF

ECHO "Folyamatban..."

set hour=%time:~0,2%
set minute=%time:~3,2%
set seconds=%time:~6,2%
set timestamp=%date%%hour%%minute%%seconds%
COPY "C:\Excelek\Sajat_Termekek\Sajat_Termek_felulet.xlsm" "C:\Excel_Backup\%timestamp%-Sajat_Termek_felulet.xlsm"

SET SQLCMD="C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\130\Tools\Binn\"
SET SERVER="WIN-4KDTJSTNBNO\SQLEXPRESS"
SET DB="PROD_DB"
SET LOGIN="sa"
SET PASSWORD="pass"

CD %SQLCMD%


SQLCMD -S %SERVER% -U %LOGIN% -P %PASSWORD% -d %DB% -Q "EXEC usp_xls_termek_update_insert"

ECHO "Kerem varjon!"
timeout /t 5

cscript "C:\Adatbazis_Fileok\VBS_XLS_DeleteRows\Sajat_Termekek.vbs" "C:\Excelek\Sajat_Termekek\Sajat_Termek_felulet.xlsm"

SQLCMD -S %SERVER% -U %LOGIN% -P %PASSWORD% -d %DB% -Q "EXEC usp_xls_termek_lista_select"

if NOT ["%errorlevel%"]==["0"] pause

ECHO "Befejezodott!"
