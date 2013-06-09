<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TaskInfo.aspx.cs" Inherits="TaskInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Task Information
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="dashboard" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <form id="Form1" runat="server" class="form">
        <fieldset>
        <div class="one-third">
            <div class="widget">
                <div class="title"><img src="http://localhost:12345/TaskTracker/images/icons/light/stop-watch.png" alt="" class="title-icon" />
                <h6>Task Information</h6></div>
                <div class="form-row">
                    <label>Task Name</label>
                    <div class="form-right"><h2><asp:Label ID="lblName" runat="server" /></h2></div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label for="labelFor">Category</label>
                    <div class="form-right"><h2><asp:Label ID="lblCategory" runat="server" /></h2></div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label>Start Date / Time</label>
                    <div class="form-right"><h2><asp:Label ID="lblStartDateTime" runat="server" /></h2></div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label>End Date / Time</label>
                    <div class="form-right"><h2><asp:Label ID="lblEndDateTime" runat="server" /></h2></div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label>Delegated To</label>
                    <div class="form-right"><h2><asp:Label ID="lblDelegates" runat="server" /></h2></div>
                    <div class="clear"></div>
                </div>
                 <div class="form-row">
                    <label>Reminder Settings</label>
                    <div class="form-right">
                        <asp:CheckBox ID="cbEmail" runat="server" Text="Email" Enabled="false" />
                        <asp:CheckBox ID="cbMobile" runat="server" Text="Mobile" Enabled="false" />
                    </div>
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
            </div>
            </div>
            <div class="two-third">
                <asp:Panel ID="pnlAdd" runat="server" Visible="false">
                <div class="note-box note-success hide-me">
                    <p>Added sub task!</p>
                </div>  
                </asp:Panel>
                <div class="widget">
                    <div class="title"><img src="http://localhost:12345/TaskTracker/images/icons/light/stop-watch.png" alt="" class="title-icon" />
                    <h6>Sub Task Information</h6></div>
                    <div class="form-row">
                        <label>Task Name</label>
                        <div class="form-right"><span class="one-half">
                        <asp:TextBox ID="txtSubTask" runat="server" MaxLength="50" placeholder="Max 50 characters here" />
                        </span>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="form-row">
                        <label for="labelFor">Description</label>
                        <div class="form-right"><span class="one-half">
                            <asp:TextBox ID="txtSubTaskDesc" runat="server"
                                class="auto-growing lim" TextMode="MultiLine" />
                        </span>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="form-row">
                        <label>Sequence</label>
                        <div class="form-right">
                        <span class="one-fourth">
                        <asp:TextBox ID="txtSequenceNo" runat="server" placeholder="0-10" />
                        </span>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="form-row">
                        <label>Attachment</label>
                        <div class="form-right">
                            <asp:FileUpload ID="fuAttachment" runat="server" />
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="form-row">
                        <asp:LinkButton ID="btnAdd" runat="server" class="wide-button blue-button" 
                            Text="Add a Task" Width="200" OnClick="btnAdd_Click" />
                    </div>
                </div>
            </div>
        </fieldset>
    </form>
</asp:Content>

