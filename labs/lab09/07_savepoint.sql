USE UniversityPerformance;
GO

DECLARE @PerformanceId int = 1;
DECLARE @OriginalGrade int = (SELECT Grade FROM dbo.Performance WHERE PerformanceId = @PerformanceId);

BEGIN TRANSACTION;
UPDATE dbo.Performance SET Grade = @OriginalGrade - 1 WHERE PerformanceId = @PerformanceId;
SAVE TRANSACTION GradeBeforeSecondChange;

UPDATE dbo.Performance SET Grade = @OriginalGrade - 2 WHERE PerformanceId = @PerformanceId;
SELECT N'After second update' AS Stage, Grade FROM dbo.Performance WHERE PerformanceId = @PerformanceId;

ROLLBACK TRANSACTION GradeBeforeSecondChange;
SELECT N'After savepoint rollback' AS Stage, Grade FROM dbo.Performance WHERE PerformanceId = @PerformanceId;

ROLLBACK TRANSACTION;
SELECT N'After final rollback' AS Stage, Grade FROM dbo.Performance WHERE PerformanceId = @PerformanceId;
GO
