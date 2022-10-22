using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetFrameworkProject
{
    public partial class developermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridViewDev.DataBind();
        }

        // add button click
        protected void btnAddDeveloper_Click(object sender, EventArgs e)
        {
            if (checkIfDeveloperExists())
            {
                Response.Write("<script>alert('Developer with this ID already Exist. You cannot add another Developer with the same Developer ID');</script>");
            }
            else
            {
                addNewDeveloper();
            }
        }

        // update button click
        protected void btnUpdateDeveloper_Click(object sender, EventArgs e)
        {
            if (checkIfDeveloperExists())
            {
                updateDeveloper();
            }
            else
            {
                Response.Write("<script>alert('Developer does not exist.');</script>");
            }
        }

        // delete button click
        protected void btnDeleteDeveloper_Click(object sender, EventArgs e)
        {
            if (checkIfDeveloperExists())
            {
                deleteDeveloper();
            }
            else
            {
                Response.Write("<script>alert('Developer does not exist.');</script>");
            }
        }

        // Search button click
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            getDeveloperByID();
        }

        bool checkIfDeveloperExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from developer_master_tbl where developer_id='" + tbDeveloperID.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void addNewDeveloper()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO developer_master_tbl(developer_id,developer_name) values(@developer_id,@developer_name)", con);

                cmd.Parameters.AddWithValue("@developer_id", tbDeveloperID.Text.Trim());
                cmd.Parameters.AddWithValue("@developer_name", tbDeveloperName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Developer added Successfully');</script>");
                clearForm();
                GridViewDev.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateDeveloper()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE developer_master_tbl SET developer_name=@developer_name WHERE developer_id='" + tbDeveloperID.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@developer_name", tbDeveloperName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Developer Updated Successfully');</script>");
                clearForm();
                GridViewDev.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void deleteDeveloper()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from developer_master_tbl WHERE developer_id='" + tbDeveloperID.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Developer Deleted Successfully');</script>");
                clearForm();
                GridViewDev.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void getDeveloperByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from developer_master_tbl where developer_id='" + tbDeveloperID.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    tbDeveloperName.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Developer ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void clearForm()
        {
            tbDeveloperID.Text = "";
            tbDeveloperName.Text = "";
        }
    }
}