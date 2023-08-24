using CinemaSystemWebApp.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CinemaSystemWebApp.Controllers
{
    public class CategoryController : Controller
    {
        private readonly CinemaSystemContext db;

        // Constructor chấp nhận một đối tượng context của cơ sở dữ liệu.
        public CategoryController(CinemaSystemContext db)
        {
            this.db = db;
        }

        // Phương thức action Index với tham số 'id' là ID của danh mục phim.
        public async Task<IActionResult> Index(int id)
        {
            // Sử dụng Entity Framework Core để lấy thông tin về danh mục phim và các phim thuộc về danh mục đó.
            // Hàm Include(e => e.Films) cho phép ta nạp thông tin các phim thuộc danh mục vào đối tượng danh mục.
            // Hàm FirstOrDefault(e => e.Id == id) lấy ra danh mục cụ thể với ID trùng khớp.

            var category = await db.Categories
                .Include(e => e.Films) // Nạp danh sách các phim thuộc danh mục này.
                .FirstOrDefaultAsync(e => e.Id == id); // Lấy danh mục phim dựa trên ID được cung cấp.

            // Trả về view với đối tượng danh mục và các phim thuộc danh mục này.
            return View(category);
        }
    }

}