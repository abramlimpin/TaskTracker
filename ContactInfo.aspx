<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ContactInfo.aspx.cs" Inherits="ContactInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Contact Information
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="dashboard" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
<div class="one-half">
    <asp:Panel ID="pnlAdd" runat="server" Visible="false">
        <div class="note-box note-success hide-me">
            <p>Contact added.</p>
        </div>
    </asp:Panel>
    <form id="Form1" runat="server" class="form">
        <fieldset>
            <div class="widget">
                <div class="title"><img src="http://localhost:12345/TaskTracker/images/icons/light/user-2.png" alt="" class="title-icon" />
                <h6>Add a Contact</h6></div>
                <div class="form-row">
                    <label>Name</label>
                    <div class="form-right">
                    <span class="one-half">
                        <asp:TextBox ID="txtFN" runat="server" MaxLength="50"
                            placeholder="First Name" />
                        </span>
                    <span class="one-half">
                        <asp:TextBox ID="txtLN" runat="server" MaxLength="50"
                            placeholder="Last Name" />
                    </span></div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label>Nickname</label>
                    <div class="form-right"><span class="one-half">
                    <asp:TextBox ID="txtNickname" runat="server" MaxLength="50" />
                    </span></div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label>Contact</label>
                    <div class="form-right">
                    <span class="one-half">
                        <asp:TextBox ID="txtEmail" runat="server" MaxLength="50"
                            placeholder="Email Address" />
                    </span>
                    <span class="one-half">
                        <asp:TextBox ID="txtMobile" runat="server" MaxLength="50"
                            placeholder="Mobile No." />
                    </span>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label for="labelFor">Group</label>
                    <div class="form-right">
                    <asp:Panel ID="pnlGroup" runat="server">
                    <span class="one-half">
                        <asp:DropDownList ID="ddlGroup" runat="server" />
                    </span>
                    </asp:Panel>
                    </div>
                    <div class="clear"></div>
                </div>

                <div class="form-row">
                    <asp:LinkButton ID="btnUpdate" runat="server" class="wide-button blue-button" 
                        Text="Update Contact" Width="200" OnClick="btnUpdate_Click" />
                </div>
            </div>
        </fieldset>
    </form>
    </div>
</asp:Content>

