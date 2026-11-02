using Microsoft.AspNetCore.Mvc.RazorPages;using UniversityPerformanceApp.Data;
namespace UniversityPerformanceApp.Pages;public class AuditModel(UniversityPerformanceDb db):PageModel {public List<Audit> Rows{get;private set;}=[];public async Task OnGetAsync()=>Rows=await db.AuditAsync();}
