using AutoMapper;
using DataAccess.Exceptions;
using Entities;
using Shared.DTO.Role;
using Shared.DTO.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DBObjects
{
    public class UserDatabase
    {
        ShoppingCartEntities shoppingCartEntities;
        IMapper userMapUserDTOMapper;
        IMapper userMapUserBasicDTOMapper;
        public UserDatabase()
        {
            shoppingCartEntities = new ShoppingCartEntities();
            var userMapUserDTOConfig = new MapperConfiguration(cfg =>{
                cfg.CreateMap<Role,RoleDTO>();
                cfg.CreateMap<User, UserDTO>();
            });
            var userMapUserBasicDTOConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<User, UserBasicDTO>();
            });

            userMapUserDTOMapper = new Mapper(userMapUserDTOConfig);
            userMapUserBasicDTOMapper = new Mapper(userMapUserBasicDTOConfig);

        }
        public UserBasicDTO AddUser(UserDTO userDTO)
        {
            User user = userMapUserDTOMapper.Map<UserDTO, User>(userDTO);
            user.ID = Guid.NewGuid();
            //user.Role.Name=(shoppingCartEntities.Roles.Where(r => r.Name == "USER").FirstOrDefault());
            shoppingCartEntities.Users.Add(user);
            shoppingCartEntities.SaveChanges();
            UserBasicDTO userBasicDTO = userMapUserBasicDTOMapper.Map<User, UserBasicDTO>(user);
            return userBasicDTO;
        }
        public bool UserNameExists(string userName)
        {
            User user = shoppingCartEntities.Users.Where(userinfo => userinfo.Name == userName).FirstOrDefault();
            if (user != null)
            {
                return true;
            }
            else
            {
                throw new NotFoundException();
            }
        }

    }
}
