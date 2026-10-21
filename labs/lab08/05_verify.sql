USE UniversityPerformance;
GO
SELECT * FROM dbo.StudentGradesView WHERE GroupNumber=N'ІПЗ-21';
SELECT dbo.GetTeacherCount() AS TeacherCount;
SELECT * FROM dbo.GetDepartmentsByFaculty();
EXEC dbo.GetDepartmentCount @FacultyName=N'Факультет інформаційних технологій';
GO
