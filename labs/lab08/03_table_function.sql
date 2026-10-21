USE UniversityPerformance;
GO
CREATE OR ALTER FUNCTION dbo.GetDepartmentsByFaculty() RETURNS TABLE AS RETURN
    SELECT f.Name AS Faculty, d.Name AS Department FROM dbo.Faculties f JOIN dbo.Departments d ON d.FacultyId=f.FacultyId;
GO
