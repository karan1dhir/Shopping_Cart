using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Exceptions
{
    public class QuantityUnavailableException:Exception
    {
        public QuantityUnavailableException() { }
        public QuantityUnavailableException(string message) : base(message) { }
        public QuantityUnavailableException(string message, Exception inner) : base(message, inner) { }

    }
}
