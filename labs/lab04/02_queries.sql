USE UniversityPerformance;
GO
SELECT * FROM dbo.Faculties WHERE Name LIKE N'%інформаційн%технолог%' ORDER BY Name;
DECLARE @Building int = 1;
SELECT * FROM dbo.Faculties WHERE BuildingNumber = @Building ORDER BY Name;
SELECT * FROM dbo.Departments WHERE HeadFullName LIKE N'С%' ORDER BY Name;
GO
