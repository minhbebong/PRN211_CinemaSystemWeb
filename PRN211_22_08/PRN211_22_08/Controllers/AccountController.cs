using Microsoft.AspNetCore.Mvc;
using PRN211_22_08.Models;
using System.Text.Json;
using Microsoft.EntityFrameworkCore;

namespace PRN211_22_08.Controllers
{
    public class AccountController : Controller
    {
        private readonly PRN_DBContext db;
        public AccountController(PRN_DBContext db)
        {
            this.db = db;
        }
        public async Task<IActionResult> Login()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Login(Account acc)
        {
            if (ModelState.IsValid)
            {
                return View();
            }
            var account = await db.Accounts.Where(a => a.Email.Equals(acc.Email) && a.Password.Equals(acc.Password) && a.Role == 1).SingleOrDefaultAsync();
            if (account == null)
            {
                TempData["msg"] = " Account not exist and Invalid role of employees";
                return View();
            }
            // cap session (Phien) lam viec cho tai khoan nay
            var JsonAccount = JsonSerializer.Serialize<Account>(account);
            HttpContext.Session.SetString("Account", JsonAccount);
            return RedirectToAction("List", "Orders");
        }
        public async Task<IActionResult> Logout()
        {
            if (HttpContext.Session.GetString("Account") != null)
            {
                //Huy session
                HttpContext.Session.Remove("Account");
            }
            return RedirectToAction("Login", "Account");
        }
 
    }
}
