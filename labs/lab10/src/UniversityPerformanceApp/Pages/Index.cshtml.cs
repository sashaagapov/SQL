using Microsoft.AspNetCore.Mvc.RazorPages; using UniversityPerformanceApp.Data;
namespace UniversityPerformanceApp.Pages;
public class IndexModel(UniversityPerformanceDb db):PageModel { public Dashboard? Data{get;private set;} public string? Error{get;private set;} public async Task OnGetAsync(){try{Data=await db.DashboardAsync();}catch{Error="Database is unavailable. Check local configuration.";}}}
