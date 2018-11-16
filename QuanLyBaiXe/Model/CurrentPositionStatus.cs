using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBaiXe.Model
{
    public class CurrentPositionStatus
    {
        public int Available { get; set; }
        public int Booked { get; set; }
        public int Occupied { get; set; }
        public int Maintenance { get; set; }
    }
}
