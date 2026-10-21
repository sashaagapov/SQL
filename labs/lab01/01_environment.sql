SELECT @@VERSION AS ServerVersion;
SELECT DB_NAME() AS CurrentDatabase;
SELECT name FROM sys.databases ORDER BY name;
SELECT CONVERT(nvarchar(128), SERVERPROPERTY('Collation')) AS ServerCollation;
EXEC sp_helpsort;
SELECT CONVERT(nvarchar(100), SERVERPROPERTY('Edition')) AS Edition;
SELECT CONVERT(int, SERVERPROPERTY('IsIntegratedSecurityOnly')) AS IntegratedSecurityOnly;
GO
