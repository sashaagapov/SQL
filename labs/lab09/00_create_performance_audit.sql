USE UniversityPerformance;
GO

IF OBJECT_ID('dbo.PerformanceAudit', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.PerformanceAudit
    (
        AuditId INT IDENTITY(1,1) PRIMARY KEY,
        PerformanceId INT,
        Action NVARCHAR(10) NOT NULL,
        OldGrade INT NULL,
        NewGrade INT NULL,
        ChangedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME()
    );
END;
GO
