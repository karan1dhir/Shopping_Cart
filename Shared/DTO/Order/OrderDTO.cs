using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared.DTO.Order
{
    public class OrderDTO
    {
      public Guid ID { get; set; }
      public int StatusID { get; set; }
      public double TotalAmount { get; set; }
      public string Status { get; set; }
      public AddressDTO Address { get; set; }
      public System.DateTime OrderDate { get; set; }
      public IEnumerable<OrderProductDTO> OrderPlaceds { get; set; }    
    }
}
