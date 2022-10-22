<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewgames.aspx.cs" Inherits="DotNetFrameworkProject.viewgames" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
            <div class="col-md-12">
                <div class="card">
                    <center>
                         <div class="row">
                            <div class="col-sm-12">
                                <center>
                                    <h3>Game Inventory</h3>
                                </center>
                            </div>
                        </div>
                        <div class="card-body">
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
                    </center>
                </div>
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br>
            <br>
        </div>
</asp:Content>
