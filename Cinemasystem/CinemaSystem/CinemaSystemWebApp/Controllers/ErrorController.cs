﻿using Microsoft.AspNetCore.Mvc;

namespace CinemaSystemWebApp.Controllers
{
    public class ErrorController : Controller
    {
        public async Task<IActionResult> Index([FromQuery(Name = "code")] int statusCode)
        {
            switch (statusCode)
            {
                case 404:
                    return Redirect("/error-pages/404.html");
                case 500:
                    return Redirect("/error-pages/500.html");
                case 403:
                    return Redirect("/error-pages/403.html");
                default:
                    break;
            }
            return RedirectToAction("Index", "Home");
        }

    }

}
