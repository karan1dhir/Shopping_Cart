using AutoMapper;
using Entities;
using Shared.DTO.Cart;
using Shared.DTO.Order;
using Shared.DTO.Variant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
                cfg.CreateMap<OrderPlaced, OrderProductDTO >();
                cfg.CreateMap<OrderPlacedVariant, OrderPlacedVariantDTO>();
                cfg.CreateMap<Variant, VariantDTO >();

            });
            OrderMapper = new Mapper(OrdersConfig);
        }

        public void PlaceOrder(Guid UserID, CartVariantItemsDTO cartVariantItemsDTO, Guid addressID)
        {

            Guid orderID = Guid.NewGuid();
            Guid orderPlacedID = Guid.NewGuid();
            Order order = new Order { ID = orderID, DeliveryAddressID = addressID, TotalAmount = cartVariantItemsDTO.SubTotal };
            OrderPlaced orderPlaced = new OrderPlaced { ID = orderPlacedID, OrderID = orderID, UserID = UserID };
            shoppingCartEntities.Orders.Add(order);
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
           public OrdersDTO GetOrders(Guid UserID)
          {
            IEnumerable<Guid> OrderPlacedID = shoppingCartEntities.OrderPlaceds.Where(c => c.UserID == UserID).Select(o => o.OrderID).ToList();
            List<Order> orderList = null;
            foreach(Guid orderID in OrderPlacedID)
            {
                Order order = shoppingCartEntities.Orders.Where(c => c.ID == orderID).FirstOrDefault();
                orderList.Add(order);
            }
          
           OrdersDTO orderInfo = new OrdersDTO();
           orderInfo.Orders = OrderMapper.Map<IEnumerable<Order>, IEnumerable<OrderDTO>>(orderList.AsEnumerable());
           return orderInfo;
        }
     }   
 }

