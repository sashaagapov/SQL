USE UniversityPerformance;
GO

CREATE OR ALTER TRIGGER dbo.trg_Performance_Delete
ON dbo.Performance
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- deleted contains rows that existed before the DELETE statement.
    INSERT INTO dbo.PerformanceAudit
        (PerformanceId, Action, OldGrade, NewGrade, ChangedAt)
    SELECT PerformanceId, N'DELETE', Grade, NULL, SYSDATETIME()
    FROM deleted;
END;
GO
