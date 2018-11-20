using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBaiXe.Model
{
   public class BlackListPerson
    {
        public long ID { get; set; }
        public int CommandType { get; set; } //1 is ADD, 2 is EDIT, 3 is DELETE
        public string Name { get; set; }
        public string LicensePlate { get; set; }
        public string PhoneNumber { get; set; }
    }
}
