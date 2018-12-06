using AutoMapper;
using Business.BusinessObjects;
using Business.Exceptions;
using GlobalMarket.ViewModels;
using Shared.DTO.Role;
using Shared.DTO.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GlobalMarket.Controllers
{
    public class RegisterController : Controller
    {

        UserBusinessContext userBusinessContext ;
        IMapper RegistrationMapper;
        IMapper RoleBasicDTOMapRoleViewMapper;
        public RoleBasicDTO roleBasicDTOList;
       
        public RegisterController()
        {
            userBusinessContext = new UserBusinessContext();
            var config = new MapperConfiguration(cfg => {
                cfg.CreateMap<UserRegistrationViewModel, UserDTO>();
            });
            var RoleBasicDTOMapRoleViewConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<RoleBasicDTO, UserRegistrationViewModel>();
            });

            RegistrationMapper = new Mapper(config);
            RoleBasicDTOMapRoleViewMapper = new Mapper(RoleBasicDTOMapRoleViewConfig);
            roleBasicDTOList = userBusinessContext.GetRoles();
        }
        // GET: Register
        public ActionResult Register()
        {
             UserRegistrationViewModel roleViewModel;
             roleViewModel = RoleBasicDTOMapRoleViewMapper.Map<RoleBasicDTO, UserRegistrationViewModel>(roleBasicDTOList);
            return View(roleViewModel);
        }
        [HttpPost]
        public ActionResult Register([Bind(Include = "Name, Password, ConfirmedPassword, Email, PhoneNumber,RoleName,Roles")] UserRegistrationViewModel userRegistrationViewModel)
        {

            userRegistrationViewModel.roles = roleBasicDTOList.roles;
            try
            {
                ModelState.Remove("roles");
                if (ModelState.IsValid)
                {
                    UserDTO userDTO = RegistrationMapper.Map<UserRegistrationViewModel, UserDTO>(userRegistrationViewModel);
                    UserBasicDTO userBasicDTO = userBusinessContext.RegisterUser(userDTO);
                    return View("Success");
                }
                else
                {
                    return View(userRegistrationViewModel);
                }
            }
            catch (UserNameAlreadyExistsException) {

                ModelState.AddModelError("", "Username is already taken");
                return View(userRegistrationViewModel);
            }
            
            catch (Exception ex)
            {
                ModelState.AddModelError("", "Something went wrong. Please try after some time");

            }
            return View("Error");
        }
    }
}