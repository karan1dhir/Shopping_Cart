using GlobalMarket.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GlobalMarket.Controllers
{
    public class DefaultController : Controller
    {
        public ActionResult DefaultExceptionCatch(String exception)
        {
            ExceptionViewModel exceptionViewModel = new ExceptionViewModel();
            exceptionViewModel.exceptionMessage = exception;
            return View(exceptionViewModel);
        }
        // GET: Default
        public ActionResult Index()
        {
            return View();
        }
    }
}