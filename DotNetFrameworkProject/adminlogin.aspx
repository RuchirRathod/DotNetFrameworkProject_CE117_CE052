<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="DotNetFrameworkProject.adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="150px" src="images/adminuser.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h3>Admin Login</h3>
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
                        <label id="lblAdminID">*Admin ID:</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="tbAdminID" runat="server" placeholder="Admin ID"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="adminIDRequieValidator" runat="server" ControlToValidate="tbAdminID" ErrorMessage="please enter ID." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <label id="lblPassword">*Password:</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="tbAdminPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="passwordRequireValidator" runat="server" ControlToValidate="tbAdminPassword" ErrorMessage="Please enter password." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="btnAdminLogin" runat="server" Text="Login" OnClick="btnAdminLogin_Click" />
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br><br>
         </div>
      </div>
   </div>
</asp:Content>
