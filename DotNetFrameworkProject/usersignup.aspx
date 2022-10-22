<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="DotNetFrameworkProject.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
      <div class="row">
         <div class="col-md-8 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100" src="images/generaluser.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>User Registration</h4>
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
                        <label>*Full Name:</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="tbFullName" runat="server" placeholder="Full Name" Width="252px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="fNameRequireValidator" runat="server" ControlToValidate="tbFullName" ErrorMessage="Please enter your full name." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Date of Birth</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="tbDob" runat="server" placeholder="Password" TextMode="Date" Width="256px"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>*Contact No:</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="tbContact" runat="server" placeholder="Contact No" TextMode="Number" Width="244px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="cNumberRequireValidator" runat="server" ControlToValidate="tbContact" ErrorMessage="Please enter your contact number." ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="cNumberRegularValidator" runat="server" ControlToValidate="tbContact" ErrorMessage="Enter only 10 digits." ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>*Email ID:</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="tbEmailID" runat="server" placeholder="Email ID" TextMode="Email" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="emailRequireValidator" runat="server" ControlToValidate="tbEmailID" ErrorMessage="Please enter your email address." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>State</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="ddlState" runat="server" Width="166px">
                              <asp:ListItem Text="Select" Value="select" />
                              <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
                              <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
                              <asp:ListItem Text="Assam" Value="Assam" />
                              <asp:ListItem Text="Bihar" Value="Bihar" />
                              <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                              <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                              <asp:ListItem Text="Goa" Value="Goa" />
                              <asp:ListItem Text="Gujarat" Value="Gujarat" />
                              <asp:ListItem Text="Haryana" Value="Haryana" />
                              <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh" />
                              <asp:ListItem Text="Jammu and Kashmir" Value="Jammu and Kashmir" />
                              <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
                              <asp:ListItem Text="Karnataka" Value="Karnataka" />
                              <asp:ListItem Text="Kerala" Value="Kerala" />
                              <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh" />
                              <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                              <asp:ListItem Text="Manipur" Value="Manipur" />
                              <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
                              <asp:ListItem Text="Mizoram" Value="Mizoram" />
                              <asp:ListItem Text="Nagaland" Value="Nagaland" />
                              <asp:ListItem Text="Odisha" Value="Odisha" />
                              <asp:ListItem Text="Punjab" Value="Punjab" />
                              <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                              <asp:ListItem Text="Sikkim" Value="Sikkim" />
                              <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
                              <asp:ListItem Text="Telangana" Value="Telangana" />
                              <asp:ListItem Text="Tripura" Value="Tripura" />
                              <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh" />
                              <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
                              <asp:ListItem Text="West Bengal" Value="West Bengal" />
                           </asp:DropDownList>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>City</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="tbCity" runat="server" placeholder="City" Width="123px"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Pincode</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="tbPincode" runat="server" placeholder="Pincode" TextMode="Number" Width="171px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="pincodeRegularVelidator" runat="server" ControlToValidate="tbPincode" ErrorMessage="Enter only 6 digits." ForeColor="Red" ValidationExpression="[0-9]{6}"></asp:RegularExpressionValidator>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <label>Full Address</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="tbAddress" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2" Width="327px"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <span class="badge badge-pill badge-info">Login Credentials</span>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>*User ID:</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="tbUserID" runat="server" placeholder="User ID" Width="263px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="userNameRequireValidator" runat="server" ControlToValidate="tbUserID" ErrorMessage="Please enter username." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>*Password:</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="tbPassword" runat="server" placeholder="Password" TextMode="Password" Width="294px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="passwordRequireValidator" runat="server" ControlToValidate="tbPassword" ErrorMessage="Please enter password." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <div class="form-group">
                            <asp:Button class="btn btn-success btn-block btn-lg" ID="btnUserSignUp" runat="server" Text="Sign Up" OnClick="btnUserSignUp_Click" />
                        </div>
                        </center>
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br><br>
         </div>
      </div>
   </div>
</asp:Content>
