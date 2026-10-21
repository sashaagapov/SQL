USE UniversityPerformance;
GO
CREATE OR ALTER FUNCTION dbo.GetTeacherCount() RETURNS int AS
BEGIN
    DECLARE @Count int;
    SELECT @Count=COUNT(*) FROM dbo.Teachers;
    RETURN @Count;
END;
GO
