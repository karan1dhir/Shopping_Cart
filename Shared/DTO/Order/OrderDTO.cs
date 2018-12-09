﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared.DTO.Order
{
    public class OrderDTO
    {
      public int StatusID { get; set; }
      public double TotalAmont { get; set; }
      public AddressDTO Address { get; set; }
      public System.DateTime OrderDate { get; set; }
      public IEnumerable<OrderProductDTO> OrderPlaceds { get; set; }    
    }
}
