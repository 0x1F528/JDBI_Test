-- =============================================
-- Create database template
-- =============================================
USE master
GO

DECLARE @SQL nvarchar(1000);
IF EXISTS (SELECT 1 FROM sys.databases WHERE [name] = N'NoodleBase')
BEGIN
    SET @SQL = N'USE [NoodleBase];
				 DROP LOGIN NoodleUser
				 DROP USER NoodleUser;

                 ALTER DATABASE NoodleBase SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
                 USE [master];
                 DROP DATABASE NoodleBase;';
    EXEC (@SQL);
END;

CREATE DATABASE NoodleBase
    ON (NAME = N'NoodleBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\NoodleBase.mdf', SIZE = 256MB, FILEGROWTH = 256MB)
LOG ON (NAME = N'NoodleBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\NoodleBase_log.ldf', SIZE = 512MB, FILEGROWTH = 125MB)
GO

USE NoodleBase
-- Creates the login AbolrousHazem with password '340$Uuxwp7Mcxo7Khy'.  
CREATE LOGIN NoodleUser
    WITH PASSWORD = 'Password1';
GO  

-- Creates a database user for the login created above.  
CREATE USER NoodleUser FOR LOGIN NoodleUser;  
GO  

USE NoodleBase
--grant <permission-name> on <object-name> to <username\principle>
EXEC sp_addrolemember 'db_owner', 'NoodleUser'