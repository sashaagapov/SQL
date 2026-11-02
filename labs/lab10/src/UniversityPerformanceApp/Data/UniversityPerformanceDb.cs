using Microsoft.Data.SqlClient;
using UniversityPerformanceApp.Models;

namespace UniversityPerformanceApp.Data;

public class UniversityPerformanceDb
{
    private readonly string _connectionString;

    public UniversityPerformanceDb(IConfiguration configuration)
    {
        _connectionString = configuration.GetConnectionString("UniversityPerformance")
            ?? configuration["SQL_CONNECTION_STRING"]
            ?? throw new InvalidOperationException("Database connection is not configured.");
    }

    public async Task<Dashboard> DashboardAsync()
    {
        int students = await GetScalarIntAsync("SELECT COUNT(*) FROM dbo.Students;");
        int disciplines = await GetScalarIntAsync("SELECT COUNT(*) FROM dbo.Disciplines;");
        int records = await GetScalarIntAsync("SELECT COUNT(*) FROM dbo.Performance;");

        const string sql = "SELECT CAST(AVG(CAST(Grade AS decimal(10, 2))) AS decimal(10, 2)) FROM dbo.Performance;";

        await using SqlConnection connection = new SqlConnection(_connectionString);
        await using SqlCommand command = new SqlCommand(sql, connection);

        await connection.OpenAsync();

        object? result = await command.ExecuteScalarAsync();
        decimal? average = result is DBNull ? null : Convert.ToDecimal(result);

        return new Dashboard
        {
            Students = students,
            Disciplines = disciplines,
            Records = records,
            Average = average
        };
    }

    private async Task<int> GetScalarIntAsync(string sql)
    {
        await using SqlConnection connection = new SqlConnection(_connectionString);
        await using SqlCommand command = new SqlCommand(sql, connection);

        await connection.OpenAsync();

        object? result = await command.ExecuteScalarAsync();
        return Convert.ToInt32(result);
    }

    public async Task<List<Grade>> GradesAsync()
    {
        const string sql = "SELECT p.PerformanceId, s.FullName, d.Name, p.Grade FROM dbo.Performance AS p JOIN dbo.Students AS s ON s.StudentId = p.StudentId JOIN dbo.Disciplines AS d ON d.DisciplineId = p.DisciplineId ORDER BY p.PerformanceId;";
        List<Grade> grades = new List<Grade>();

        await using SqlConnection connection = new SqlConnection(_connectionString);
        await using SqlCommand command = new SqlCommand(sql, connection);

        await connection.OpenAsync();

        await using SqlDataReader reader = await command.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            Grade grade = new Grade
            {
                Id = reader.GetInt32(0),
                Student = reader.GetString(1),
                Discipline = reader.GetString(2),
                Value = reader.GetInt32(3)
            };

            grades.Add(grade);
        }

        return grades;
    }

    public async Task<List<StudentOption>> GetStudentsAsync()
    {
        const string sql = "SELECT StudentId, FullName FROM dbo.Students ORDER BY FullName;";
        List<StudentOption> students = new List<StudentOption>();

        await using SqlConnection connection = new SqlConnection(_connectionString);
        await using SqlCommand command = new SqlCommand(sql, connection);

        await connection.OpenAsync();

        await using SqlDataReader reader = await command.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            StudentOption student = new StudentOption
            {
                Id = reader.GetInt32(0),
                Name = reader.GetString(1)
            };

            students.Add(student);
        }

        return students;
    }

    public async Task<List<DisciplineOption>> GetDisciplinesAsync()
    {
        const string sql = "SELECT DisciplineId, Name FROM dbo.Disciplines ORDER BY Name;";
        List<DisciplineOption> disciplines = new List<DisciplineOption>();

        await using SqlConnection connection = new SqlConnection(_connectionString);
        await using SqlCommand command = new SqlCommand(sql, connection);

        await connection.OpenAsync();

        await using SqlDataReader reader = await command.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            DisciplineOption discipline = new DisciplineOption
            {
                Id = reader.GetInt32(0),
                Name = reader.GetString(1)
            };

            disciplines.Add(discipline);
        }

        return disciplines;
    }

    public async Task<int> AddGradeAsync(int studentId, int disciplineId, int grade)
    {
        const string sql = """
            INSERT dbo.Performance (StudentId, DisciplineId, Grade)
            VALUES (@studentId, @disciplineId, @grade);
            """;

        await using SqlConnection connection = new SqlConnection(_connectionString);
        await using SqlCommand command = new SqlCommand(sql, connection);

        command.Parameters.AddWithValue("@studentId", studentId);
        command.Parameters.AddWithValue("@disciplineId", disciplineId);
        command.Parameters.AddWithValue("@grade", grade);

        await connection.OpenAsync();
        return await command.ExecuteNonQueryAsync();
    }

    public async Task<int> UpdateGradeAsync(int performanceId, int grade)
    {
        const string sql = """
            UPDATE dbo.Performance
            SET Grade = @grade
            WHERE PerformanceId = @performanceId;
            """;

        await using SqlConnection connection = new SqlConnection(_connectionString);
        await using SqlCommand command = new SqlCommand(sql, connection);

        command.Parameters.AddWithValue("@performanceId", performanceId);
        command.Parameters.AddWithValue("@grade", grade);

        await connection.OpenAsync();
        return await command.ExecuteNonQueryAsync();
    }

    public async Task<int> DeleteGradeAsync(int performanceId)
    {
        const string sql = "DELETE FROM dbo.Performance WHERE PerformanceId = @performanceId;";

        await using SqlConnection connection = new SqlConnection(_connectionString);
        await using SqlCommand command = new SqlCommand(sql, connection);

        command.Parameters.AddWithValue("@performanceId", performanceId);

        await connection.OpenAsync();
        return await command.ExecuteNonQueryAsync();
    }

    public async Task<List<Audit>> AuditAsync()
    {
        const string sql = "SELECT AuditId, Action, PerformanceId, OldGrade, NewGrade, ChangedAt FROM dbo.PerformanceAudit ORDER BY AuditId DESC;";
        List<Audit> auditRows = new List<Audit>();

        await using SqlConnection connection = new SqlConnection(_connectionString);
        await using SqlCommand command = new SqlCommand(sql, connection);

        await connection.OpenAsync();

        await using SqlDataReader reader = await command.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            Audit audit = new Audit
            {
                Id = reader.GetInt32(0),
                Action = reader.GetString(1),
                PerformanceId = reader.IsDBNull(2) ? null : reader.GetInt32(2),
                OldGrade = reader.IsDBNull(3) ? null : reader.GetInt32(3),
                NewGrade = reader.IsDBNull(4) ? null : reader.GetInt32(4),
                ChangedAt = reader.GetDateTime(5)
            };

            auditRows.Add(audit);
        }

        return auditRows;
    }
}
