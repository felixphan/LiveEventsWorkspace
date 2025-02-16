//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EventZone.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Report
    {
        public int ReportID { get; set; }
        public long EventID { get; set; }
        public long SenderID { get; set; }
        public int ReportType { get; set; }
        public string ReportContent { get; set; }
        public int ReportStatus { get; set; }
        public System.DateTime ReportDate { get; set; }
        public Nullable<System.DateTime> HandleDate { get; set; }
        public Nullable<long> HandleBy { get; set; }
    
        public virtual Event Event { get; set; }
        public virtual ReportDefine ReportDefine { get; set; }
        public virtual User User { get; set; }
    }
}
