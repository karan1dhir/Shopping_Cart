using AutoMapper;
using Business.BusinessObjects;
using Business.Exceptions;
using GlobalMarket.ViewModels;
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
    public class ProductController : Controller
    {
        // GET: Product
        ProductBusinessContext productBusinessContext;
        IMapper CategoryProductVMMapper;
        IMapper ProductProductVMMapper;
        public ProductController()
        {
          productBusinessContext = new ProductBusinessContext();
          var productCollectionDTOConfig = new MapperConfiguration(cfg => {
            cfg.CreateMap<ProductDTO, ProductViewModel>();
            cfg.CreateMap<VariantDTO, VariantViewModel>();
            cfg.CreateMap<CategoryProductDTO, CategoryProductViewModel>();
          });
            var productDTOConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<ProductDTO, ProductViewModel>();
                cfg.CreateMap<VariantDTO, VariantViewModel>();
                cfg.CreateMap<CategoryProductDTO, CategoryProductViewModel>();

            });
            CategoryProductVMMapper = new Mapper(productCollectionDTOConfig);
            ProductProductVMMapper = new Mapper(productDTOConfig);


        }
        public ActionResult ProductDetail(Guid ProductID)
        {
            ProductViewModel productViewModel = new ProductViewModel();
            ProductDTO productDTO = new ProductDTO();
            try
            {
                productDTO = productBusinessContext.GetProduct(ProductID);
            }
            catch(CatgoryDoesNotExistsException ex)
            {
                return View("Error");
            }
            catch(Exception ex)
            {
                return View("Internal View");
            }
            productViewModel = ProductProductVMMapper.Map<ProductDTO, ProductViewModel>(productDTO);
            return View(productViewModel);
        }
    }
}