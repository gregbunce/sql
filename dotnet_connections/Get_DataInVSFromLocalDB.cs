// Using SQL DataReader in Visual Studio to retrieve data

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LocalDb_Testing
{
    class Program
    {
        static void Main(string[] args)
        {

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\v11.0;Integrated Security=True;AttachDbFilename=C:\Users\gbunce\Documents\LocalDB Databases\GregBunce.mdf");
            SqlCommand cmd = new SqlCommand("Select * From dbo.StTypeDomains", con);
            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();

            while (rd.Read())
            {
                Console.WriteLine(rd[1].ToString());
            }

            Console.Read();
        }
    }
}
