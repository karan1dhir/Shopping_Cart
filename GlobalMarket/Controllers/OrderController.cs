using AutoMapper;
using Business.BusinessObjects;
using Business.Exceptions;
using GlobalMarket.ActionFilter;
using GlobalMarket.ViewModels;
using Shared.DTO.Category;
using Shared.DTO.Order;
using Shared.DTO.Product;
using Shared.DTO.Variant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GlobalMarket.Controllers
{

    [UserAuthenticationFilter]
    public class OrderController : Controller
    {
        // GET: Order

        IMapper AddressMapper;
        IMapper OrdersMapper;
        OrderBusinessContext orderBusinessContext;
            
        public OrderController()
        {
            orderBusinessContext = new OrderBusinessContext();
            var config = new MapperConfiguration(cfg => {
                cfg.CreateMap<AddressViewModel, AddressDTO>();
            });
            var config2 = new MapperConfiguration(cfg => {
                cfg.CreateMap<OrderDTO, OrderViewModel>();
                cfg.CreateMap<OrderProductDTO,OrderProductViewModel>();
                cfg.CreateMap<OrderPlacedVariantDTO, OrderPlacedVariantViewModel>();
                cfg.CreateMap<VariantDTO, VariantViewModel>();
                cfg.CreateMap<VariantImageDTO, VariantImageViewModel>();
                cfg.CreateMap<ProductDTO, ProductViewModel>();
                cfg.CreateMap<CategoryProductDTO, CategoryProductViewModel>();

            });
            AddressMapper = new Mapper(config);
            OrdersMapper = new Mapper(config2);
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
                    orderBusinessContext.PlaceOrder(new Guid(Session["UserID"].ToString()), addressDTO);
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
        public  ActionResult MyOrders()
        {
            OrdersViewModel ordersViewModel = new OrdersViewModel();
            try
            {
                OrdersDTO ordersDTO = orderBusinessContext.GetOrders(new Guid(Session["UserID"].ToString()));
                ordersViewModel.Orders = OrdersMapper.Map<IEnumerable<OrderDTO>, IEnumerable<OrderViewModel>>(ordersDTO.Orders);
            }
            catch (NoOrderException ex)
            {
                return View("NoOrders");
            }
            catch (Exception ex)
            {
                return View("InternalError");
            }
            return View(ordersViewModel);
        }
        public ActionResult GetOrder(Guid OrderID)
        {
            OrderDTO orderDTO = orderBusinessContext.GetOrder(OrderID);
            OrderViewModel orderViewModel = OrdersMapper.Map<OrderDTO, OrderViewModel>(orderDTO);
            return View(orderViewModel);
        }
    }
}
