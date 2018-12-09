using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Exceptions
{
    public class OrderLimitExceededException:Exception
    {
        public OrderLimitExceededException() { }
        public OrderLimitExceededException(string message) : base(message) { }
        public OrderLimitExceededException(string message, Exception inner) : base(message, inner) { }
    }
}
