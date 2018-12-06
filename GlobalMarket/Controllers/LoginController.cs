using AutoMapper;
using Business.BusinessObjects;
using Business.Exceptions;
using GlobalMarket.ViewModels;
using Shared.DTO.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GlobalMarket.Controllers
{
    public class LoginController : Controller
    {

        UserBusinessContext userBusinessContext;
        IMapper LoginMapper;
        // GET: Login
        public LoginController()
        {
            userBusinessContext = new UserBusinessContext();
            var config = new MapperConfiguration(cfg =>{
                cfg.CreateMap<LoginViewModel,UserLoginDTO>();
            });
            LoginMapper = new Mapper(config);
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login([Bind(Include = "Email,Password")] LoginViewModel loginViewModel)
        {

            if (ModelState.IsValid)
            {
                UserLoginDTO userLoginDTO = LoginMapper.Map<LoginViewModel, UserLoginDTO>(loginViewModel);
                try
                {
                    UserBasicDTO userBasicDTO = userBusinessContext.LoginUser(userLoginDTO);
                    Session["UserID"] = userBasicDTO.ID;
                    return RedirectToAction("Index", "Home");
                }
                catch (InvalidLoginException ex)
                {

                    ModelState.AddModelError("", "Invalid Login Credentials.");
                    return View(loginViewModel);
                }
                catch (Exception ex)
                { 
                    ModelState.AddModelError("", "Something went wrong, Please try again.");
                    return View("Error");
                }
            }
            return View(loginViewModel);
        }
    }
}