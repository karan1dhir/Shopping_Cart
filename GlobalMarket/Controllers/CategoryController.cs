using AutoMapper;
using Business.BusinessObjects;
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
    public class CategoryController : Controller
    {
        // GET: Category
        IMapper CategoryMapper;
        CategoryBusinessContext categoryBusinessContext;
        ProductBusinessContext productBusinessContext;
        public CategoryController()
        {
            categoryBusinessContext = new CategoryBusinessContext();
            productBusinessContext = new ProductBusinessContext();

            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<CategoryProductDTO, CategoryProductViewModel>();
                cfg.CreateMap<ProductDTO, ProductViewModel>();
                cfg.CreateMap<VariantDTO, VariantViewModel>();
                cfg.CreateMap<VariantImageDTO, VariantImageViewModel>();
            });
            CategoryMapper = new Mapper(config);
        }

        public PartialViewResult GetCategories()
        {

            CategoriesViewModel categoriesViewModel = new CategoriesViewModel();
            CategoriesDTO categoryDTOs = categoryBusinessContext.GetCategories();
            categoriesViewModel.categories = categoryDTOs.categories;
            return PartialView(categoriesViewModel);
        }
        public ActionResult CategoryProducts(string CategoryName)
        {
        
            CategoryProductViewModel viewModel = new CategoryProductViewModel();
            CategoryProductDTO categoryProductsDTO = new CategoryProductDTO();
            try
            {
                categoryProductsDTO = productBusinessContext.GetCategoryProducts(CategoryName);
                viewModel = CategoryMapper.Map<CategoryProductDTO, CategoryProductViewModel>(categoryProductsDTO);
                return View(viewModel);
            }

            catch (Exception ex)
            {
                return View("Internal Error");
            }
        }
    }
}