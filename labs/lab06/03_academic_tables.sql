USE UniversityPerformance;
GO
CREATE TABLE dbo.Disciplines (DisciplineId int IDENTITY PRIMARY KEY, Name nvarchar(100) NOT NULL, TeacherId int NOT NULL REFERENCES dbo.Teachers(TeacherId), DepartmentId int NOT NULL REFERENCES dbo.Departments(DepartmentId));
CREATE TABLE dbo.Performance (PerformanceId int IDENTITY PRIMARY KEY, DisciplineId int NOT NULL REFERENCES dbo.Disciplines(DisciplineId), StudentId int NOT NULL REFERENCES dbo.Students(StudentId), Grade int NOT NULL);
GO
INSERT dbo.Disciplines (Name, TeacherId, DepartmentId) VALUES
(N'Бази даних',1,1),(N'Програмування',1,1),(N'Інформаційні системи',2,6),(N'Мережі',2,6),(N'Безпека',3,7);
INSERT dbo.Performance (DisciplineId, StudentId, Grade) VALUES
(1,1,96),(2,2,95),(3,3,94),(4,4,93),(5,5,92),(1,6,91),(2,7,90),(3,8,88),(4,9,83),(5,10,83);
GO
