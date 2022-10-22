using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.NetworkInformation;
using System.Net;

namespace DotNetFrameworkProject
{
    public partial class admingameinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillDeveloperValues();
            }
            GridViewGameInventory.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            getGameByID();
        }

        protected void btnAddGame_Click(object sender, EventArgs e)
        {
            if (checkIfGameExists())
            {
                Response.Write("<script>alert('Game Already Exists, try some other Game ID');</script>");
            }
            else
            {
                addNewGame();
            }
        }

        protected void btnUpdateGame_Click(object sender, EventArgs e)
        {
            updateGameByID();
        }

        protected void btnDeleteGame_Click(object sender, EventArgs e)
        {
            deleteGameByID();

        }

        bool checkIfGameExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from game_master_tbl where game_id='" + tbGameID.Text.Trim() + "' OR game_name='" + tbGameName.Text.Trim() + "';", con);
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

        void getGameByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from game_master_tbl WHERE game_id='" + tbGameID.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    tbGameName.Text = dt.Rows[0]["game_name"].ToString();
                    tbReleaseDate.Text = dt.Rows[0]["release_date"].ToString();
                    tbEdition.Text = dt.Rows[0]["edition"].ToString();
                    tbCost.Text = dt.Rows[0]["game_cost"].ToString().Trim();
                    tbDescription.Text = dt.Rows[0]["game_description"].ToString();

                    ddlLanguage.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    ddlDeveloperName.SelectedValue = dt.Rows[0]["developer_name"].ToString().Trim();

                    ListBoxGenre.ClearSelection();
                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < ListBoxGenre.Items.Count; j++)
                        {
                            if (ListBoxGenre.Items[j].ToString() == genre[i])
                            {
                                ListBoxGenre.Items[j].Selected = true;

                            }
                        }
                    }
                    global_filepath = dt.Rows[0]["game_img_link"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Invalid Game ID');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void addNewGame()
        {
            try
            {
                string genres = "";
                foreach (int i in ListBoxGenre.GetSelectedIndices())
                {
                    genres = genres + ListBoxGenre.Items[i] + ",";
                }

                genres = genres.Remove(genres.Length - 1);

                string filepath = "~/game_inventory/inventory.jpg";
                string filename = Path.GetFileName(ImageFileUpload.PostedFile.FileName);
                ImageFileUpload.SaveAs(Server.MapPath("game_inventory/" + filename));
                filepath = "~/game_inventory/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO game_master_tbl(game_id,game_name,genre,developer_name,release_date,language,edition,game_cost,game_description,game_img_link) values(@game_id,@game_name,@genre,@developer_name,@release_date,@language,@edition,@game_cost,@game_description,@game_img_link)", con);

                cmd.Parameters.AddWithValue("@game_id", tbGameID.Text.Trim());
                cmd.Parameters.AddWithValue("@game_name", tbGameName.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@developer_name", ddlDeveloperName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@release_date", tbReleaseDate.Text.Trim());
                cmd.Parameters.AddWithValue("@language", ddlLanguage.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", tbEdition.Text.Trim());
                cmd.Parameters.AddWithValue("@game_cost", tbCost.Text.Trim());                
                cmd.Parameters.AddWithValue("@game_description", tbDescription.Text.Trim());                
                cmd.Parameters.AddWithValue("@game_img_link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Game added successfully.');</script>");
                GridViewGameInventory.DataBind();
                clearForm();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateGameByID()
        {

            if (checkIfGameExists())
            {
                try
                {
                    string genres = "";
                    foreach (int i in ListBoxGenre.GetSelectedIndices())
                    {
                        genres = genres + ListBoxGenre.Items[i] + ",";
                    }
                    genres = genres.Remove(genres.Length - 1);

                    string filepath = "~/game_inventory/inventory";
                    string filename = Path.GetFileName(ImageFileUpload.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        ImageFileUpload.SaveAs(Server.MapPath("game_inventory/" + filename));
                        filepath = "~/game_inventory/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE game_master_tbl set game_name=@game_name, genre=@genre, developer_name=@developer_name, release_date=@release_date, language=@language, edition=@edition, game_cost=@game_cost, game_description=@game_description, game_img_link=@game_img_link where game_id='" + tbGameID.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@game_name", tbGameName.Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genres);
                    cmd.Parameters.AddWithValue("@developer_name", ddlDeveloperName.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@release_date", tbReleaseDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", ddlLanguage.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@edition", tbEdition.Text.Trim());
                    cmd.Parameters.AddWithValue("@game_cost", tbCost.Text.Trim());
                    cmd.Parameters.AddWithValue("@game_description", tbDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@game_img_link", filepath);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridViewGameInventory.DataBind();
                    Response.Write("<script>alert('Game Updated Successfully');</script>");
                    clearForm();


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Game ID');</script>");
            }
        }

        void deleteGameByID()
        {
            if (checkIfGameExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from game_master_tbl WHERE game_id='" + tbGameID.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Game Deleted Successfully');</script>");
                    clearForm();
                    GridViewGameInventory.DataBind();

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

        void fillDeveloperValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT developer_name from developer_master_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddlDeveloperName.DataSource = dt;
                ddlDeveloperName.DataValueField = "developer_name";
                ddlDeveloperName.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void clearForm()
        {
            tbGameID.Text = "";
            tbGameName.Text = "";
            tbReleaseDate.Text = "";
            tbEdition.Text = "";
            tbCost.Text = "";
            tbDescription.Text = "";
            ListBoxGenre.Text = "";
        }
    }
}