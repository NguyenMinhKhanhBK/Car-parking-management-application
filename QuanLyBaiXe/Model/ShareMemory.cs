using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBaiXe.Model
{
   public class ShareMemory
    {
        public int AvailableToMaintenancePosition { get; set; }
        public int CancelBookedPosition { get; set; }
        public int FinishMaintenancePosition { get; set; }
        public int OccupiedToAvailablePosition { get; set; }

    }
}
