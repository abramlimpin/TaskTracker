<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="dashboard" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <form id="Form1" runat="server" class="form">
        <fieldset>
            <div class="widget">
                <div class="title"><img src="http://localhost:12345/TaskTracker/images/icons/light/user.png" alt="" class="title-icon" />
                <h6>User Information</h6></div>
                <div class="form-row">
                    <label>Email Address</label>
                    <div class="form-right"><span class="one-half">
                    <asp:TextBox ID="txtEmail" runat="server" MaxLength="80" />
                    </span></div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label>First Name</label>
                    <div class="form-right"><span class="one-half">
                    <asp:TextBox ID="txtFN" runat="server" MaxLength="50" />
                    </span></div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label>Last Name</label>
                    <div class="form-right"><span class="one-half">
                    <asp:TextBox ID="txtLN" runat="server" MaxLength="50" />
                    </span></div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label>Mobile Number</label>
                    <div class="form-right"><span class="one-half">
                    <asp:TextBox ID="txtMobile" runat="server" MaxLength="20" />
                    </span></div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label for="labelFor">Change Password</label>
                    <div class="form-right"><span class="one-half">
                        <asp:TextBox ID="txtPassword" runat="server" MaxLength="30"
                           TextMode="Password" class="tipN" 
                           Title="Leave this blank if you don't want to change your password." />
                    </span>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label for="labelFor">Repeat Password</label>
                    <div class="form-right"><span class="one-half">
                        <asp:TextBox ID="txtRepeatPassword" runat="server" MaxLength="30"
                           TextMode="Password"  />
                    </span>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <asp:LinkButton ID="btnUpdate" runat="server" class="wide-button blue-button" 
                        Text="Update Profile" Width="200" OnClick="btnUpdate_Click" />
                </div>
            </div>
        </fieldset>
    </form>
</asp:Content>

