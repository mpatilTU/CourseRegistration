<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="courseRegistration.aspx.cs" Inherits="Project2.courseRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style.css" rel="stylesheet" />
</head>
<body>
     
    <form id="form1" runat="server" class="form1">
         

      <div class="auto-style1">
          
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 391px; top: 139px; position: absolute; height: 19px" Text="Name:" Font-Bold="True"></asp:Label>
        <asp:RequiredFieldValidator ID="reqName" ControlToValidate="txtName" runat="server" ErrorMessage="Please Enter Name" height="19" style="z-index: 1; left: 447px; top: 112px; position: absolute; bottom: 580px;" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator> 
        <asp:TextBox ID="txtName" runat="server" ValidationGroup="ForgotwordFrame" style="z-index: 1; left: 447px; top: 139px; position: absolute"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 334px; top: 181px; position: absolute" Text="Phone Number:" Font-Bold="True"></asp:Label>
        <asp:TextBox ID="txtPhone" runat="server" ValidationGroup="ForgotPhone" style="z-index: 2; left: 447px; top: 175px; position: absolute"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqPhone" ControlToValidate="txtPhone" runat="server" ErrorMessage="Please Enter Phone Number" style="z-index: 1; left: 646px; top: 174px; position: absolute; height: 21px; width: 190px;" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 337px; top: 273px; position: absolute; height: 21px; width: 84px;" Text="Email Address:" Font-Bold="True"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" style="z-index: 1; left: 447px; top: 273px; position: absolute"></asp:TextBox>
        <br />
        <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 333px; top: 222px; position: absolute; height: 21px" Text="Home Address:" Font-Bold="True"></asp:Label>
        <asp:TextBox ID="txtAddress" runat="server" style="z-index: 1; left: 447px; top: 223px; position: absolute"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqAddress" ControlToValidate="txtAddress" runat="server" ErrorMessage="Please Enter Address" style="z-index: 1; left: 645px; top: 214px; position: absolute; bottom: 476px; width: 146px; height: 21px" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator> 
        <br />
        <asp:Label ID="Label4" runat="server" style="z-index: 1; left: 335px; top: 323px; position: absolute; height: 24px" Text="Student ID:" Font-Bold="True"></asp:Label>
        <asp:TextBox ID="txtID" runat="server" style="z-index: 1; left: 447px; top: 321px; position: absolute"></asp:TextBox>
      </div>
        
      <div class="auto-style">
        <asp:Label ID="Label5" runat="server" style="z-index: 1; left: 628px; top: 273px; position: absolute; height: 22px;" Text="Enrollment:" Font-Bold="True"></asp:Label>
        <asp:RadioButton ID="radFullTime" runat="server" style="z-index: 1; left: 724px; top: 273px; position: absolute; height: 21px; width: 90px;" Text="Full-Time" Groupname="radEnrollment" Checked="true" Font-Bold="True"/>
        <asp:RadioButton ID="radPartTime" runat="server" style="z-index: 1; left: 835px; top: 273px; position: absolute; height: 21px; width: 122px; right: 528px;" Text="Part-Time"  Groupname="radEnrollment" Font-Bold="True"/>
        <br />
        <asp:Label ID="Label7" runat="server" style="z-index: 1; left: 625px; top: 322px; position: absolute; width: 130px;" Text="Payment Options:" Font-Bold="True"></asp:Label>
        <asp:DropDownList ID="ddlPayment" runat="server" style="z-index: 1; top: 318px; position: absolute; left:761px; height: 42px; width: 122px;" CssClass="form-select" Font-Bold="True" >
            <asp:ListItem>Pay Now</asp:ListItem>
            <asp:ListItem>Payment Plan</asp:ListItem>
            <asp:ListItem>Financial Aid</asp:ListItem>
        </asp:DropDownList>
    <br />                                    
    </div>
       
    <div>
        <asp:GridView ID="gvCourses" runat="server" AutoGenerateColumns="False" style="z-index: 1; left: 427px; top: 362px; position: absolute; height: 133px; width: 187px; margin-top: 0px;" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:TemplateField HeaderText="Select Course">
                      <ItemTemplate>
                        <asp:CheckBox ID="chkSelect" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CRN" HeaderText="CRN" />
                <asp:BoundField DataField="DepartmentCode" HeaderText="DepartmentCode" />
                <asp:BoundField DataField="CourseTitle" HeaderText="CourseTitle" />
                <asp:BoundField DataField="Days" HeaderText="Days" />
                <asp:BoundField DataField="Time" HeaderText="Time" />
                <asp:BoundField DataField="Professor" HeaderText="Professor" />
                <asp:BoundField DataField="CreditHours" HeaderText="CreditHours" />
                <asp:TemplateField HeaderText="Location">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlLocation" runat="server" AutoPostBack="true">
                                <asp:ListItem>In-Person</asp:ListItem>
                                <asp:ListItem>Online</asp:ListItem>
                                <asp:ListItem>Hybrid</asp:ListItem>
                        </asp:DropDownList>
            </ItemTemplate>
        </asp:TemplateField>
     
                <asp:BoundField DataField="TotalAvailableSeats" HeaderText="TotalAvailableSeats" />
     
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
       </div>
        <br /> 
                                             
        <asp:GridView ID="gvStudentRoster" runat="server" AutoGenerateColumns="False" ShowFooter="True" style="z-index: 1; left: 612px; top: 759px; position: absolute; height: 133px; width: 187px" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="crn" HeaderText="CRN" />
                <asp:BoundField DataField="courseTitle" HeaderText="Course Title" />
                <asp:BoundField DataField="days" HeaderText="Days" />
                <asp:BoundField DataField="time" HeaderText="Time" />
                <asp:BoundField DataField="location" HeaderText="Location" />
                <asp:BoundField DataField="creditHours" HeaderText="Credit Hours" />
                <asp:BoundField DataField="cost" HeaderText="Course Costs" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
                                             
        <asp:Label ID="lbldisplayName" runat="server" style="z-index: 1; left: 533px; top: 603px; position: absolute; height: 31px; width: 655px;" BackColor="White" Font-Bold="True" Visible="False" Font-Size="Large"></asp:Label>
                                             
        <div style="height: 1738px">
            <asp:Button ID="btnRegister" runat="server" style="z-index: 1; left: 778px; top: 695px; position: absolute" Text="Register for Classes" OnClick="btnRegister_Click" />
        </div>
                                             
    </form>
</body>
</html>
