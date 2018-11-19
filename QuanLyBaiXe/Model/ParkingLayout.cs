using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace QuanLyBaiXe.Model
{
   public class ParkingLayout
    {
        public bool IsAvailable { get; set; }
        public bool IsBooked { get; set; }
        public bool IsOccupied { get; set; }
        public bool IsMaintenance { get; set; }

    }
}
