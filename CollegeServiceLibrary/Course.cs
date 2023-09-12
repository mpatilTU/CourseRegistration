using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CollegeServiceLibrary
{
    public class Course
    {
        private string crn;
        private string departmentCode;
        private string courseTitle;
        private string days;
        private string time;
        private string professor;
        private float creditHours;
        private float additionalFees;
        private string location;
        private int seats;
        private double cost;


        public Course(string CRN, string departmentCode, string courseTitle, string days, string time, string professor, float creditHours, string location, int seats)
        {
            crn = CRN;
            DepartmentCode = departmentCode;
            CourseTitle = courseTitle;
            Days = days;
            Time = time;
            Professor = professor;
            CreditHours = creditHours;
            Location = location;
            Seats = seats;
            AdditionalFees = 100;
        }

        
        public string DepartmentCode { get => departmentCode; set => departmentCode = value; }
        public string CourseTitle { get => courseTitle; set => courseTitle = value; }
        public string Days { get => days; set => days = value; }
        public string Time { get => time; set => time = value; }
        public string Professor { get => professor; set => professor = value; }
        public float CreditHours { get => creditHours; set => creditHours = value; }
        public float AdditionalFees { get => additionalFees; set => additionalFees = value; }
        public string Location { get => location; set => location = value; }
        public double Cost { get => cost; set => cost = value; }
        public string Crn { get => crn; set => crn = value; }
        public int Seats { get => seats; set => seats = value; }


        public void CalculateCost() {
            Cost = CreditHours * 4500 + additionalFees;
            if(location.Equals("In-Person"))
            {
                Cost += 85;
            }
            else if(location.Equals("Online"))
            {
                Cost += 95;
            }
            else if(location.Equals("Hybrid"))
            {
                Cost += 105;
            }
        }
    }
}
