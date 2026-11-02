USE UniversityPerformance;
GO

CREATE OR ALTER TRIGGER dbo.trg_Performance_Insert
ON dbo.Performance
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- inserted contains every new row, including rows from a multi-row INSERT.
    INSERT INTO dbo.PerformanceAudit
        (PerformanceId, Action, OldGrade, NewGrade, ChangedAt)
    SELECT PerformanceId, N'INSERT', NULL, Grade, SYSDATETIME()
    FROM inserted;
END;
GO
