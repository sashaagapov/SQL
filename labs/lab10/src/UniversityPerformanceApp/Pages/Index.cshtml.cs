using Microsoft.AspNetCore.Mvc.RazorPages;
using UniversityPerformanceApp.Data;
using UniversityPerformanceApp.Models;

namespace UniversityPerformanceApp.Pages;

public class IndexModel : PageModel
{
    private readonly UniversityPerformanceDb _database;

    public IndexModel(UniversityPerformanceDb database)
    {
        _database = database;
    }

    public Dashboard? Data { get; private set; }

    public string? Error { get; private set; }

    public async Task OnGetAsync()
    {
        try
        {
            Data = await _database.DashboardAsync();
        }
        catch
        {
            Error = "Database is unavailable. Check local configuration.";
        }
    }
}
