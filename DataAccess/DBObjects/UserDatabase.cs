﻿using AutoMapper;
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
        IMapper roleMapRoleBasicDTOMapper;
        IMapper userDTOMapUserMapper;
        public UserDatabase()
        {
            shoppingCartEntities = new ShoppingCartEntities();

            var roleMapRoleBasicConfig = new MapperConfiguration(cfg =>{
                cfg.CreateMap<Role, RoleDTO>();
            });

            var userDTOMapUserConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<UserDTO, User>();
            });

            var userMapUserDTOConfig = new MapperConfiguration(cfg =>{
                cfg.CreateMap<User, UserDTO>();
            });
            var userMapUserBasicDTOConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<User, UserBasicDTO>();
            });

            userMapUserDTOMapper = new Mapper(userMapUserDTOConfig);
            userMapUserBasicDTOMapper = new Mapper(userMapUserBasicDTOConfig);
            roleMapRoleBasicDTOMapper = new Mapper(roleMapRoleBasicConfig);
            userDTOMapUserMapper = new Mapper(userDTOMapUserConfig);
        }
        public UserBasicDTO AddUser(UserDTO userDTO)
        {
            User user = userDTOMapUserMapper.Map<UserDTO, User>(userDTO);
            user.ID = Guid.NewGuid();
            user.RoleID = shoppingCartEntities.Roles.Where(r => r.Name == "USER").Select(a => a.ID).FirstOrDefault();
            shoppingCartEntities.Users.Add(user);
            shoppingCartEntities.SaveChanges();
            UserBasicDTO userBasicDTO = userMapUserBasicDTOMapper.Map<User, UserBasicDTO>(user);
            return userBasicDTO;
        }
        public bool UserEmailExists(string userEmail)
        {
            User user = shoppingCartEntities.Users.Where(userinfo => userinfo.Email == userEmail).FirstOrDefault();
            if (user == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        public UserBasicDTO GetUser(UserLoginDTO userLoginDTO)
        {
            User user = shoppingCartEntities.Users.Where(a => a.Email == userLoginDTO.Email).First();
            if (user != null)
            {
                UserBasicDTO UserBasicDTO = userMapUserBasicDTOMapper.Map<User, UserBasicDTO>(user);
                return UserBasicDTO;
            }
            else
            {
                throw new NotFoundException();
            }
        }
        public bool UserExists(UserLoginDTO userLoginDTO)
        {
            User user = shoppingCartEntities.Users.Where(a => a.Email == userLoginDTO.Email).FirstOrDefault();
            if (user != null)
            {
                return true;
            }
            else
            {
                throw new NotFoundException();
            }
        }

        public RoleBasicDTO GetRole()
        {
            List<Role> roles = shoppingCartEntities.Roles.ToList();
            IEnumerable<Role> convertRoles= roles.AsEnumerable<Role>();
            RoleBasicDTO roleBasicDTO = new RoleBasicDTO();
            roleBasicDTO.roles = roleMapRoleBasicDTOMapper.Map<IEnumerable<Role>, IEnumerable<RoleDTO>>(convertRoles);
            if (roles != null)
            {
                return roleBasicDTO;
            }
            else
            {
                throw new NotFoundException();
            }
        } 
    }
}