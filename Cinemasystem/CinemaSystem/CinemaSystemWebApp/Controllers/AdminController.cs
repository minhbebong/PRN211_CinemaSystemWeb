using Microsoft.AspNetCore.Mvc;
using CinemaSystemWebApp.Models;
using Microsoft.AspNetCore.Mvc.Filters;
using CinemaSystemWebApp.Utils;


namespace CinemaSystemWebApp.Controllers
{

    public class AdminController : Controller
    {
        private readonly CinemaSystemContext db;
        public AdminController(CinemaSystemContext db)
        {
            this.db = db;
        }

        // Định nghĩa một thuộc tính để lưu trữ thông tin của người dùng admin đang đăng nhập.
        // "null!" chỉ ra rằng nó được khởi tạo là non-null.
        public Models.User AdminUser { get; set; } = null!;

        // Ghi đè phương thức OnActionExecuting để thực hiện mã trước khi thực hiện các phương thức action.
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            // lấy thông tin người dùng từ cookies 
            var user = Authentication.GetUserByCookies(context.HttpContext.Request.Cookies);
            if (user is null || user.Role != (int)Models.User.Roles.Admin)
            {
                context.Result = new RedirectResult("/");
            }

            // Lưu trữ thông tin người dùng trong thuộc tính AdminUser.
            AdminUser = user!;
        }
        public IActionResult Index(string? tab)
        {
            ViewBag.Categories = db.Categories.ToList();
            ViewBag.Films = db.Films.ToList();
            ViewBag.ActiveTab = tab;
            return View(AdminUser);
        }

        [HttpPost]
        public IActionResult CreateShow(int id, float price, DateTime start, int room)
        {
            var film = db.Films.Find(id);
            var roomObj = db.Rooms.Find(room);
            if (film is null || roomObj is null)
            {
                return RedirectToAction("Index", "Film", new { id = id, message = "Phim hoặc phòng không hợp lệ!" });
            }

            // Tạo một đối tượng Show mới với dữ liệu được cung cấp.
            var show = new Show
            {
                FilmId = film.Id,
                RoomId = roomObj.Id,
                Start = start,
                End = start.AddMinutes(film.Length),
                TicketPrice = price
            };

            // Kiểm tra xem có xung đột thời gian chiếu không và chuyển hướng nếu cần.
            if (db.Shows.Any(s => s.RoomId == show.RoomId && ((s.End > show.Start && s.End < show.End) || (s.Start > show.Start && s.Start < show.End) || (s.Start < show.Start && s.End > show.End))))
            {
                return RedirectToAction("Index", "Film", new { id = id, message = "Thời gian chiếu không hợp lệ!" });
            }
            db.Shows.Add(show);
            db.SaveChanges();
            return RedirectToAction("Index", "Film", new { id = id, message = "Tạo lịch chiếu thành công!" });
        }

        //  phương thức action Category để quản lý danh mục phim
        [HttpPost]
        public IActionResult Category(int? id, string name, string description, string action)
        {
            switch (action)
            {
                case "create":
                    var newCategory = new Models.Category()
                    {
                        Name = name,
                        Desc = description
                    };
                    db.Categories.Add(newCategory);
                    db.SaveChanges();
                    break;
                case "edit":
                    if (id.HasValue)
                    {
                        var categoryToEdit = db.Categories.Find(id.Value);

                        if (categoryToEdit != null)
                        {
                            //Cập nhật thông tin của danh mục
                            categoryToEdit.Name = name;
                            categoryToEdit.Desc = description;
                            db.SaveChanges();
                        }
                    }
                    break;
                case "delete":
                    if (id.HasValue)
                    {
                        var categoryToDelete = db.Categories.Find(id.Value);
                        db.Categories.Remove(categoryToDelete);
                        db.SaveChanges();
                    }
                    break;
                default:
                    break;
            }


            return RedirectToAction(nameof(Index), new { tab = "category" });
        }

        [HttpPost]
        public IActionResult Film(int? id, string name, string description, List<int>? categories, [FromForm(Name = "release-date")] DateTime? releaseDate, int? length, string action, IFormFile? image)
        {
            switch (action)
            {
                case "create":
                    if (length.HasValue && length.Value > 260)
                    {
                        ModelState.AddModelError("length", "Độ dài phim không được vượt quá 260");
                        return RedirectToAction(nameof(Index), new { tab = "film" });
                    }
                    if (image is not null)
                    {
                        // Lấy đường dẫn lưu trữ và tải hình ảnh lên.
                        var uploadPath = Path.Combine(Path.GetFullPath("wwwroot"), "assets");
                        using (var stream = image.OpenReadStream())
                        {
                            string filepath = $"/assets/{UploadFile.Upload(uploadPath, image.FileName, stream).FileName}";

                            // Tạo một đối tượng phim mới và thêm vào cơ sở dữ liệu.
                            db.Films.Add(new Models.Film()
                            {
                                Name = name,
                                Desc = description,
                                Categories = db.Categories.Where(e => categories!.Contains(e.Id)).ToList(),
                                ReleaseDate = releaseDate!.Value,
                                Length = length!.Value,
                                ImageUrl = filepath
                            });

                            db.SaveChanges();
                        }
                    }
                    break;
                case "delete":
                    if (id.HasValue)
                    {
                        // Xóa phim dựa trên ID.
                        db.Films.Remove(new Models.Film() { Id = id.Value });
                        db.SaveChanges();
                    }
                    break;
                default:
                    break;
            }

            // Chuyển hướng đến action Index với tab "film" được kích hoạt.
            return RedirectToAction(nameof(Index), new { tab = "film" });
        }

    }

}