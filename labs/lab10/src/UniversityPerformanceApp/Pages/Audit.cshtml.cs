using Microsoft.AspNetCore.Mvc.RazorPages;
using UniversityPerformanceApp.Data;
using UniversityPerformanceApp.Models;

namespace UniversityPerformanceApp.Pages;

public class AuditModel : PageModel
{
    private readonly UniversityPerformanceDb _database;

    public AuditModel(UniversityPerformanceDb database)
    {
        _database = database;
    }

    public List<Audit> Rows { get; private set; } = new List<Audit>();

    public async Task OnGetAsync()
    {
        Rows = await _database.AuditAsync();
    }
}
