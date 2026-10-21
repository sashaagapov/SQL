SELECT DB_NAME() AS CurrentDatabase;
GO
USE UniversityPerformance;
GO
SELECT DepartmentId, Name, FacultyId, HeadFullName FROM dbo.Departments ORDER BY DepartmentId;
GO
