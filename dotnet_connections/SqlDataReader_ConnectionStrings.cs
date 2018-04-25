using System.Data.SqlClient;
using System.Data;

SqlConnection connection = new SqlConnection("Data Source=sgid.agrc.utah.gov;Initial Catalog=SGID10;User ID=*******;Password=*******");

SqlDataReader reader;

using (connection)
                {
                    //open the connection
                    connection.Open();

          SqlCommand command = new SqlCommand("SELECT * FROM something, connection);

reader = command.ExecuteReader();

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                Console.WriteLine(reader[0]);
                            }
                        }

reader.Close();
reader.Dispose();

                    // close the connection
                    if (connection.State == ConnectionState.Open)
                    {
                        connection.Close();
                    }
                }
