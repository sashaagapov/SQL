USE UniversityPerformance;
GO
CREATE TABLE dbo.Faculties (
    FacultyId int IDENTITY PRIMARY KEY,
    Name nvarchar(100) NOT NULL,
    DeanFullName nvarchar(100) NOT NULL,
    BuildingNumber int NOT NULL,
    PhoneNumber nvarchar(50) NOT NULL
);
CREATE TABLE dbo.Departments (
    DepartmentId int IDENTITY PRIMARY KEY,
    Name nvarchar(100) NOT NULL,
    FacultyId int NOT NULL REFERENCES dbo.Faculties(FacultyId),
    HeadFullName nvarchar(100) NOT NULL
);
GO
