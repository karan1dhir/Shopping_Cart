using AutoMapper;
using Business.BusinessObjects;
using GlobalMarket.ViewModels;
using Shared.DTO.Category;
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
        CategoryBusinessContext categoryBusinessContext;
        ProductBusinessContext productBusinessContext;
        public CategoryController()
        {
            categoryBusinessContext = new CategoryBusinessContext();
            productBusinessContext = new ProductBusinessContext();
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

            }
           
            catch (Exception ex)
            {
                return View("Internal Error");
            }


            return View(viewModel);
        }
    }
}