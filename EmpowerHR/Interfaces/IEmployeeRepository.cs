using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmpowerHR.Interfaces
{
    internal interface IEmployeeRepository
    {
        DataTable ListAllEmployees();
        DataTable GetEmployeeById(int id);
        void UpdateEmployee(int id, string firstName, string lastName, string division, string title, int room);
        void DeleteEmployee(int id);
    }
}
