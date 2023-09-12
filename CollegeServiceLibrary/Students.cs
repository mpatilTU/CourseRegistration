using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace CollegeServiceLibrary
{
    public class Students
    {
        private string name;
        private string phone;
        private string address;
        private string email;
        private string id;
        private string enrollment;

        public string Name { get => name; set => name = value; }
        public string Phone { get => phone; set => phone = value; }
        public string Address { get => address; set => address = value; }
        public string Email { get => email; set => email = value; }
        public string Id { get => id; set => id = value; } 
        public string Enrollment { get => enrollment; set => enrollment = value; }

        public Students(string name, string phone, string address, string email, string id, string enrollment)
        {
            Name = name;
            Phone = phone;
            Address = address;
            Email = email;
            Id = id;
            Enrollment = enrollment;
        }
    }
   
}
