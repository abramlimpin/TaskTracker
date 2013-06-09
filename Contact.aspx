<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    <asp:Label ID="lblTitle" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form id="Form1" runat="server" class="form">
        <fieldset>
            <div class="widget">
                <div class="title"><img src="http://localhost:12345/TaskTracker/images/icons/light/stop-watch.png" alt="" class="title-icon" />
                <h6>Task Information</h6></div>
                <div class="form-row">
                    <label>Task Name</label>
                    <div class="form-right"><span class="one-half">
                    <asp:TextBox ID="txtName" runat="server" MaxLength="50" placeholder="Max 10 characters here" />
                    </span></div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label for="labelFor">Category</label>
                    <div class="form-right"><asp:DropDownList ID="ddlCategories" runat="server"
                        class="one-half" /></div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label>Start Date / Time</label>
                    <div class="form-right">
                        <asp:TextBox ID="txtStartDate" runat="server" class="datepicker" /> / 
                        <asp:TextBox ID="txtStartTime" runat="server" class="time-picker" size="8" />
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label>End Date / Time</label>
                    <div class="form-right">
                        <asp:TextBox ID="txtEndDate" runat="server" class="datepicker" /> / 
                        <asp:TextBox ID="txtEndTime" runat="server" class="time-picker" size="8" />
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label>Delegate To</label>
                    <div class="form-right"><asp:Button ID="btnDelegate" runat="server" Text="Select Contact"  /></div>
                    <div class="clear"></div>
                </div>
                <asp:Panel ID="pnlSequence" runat="server" Visible="false">
                    <div class="form-row">
                        <label>Sequence No. </label>
                        <div class="form-right">
                            <span class="one-fourth">
                                <asp:TextBox ID="txtSequence" runat="server" />
                            </span>
                        </div>
                        <div class="clear"></div>
                    </div>
                </asp:Panel>
                <div class="form-row">
                    <asp:LinkButton ID="btnAdd" runat="server" class="wide-button blue-button" 
                        Text="Add a Contact" Width="200" OnClick="btnAdd_Click" />
                </div>
            </div>
        </fieldset>
    </form>
</asp:Content>

