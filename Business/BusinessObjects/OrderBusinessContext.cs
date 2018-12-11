using Business.Exceptions;
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
        ProductDatabaseContext productDatabaseContext;

        public OrderBusinessContext()
        {
            orderDataBaseContext = new OrderDatabaseContext(); 
            addressDatabaseContext =  new AddressDatabaseContext();
            cartDataBaseContext = new CartDatabaseContext(); 
            productDatabaseContext = new ProductDatabaseContext();

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
            productDatabaseContext.UpdateInventory(cartVariantItemsDTO);
            cartDataBaseContext.EmptyCart(UserID);
            return true;
        }
        public OrdersDTO GetOrders(Guid UserID)
        {
            OrdersDTO newOrdersDTO = orderDataBaseContext.GetOrders(UserID);
            if (newOrdersDTO.Orders.ToList().Count == 0)
            {
                throw new NoOrderException();
            }
            else
            {
                foreach (OrderDTO order in newOrdersDTO.Orders)
                {
                    order.Status = orderDataBaseContext.GetOrderStatus(order.StatusID);
                }
                return newOrdersDTO;
            }

        }
    }
}
