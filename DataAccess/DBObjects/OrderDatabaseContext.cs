using AutoMapper;
using Entities;
using Shared.DTO.Cart;
using Shared.DTO.Category;
using Shared.DTO.Order;
using Shared.DTO.Product;
using Shared.DTO.Variant;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace DataAccess.DBObjects
{
    public class OrderDatabaseContext
    {

        ShoppingCartEntities shoppingCartEntities;
        IMapper OrderMapper;
        public OrderDatabaseContext()
        {
            shoppingCartEntities = new ShoppingCartEntities();
            var OrdersConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<Order, OrderDTO>();
                cfg.CreateMap<OrderPlaced, OrderProductDTO>();
                cfg.CreateMap<OrderPlacedVariant,OrderPlacedVariantDTO>();
                cfg.CreateMap<Variant, VariantDTO>();
                cfg.CreateMap<VariantImage, VariantImageDTO>();
                cfg.CreateMap<Address, AddressDTO>();
                cfg.CreateMap<Product, ProductDTO>();
                cfg.CreateMap<Category, CategoryProductDTO>();

            });
            OrderMapper = new Mapper(OrdersConfig);
        }

        public void PlaceOrder(Guid UserID, CartVariantItemsDTO cartVariantItemsDTO, Guid addressID)
        {

            Guid orderID = Guid.NewGuid();
            Guid orderPlacedID = Guid.NewGuid();
            DateTime dateTime = DateTime.Now;
            Order order = new Order { ID = orderID, DeliveryAddressID = addressID, TotalAmount = cartVariantItemsDTO.SubTotal , isCancelled = "N" , OrderDate = dateTime , DeliveryDate = dateTime, StatusID=1};
            shoppingCartEntities.Orders.Add(order);
            shoppingCartEntities.SaveChanges();
            OrderPlaced orderPlaced = new OrderPlaced { ID = orderPlacedID, OrderID = orderID, UserID = UserID  };
            shoppingCartEntities.OrderPlaceds.Add(orderPlaced);
            shoppingCartEntities.SaveChanges();

            foreach (var cartItem in cartVariantItemsDTO.CartItems)
            {
                OrderPlacedVariant orderPlacedVariant = new OrderPlacedVariant
                {
                    ID = Guid.NewGuid(),
                    OrderPlacedID = orderPlacedID,
                    VariantID = cartItem.Variant.ID,
                    SellingPrice = cartItem.Variant.DiscountedPrice,
                    Quantity = cartItem.Quantity
                };
                
                shoppingCartEntities.OrderPlacedVariants.Add(orderPlacedVariant);
                shoppingCartEntities.SaveChanges();
            }
            return;
            }
           public string GetOrderStatus(int statusID)
        {
            string status = shoppingCartEntities.Status.Where(s => s.ID == statusID).Select(s => s.description).FirstOrDefault();
            return status;
        }
        public bool ItemsExist(Guid userID)
        {
            int items = shoppingCartEntities.CartVariantMappings.Include(c => c.VariantID).Where(c => c.CartID == userID).Count();
            Debug.WriteLine(shoppingCartEntities.CartVariantMappings.Include(c => c.VariantID).Where(c => c.CartID == userID).Count());
            if (items > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public OrdersDTO GetOrders(Guid UserID)
          {
            IEnumerable<Guid> OrderPlacedID = shoppingCartEntities.OrderPlaceds.Where(c => c.UserID == UserID).Select(o => o.OrderID).ToList();
            Debug.WriteLine(shoppingCartEntities.OrderPlaceds.Where(c => c.UserID == UserID).Select(o => o.OrderID).ToList());
            List<Order> orderList = new List<Order>();
            foreach(Guid orderID in OrderPlacedID)
            {
                Order order = shoppingCartEntities.Orders.Where(c => c.ID == orderID).FirstOrDefault();
                Debug.WriteLine(shoppingCartEntities.Orders.Where(c => c.ID == orderID).FirstOrDefault());
                orderList.Add(order);
            }
          
           OrdersDTO orderInfo = new OrdersDTO();
           orderInfo.Orders = OrderMapper.Map<IEnumerable<Order>, IEnumerable<OrderDTO>>(orderList.AsEnumerable());
           return orderInfo;
        }
        public OrderDTO GetOrder(Guid orderID)
        {
            Order order = shoppingCartEntities.Orders.Where(o => o.ID == orderID).FirstOrDefault();
            Debug.WriteLine(shoppingCartEntities.Orders.Where(o => o.ID == orderID).FirstOrDefault());
            OrderDTO orderDTO = OrderMapper.Map<Order, OrderDTO>(order);
            return orderDTO;
        }
    }
}

