USE UniversityPerformance;
GO

DECLARE @PerformanceId int = 1;
DECLARE @OriginalGrade int = (SELECT Grade FROM dbo.Performance WHERE PerformanceId = @PerformanceId);

BEGIN TRANSACTION OuterTransaction;
SELECT N'After outer BEGIN' AS Stage, @@TRANCOUNT AS TransactionCount;

BEGIN TRANSACTION InnerTransaction;
SELECT N'After inner BEGIN' AS Stage, @@TRANCOUNT AS TransactionCount;

UPDATE dbo.Performance SET Grade = @OriginalGrade - 1 WHERE PerformanceId = @PerformanceId;
COMMIT TRANSACTION InnerTransaction;
-- The inner COMMIT decreases @@TRANCOUNT, but the outer transaction still controls the result.
SELECT N'After inner COMMIT' AS Stage, @@TRANCOUNT AS TransactionCount;

ROLLBACK TRANSACTION OuterTransaction;
SELECT N'After outer ROLLBACK' AS Stage, Grade FROM dbo.Performance WHERE PerformanceId = @PerformanceId;
GO
