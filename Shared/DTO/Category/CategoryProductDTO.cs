using Shared.DTO.Product;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared.DTO.Category
{
    public class CategoryProductDTO
    {
        public IEnumerable<ProductDTO> Products { get; set; }
    }
}
