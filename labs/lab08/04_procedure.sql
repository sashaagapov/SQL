USE UniversityPerformance;
GO
CREATE OR ALTER PROCEDURE dbo.GetDepartmentCount @FacultyName nvarchar(100) AS
BEGIN
    SET NOCOUNT ON;
    SELECT f.Name AS Faculty, COUNT(d.DepartmentId) AS DepartmentCount
    FROM dbo.Faculties f LEFT JOIN dbo.Departments d ON d.FacultyId=f.FacultyId
    WHERE f.Name=@FacultyName GROUP BY f.FacultyId,f.Name;
END;
GO
