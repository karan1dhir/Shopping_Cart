using Shared.DTO.Product;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared.DTO.Variant
{
    public class VariantDTO
    {
        public Guid ID { get; set; }
        public string SKU { get; set; }
        public double ListingPrice {get ; set;}
        public double Discount { get; set; }
        public int QuantitySold { get; set; }
        public int Inventory { get; set; }
        public ProductDTO Product { get; set; }
        public IEnumerable<VariantImageDTO> VariantImages { get; set; }
        public double DiscountedPrice { get; set; }
    }
}
