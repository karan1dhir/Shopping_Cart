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
            AnalyticsDTO analyticsDTO = productDatabaseContext.GetTopProductsByCart();
            foreach(var category in analyticsDTO.categoryProducts)
            {
                category.Products = category.Products.Take(4);
            }
            return analyticsDTO;
        }
    }
}
