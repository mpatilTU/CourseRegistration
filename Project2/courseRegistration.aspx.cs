using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;
using CollegeServiceLibrary;

namespace Project2
{
    public partial class courseRegistration : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)    // if it's the first page load
            {
                string strSQL = "SELECT * FROM Courses ORDER BY CRN";
                gvCourses.DataSource = objDB.GetDataSet(strSQL);
                gvCourses.DataBind();
            }

           

        }
            protected void btnRegister_Click(object sender, EventArgs e)
            {
            lbldisplayName.Visible = true;
            gvCourses.Visible = false;
            btnRegister.Visible = false;

            bool flag = false;
            foreach (GridViewRow gvrow in gvCourses.Rows)
            {
                CheckBox chk = (CheckBox)gvrow.FindControl("chkSelect");
                if (chk.Checked)
                {
                    flag = true;
                }
            }

            if (!flag)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "alert('Please select atleast one checkbox');", true);
                return;
            }

            string enrollment = "";
                if (radFullTime.Checked)
                    enrollment = "Full-time";
                else if (radPartTime.Checked)
                    enrollment = "Part-time";

            String name = Request["txtName"];
            String phone = Request["txtPhone"];
            String address = Request["txtAddress"];
            String email = Request["txtEmail"];
            String id = Request["txtId"];

            lbldisplayName.Text = "Name: " + " " + name + " " + "Phone:" + phone + " " + "Email:" +  email + "" + "Address:" + address + " " + "Id:" + id;
           

            Students student = new Students(txtName.Text, txtPhone.Text, txtAddress.Text, txtEmail.Text, txtID.Text, enrollment);

                List<Course> chosenStudentCourses = new List<Course>();

                for (int i = 0; i < gvCourses.Rows.Count; i++)
                {
                    CheckBox checkBox = (CheckBox)gvCourses.Rows[i].FindControl("chkSelect");

                    if (checkBox.Checked)
                    {
                   // DropDownList ddl = (DropDownList)gvCourses.Rows[i].FindControl("ddlLocation");
                //   course.Location = ddl.SelectedValue;
                        Course course = new Course(gvCourses.Rows[i].Cells[1].Text, gvCourses.Rows[i].Cells[2].Text, gvCourses.Rows[i].Cells[3].Text, gvCourses.Rows[i].Cells[4].Text, gvCourses.Rows[i].Cells[5].Text, gvCourses.Rows[i].Cells[6].Text, float.Parse(gvCourses.Rows[i].Cells[7].Text),gvCourses.Rows[i].Cells[8].Text, int.Parse(gvCourses.Rows[i].Cells[9].Text));
                    DropDownList ddl = (DropDownList)gvCourses.Rows[i].FindControl("ddlLocation");
                    course.Location = ddl.SelectedValue;
                    chosenStudentCourses.Add(course);
                    }
                }

                StudentRoster studentRoster = new StudentRoster();

                for (int i = 0; i < chosenStudentCourses.Count; i++)
                {
                    studentRoster.StudentChosenCourses.Add(chosenStudentCourses[i]);
                    studentRoster.StudentChosenCourses[i].CalculateCost();
                }

                gvStudentRoster.DataSource = studentRoster.StudentChosenCourses;
                gvStudentRoster.DataBind();

                gvStudentRoster.FooterRow.Cells[0].Text = "Total Cost";
                gvStudentRoster.FooterRow.Cells[6].Text = studentRoster.CalculateTotalCost().ToString("C");

                foreach (var course in studentRoster.StudentChosenCourses)
                {
                    string sql = "UPDATE Courses SET TotalAvailableSeats = " + course.Seats + " WHERE CRN = " + course.Crn;

                    objDB.DoUpdate(sql);
                }
            }

       
    }
    }

