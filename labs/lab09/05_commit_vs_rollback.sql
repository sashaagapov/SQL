USE UniversityPerformance;
GO

DECLARE @PerformanceId int = 1;
DECLARE @OriginalGrade int = (SELECT Grade FROM dbo.Performance WHERE PerformanceId = @PerformanceId);

-- COMMIT makes this change visible after the transaction ends.
BEGIN TRANSACTION;
UPDATE dbo.Performance SET Grade = @OriginalGrade - 1 WHERE PerformanceId = @PerformanceId;
COMMIT TRANSACTION;
SELECT N'After COMMIT' AS Stage, Grade FROM dbo.Performance WHERE PerformanceId = @PerformanceId;

-- A second transaction restores the coursework value.
BEGIN TRANSACTION;
UPDATE dbo.Performance SET Grade = @OriginalGrade WHERE PerformanceId = @PerformanceId;
COMMIT TRANSACTION;

-- ROLLBACK cancels this temporary change.
BEGIN TRANSACTION;
UPDATE dbo.Performance SET Grade = @OriginalGrade - 2 WHERE PerformanceId = @PerformanceId;
ROLLBACK TRANSACTION;
SELECT N'After ROLLBACK' AS Stage, Grade FROM dbo.Performance WHERE PerformanceId = @PerformanceId;
GO
