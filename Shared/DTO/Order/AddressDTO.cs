using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared.DTO.Order
{
   public class AddressDTO
    {

        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public int Pin { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
    }
}
