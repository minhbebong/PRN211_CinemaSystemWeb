using Lab1.Models;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);


builder.Services.AddControllersWithViews();
//bo sung instance cua PRN211DBContext vao container cua web server
builder.Services.AddDbContext<PRN_DBContext>(opt => opt.UseSqlServer(builder.Configuration.GetConnectionString("PRN_DB")));
builder.Services.AddSession(opt => opt.IdleTimeout = TimeSpan.FromSeconds(20));

//bo sung instance cua PRN211DB
builder.Services.AddDbContext<PRN_DBContext>(opt => opt.UseSqlServer
(builder.Configuration.GetConnectionString("PRN_DB")));

var app = builder.Build();
app.UseStaticFiles();
app.UseSession();
app.MapControllerRoute(
     name: "default",
     pattern: "{controller=Account}/{action=Login}/{id?}"
    );
app.Run();
