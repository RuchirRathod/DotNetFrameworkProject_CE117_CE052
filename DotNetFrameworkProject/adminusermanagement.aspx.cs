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
    public partial class adminusermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridViewUser.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            getUserByID();
        }

        protected void btnSuccess_Click(object sender, EventArgs e)
        {
            updateUserStatusByID("active");
        }

        protected void btnPending_Click(object sender, EventArgs e)
        {
            updateUserStatusByID("pending");
        }

        protected void btnDeactive_Click(object sender, EventArgs e)
        {
            updateUserStatusByID("deactive");
        }

        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {
            deleteUserByID();
        }

        bool checkIfUserExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from user_master_tbl where user_id='" + tbUserID.Text.Trim() + "';", con);
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

        void getUserByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from user_master_tbl where user_id='" + tbUserID.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        tbFullName.Text = dr.GetValue(0).ToString();
                        tbAccountStatus.Text = dr.GetValue(10).ToString();
                        tbDob.Text = dr.GetValue(1).ToString();
                        tbContactNo.Text = dr.GetValue(2).ToString();
                        tbEmailID.Text = dr.GetValue(3).ToString();
                        tbState.Text = dr.GetValue(4).ToString();
                        tbCity.Text = dr.GetValue(5).ToString();
                        tbPincode.Text = dr.GetValue(6).ToString();
                        tbAddress.Text = dr.GetValue(7).ToString();

                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateUserStatusByID(string status)
        {
            if (checkIfUserExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }
                    SqlCommand cmd = new SqlCommand("UPDATE user_master_tbl SET account_status='" + status + "' WHERE user_id='" + tbUserID.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridViewUser.DataBind();
                    Response.Write("<script>alert('User Status Updated');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid User ID');</script>");
            }

        }

        void deleteUserByID()
        {
            if (checkIfUserExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from user_master_tbl WHERE user_id='" + tbUserID.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('User Deleted Successfully');</script>");
                    clearForm();
                    GridViewUser.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid User ID');</script>");
            }
        }

        void clearForm()
        {
            tbUserID.Text = "";
            tbFullName.Text = "";
            tbAccountStatus.Text = "";
            tbDob.Text = "";
            tbContactNo.Text = "";
            tbEmailID.Text = "";
            tbState.Text = "";
            tbCity.Text = "";
            tbPincode.Text = "";
            tbAddress.Text = "";
        }
    }
}