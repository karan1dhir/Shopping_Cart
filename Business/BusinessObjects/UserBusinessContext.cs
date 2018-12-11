using Business.Exceptions;
using DataAccess.DBObjects;
using Entities;
using Shared.DTO.Role;
using Shared.DTO.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.BusinessObjects
{
   public class UserBusinessContext
    {
        UserDatabase userDatabase;
        public UserBusinessContext()
        {
         userDatabase = new UserDatabase();
        }
        public UserBasicDTO RegisterUser(UserDTO userDTO)
        {
            try
            {
                if (userDatabase.UserEmailExists(userDTO.Email))
                {
                    throw new UserNameAlreadyExistsException();
                }
                userDTO.HashPassword = PasswordHasher.HashPassword(userDTO.Password);
                UserBasicDTO userBasicDTO = userDatabase.AddUser(userDTO);
                return userBasicDTO;
            }
            catch (UserNameAlreadyExistsException ex)
            {
                throw new UserNameAlreadyExistsException();
            }
             catch (Exception ex)
            {
                throw new Exception();
            }
        }
        public UserBasicDTO LoginUser(UserLoginDTO userLoginDTO)
        {
            try
            {
                if (userDatabase.UserExists(userLoginDTO))
                {
                    UserBasicDTO userBasicDTO = userDatabase.GetUser(userLoginDTO);
                    if (PasswordHasher.VerifyPassword(userLoginDTO.Password, userBasicDTO.HashPassword))
                    {
                        return userBasicDTO;
                    }
                }
                throw new InvalidLoginException();
            }
            catch (NotFoundException)
            {
                throw new InvalidLoginException();
            }
        }
        public RoleBasicDTO GetRoles()
        {
            RoleBasicDTO roleBasicDTO = userDatabase.GetRole();
            try
            {
                if(userDatabase.GetRole().roles.Count()<=0)
                {
                    throw new NoRolesFoundException();
                }
                else
                {
                    return roleBasicDTO;
                }
            }
            catch (NoRolesFoundException ex)
            {
                throw new NoRolesFoundException();
            }
            catch(Exception ex)
            {
                throw new Exception();
            }
        }
    }
}
