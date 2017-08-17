IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'WebService_AdventureWorks')
CREATE LOGIN [WebService_AdventureWorks] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [WebService_AdventureWorks] FOR LOGIN [WebService_AdventureWorks] WITH DEFAULT_SCHEMA=[DBO]
GO
GRANT EXECUTE TO [WebService_AdventureWorks]
