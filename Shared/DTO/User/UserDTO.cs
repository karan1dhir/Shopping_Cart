using Shared.DTO.Role;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared.DTO.User
{
    public class UserDTO
    {
       public string Name { get; set; }
       public string Password { get; set; }
       public string HashPassword { get; set; }
       public string Email { get; set; }
       public string PhoneNumber { get; set; }
       public string RoleName { get; set; }
    }
}

