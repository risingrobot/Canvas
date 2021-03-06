//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class UserDesign
    {
        public int Id { get; set; }
        public string Heading { get; set; }
        public string Description { get; set; }
        public Nullable<int> PersonId { get; set; }
        public Nullable<int> DesignId { get; set; }
        public string ImageUrl { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
    
        public virtual Design Design { get; set; }
        public virtual Person Person { get; set; }
    }
}
