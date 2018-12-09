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
            Address address = AddressMapper.Map<AddressDTO, Address>(addressDTO);
            UserAddressMapping userAddressMapping = new UserAddressMapping();
            userAddressMapping.UserID = UserID;
            userAddressMapping.AddressID = Guid.NewGuid();
            shoppingCartEntities.SaveChanges();
            return userAddressMapping.UserID.GetValueOrDefault();
        }
    }
}
