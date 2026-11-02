namespace UniversityPerformanceApp.Models;

public class Grade
{
    public int Id { get; set; }

    public string Student { get; set; } = string.Empty;

    public string Discipline { get; set; } = string.Empty;

    public int Value { get; set; }
}
