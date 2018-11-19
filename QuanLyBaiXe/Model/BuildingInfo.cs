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
    
    public partial class BuildingInfo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public BuildingInfo()
        {
            this.CarParkingLayouts = new HashSet<CarParkingLayout>();
            this.DataLoggings = new HashSet<DataLogging>();
        }
    
        public int ID { get; set; }
        public string DisplayName { get; set; }
        public string Location { get; set; }
        public Nullable<float> Longtitude { get; set; }
        public Nullable<float> Latitude { get; set; }
        public string Url { get; set; }
    
        public virtual Building Building { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CarParkingLayout> CarParkingLayouts { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DataLogging> DataLoggings { get; set; }
    }
}
