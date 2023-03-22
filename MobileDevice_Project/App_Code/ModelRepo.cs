using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MobileDevice_Project.App_Code
{
    public class ModelRepo
    {
        SqlConnection con;
        public ModelRepo()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ModelDB"].ConnectionString);
        }
        public IList<Model> Get()
        {
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Models", con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);

                var data= dt.AsEnumerable()
                     .Select(r => new Model
                     {
                         ModelId = r.Field<int>("ModelId"),
                         ModelName = r.Field<string>("ModelName"),
                         Brand = r.Field<string>("Brand")
                     }
                     ).ToList();
                return data;
            }

        }
        public void Insert(Model m)
        {
            using (SqlCommand cmd = new SqlCommand("INSERT INTO Models VALUES (@n, @b)", con))
            {
                cmd.Parameters.AddWithValue("@n", m.ModelName);
                cmd.Parameters.AddWithValue("@b", m.Brand);
                
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        public void Update(Model m)
        {
            using (SqlCommand cmd = new SqlCommand("UPDATE Models SET ModelName=@n, Brand=@b Where ModelId=@i", con))
            {
                cmd.Parameters.AddWithValue("@n", m.ModelName);
                cmd.Parameters.AddWithValue("@b", m.Brand);
                cmd.Parameters.AddWithValue("@i", m.ModelId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        public void Delete(Model m)
        {
            using (SqlCommand cmd = new SqlCommand("DELETE Models Where ModelId=@i", con))
            {

                cmd.Parameters.AddWithValue("@i", m.ModelId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        public int ModelCount()
        {
            using(SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Models", con))
            {
                con.Open();
                int n = (int)cmd.ExecuteScalar();
                con.Close();
                return n;
            }
        }
    }
}