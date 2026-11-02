USE UniversityPerformance;
GO

CREATE OR ALTER TRIGGER dbo.trg_Performance_Update
ON dbo.Performance
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.PerformanceAudit
        (PerformanceId, Action, OldGrade, NewGrade, ChangedAt)
    SELECT
        i.PerformanceId,
        N'UPDATE',
        d.Grade,
        i.Grade,
        SYSDATETIME()
    FROM inserted AS i
    JOIN deleted AS d
        ON i.PerformanceId = d.PerformanceId;
END;
GO
