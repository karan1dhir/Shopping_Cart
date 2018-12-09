using Shared.DTO.Variant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared.DTO.Order
{
    public class OrderPlacedVariantDTO
    {
        public double SellingPrice { get; set; }
        public int Quantity { get; set; }
        public VariantDTO Variant { get; set; }
    }
}
