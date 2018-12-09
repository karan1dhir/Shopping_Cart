using AutoMapper;
using Business.BusinessObjects;
using GlobalMarket.ViewModels;
using Shared.DTO.Order;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GlobalMarket.Controllers
{
    public class OrderController : Controller
    {
        // GET: Order

        IMapper AddressMapper;
        OrderBusinessContext orderBusinessContext;

        public OrderController()
        {
            orderBusinessContext = new OrderBusinessContext();
            var config = new MapperConfiguration(cfg => {
                cfg.CreateMap<AddressViewModel, AddressDTO>();
            });
          AddressMapper = new Mapper(config);
        }

        public ActionResult Checkout()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Checkout([Bind(Include =("AddressLine1, AddressLine2, Pin, City, State, Country"))] AddressViewModel addressViewModel)
        {

            if (ModelState.IsValid)
            {
                try
                {
                    AddressDTO addressDTO = AddressMapper.Map<AddressViewModel, AddressDTO>(addressViewModel);


                    return View("Success");

                }
                catch (Exception ex)
                {
                    return View("Internal Error");
                }
            }
            else
            {
                return View(addressViewModel);
            }

            }
        }
    }
