using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Exceptions
{
    public class CatgoryDoesNotExistsException:Exception
    {
        public CatgoryDoesNotExistsException() { }
        public CatgoryDoesNotExistsException(string message):base(message) {  }
        public CatgoryDoesNotExistsException(string message,Exception inner):base(message,inner) { }
    }
}
