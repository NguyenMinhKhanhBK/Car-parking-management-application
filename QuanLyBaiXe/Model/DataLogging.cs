//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLyBaiXe.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class DataLogging
    {
        public int ID { get; set; }
        public Nullable<int> BuildingID { get; set; }
        public Nullable<int> BlockID { get; set; }
        public Nullable<int> PositionID { get; set; }
        public Nullable<System.DateTime> LoggedTime { get; set; }
        public string UserName { get; set; }
        public string LicensePlate { get; set; }
        public Nullable<System.DateTime> ArrivalTime { get; set; }
        public Nullable<System.DateTime> LeavingTime { get; set; }
        public Nullable<long> TotalServiceMinutes { get; set; }
        public Nullable<float> Charge { get; set; }
    
        public virtual Block Block { get; set; }
        public virtual BuildingInfo BuildingInfo { get; set; }
    }
}
