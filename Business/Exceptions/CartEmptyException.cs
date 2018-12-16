using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Exceptions
{
    public class CartEmptyException:Exception
    {
        public CartEmptyException() { }
        public CartEmptyException(string message) : base(message) { }
        public CartEmptyException(string message, Exception inner) : base(message, inner) { }
    }
}
