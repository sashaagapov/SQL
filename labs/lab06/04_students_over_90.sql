USE UniversityPerformance;
GO
SELECT f.Name AS Faculty, d.Name AS Department, s.FullName AS Student, p.Grade
FROM dbo.Performance p
JOIN dbo.Students s ON s.StudentId=p.StudentId
JOIN dbo.Groups g ON g.GroupId=s.GroupId
JOIN dbo.Departments d ON d.DepartmentId=g.DepartmentId
JOIN dbo.Faculties f ON f.FacultyId=d.FacultyId
WHERE p.Grade > 90 ORDER BY p.Grade DESC;
GO
