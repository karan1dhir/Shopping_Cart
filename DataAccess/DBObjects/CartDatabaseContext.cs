using DataAccess.Exceptions;
using Entities;
using Shared.DTO.Cart;
using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Shared.DTO.Variant;
using Shared.DTO.Product;

namespace DataAccess.DBObjects
{
    public class CartDatabaseContext
    {
        ShoppingCartEntities shoppingCartEntities = new ShoppingCartEntities();
        IMapper CartItemsMapper;


        public CartDatabaseContext()
        {
            var cartItemsConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<Variant, VariantDTO>();
                cfg.CreateMap<CartVariantMapping, CartVariantDTO>();
                cfg.CreateMap<Product, ProductDTO>();
            });
            CartItemsMapper = new Mapper(cartItemsConfig);
        }

        private double GetSellingPrice(Guid VariantID)
        {

        double ListingPrice = shoppingCartEntities.Variants.Where(v => v.ID == VariantID).Select(v => v.ListingPrice).FirstOrDefault();
        double Discount = shoppingCartEntities.Variants.Where(v => v.ID == VariantID).Select(v => v.Discount).FirstOrDefault();
        double SellingPrice = ListingPrice - Discount * ListingPrice / 100;
        return SellingPrice; 
    }

        public int PresentInCart(CartVariantMappingDTO cartVariantMappingDTO)
        {

            int quantity = shoppingCartEntities.CartVariantMappings.Where(c => c.CartID == cartVariantMappingDTO.UserID && c.VariantID == cartVariantMappingDTO.VariantID)
                .Select(q => q.Quantity).FirstOrDefault();

            if(quantity == 0) { return quantity; }
            return quantity;
        }

        public int GetInventory(CartVariantMappingDTO cartVariantMappingDTO)
        {
            int Inventory  = shoppingCartEntities.Variants.Where(c => c.ID == cartVariantMappingDTO.VariantID).Select(p=> p.Inventory).FirstOrDefault();
            return Inventory;
        }
        public int GetOrderLimit(CartVariantMappingDTO cartVariantMappingDTO)
        {

           Guid productID = shoppingCartEntities.Variants.Where(c => c.ID == cartVariantMappingDTO.VariantID).Select(p => p.ProductID).FirstOrDefault();
           var OrderLimit = shoppingCartEntities.Products.Where(p => p.ID == productID).Select(o => o.OrderLimit).FirstOrDefault();
           if(OrderLimit == null)
            {
                int inventoryValue = GetInventory(cartVariantMappingDTO);
                return inventoryValue;
            }
            return OrderLimit.GetValueOrDefault();
        }
        private bool isItemPresent(CartVariantMappingDTO cartVariantMappingDTO)
        {
            CartVariantMapping cart = shoppingCartEntities.CartVariantMappings.Where(c => c.CartID == cartVariantMappingDTO.UserID && c.VariantID == cartVariantMappingDTO.VariantID).FirstOrDefault();
            if (cart != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public void AddToCart(CartVariantMappingDTO cartVariantMappingDTO)
        {
            CartVariantMapping cart = new CartVariantMapping { ID = Guid.NewGuid(), CartID= cartVariantMappingDTO.UserID, VariantID = cartVariantMappingDTO.VariantID, Quantity = cartVariantMappingDTO.Quantity,
            SellingPrice = cartVariantMappingDTO.SellingPrice };
            if (isItemPresent(cartVariantMappingDTO))
            {
                cart = shoppingCartEntities.CartVariantMappings.Where(c => c.CartID == cartVariantMappingDTO.UserID && c.VariantID == cartVariantMappingDTO.VariantID).FirstOrDefault();
                cart.Quantity = cartVariantMappingDTO.Quantity;
            }
            else
            {
                shoppingCartEntities.CartVariantMappings.Add(cart);
            }
            shoppingCartEntities.SaveChanges();
        }
        public CartVariantItemsDTO GetCart(Guid UserID)
        {
            var carts = shoppingCartEntities.CartVariantMappings.Include(c => c.Variant.Product).Where(c => c.CartID == UserID).ToList();
            CartVariantItemsDTO cartVariantItemsDTO = new CartVariantItemsDTO();
            cartVariantItemsDTO.CartItems = CartItemsMapper.Map<IEnumerable<CartVariantMapping>, IEnumerable<CartVariantDTO>>(carts);
            return cartVariantItemsDTO;
        }
        public void EmptyCart(Guid UserID)
        {
            shoppingCartEntities.CartVariantMappings.RemoveRange(shoppingCartEntities.CartVariantMappings.Where(c => c.CartID == UserID));
            shoppingCartEntities.SaveChanges();
            return;
        }
        public void RemoveItem(Guid UserID, Guid VariantID)
        {
            shoppingCartEntities.CartVariantMappings.RemoveRange(shoppingCartEntities.CartVariantMappings.Where(c => c.CartID == UserID && c.VariantID == VariantID));
            shoppingCartEntities.SaveChanges();
            return;
        }
    }
}