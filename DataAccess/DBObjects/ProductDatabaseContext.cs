using AutoMapper;
using Entities;
using Shared.DTO.Analytics;
using Shared.DTO.Category;
using Shared.DTO.Product;
using Shared.DTO.Variant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DBObjects
{

    public class ProductDatabaseContext
    {

        IMapper AnalyticsMapper;
        ShoppingCartEntities shoppingCartEntities;
        public ProductDatabaseContext()
        {
           shoppingCartEntities = new ShoppingCartEntities();

            var AnalyticsConfig = new MapperConfiguration(cfg =>{
                cfg.CreateMap<Variant, VariantDTO>();
                cfg.CreateMap<Product, ProductDTO>();
                cfg.CreateMap<Category, CategoryProductDTO>().ForMember(dest => dest.Products, opt => opt.MapFrom(src => src.Products));
            });
            AnalyticsMapper = new Mapper(AnalyticsConfig);
        }
        public AnalyticsDTO GetTopProductsByCart()
        {
            List<Category> categories = shoppingCartEntities.Categories.OrderByDescending(c =>c.ProductsSold).ToList();
            foreach(Category category in categories)
            {
                category.Products = category.Products.ToList();
                IEnumerable<Product> products = category.Products;
                foreach (Product product in products)
                {
                    IEnumerable<Variant> variants = product.Variants;
                }
            }
            AnalyticsDTO analyticsDTO = new AnalyticsDTO();
            analyticsDTO.categoryProducts = AnalyticsMapper.Map<IEnumerable<Category>, IEnumerable<CategoryProductDTO>>(categories);
            return analyticsDTO;
        }
    }
}
