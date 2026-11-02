namespace UniversityPerformanceApp.Models;

public class Audit
{
    public int Id { get; set; }

    public string Action { get; set; } = string.Empty;

    public int? PerformanceId { get; set; }

    public int? OldGrade { get; set; }

    public int? NewGrade { get; set; }

    public DateTime ChangedAt { get; set; }
}
