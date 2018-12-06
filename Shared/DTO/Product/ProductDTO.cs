using Shared.DTO.Category;
using Shared.DTO.Variant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared.DTO.Product
{
    public class ProductDTO
    {

        public IEnumerable<VariantDTO> Variants { get; set; }
        public CategoryProductDTO Category { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Title { get; set; }
        public int OrderLimit { get; set; }
        public string TotalVariantsSold { get; set; }
    }
}
