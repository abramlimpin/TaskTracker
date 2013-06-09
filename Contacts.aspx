<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Contacts.aspx.cs" Inherits="Contacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Contacts
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="dashboard" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <div class="widgets">
        <div class="one-half">
            <asp:Panel ID="pnlEdit" runat="server" Visible="false">
                <div class="note-box note-success hide-me">
                    <p>Contact information updated.</p>
                </div>
            </asp:Panel>
            <div class="widget">
                <div class="title"><img src="http://localhost:12345/TaskTracker/images/icons/light/user-2.png" alt="" class="title-icon" />
                <h6>Contact List</h6>
                </div>
                <ul class="users-lists">
                    <asp:ListView ID="lvContacts" runat="server">
                        <ItemTemplate>
                        <li>
                            <a href="#" title="" class="float-left"><img class="id-pic" src="images/icons/control/32/users.png" alt="" /></a>
                            <div class="user-informations">
                                <a href="#" title=""><strong><%# Eval("FullName") %>
                                 / <%# Eval("Nickname") %></strong></a>
                                <i><%# Eval("Email") %> / <%# Eval("Mobile") %></i>	
                            </div>
                            <div class="user-links">
                                <a href="ContactInfo.aspx?ID=<%# Eval("ContactID") %>&mode=edit" title="Edit a contact" class="tipW"><img src="http://localhost:12345/TaskTracker/images/icons/edit.png" alt="" /></a>
                                <a href="Contact.aspx?ID=<%# Eval("ContactID") %>&mode=edit" title="Delete a Contact" class="tipW"><img src="http://localhost:12345/TaskTracker/images/icons/remove.png" alt="" /></a>
                            </div>
                            <div class="clear"></div>
                        </li>    
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <li>
                                <center><h2>No contacts found.</h2></center>
                            </li>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </ul>
            </div>
        </div>
        <div class="one-half">
        <asp:Panel ID="pnlAdd" runat="server" Visible="false">
            <div class="note-box note-success hide-me">
                <p>Contact added.</p>
            </div>
        </asp:Panel>
        <form runat="server" class="form">
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
                        <span class="one-half">
                            <asp:TextBox ID="txtGroup" runat="server" 
                               placeholder="Or add a category name" />
                        </span>
                        </div>
                        <div class="clear"></div>
                    </div>

                    <div class="form-row">
                        <asp:LinkButton ID="btnAdd" runat="server" class="wide-button blue-button" 
                            Text="Add a Contact" Width="200" OnClick="btnAdd_Click" />
                    </div>
                </div>
            </fieldset>
        </form>
        </div>
    </div>
</asp:Content>

