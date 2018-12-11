using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared.DTO.Cart
{
    public class CartVariantItemsDTO
    {
        public double SubTotal { get; set; }
        public double TotalDiscount { get; set; }
        public IEnumerable<CartVariantDTO> CartItems { get; set; }

    }
}
