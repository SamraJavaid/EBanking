//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EBankingProject.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class BalanceEnquiry
    {
        public int BalId { get; set; }
        public Nullable<int> AccountNo { get; set; }
        public Nullable<decimal> CurrentBalance { get; set; }
    
        public virtual Account Account { get; set; }
    }
}
