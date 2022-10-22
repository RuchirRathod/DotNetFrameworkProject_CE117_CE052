using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetFrameworkProject
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null)
                {
                    btnUserLogin.Visible = true;
                    btnSignUp.Visible = true;

                    btnLogout.Visible = false;
                    btnUserProfile.Visible = false;


                    btnAdminLogin.Visible = true;
                    btnDevMgmt.Visible = false;
                    btnGameInventory.Visible = false;
                    btnGameMgmt.Visible = false;
                    btnUserMgmt.Visible = false;
                }
                else if (Session["role"].Equals("user"))
                {
                    btnUserLogin.Visible = false;
                    btnSignUp.Visible = false;

                    btnLogout.Visible = true;
                    btnUserProfile.Visible = true;
                    btnUserProfile.Text = "Hello " + Session["username"].ToString();

                    btnAdminLogin.Visible = true;
                    btnDevMgmt.Visible = false;
                    btnGameInventory.Visible = false;
                    btnGameMgmt.Visible = false;
                    btnUserMgmt.Visible = false;
                }
                else if (Session["role"].Equals("admin"))
                {
                    btnUserLogin.Visible = false;
                    btnSignUp.Visible = false;

                    btnLogout.Visible = true;
                    btnUserProfile.Visible = true;
                    btnUserProfile.Text = "Hello Admin";

                    btnAdminLogin.Visible = false;
                    btnDevMgmt.Visible = true;
                    btnGameInventory.Visible = true;
                    btnGameMgmt.Visible = true;
                    btnUserMgmt.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void btnDevMgmt_Click(object sender, EventArgs e)
        {
            Response.Redirect("developermanagement.aspx");
        }

        protected void btnGameInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("admingameinventory.aspx");
        }

        protected void btnGameMgmt_Click(object sender, EventArgs e)
        {
            Response.Redirect("gamemanagement.aspx");
        }

        protected void btnUserMgmt_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminusermanagement.aspx");
        }

        protected void btnViewGames_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewgames.aspx");
        }

        protected void btnUserLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx"); 
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            btnUserLogin.Visible = true;
            btnSignUp.Visible = true;

            btnLogout.Visible = false;
            btnUserProfile.Visible = false;


            btnAdminLogin.Visible = true;
            btnDevMgmt.Visible = false;
            btnGameInventory.Visible = false;
            btnGameMgmt.Visible = false;
            btnUserMgmt.Visible = false;

            Response.Redirect("homepage.aspx");
        }

        protected void btnUserProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("userprofile.aspx");
        }
    }
}