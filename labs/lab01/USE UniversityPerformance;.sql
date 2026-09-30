USE UniversityPerformance;
GO

SELECT
    d.Name AS Department,
    f.Name AS Faculty,
    d.HeadFullName
FROM dbo.Departments AS d
JOIN dbo.Faculties AS f
    ON d.FacultyId = f.FacultyId
ORDER BY d.Name;
GO