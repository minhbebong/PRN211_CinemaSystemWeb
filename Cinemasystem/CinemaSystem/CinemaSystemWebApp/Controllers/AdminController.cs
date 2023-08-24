using Microsoft.AspNetCore.Mvc;
using CinemaSystemWebApp.Models;
using Microsoft.AspNetCore.Mvc.Filters;
using CinemaSystemWebApp.Utils;


namespace CinemaSystemWebApp.Controllers
{
    // Định nghĩa namespace và class cho Controller.
    public class AdminController : Controller
    {
        // Khai báo trường private để lưu trữ đối tượng context của cơ sở dữ liệu.
        private readonly CinemaSystemContext db;

        // Tạo constructor chấp nhận context của cơ sở dữ liệu như một tham số.
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
            // Lấy thông tin người dùng từ cookies bằng cách sử dụng phương thức tiện ích.
            var user = Authentication.GetUserByCookies(context.HttpContext.Request.Cookies);

            // Kiểm tra nếu người dùng là null hoặc không phải admin. Nếu có, chuyển hướng đến trang chủ ("/").
            if (user is null || user.Role != (int)Models.User.Roles.Admin)
            {
                context.Result = new RedirectResult("/");
            }

            // Lưu trữ thông tin người dùng trong thuộc tính AdminUser.
            AdminUser = user!;
        }

        // Định nghĩa một phương thức action Index với tham số tùy chọn 'tab'.
        public IActionResult Index(string? tab)
        {
            // Tải danh sách các danh mục và phim từ cơ sở dữ liệu và lưu chúng vào ViewBag.
            ViewBag.Categories = db.Categories.ToList();
            ViewBag.Films = db.Films.ToList();

            // Lưu giá trị của tham số 'tab' vào ViewBag.
            ViewBag.ActiveTab = tab;

            // Trả về view với đối tượng AdminUser.
            return View(AdminUser);
        }

        // Định nghĩa một phương thức HTTP POST action CreateShow với các tham số.
        [HttpPost]
        public IActionResult CreateShow(int id, float price, DateTime start, int room)
        {
            // Lấy đối tượng phim và phòng chiếu từ cơ sở dữ liệu dựa trên các tham số được cung cấp.
            var film = db.Films.Find(id);
            var roomObj = db.Rooms.Find(room);

            // Kiểm tra nếu phim hoặc phòng không hợp lệ và chuyển hướng nếu cần.
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

            // Thêm chiếu vào cơ sở dữ liệu và lưu thay đổi.
            db.Shows.Add(show);
            db.SaveChanges();

            // Chuyển hướng đến trang chủ phim với thông báo thành công.
            return RedirectToAction("Index", "Film", new { id = id, message = "Tạo lịch chiếu thành công!" });
        }

        // Định nghĩa phương thức action Category để quản lý danh mục phim.
        [HttpPost]
        public IActionResult Category(int? id, string name, string description, string action)
        {
            switch (action)
            {
                case "create":
                    // Tạo một danh mục mới và thêm vào cơ sở dữ liệu.
                    db.Categories.Add(new Models.Category() { Name = name, Desc = description });
                    db.SaveChanges();
                    break;
                case "edit":
                    if (id.HasValue)
                    {
                        // Cập nhật thông tin danh mục dựa trên ID.
                        db.Categories.Update(new Models.Category() { Id = id.Value, Name = name, Desc = description });
                        db.SaveChanges();
                    }
                    break;
                case "delete":
                    if (id.HasValue)
                    {
                        // Xóa danh mục dựa trên ID.
                        db.Categories.Remove(new Models.Category() { Id = id.Value });
                        db.SaveChanges();
                    }
                    break;
                default:
                    break;
            }

            // Chuyển hướng đến action Index với tab "category" được kích hoạt.
            return RedirectToAction(nameof(Index), new { tab = "category" });
        }

        // Định nghĩa phương thức action Film để quản lý phim.
        [HttpPost]
        public IActionResult Film(int? id, string name, string description, List<int>? categories, [FromForm(Name = "release-date")] DateTime? releaseDate, int? length, string action, IFormFile? image)
        {
            switch (action)
            {
                case "create":
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