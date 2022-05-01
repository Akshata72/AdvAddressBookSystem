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
        public static string connectionString = @"Server=(localdb)\MSSQLLocalDB;Database=AddressBook_Service;Trusted_Connection=True;";
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
        // UC2:- Ability to create a Address Book Table with first and last names, address, city, state, zip, phone number and email as its attributes 
        public List<AddressBookModel> GetAllAddressBookData()
        {
            List<AddressBookModel> addressBookModels = new List<AddressBookModel>();
            AddressBookModel model = new AddressBookModel();
            SqlConnection sqlconnection = new SqlConnection(connectionString);
            string Spname = "GetAllAddressBookData()";
            using (sqlconnection)
            {
                SqlCommand sqlCommand = new SqlCommand(Spname, sqlconnection);
                sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
                sqlconnection.Open();
                SqlDataReader reader = sqlCommand.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        model.FirstName = reader.GetString(0);
                        model.LastName = reader.GetString(1);
                        model.Address = reader.GetString(2);
                        model.City = reader.GetString(3);
                        model.State = reader.GetString(4);
                        model.Zip = reader.GetInt32(5);
                        model.PhoneNumber = reader.GetInt64(6);
                        model.EmailId = reader.GetString(7);
                        addressBookModels.Add(model);
                        Console.WriteLine("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9}", model.FirstName, model.LastName,
                                model.Address, model.City, model.State, model.Zip, model.PhoneNumber, model.EmailId, model.AddressBookType, model.AddressBookName);
                        Console.WriteLine("\n");
                    }
                }
                sqlconnection.Close();
            }
            return addressBookModels;
        }
    }
}
