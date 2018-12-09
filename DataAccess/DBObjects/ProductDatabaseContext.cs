using AutoMapper;
using Entities;
using Shared.DTO.Analytics;
using Shared.DTO.Category;
using Shared.DTO.Product;
using Shared.DTO.Variant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Text;
using System.Threading.Tasks;
using DataAccess.Exceptions;

namespace DataAccess.DBObjects
{

    public class ProductDatabaseContext
    {

        IMapper AnalyticsMapper;
        ShoppingCartEntities shoppingCartEntities;
        IMapper ProductMapper;
        IMapper VariantMapper;
        IMapper CategoryProductMapper;

        public ProductDatabaseContext()
        {
            shoppingCartEntities = new ShoppingCartEntities();

            var AnalyticsConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Variant, VariantDTO>();
                cfg.CreateMap<Product, ProductDTO>();
                cfg.CreateMap<Category, CategoryProductDTO>().ForMember(dest => dest.Products, opt => opt.MapFrom(src => src.Products));
            });

            var productDTOConfig = new MapperConfiguration(cfg =>{
                cfg.CreateMap<Product, ProductDTO>();
                cfg.CreateMap<Variant, VariantDTO>();
            });

            var VariantDTOConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<Variant, VariantDTO>();
                cfg.CreateMap<Product, ProductDTO>();
            });
            var productVariantCollectionDTOConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<Variant, VariantDTO>();
                cfg.CreateMap<Product, ProductDTO>();
            });


            CategoryProductMapper = new Mapper(productVariantCollectionDTOConfig);
            AnalyticsMapper = new Mapper(AnalyticsConfig);
            ProductMapper = new Mapper(productDTOConfig);
            VariantMapper = new Mapper(VariantDTOConfig);
            
        }

        public string GetCategoryName(Guid categoryID)
        {

            Category category = shoppingCartEntities.Categories.Find(categoryID);
            string name = category.Name;
            return name;
        }

        public bool ProductExists(Guid ProductID)
        {
            Product product = shoppingCartEntities.Products.Find(ProductID);
            if(product == null)
            {
                throw new ProductNotFoundException();
            }
            return true;
        }

        public bool CategoryExists(string CategoryName) 
        {
            Category category = shoppingCartEntities.Categories.Where(c => c.Name == CategoryName).FirstOrDefault();
            if(category == null)
            {
                throw new NotFoundException();
            }
            return true;
        }

        public CategoryProductDTO GetCategoryProducts(string CategoryName)
        {
            Category category = shoppingCartEntities.Categories.Include(c => c.Products).Where(c => c.Name == CategoryName).FirstOrDefault();
            IEnumerable<Product> products = category.Products;
            CategoryProductDTO categoryProductDTO = new CategoryProductDTO();
            categoryProductDTO.Products = CategoryProductMapper.Map<IEnumerable<Product>, IEnumerable<ProductDTO>>(products);
            categoryProductDTO.Name = category.Name;
            return categoryProductDTO;
        }
        public ProductDTO GetProduct(Guid ProductID)
        {
            Product product = shoppingCartEntities.Products.Where(p => p.ID == ProductID).Include(p => p.Variants).FirstOrDefault();
            ProductDTO productDTO = new ProductDTO();
            productDTO = ProductMapper.Map<Product, ProductDTO>(product);
            productDTO.Variants = VariantMapper.Map<IEnumerable<Variant>,IEnumerable<VariantDTO>>(product.Variants);
            return productDTO;

        }
        public AnalyticsDTO GetTopProductsByCart()
        {
            List<Category> categories = shoppingCartEntities.Categories.Include(c => c.Products).OrderByDescending(c => c.ProductsSold).ToList();
            foreach (Category category in categories)
            {
                category.Products = category.Products.OrderByDescending(p => p.TotalVariantsSold).ToList();
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
