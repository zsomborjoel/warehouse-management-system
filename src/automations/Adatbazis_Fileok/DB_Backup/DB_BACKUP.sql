--Backup specific database

-- 1. Variable declaration

DECLARE @path VARCHAR(500)
DECLARE @name VARCHAR(500)
DECLARE @pathwithname VARCHAR(500)
DECLARE @time DATETIME
DECLARE @year VARCHAR(4)
DECLARE @month VARCHAR(2)
DECLARE @day VARCHAR(2)


-- 2. Setting the backup path

SET @path = 'C:\DB_Backup\'

-- 3. Getting the time values

SELECT @time   = GETDATE()
SELECT @year   = (SELECT CONVERT(VARCHAR(4), DATEPART(yy, @time)))
SELECT @month  = (SELECT CONVERT(VARCHAR(2), FORMAT(DATEPART(mm,@time),'00')))
SELECT @day    = (SELECT CONVERT(VARCHAR(2), FORMAT(DATEPART(dd,@time),'00')))


-- 4. Defining the filename format

SELECT @name ='PROD_DB' + '_' + @year + @month + @day 

SET @pathwithname = @path + @namE + '.bak'

--5. Executing the backup command

BACKUP DATABASE PROD_DB 
TO DISK = @pathwithname WITH NOFORMAT, NOINIT, SKIP, REWIND, NOUNLOAD, STATS = 10

PRINT('------------------------------------------------') 
PRINT('Statistics Update begin')
PRINT('')

--6. Update Statistics on the Indexes

EXEC sp_updatestats;

GO 

