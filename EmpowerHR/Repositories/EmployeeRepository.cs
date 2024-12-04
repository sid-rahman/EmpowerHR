using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using EmpowerHR.Interfaces;

namespace EmpowerHR.Repositories
{
    public class EmployeeRepository : IEmployeeRepository
    {
        private string _connectionString = ConfigurationManager.ConnectionStrings["HRConnectionString"].ConnectionString;
        public DataTable ListAllEmployees()
        {
            var employees = new DataTable();
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("dbo.get_all_employees", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                if (adapter != null)
                    adapter.Fill(employees);
            }
            return employees;
        }

        public DataTable GetEmployeeById(int id)
        {
            var employee = new DataTable();
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("get_employee_details", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@EmployeeId", id);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                if (adapter != null)
                    adapter.Fill(employee);
            }
            return employee;
        }

        public void UpdateEmployee(int id, string firstName, string lastName, string division, string title, int room)
        {
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("update_employee", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@EmployeeId", id);
                cmd.Parameters.AddWithValue("@FirstName", firstName);
                cmd.Parameters.AddWithValue("@LastName", lastName);
                cmd.Parameters.AddWithValue("@Division", division);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Room", room);

                cmd.ExecuteNonQuery();
            }
        }

        public void DeleteEmployee(int id)
        {
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("delete_employee", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@EmployeeId", id);

                cmd.ExecuteNonQuery();
            }
        }

    }
}