using Shared.DTO.Variant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared.DTO.Cart
{
    public class CartVariantDTO
    {
        public string Name { get; set; }
        public VariantDTO Variant { get; set; }
        public Guid ID { get; set; }
        public int Quantity { get; set; }
    }
}
