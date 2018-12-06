using DataAccess.DBObjects;
using Entities;
using Shared.DTO.Analytics;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.BusinessObjects
{
   public class ProductBusinessContext
    {
        ProductDatabaseContext productDatabaseContext = new ProductDatabaseContext();

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
    }
}
