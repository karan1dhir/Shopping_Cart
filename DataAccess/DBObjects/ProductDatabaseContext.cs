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
using Shared.DTO.Cart;

namespace DataAccess.DBObjects
{

    public class ProductDatabaseContext
    {

        IMapper AnalyticsMapper;
        ShoppingCartEntities shoppingCartEntities;
        IMapper ProductMapper;
        IMapper VariantMapper;
        IMapper CategoryProductMapper;
        IMapper ProductSearchMapper;


        public ProductDatabaseContext()
        {
            shoppingCartEntities = new ShoppingCartEntities();

            var AnalyticsConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Variant, VariantDTO>();
                cfg.CreateMap<Product, ProductDTO>();
                cfg.CreateMap<Category, CategoryProductDTO>().ForMember(dest => dest.Products, opt => opt.MapFrom(src => src.Products));
            });

            var productsSearchDTOConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<Product, ProductDTO>();
                cfg.CreateMap<Variant, VariantDTO>();
            });

            var productDTOConfig = new MapperConfiguration(cfg =>{
                cfg.CreateMap<Product, ProductDTO>();
                cfg.CreateMap<Variant, VariantDTO>();

            });

            var VariantDTOConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<Variant, VariantDTO>();
                cfg.CreateMap<Product, ProductDTO>();
                cfg.CreateMap<VariantImage, VariantImageDTO>();
                cfg.CreateMap<Category, CategoryProductDTO>();
            });
            var productVariantCollectionDTOConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<Variant, VariantDTO>();
                cfg.CreateMap<Product, ProductDTO>();
            });


            CategoryProductMapper = new Mapper(productVariantCollectionDTOConfig);
            AnalyticsMapper = new Mapper(AnalyticsConfig);
            ProductMapper = new Mapper(productDTOConfig);
            VariantMapper = new Mapper(VariantDTOConfig);
            ProductSearchMapper = new Mapper(productsSearchDTOConfig);
        }

        public string GetCategoryName(Guid categoryID)
        {

            Category category = shoppingCartEntities.Categories.Find(categoryID);
            string name = category.Name;
            return name;
        }
        public void UpdateInventory(CartVariantItemsDTO cartVariantItemsDTO)
        {
            foreach (var cartItem in cartVariantItemsDTO.CartItems)
            {
                shoppingCartEntities.Variants.FirstOrDefault(p => p.ID == cartItem.Variant.ID).Inventory -= cartItem.Quantity;
                shoppingCartEntities.Variants.FirstOrDefault(p => p.ID == cartItem.Variant.ID).QuantitySold += cartItem.Quantity;
                shoppingCartEntities.Categories.FirstOrDefault(c => c.ID == cartItem.Variant.Product.Category.ID).ProductsSold += cartItem.Quantity;
                shoppingCartEntities.SaveChanges();
            }
            return;
        }
        public ProductsSearchResultDTO GetProductsWithString(string SearchString)
        {
            IEnumerable<Product> searchResults = shoppingCartEntities.Products.Where(p => p.Title.Contains(SearchString) || p.Description.Contains(SearchString)).Include(p => p.Category);
            ProductsSearchResultDTO productsSearchResultDTO = new ProductsSearchResultDTO();
            productsSearchResultDTO.Products = ProductSearchMapper.Map<IEnumerable<Product>, IEnumerable<ProductDTO>>(searchResults);
            return productsSearchResultDTO;
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
            CategoryProductDTO categoryProductDTO = new CategoryProductDTO();
            categoryProductDTO = CategoryProductMapper.Map<Category, CategoryProductDTO>(category);
            return categoryProductDTO;
        }

        private string SetVariantStringFromSKU(string sKU)
        {
            string variantString = "";
            string[] propertyValueMappingID = sKU.Split('~');
            foreach (string mapper in propertyValueMappingID)
            {
                int mapperID = int.Parse(mapper);
                Guid propertyID = shoppingCartEntities.VariantPropertyValues.Where(m => m.ID == mapperID).Select(m => m.PropertyID).FirstOrDefault();
                Guid valueID = shoppingCartEntities.VariantPropertyValues.Where(m => m.ID == mapperID).Select(m => m.ValueID).FirstOrDefault();
                string property = shoppingCartEntities.Properties.Where(p => p.ID == propertyID).Select(p => p.Name).FirstOrDefault();
                string value = shoppingCartEntities.Values.Where(v => v.ID == valueID).Select(v => v.Name).FirstOrDefault();
                variantString = variantString + " " + property + ":" + value;
            }
            return variantString;
        }
        public ProductDTO GetProduct(Guid ProductID)
        {
            Product product = shoppingCartEntities.Products.Where(p => p.ID == ProductID).Include(p => p.Variants).FirstOrDefault();
            ProductDTO productDTO = new ProductDTO();
            productDTO = ProductMapper.Map<Product, ProductDTO>(product);
            productDTO.Variants = VariantMapper.Map<IEnumerable<Variant>,IEnumerable<VariantDTO>>(product.Variants);
            foreach (VariantDTO variant in productDTO.Variants)
            {
                variant.VariantString = SetVariantStringFromSKU(variant.SKU);
            }

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
        public VariantDTO GetVariant(Guid variantID)
        {
            Variant variant = shoppingCartEntities.Variants.Where(v => v.ID == variantID).FirstOrDefault();
            VariantDTO variantDTO = VariantMapper.Map<Variant, VariantDTO>(variant);
            return variantDTO;
        }
    }
}
