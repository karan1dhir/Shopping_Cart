using Shared.DTO.Variant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared.DTO.Order
{
    public class OrderProductDTO
    {
       public IEnumerable<OrderPlacedVariantDTO> OrderPlacedVariants { get; set; }
    }
}
