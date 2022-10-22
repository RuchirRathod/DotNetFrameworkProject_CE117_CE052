<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="developermanagement.aspx.cs" Inherits="DotNetFrameworkProject.developermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Developer Details</h4>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                        <img width="100px" src="images/developer.png" />
                                       
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label id="lblDeveloperID">*Developer ID:</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="tbDeveloperID" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="btnSearch" runat="server" Text="Go" OnClick="btnSearch_Click" CausesValidation="False" />
                                        <asp:RequiredFieldValidator ID="devIDRequireValidator" runat="server" ControlToValidate="tbDeveloperID" ErrorMessage="Please enter Developer id." ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label id="lblDeveloperName">*Developer Name:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="tbDeveloperName" runat="server" placeholder="Developer Name"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="devNameRequiredValidator" runat="server" ControlToValidate="tbDeveloperName" ErrorMessage="Please enter developer name." ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="btnAddDeveloper" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="btnAddDeveloper_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnUpdateDeveloper" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="btnUpdateDeveloper_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnDeleteDeveloper" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="btnDeleteDeveloper_Click" />
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
                                        <h4>Developer List</h4>
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
                                <asp:GridView class="table table-striped table-bordered" ID="GridViewDev" runat="server" AutoGenerateColumns="False" DataKeyNames="developer_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="developer_id" HeaderText="developer_id" ReadOnly="True" SortExpression="developer_id" />
                                        <asp:BoundField DataField="developer_name" HeaderText="developer_name" SortExpression="developer_name" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [developer_master_tbl]"></asp:SqlDataSource>
                            </div>
                        </div>


                    </div>
                </div>


            </div>

        </div>
    </div>
</asp:Content>
