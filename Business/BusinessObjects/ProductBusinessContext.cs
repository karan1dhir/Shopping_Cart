using Business.Exceptions;
using DataAccess.DBObjects;
using DataAccess.Exceptions;
using Entities;
using Shared.DTO.Analytics;
using Shared.DTO.Category;
using Shared.DTO.Product;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.BusinessObjects
{
   public class ProductBusinessContext
    {

        ProductDatabaseContext productDatabaseContext;
        public ProductBusinessContext()
        {
           productDatabaseContext = new ProductDatabaseContext();

        }

        public AnalyticsDTO GetTopProductsByCart()
        {
            int counter = 0;
            AnalyticsDTO analyticsDTO = productDatabaseContext.GetTopProductsByCart();
            foreach(var category in analyticsDTO.categoryProducts)
            {
                if (counter < 3)
                {
                    category.Products = category.Products.Take(3);
                }
                else
                {
                    category.Products = category.Products.Take(5);
                }
                counter++;
            }
            return analyticsDTO;
        }
        public CategoryProductDTO GetCategoryProducts(string CategoryName)
        {
            try
            {
                bool CategoryExist = productDatabaseContext.CategoryExists(CategoryName);
            }
            catch(NotFoundException ex)
            {
                throw new CatgoryDoesNotExistsException();
            }
            CategoryProductDTO categoryProductDTO = productDatabaseContext.GetCategoryProducts(CategoryName);
            return categoryProductDTO;

        }
        public ProductDTO GetProduct(Guid ProductID)
        {

            try
            {
                bool exists = productDatabaseContext.ProductExists(ProductID);
            }
            catch(NotFoundException ex)
            {
                throw new ProductDoesNotExistsException();
            }
            catch(Exception ex)
            {
                throw new Exception("Unkonwn error");
            }

            ProductDTO productDTO = productDatabaseContext.GetProduct(ProductID);
            return productDTO;
        }
    }
}
