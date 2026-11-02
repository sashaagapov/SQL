using Microsoft.Data.SqlClient;
namespace UniversityPerformanceApp.Data;
public sealed class UniversityPerformanceDb(IConfiguration config)
{
    private string Cs => config.GetConnectionString("UniversityPerformance") ?? config["SQL_CONNECTION_STRING"] ?? throw new InvalidOperationException("Database connection is not configured.");
    public async Task<Dashboard> DashboardAsync() { var students=await ScalarAsync("SELECT COUNT(*) FROM dbo.Students;");var disciplines=await ScalarAsync("SELECT COUNT(*) FROM dbo.Disciplines;");var records=await ScalarAsync("SELECT COUNT(*) FROM dbo.Performance;");await using var c=new SqlConnection(Cs);await using var cmd=new SqlCommand("SELECT CAST(AVG(CAST(Grade AS decimal(10,2))) AS decimal(10,2)) FROM dbo.Performance;",c);await c.OpenAsync();var average=await cmd.ExecuteScalarAsync();return new(students,disciplines,records,average is DBNull?null:Convert.ToDecimal(average));}
    private async Task<int> ScalarAsync(string sql){await using var c=new SqlConnection(Cs);await using var cmd=new SqlCommand(sql,c);await c.OpenAsync();return Convert.ToInt32(await cmd.ExecuteScalarAsync());}
    public async Task<List<Grade>> GradesAsync(){var x=new List<Grade>();await using var c=new SqlConnection(Cs);await using var cmd=new SqlCommand("SELECT p.PerformanceId,s.FullName,d.Name,p.Grade FROM dbo.Performance p JOIN dbo.Students s ON s.StudentId=p.StudentId JOIN dbo.Disciplines d ON d.DisciplineId=p.DisciplineId ORDER BY p.PerformanceId",c);await c.OpenAsync();await using var r=await cmd.ExecuteReaderAsync();while(await r.ReadAsync())x.Add(new(r.GetInt32(0),r.GetString(1),r.GetString(2),r.GetInt32(3)));return x;}
    public async Task<int> ChangeAsync(string sql,params (string,int)[] p){await using var c=new SqlConnection(Cs);await using var cmd=new SqlCommand(sql,c);foreach(var v in p)cmd.Parameters.AddWithValue(v.Item1,v.Item2);await c.OpenAsync();return await cmd.ExecuteNonQueryAsync();}
    public async Task<List<Audit>> AuditAsync(){var x=new List<Audit>();await using var c=new SqlConnection(Cs);await using var cmd=new SqlCommand("SELECT AuditId,Action,PerformanceId,OldGrade,NewGrade,ChangedAt FROM dbo.PerformanceAudit ORDER BY AuditId DESC",c);await c.OpenAsync();await using var r=await cmd.ExecuteReaderAsync();while(await r.ReadAsync())x.Add(new(r.GetInt32(0),r.GetString(1),r.IsDBNull(2)?null:r.GetInt32(2),r.IsDBNull(3)?null:r.GetInt32(3),r.IsDBNull(4)?null:r.GetInt32(4),r.GetDateTime(5)));return x;}
}
public record Dashboard(int Students,int Disciplines,int Records,decimal? Average);
public record Grade(int Id,string Student,string Discipline,int Value);
public record Audit(int Id,string Action,int? PerformanceId,int? OldGrade,int? NewGrade,DateTime ChangedAt);
