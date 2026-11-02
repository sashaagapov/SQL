using UniversityPerformanceApp.Data;

var builder = WebApplication.CreateBuilder(args);
builder.Configuration.AddUserSecrets<Program>(optional: true);
builder.Services.AddRazorPages();
builder.Services.AddScoped<UniversityPerformanceDb>();
var app = builder.Build();
app.UseExceptionHandler("/Error");
app.UseStaticFiles();
app.MapRazorPages();
app.Run();
