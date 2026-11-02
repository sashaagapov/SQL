using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using UniversityPerformanceApp.Data;
using UniversityPerformanceApp.Models;

namespace UniversityPerformanceApp.Pages;

public class GradesModel : PageModel
{
    private readonly UniversityPerformanceDb _database;

    public GradesModel(UniversityPerformanceDb database)
    {
        _database = database;
    }

    public List<Grade> Rows { get; private set; } = new List<Grade>();

    public List<StudentOption> Students { get; private set; } = new List<StudentOption>();

    public List<DisciplineOption> Disciplines { get; private set; } = new List<DisciplineOption>();

    public string? Message { get; private set; }

    public async Task OnGetAsync()
    {
        await LoadPageDataAsync();
    }

    public async Task<IActionResult> OnPostAddAsync(int studentId, int disciplineId, int grade)
    {
        if (!await IsGradeValidAsync(grade))
        {
            return Page();
        }

        int affectedRows = await _database.AddGradeAsync(studentId, disciplineId, grade);

        if (affectedRows == 0)
        {
            Message = "The grade was not added.";
            await LoadPageDataAsync();
            return Page();
        }

        return RedirectToPage();
    }

    public async Task<IActionResult> OnPostUpdateAsync(int performanceId, int grade)
    {
        if (!await IsGradeValidAsync(grade))
        {
            return Page();
        }

        int affectedRows = await _database.UpdateGradeAsync(performanceId, grade);

        if (affectedRows == 0)
        {
            Message = "This grade record no longer exists.";
            await LoadPageDataAsync();
            return Page();
        }

        return RedirectToPage();
    }

    public async Task<IActionResult> OnPostDeleteAsync(int performanceId)
    {
        int affectedRows = await _database.DeleteGradeAsync(performanceId);

        if (affectedRows == 0)
        {
            Message = "This grade record no longer exists.";
            await LoadPageDataAsync();
            return Page();
        }

        return RedirectToPage();
    }

    private async Task<bool> IsGradeValidAsync(int grade)
    {
        if (grade >= 0 && grade <= 100)
        {
            return true;
        }

        Message = "Grade must be from 0 to 100.";
        await LoadPageDataAsync();
        return false;
    }

    private async Task LoadPageDataAsync()
    {
        Rows = await _database.GradesAsync();
        Students = await _database.GetStudentsAsync();
        Disciplines = await _database.GetDisciplinesAsync();
    }
}
