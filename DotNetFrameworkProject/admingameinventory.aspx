<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admingameinventory.aspx.cs" Inherits="DotNetFrameworkProject.admingameinventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Game Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img id="imgview" Height="150px" width="100px" src="game_inventory/inventory.jpg" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:FileUpload onChange="readURL(this);" class="form-control" ID="ImageFileUpload" runat="server" />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                         *<label id="lblGameID">Game ID:</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="tbGameID" runat="server" placeholder="Game ID"></asp:TextBox>
                              <asp:LinkButton class="form-control btn btn-primary" ID="btnSearch" runat="server" Text="Go" OnClick="btnSearch_Click" CausesValidation="False"/>
                               <asp:RequiredFieldValidator ID="gIDRequire" runat="server" ControlToValidate="tbGameID" ErrorMessage="Please enter game id." ForeColor="Red"></asp:RequiredFieldValidator>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-8">
                        <label id="lblGameName">*Game Name:</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="tbGameName" runat="server" placeholder="Game Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="gNameRequire" runat="server" ControlToValidate="tbGameName" ErrorMessage="Please enter a game name." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label id="lblLanguage">Language</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="ddlLanguage" runat="server">
                              <asp:ListItem Text="English" Value="English" />
                              <asp:ListItem Text="Hindi" Value="Hindi" />
                              <asp:ListItem Text="French" Value="French" />
                              <asp:ListItem Text="German" Value="German" />
                              <asp:ListItem Text="Japanese" Value="Japanese" />
                              <asp:ListItem Text="Korean" Value="Korean" />
                           </asp:DropDownList>
                        </div>
                        <label id="lblEdition">*Edition:</label><div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="tbEdition" runat="server" placeholder="Edition"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="editionRequire" runat="server" ControlToValidate="tbEdition" ErrorMessage="Please specify edition." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label id="lblDeveloperName">*Developer Name:</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="ddlDeveloperName" runat="server">
                           </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="devRequire" runat="server" ControlToValidate="ddlDeveloperName" ErrorMessage="Please select developername." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <label id="lblReleaseDate">*Release Date:</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="tbReleaseDate" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="dateRequire" runat="server" ControlToValidate="tbReleaseDate" ErrorMessage="Please select release date." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label id="lblGenre">*Genre:</label>
                        <div class="form-group">
                           <asp:ListBox CssClass="form-control" ID="ListBoxGenre" runat="server" SelectionMode="Multiple" Rows="5">
                              <asp:ListItem Text="Sandbox" Value="Sandbox" />
                              <asp:ListItem Text="Real-time strategy" Value="Real-time strategy" />
                              <asp:ListItem Text="Shooters" Value="Shooters" />
                              <asp:ListItem Text="Multiplayer online battle arena" Value="Multiplayer online battle arena" />
                              <asp:ListItem Text="Role-plying" Value="Role-plying" />
                              <asp:ListItem Text="Simulation" Value="Simulation" />
                              <asp:ListItem Text="Sports" Value="Sports" />
                              <asp:ListItem Text="Puzzelrs" Value="Puzzelrs" />
                              <asp:ListItem Text="Party Games" Value="Party Games" />
                              <asp:ListItem Text="Action-adventure" Value="Action-adventure" />
                              <asp:ListItem Text="Survival and Horror" Value="Survival and Horror" />
                              <asp:ListItem Text="Plarformer" Value="Plarformer" />
                           </asp:ListBox>
                            <asp:RequiredFieldValidator ID="genreRequire" runat="server" ControlToValidate="ListBoxGenre" ErrorMessage="Please select genre of game." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label id="lblDescription">Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="tbDescription" runat="server" placeholder="Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col-md-6" id="lblCost">
                        <label>*Cost:</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="tbCost" runat="server" placeholder="Cost" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="costRequire" runat="server" ControlToValidate="tbCost" ErrorMessage="please enter price cost." ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="costRegular" runat="server" ControlToValidate="tbCost" ErrorMessage="Enter only numbers 10 - 10K." ForeColor="Red" ValidationExpression="^\d{0,8}(\.\d{1,4})?$"></asp:RegularExpressionValidator>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-4">
                        <asp:Button ID="btnAddGame" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="btnAddGame_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="btnUpdateGame" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="btnUpdateGame_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="btnDeleteGame" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="btnDeleteGame_Click" />
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br>
            <br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Game Inventory</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridViewGameInventory" runat="server" AutoGenerateColumns="False" DataKeyNames="game_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="game_id" HeaderText="Game ID" ReadOnly="True" SortExpression="game_id">
                                    <ControlStyle Font-Bold="True" />
                                    <ItemStyle Font-Bold="True" />
                                </asp:BoundField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-lg-10">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <asp:Label ID="lblgameName" runat="server" Text='<%# Eval("game_name") %>' Font-Bold="True" Font-Size="X-Large" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <span>Developer - </span>
                                                            <asp:Label ID="lbldeveloperName" runat="server" Font-Bold="True" Text='<%# Eval("developer_name") %>' />
                                                            &nbsp;
                                                            <span>
                                                                <span>&nbsp;</span>
                                                                Genre - 
                                                            </span>
                                                            <asp:Label ID="lblgenre" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                            &nbsp; 
                                                            <span>
                                                                Language -
                                                                <span>&nbsp;</span>
                                                                <asp:Label ID="lbllanguage" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            Edition -
                                                            <asp:Label ID="lbledition" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>' />
                                                            &nbsp; 
                                                            Cost -
                                                            <asp:Label ID="lblcost" runat="server" Font-Bold="True" Text='<%# Eval("game_cost") %>' />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            Description -
                                                            <asp:Label ID="lbldescription" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("game_description") %>' />
                                                        </div>
                                                        </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("game_img_link") %>' />
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                         </asp:GridView>
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [game_master_tbl]"></asp:SqlDataSource>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>
