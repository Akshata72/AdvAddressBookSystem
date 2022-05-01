using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Address_Book_System_ADO
{
    class AddressBookManagement
    {
        //Specifying the connection string from the sql server connection.
        public static string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=AddressBook_Service;Integrated Security=true;";
        // Establishing the connection using the Sqlconnection.  
        SqlConnection connection = new SqlConnection(connectionString);

        public void DataBaseConnection()
        {
            try
            {
                // open connection
                connection.Open();
                //using SqlConnection
                using (connection)
                {
                    Console.WriteLine($"Connection is created Successful");
                }
                connection.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}
