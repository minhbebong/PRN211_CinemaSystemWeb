using CinemaSystemWebApp.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CinemaSystemWebApp.Controllers
{
    public class CategoryController : Controller
    {
        private readonly CinemaSystemContext db;
        public CategoryController(CinemaSystemContext db)
        {
            this.db = db;
        }

        public async Task<IActionResult> Index(int id)
        {
            var category = await db.Categories
                .Include(e => e.Films) // Nạp danh sách các phim thuộc danh mục này.
                .FirstOrDefaultAsync(e => e.Id == id); // Lấy danh mục phim dựa trên ID được cung cấp.
            return View(category);
        }
    }

}