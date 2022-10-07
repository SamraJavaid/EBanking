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
    
    public partial class Customer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer()
        {
            this.Accounts = new HashSet<Account>();
        }
    
        public int CustId { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string Gender { get; set; }
        public Nullable<System.DateTime> DateofBirth { get; set; }
        public string CnicNo { get; set; }
        public string Address { get; set; }
        public string EmailId { get; set; }
        public Nullable<int> PinCode { get; set; }
        public string Password { get; set; }
        public string Image { get; set; }
        public Nullable<int> Branch { get; set; }
        public string Role { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Account> Accounts { get; set; }
        public virtual branch branch1 { get; set; }
    }
}