using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Runtime.Remoting.Messaging;
using System.Web.Script.Serialization;

namespace SaleOrderBooking
{
    public partial class Logina : System.Web.UI.Page
    {

        static string cs = ConfigurationManager.ConnectionStrings["CN"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]

        public static string Getdataa(string username, string password)
        {
          

            SqlConnection con = new SqlConnection(cs);


            string query = "SELECT * FROM USERMAST WHERE UID=@uname AND PASS=@password";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {


                cmd.Parameters.AddWithValue("@uname", username);
                cmd.Parameters.AddWithValue("@password", password);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    return "Login Successful";

                }
                else
                {
                    return "Login Not Successful";
                }
            }
        }

        
    }
}




