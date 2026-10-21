USE UniversityPerformance;
GO
CREATE OR ALTER VIEW dbo.StudentGradesView AS
SELECT s.FullName AS Student, g.GroupNumber, d.Name AS Discipline, p.Grade
FROM dbo.Students s JOIN dbo.Groups g ON g.GroupId=s.GroupId
JOIN dbo.Performance p ON p.StudentId=s.StudentId
JOIN dbo.Disciplines d ON d.DisciplineId=p.DisciplineId;
GO
