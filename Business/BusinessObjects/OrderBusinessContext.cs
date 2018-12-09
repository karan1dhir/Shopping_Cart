using DataAccess.DBObjects;
using Shared.DTO.Cart;
using Shared.DTO.Order;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.BusinessObjects
{
   public class OrderBusinessContext
    {
        OrderDatabaseContext orderDataBaseContext;
        AddressDatabaseContext addressDatabaseContext;
        CartDatabaseContext cartDataBaseContext;


        public OrderBusinessContext()
        {
            orderDataBaseContext = new OrderDatabaseContext(); 
            addressDatabaseContext =  new AddressDatabaseContext();
            cartDataBaseContext = new CartDatabaseContext(); 
        }

        public bool PlaceOrder(Guid UserID, AddressDTO addressDTO)
        {
            Guid AddressID = addressDatabaseContext.AddAddress(UserID, addressDTO);
            CartVariantItemsDTO cartVariantItemsDTO = cartDataBaseContext.GetCart(UserID);
            double subtotal = new double();
            foreach (var cartVariant in cartVariantItemsDTO.CartItems)
            {
                int OrderQuantity = cartVariant.Quantity;
                double Discount = cartVariant.Variant.Discount;
                double Price = cartVariant.Variant.ListingPrice;
                cartVariant.Variant.DiscountedPrice = (Price * (100 - Discount) / 100);
                double DiscountedPrice = cartVariant.Variant.DiscountedPrice;
                subtotal += DiscountedPrice * OrderQuantity;
            }
            cartVariantItemsDTO.SubTotal = subtotal;
            orderDataBaseContext.PlaceOrder(UserID, cartVariantItemsDTO, AddressID);


        }

    }
}
