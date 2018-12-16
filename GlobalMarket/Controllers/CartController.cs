using AutoMapper;
using Business.BusinessObjects;
using Business.Exceptions;
using DataAccess.Exceptions;
using GlobalMarket.ActionFilter;
using GlobalMarket.ViewModels;
using Shared.DTO.Cart;
using Shared.DTO.Category;
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
    public class CartController : Controller
    {
        // GET: Cart
        IMapper CartMapper;
        IMapper CartInfoMapper;
        CartBusinessContext cartBusinessContext;

        public CartController()
        {
            cartBusinessContext = new CartBusinessContext();
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<CartViewModel, CartVariantMappingDTO>();
            });
            var cartInfoMappingConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<ProductDTO, ProductViewModel>();
                cfg.CreateMap<VariantDTO, VariantViewModel>();
                cfg.CreateMap<CartVariantDTO, CartVarientViewModel>();
                cfg.CreateMap<CartVariantItemsDTO, CartVariantItemsViewModel>();
                cfg.CreateMap<CategoryProductDTO, CategoryProductViewModel>();
                cfg.CreateMap<VariantImageDTO, VariantImageViewModel>();
            });


            CartMapper = new Mapper(config);
            CartInfoMapper = new Mapper(cartInfoMappingConfig);

        }

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddItem([Bind(Include = "VariantID, ProductID, Quantity, OrderLimit, Inventory")] CartViewModel cartViewModel)
        {

            CartMessageViewModel cartMessageViewModel = new CartMessageViewModel();
            if (ModelState.IsValid)
            {
                CartVariantMappingDTO cartVariantMappingDTO = CartMapper.Map<CartViewModel, CartVariantMappingDTO>(cartViewModel);
                cartVariantMappingDTO.UserID = new Guid(Session["UserID"].ToString());
                try
                {
                    cartBusinessContext.AddItem(cartVariantMappingDTO);
                    cartMessageViewModel.SuccessMessage = "Item Successfuly Added to Cart";
                    return View(cartMessageViewModel);
                }
                catch (ItemAlreadyInCartException ex)
                {
                    cartMessageViewModel.ErrorMessages.Add("Item is already present in the cart");
                    return View(cartMessageViewModel);
                }
                catch(OrderLimitExceededException)
                {
                    cartMessageViewModel.ErrorMessages.Add("Order Quantity Exceeded the limit");
                    return View(cartMessageViewModel);
                }
                catch (QuantityUnavailableException)
                {
                    cartMessageViewModel.ErrorMessages.Add("Requested Quantity is UnAvailable");
                    return View(cartMessageViewModel);
                }
                catch (Exception ex)
                {
                    return View("InternalError");
                }
            }
            else
            {
                foreach (var modelState in ModelState.Values)
                {
                    foreach (var err in modelState.Errors)
                    {
                        cartMessageViewModel.ErrorMessages.Add(err.ErrorMessage.ToString());
                    }

                }
                return View(cartMessageViewModel);
            }
        }
        public ActionResult ViewCart()
        {
            try
            {
                CartVariantItemsDTO cartVariantItemsDTO = cartBusinessContext.GetCart(new Guid(Session["UserID"].ToString()));
                CartVariantItemsViewModel cartVariantItemsViewModel = new CartVariantItemsViewModel();
                cartVariantItemsViewModel.CartItems = CartInfoMapper.Map<IEnumerable<CartVariantDTO>, IEnumerable<CartVarientViewModel>>(cartVariantItemsDTO.CartItems);
                cartVariantItemsViewModel.SubTotal = cartVariantItemsDTO.SubTotal;
                return View(cartVariantItemsViewModel);
            }
            catch(Exception ex)
            {
                return RedirectToAction("DefaultExceptionCatch", "Default", new { exception = ex });
            }
        }
        public ActionResult RemoveItem(Guid VariantID)
        {
            try
            {
                cartBusinessContext.RemoveItem(new Guid(Session["UserID"].ToString()), VariantID);
                return RedirectToAction("ViewCart");
            }
            catch(Exception ex)
            {
                return RedirectToAction("DefaultExceptionCatch", "Default", new { exception = ex });
            }
        }
    }
}
    