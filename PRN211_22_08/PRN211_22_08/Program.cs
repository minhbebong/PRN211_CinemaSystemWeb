using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using PRN211_22_08.Models;

var builder = WebApplication.CreateBuilder(args);
//bổ sung service cho ứng dụng vận hành theo kiến trúc MVC
builder.Services.AddControllersWithViews();
builder.Services.AddSession(opt => opt.IdleTimeout = TimeSpan.FromMinutes(20));


//bo sung instance cua PRN211DBcontext vao container cua web server
builder.Services.AddDbContext<PRN_DBContext>(opt => opt.UseSqlServer(builder.Configuration.GetConnectionString("PRN211DB")));

var app = builder.Build();

//kich hoat co che rputing (dinh tuyen cac request)cho ung dung
app.UseRouting();

//cho ung dung web co the su dung cac static file (css,js,image..)
app.UseStaticFiles();

//cau hinh pattern thuc thi tren url de xu li cac request
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Account}/{action=Login}/{id?}");

//app.MapGet("/", () => "Hello World!");


app.UseSession(); // Add this line to configure session middleware



app.Run();
