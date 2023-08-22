using Lab1.Models;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;

namespace Lab1.Controllers
{
    public class OrdersController : Controller
    {
        private readonly PRN_DBContext db;
        public OrdersController(PRN_DBContext db)
        {
            this.db = db;
        }
        public async Task<IActionResult> List()
        {
            if (HttpContext.Session.GetString("Account") != null)
            {
                var account = JsonSerializer.Deserialize<Account>(HttpContext.Session.GetString("Account"));
                if (account.Role == 2)
                {
                    dynamic employees = null;
                    //Lay gia tri cua tham so C.id tu url:Home/Index/?cid=x                 
                    var orders = db.Orders.ToList();
                    //dung ViewData de chuyen du lieu la danh sach cac city sang view
                    ViewData["orders"] = orders;
                    // dung phuong thuc View() de truyen du lieu la danh sach cac employee thong qua model
                    return View(employees);
                }
                else
                {
                    return RedirectToAction("Login", "Account");
                }
            }
            return RedirectToAction("Login", "Account");
        }
    }
}
