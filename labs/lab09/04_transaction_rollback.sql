USE UniversityPerformance;
GO

DECLARE @PerformanceId int = 1;

SELECT N'Before transaction' AS Stage, Grade
FROM dbo.Performance WHERE PerformanceId = @PerformanceId;

BEGIN TRANSACTION;

UPDATE dbo.Performance SET Grade = Grade - 1
WHERE PerformanceId = @PerformanceId;

SELECT N'Inside transaction' AS Stage, Grade
FROM dbo.Performance WHERE PerformanceId = @PerformanceId;
SELECT N'Audit inside transaction' AS Stage, Action, OldGrade, NewGrade
FROM dbo.PerformanceAudit WHERE PerformanceId = @PerformanceId;

ROLLBACK TRANSACTION;

SELECT N'After rollback' AS Stage, Grade
FROM dbo.Performance WHERE PerformanceId = @PerformanceId;
SELECT N'Audit after rollback' AS Stage, Action, OldGrade, NewGrade
FROM dbo.PerformanceAudit WHERE PerformanceId = @PerformanceId;
GO
