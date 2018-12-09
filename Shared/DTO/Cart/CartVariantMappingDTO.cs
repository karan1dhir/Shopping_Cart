using Shared.DTO.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared.DTO.Cart
{
    public class CartVariantMappingDTO
    {
        public Guid ID { get; set; }
        public Guid UserID { get; set; }
        public Guid VariantID { get; set; }
        public System.Guid ProductID { get; set; }
        public double SellingPrice { get; set; }
        public int Quantity { get; set; }
    }
}
    