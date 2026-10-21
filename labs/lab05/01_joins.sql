USE UniversityPerformance;
GO
SELECT f.Name AS Faculty, d.Name AS Department FROM dbo.Faculties f CROSS JOIN dbo.Departments d;
SELECT f.Name AS Faculty, d.Name AS Department FROM dbo.Faculties f LEFT JOIN dbo.Departments d ON f.FacultyId = d.FacultyId;
SELECT f.Name AS Faculty, d.Name AS Department FROM dbo.Faculties f RIGHT JOIN dbo.Departments d ON f.FacultyId = d.FacultyId;
GO
