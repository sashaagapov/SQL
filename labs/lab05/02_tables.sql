USE UniversityPerformance;
GO
CREATE TABLE dbo.Groups (GroupId int IDENTITY PRIMARY KEY, GroupNumber nvarchar(20) NOT NULL, DepartmentId int NOT NULL REFERENCES dbo.Departments(DepartmentId));
CREATE TABLE dbo.Students (StudentId int IDENTITY PRIMARY KEY, RecordBookNumber nvarchar(20) NOT NULL, FullName nvarchar(100) NOT NULL, GroupId int NOT NULL REFERENCES dbo.Groups(GroupId));
CREATE TABLE dbo.Teachers (TeacherId int IDENTITY PRIMARY KEY, PersonnelNumber nvarchar(20) NOT NULL, FullName nvarchar(100) NOT NULL, DepartmentId int NOT NULL REFERENCES dbo.Departments(DepartmentId));
GO
INSERT dbo.Groups (GroupNumber, DepartmentId) VALUES (N'ІПЗ-21',1),(N'ІС-21',6),(N'КБ-21',7);
INSERT dbo.Students (RecordBookNumber, FullName, GroupId) VALUES
(N'001',N'Студент 1',1),(N'002',N'Студент 2',1),(N'003',N'Студент 3',1),(N'004',N'Студент 4',1),
(N'005',N'Студент 5',2),(N'006',N'Студент 6',2),(N'007',N'Студент 7',2),
(N'008',N'Студент 8',3),(N'009',N'Студент 9',3),(N'010',N'Студент 10',3);
INSERT dbo.Teachers (PersonnelNumber, FullName, DepartmentId) VALUES
(N'001',N'Викладач 1',1),(N'002',N'Викладач 2',6),(N'003',N'Викладач 3',7);
GO
