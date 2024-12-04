using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EmpowerHR.Interfaces;
using EmpowerHR.Repositories;

namespace EmpowerHR
{
    public partial class _Default : Page
    {
        private IEmployeeRepository _employeeRepository = new EmployeeRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindEmployeeGridView();
            }
        }

        void bindEmployeeGridView()
        {
            EmployeeGridView.DataSource = _employeeRepository.ListAllEmployees();
            EmployeeGridView.DataBind();
        }
    }
}