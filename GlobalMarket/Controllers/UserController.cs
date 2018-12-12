using Business.BusinessObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GlobalMarket.Controllers
{
    public class UserController:Controller
    {

        UserBusinessContext userBusinessContext;

        public UserController()
        {
            userBusinessContext = new UserBusinessContext();
        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }

        public ActionResult CheckAdmin()
        {
            try
            {
                if (userBusinessContext.CheckAdmin(new Guid(Session["UserID"].ToString())))
                {
                    return View("Admin");
                }
                else
                {
                    return View("NotAdmin");
                }
            }
            catch (Exception)
            {
                return View("InternalError");
            }
        }
    }
}