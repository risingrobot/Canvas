﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Canva.Models
{
    public class CategoryModel
    {
        public long Id { get; set; } = 0;
        public string Name { get; set; }
    }

   public class DesignModel
    {
        public long Id { get; set; } = 0;
        public string Url { get; set; }
        public string Category { get; set; }
        public int? Fk_Category { get; set; } = 0;
        public string Html { get; set; }

        public List<CategoryModel> Categories { get; set; }

    }

    public class SubscribeModel
    {
        public int Id { get; set; }
        public string Email { get; set; }
    }

    public class ProfileModel
    {
        public int Id { get; set; }

        [Required]
        public string FullName { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        [Required]
        public string Password { get; set; }
        [Required]
        [Compare("Password")]
        public string ConfirmPassword { get; set; }

    }

    public class PersonModel
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public string EmailAddress { get; set; }
        public string Password { get; set; }
        public string ImageUrl { get; set; }
        public Nullable<int> ProfessionId { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public Nullable<long> FK_Role { get; set; }

        //public virtual Profession Profession { get; set; }
        //public virtual Role Role { get; set; }
        //[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        //public virtual ICollection<UserDesign> UserDesigns { get; set; }

    }
}