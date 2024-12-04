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

        protected void btnDeleteEmployee_Click(object sender, EventArgs e)
        {
            var btnDelete = (Button)sender;
            var employeeId = int.Parse(btnDelete.CommandArgument);
            da.DeleteEmployee(employeeId);

            BindEmployeeGrid();
        }
    }
}