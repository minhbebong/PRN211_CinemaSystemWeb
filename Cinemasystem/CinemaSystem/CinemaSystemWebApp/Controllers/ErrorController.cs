using Microsoft.AspNetCore.Mvc;

namespace CinemaSystemWebApp.Controllers
{
    public class ErrorController : Controller
    {
        // Phương thức action Index nhận một tham số 'statusCode' từ truy vấn (query parameter).
        public async Task<IActionResult> Index([FromQuery(Name = "code")] int statusCode)
        {
            // Sử dụng một câu lệnh switch-case để kiểm tra giá trị 'statusCode' và xử lý tương ứng.
            switch (statusCode)
            {
                case 404:
                    // Nếu 'statusCode' là 404, ta chuyển hướng người dùng đến trang lỗi 404.html.
                    return Redirect("/error-pages/404.html");
                case 500:
                    // Nếu 'statusCode' là 500, ta chuyển hướng người dùng đến trang lỗi 500.html.
                    return Redirect("/error-pages/500.html");
                case 403:
                    // Nếu 'statusCode' là 403, ta chuyển hướng người dùng đến trang lỗi 403.html.
                    return Redirect("/error-pages/403.html");
                default:
                    break;
            }

            // Nếu 'statusCode' không trùng với bất kỳ trường hợp nào ở trên, ta chuyển hướng người dùng về trang chủ (Index của HomeController).
            return RedirectToAction("Index", "Home");
        }

    }

}