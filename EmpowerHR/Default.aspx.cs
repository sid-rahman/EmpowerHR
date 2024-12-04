using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using EmpowerHR.Data;

namespace EmpowerHR
{
    public partial class _Default : Page
    {
        DataAccess da = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEmployeeGrid();
            }
        }

        void BindEmployeeGrid()
        {
            EmployeeGridView.DataSource = da.ListAllEmployees();
            EmployeeGridView.DataBind();
        }

        protected void EmployeePageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            EmployeeGridView.PageIndex = e.NewPageIndex;
            BindEmployeeGrid();
        }

        protected void btnDeleteEmployee_Click(object sender, EventArgs e)
        {
            var btnDelete = (Button)sender;
            var employeeId = int.Parse(btnDelete.CommandArgument);
            da.DeleteEmployee(employeeId);

            BindEmployeeGrid();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var employeeId = int.Parse(modaluniqueId.Text);
            var firstName = modalfirstName.Text;
            var lastName = modallastName.Text;
            var division = modaldivision.Text;
            var building = modalbuilding.Text;
            var title = modaltitle.Text;
            var room = int.Parse(modalroom.Text);

            da.UpdateEmployee(employeeId, firstName, lastName, division, building, title, room);
            BindEmployeeGrid();
        }

        protected void btnSearchEmployee_Click(object sender, EventArgs e)
        {
            var employeeId = int.Parse(searchEmployeeId.Text);
            EmployeeGridView.DataSource = da.GetEmployeeById(employeeId);
            EmployeeGridView.DataBind();
        }
    }
}