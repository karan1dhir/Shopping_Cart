using Business.Exceptions;
using DataAccess.DBObjects;
using DataAccess.Exceptions;
using Shared.DTO.Cart;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.BusinessObjects
{
    public class CartBusinessContext
    {
        CartDatabaseContext cartDatabaseContext = new CartDatabaseContext();
        public void AddItem(CartVariantMappingDTO cartVariantMappingDTO)
        {

            try
            {
                int totalQuantity = cartDatabaseContext.PresentInCart(cartVariantMappingDTO) + cartVariantMappingDTO.Quantity;
                int inventoryValue = cartDatabaseContext.GetInventory(cartVariantMappingDTO);
                int orderLimitValue = cartDatabaseContext.GetOrderLimit(cartVariantMappingDTO);

                if(totalQuantity > orderLimitValue)
                {
                    throw new OrderLimitExceededException();
                }
                if (totalQuantity > inventoryValue)
                {
                    throw new QuantityUnavailableException();
                }
                cartVariantMappingDTO.Quantity = totalQuantity;
                cartDatabaseContext.AddToCart(cartVariantMappingDTO);
            }
            catch (AlreadyPresentException ex)
            {
                throw new ItemAlreadyInCartException();
            }
            
        }
         public CartVariantItemsDTO GetCart(Guid UserID)    
        {
            CartVariantItemsDTO cartVariantItemsDTO = cartDatabaseContext.GetCart(UserID);
            float subtotal = new float();
            foreach(var cartVariants in cartVariantItemsDTO.CartItems)
            {
                int Quantity = cartVariants.Quantity;
                float Discount = cartVariants.Variant.Discount;
                float Price = cartVariants.Variant.ListingPrice;
                cartVariants.Variant.DiscountedPrice = (Price * (100 - Discount) / 100);
                float DiscountedPrice = cartVariants.Variant.DiscountedPrice;
                subtotal += DiscountedPrice * Quantity;
            }
            cartVariantItemsDTO.SubTotal = subtotal;
            return cartVariantItemsDTO;
        }
        public bool EmptyCart(Guid UserID)
        {
            cartDatabaseContext.EmptyCart(UserID);
            return true;
        }
        public void RemoveItem(Guid UserID,Guid VariantID)
        {
            cartDatabaseContext.RemoveItem(UserID, VariantID);
        }
    }
}
