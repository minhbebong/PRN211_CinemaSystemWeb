using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Text.Json;
using Lab1.Models;

namespace Lab1.Controllers
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
            if (!ModelState.IsValid)
            {
                return View();
            }
            var account = await db.Accounts.Where(a => a.Email.Equals(acc.Email) &&
                                                   a.Password.Equals(acc.Password) && a.Role == 1).SingleOrDefaultAsync();
            if (account == null)
            {
                TempData["msg"] = "This account not exist";
                return View();
            }


            //cap session(phien)lam viec cho tai khoan nay
            var JsonAccount = JsonSerializer.Serialize<Account>(account);
            HttpContext.Session.SetString("Account", JsonAccount);

            return RedirectToAction("List", "Order");

        }

    }
}