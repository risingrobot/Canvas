using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Canva.Models
{
    public class MainPageModel
    {
        public MainPageModel()
        {
            registerModel = new RegisterModel();
        }
        public RegisterModel registerModel { get; set; }
        public LoginModel loginModel { get; set; }
    }
    public class RegisterModel
    {
        public int Id { get; set; }
        [Required]
        public string FullName { get; set; }
        [Required]
        public string EmailAddress { get; set; }
        [Required]
        public string Password { get; set; }
        public int ProfessionId { get; set; }
        [Required]
        [Compare("Password")]
        public string ConfirmPassword { get; set; }



    }

    
}
