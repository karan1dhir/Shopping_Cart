using AutoMapper;
using Business.BusinessObjects;
using GlobalMarket.ViewModels;
using Shared.DTO.Analytics;
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
    public class HomeController : Controller
    {
        IMapper AnalyticsMapper;
        public HomeController()
        {
            var AnalyticsConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<AnalyticsDTO, AnalyticsViewModel>();
                cfg.CreateMap<CategoryProductDTO, CategoryProductViewModel>();
                cfg.CreateMap<ProductDTO, ProductViewModel>();
                cfg.CreateMap<VariantDTO, VariantViewModel>();
                cfg.CreateMap<VariantImageDTO, VariantImageViewModel>();
            });
            AnalyticsMapper = new Mapper(AnalyticsConfig);
        }
        public ActionResult Index()
        {
            AnalyticsDTO analyticsDTO = new AnalyticsDTO();
            ProductBusinessContext productBusinessContext = new ProductBusinessContext();
            AnalyticsViewModel analyticsViewModel = new AnalyticsViewModel();
             
            try
            {
                analyticsDTO = productBusinessContext.GetTopProductsByCart();
                analyticsViewModel = AnalyticsMapper.Map<AnalyticsDTO, AnalyticsViewModel>(analyticsDTO);
                return View(analyticsViewModel);

            }
            catch (Exception ex)
            {
            
                return View("Internal Error"+ex);
            }
        }
    }
}