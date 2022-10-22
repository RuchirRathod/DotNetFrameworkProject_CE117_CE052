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
    public partial class gamemanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIssue_Click(object sender, EventArgs e)
        {
            if (checkIfGameExist() && checkIfUserExist())
            {
                if (checkIfIssueEntryExist())
                {
                    Response.Write("<script>alert('This User already has this game');</script>");
                }
                else
                {
                    issueGame();
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong Game ID or User ID');</script>");
            }
        }
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            if (checkIfGameExist() && checkIfUserExist())
            {

                if (checkIfIssueEntryExist())
                {
                    returnGame();
                }
                else
                {
                    Response.Write("<script>alert('This Entry does not exist');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Wrong Game ID or User ID');</script>");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            getNames();
        }

        void issueGame()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO game_issue_tbl(user_id,user_name,game_id,game_name,issue_date,return_due) values(@user_id,@user_name,@game_id,@game_name,@issue_date,@return_due)", con);

                cmd.Parameters.AddWithValue("@user_id", tbUserID.Text.Trim());
                cmd.Parameters.AddWithValue("@user_name", tbUserName.Text.Trim());
                cmd.Parameters.AddWithValue("@game_id", tbGameID.Text.Trim());
                cmd.Parameters.AddWithValue("@game_name", tbGameName.Text.Trim());
                cmd.Parameters.AddWithValue("@issue_date", tbStartDate.Text.Trim());
                cmd.Parameters.AddWithValue("@return_due", tbEndDate.Text.Trim());

                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Game Issued Successfully');</script>");

                GridViewGameList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void returnGame()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Delete from game_issue_tbl WHERE game_id='" + tbGameID.Text.Trim() + "' AND user_id='" + tbUserID.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Game Returned Successfully');</script>");
                
                GridViewGameList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkIfGameExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from game_master_tbl WHERE game_id='" + tbGameID.Text.Trim() + "'", con);
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
                return false;
            }

        }

        bool checkIfUserExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select full_name from user_master_tbl WHERE user_id='" + tbUserID.Text.Trim() + "'", con);
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
                return false;
            }

        }

        bool checkIfIssueEntryExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from game_issue_tbl WHERE user_id='" + tbUserID.Text.Trim() + "' AND game_id='" + tbGameID.Text.Trim() + "'", con);
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
                return false;
            }
        }

        void getNames()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select game_name from game_master_tbl WHERE game_id='" + tbGameID.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    tbGameName.Text = dt.Rows[0]["game_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong Game ID');</script>");
                }

                cmd = new SqlCommand("select full_name from user_master_tbl WHERE user_id='" + tbUserID.Text.Trim() + "'", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    tbUserName.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong User ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

    }
}