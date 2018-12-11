using AutoMapper;
using Entities;
using Shared.DTO.Order;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DBObjects
{
    public class AddressDatabaseContext
    {
        ShoppingCartEntities shoppingCartEntities;
        IMapper AddressMapper;


        public AddressDatabaseContext()
        {
            shoppingCartEntities = new ShoppingCartEntities();
            var Config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<AddressDTO,Address>();
            });
            AddressMapper = new Mapper(Config);
        }

        public Guid AddAddress(Guid UserID, AddressDTO addressDTO)
        { 
          Guid id = Guid.NewGuid();
          Guid mappingID = Guid.NewGuid();
          Address address = new Address { ID = id, AddressLine1 = addressDTO.AddressLine1, AddressLine2 = addressDTO.AddressLine2, City = addressDTO.City, Pin = addressDTO.Pin, State = addressDTO.State, Country = addressDTO.Country };
          shoppingCartEntities.Addresses.Add(address);
          UserAddressMapping userAddressMapping = new UserAddressMapping { ID = mappingID, AddressID = id, UserID = UserID };
          shoppingCartEntities.UserAddressMappings.Add(userAddressMapping);
          shoppingCartEntities.SaveChanges();
          return id; 
        }
    }
}
