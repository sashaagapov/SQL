USE UniversityPerformance;
GO
SELECT AVG(CAST(Grade AS decimal(10,2))) AS AverageGrade FROM dbo.Performance;
SELECT s.FullName, d.Name AS Discipline, p.Grade FROM dbo.Performance p JOIN dbo.Students s ON s.StudentId=p.StudentId JOIN dbo.Disciplines d ON d.DisciplineId=p.DisciplineId ORDER BY s.FullName,d.Name;
DECLARE @Discipline nvarchar(100) = N'Бази даних', @Grade int = 96;
SELECT s.FullName, d.Name AS Discipline, p.Grade FROM dbo.Performance p JOIN dbo.Students s ON s.StudentId=p.StudentId JOIN dbo.Disciplines d ON d.DisciplineId=p.DisciplineId WHERE d.Name=@Discipline AND p.Grade=@Grade;
SELECT s.FullName, MAX(p.Grade) AS MaximumGrade FROM dbo.Students s JOIN dbo.Performance p ON p.StudentId=s.StudentId GROUP BY s.StudentId,s.FullName HAVING MAX(p.Grade)<=60;
GO
