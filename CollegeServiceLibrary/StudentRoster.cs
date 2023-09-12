using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CollegeServiceLibrary
{
    public class StudentRoster
    {
        List<Course> studentChosenCourses;

        public StudentRoster()
        {
            StudentChosenCourses = new List<Course>();
        }

        public List<Course> StudentChosenCourses { get => studentChosenCourses; set => studentChosenCourses = value; }

        public double CalculateTotalCost()
        {
            double total = 0;

            for(int i = 0; i < studentChosenCourses.Count; i++)
            {
                total += studentChosenCourses[i].Cost;
            }

            return total;
        }

        public void UpdateSeats()
        {
            foreach(var course in studentChosenCourses)
            {
                course.Seats--;
            }
        }
    }
}
