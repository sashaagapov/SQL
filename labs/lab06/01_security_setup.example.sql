-- Replace the placeholder securely before executing as an administrator.
CREATE LOGIN lab6_login WITH PASSWORD = '<YOUR_PASSWORD>';
GO
USE UniversityPerformance;
GO
CREATE USER lab6_user FOR LOGIN lab6_login;
CREATE USER lab6_reader WITHOUT LOGIN;
CREATE USER lab6_manager WITHOUT LOGIN;
CREATE ROLE LabReadOnly;
CREATE ROLE LabDataManager;
GRANT SELECT ON SCHEMA::dbo TO LabReadOnly;
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO LabDataManager;
ALTER ROLE LabReadOnly ADD MEMBER lab6_reader;
ALTER ROLE LabDataManager ADD MEMBER lab6_manager;
GO
