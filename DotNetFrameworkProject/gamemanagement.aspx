<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="gamemanagement.aspx.cs" Inherits="DotNetFrameworkProject.gamemanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("
                < thead ></thead > ").append($(this).find("tr: first"))).dataTable();
       });
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
                           <h4>Game Management</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="images/inventory.jpg" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label id="lblUserID">*User ID:</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="tbUserID" runat="server" placeholder="User ID"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="uIDRequirwValidator" runat="server" ControlToValidate="tbUserID" ErrorMessage="Please enter user id." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label id="lblGameID">*Game ID:</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="tbGameID" runat="server" placeholder="Game ID"></asp:TextBox>
                              <asp:Button class="btn btn-primary" ID="btnSearch" runat="server" Text="Go" OnClick="btnSearch_Click" CausesValidation="False" />
                               <asp:RequiredFieldValidator ID="gameIDRequireValidator" runat="server" ControlToValidate="tbGameID" ErrorMessage="Please enter game id."></asp:RequiredFieldValidator>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label id="lblUserName">User Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="tbUserName" runat="server" placeholder="User Name" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label id="lblGameName">Game Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="tbGameName" runat="server" placeholder="Game Name" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label id="lblStartDate">*Start Date:</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="tbStartDate" runat="server" placeholder="Start Date" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="startDateRequireValidator" runat="server" ControlToValidate="tbStartDate" ErrorMessage="Please enter start date." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label id="lblEndDate">*End Date:</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="tbEndDate" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="endDateRequireValidator" runat="server" ControlToValidate="tbEndDate" ErrorMessage="Please enter end date." ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbStartDate" ControlToValidate="tbEndDate" ErrorMessage="Enter a valid last date." ForeColor="Red" Operator="GreaterThan"></asp:CompareValidator>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-6">
                        <asp:Button ID="btnIssue" class="btn btn-lg btn-block btn-primary" runat="server" Text="Issue" OnClick="btnIssue_Click" />
                     </div>
                     <div class="col-6">
                        <asp:Button ID="btnReturn" class="btn btn-lg btn-block btn-success" runat="server" Text="Return" OnClick="btnReturn_Click" />
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
                           <h4>Game List</h4>
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
                        <asp:GridView class="table table-striped table-bordered" ID="GridViewGameList" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="user_id" HeaderText="Member ID" SortExpression="member_id" />
                                <asp:BoundField DataField="user_name" HeaderText="Member Name" SortExpression="member_name" />
                                <asp:BoundField DataField="game_id" HeaderText="Game ID" SortExpression="game_id" />
                                <asp:BoundField DataField="game_name" HeaderText="Game Name" SortExpression="game_name" />
                                <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                                <asp:BoundField DataField="return_due" HeaderText="Return Date" SortExpression="return_due" />
                            </Columns>
                         </asp:GridView>
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [game_issue_tbl]"></asp:SqlDataSource>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>
