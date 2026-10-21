USE UniversityPerformance;
GO
UPDATE dbo.Departments SET HeadFullName = N'Сидоренко (демо)' WHERE DepartmentId = 1;
UPDATE dbo.Departments SET HeadFullName = N'Керівник 2 (демо)' WHERE DepartmentId = 2;
UPDATE dbo.Departments SET HeadFullName = N'Керівник 3 (демо)' WHERE DepartmentId = 3;
DELETE FROM dbo.Departments WHERE DepartmentId = 9;
GO
