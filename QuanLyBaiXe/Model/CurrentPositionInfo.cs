using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBaiXe.Model
{
   public class CurrentPositionInfo
    {
        public int STT { get; set; }
        public string DisplayName { get; set; }
        public int PosID { get; set; }
        public string LicensePlate { get; set; }
        public string Status { get; set; }
        public string PhoneNumber { get; set; }
        public Nullable<DateTime> ReservedTime { get; set; }
        public Nullable<DateTime> ArrivalTime { get; set; }

        
    }
}
