<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Task.aspx.cs" Inherits="Task" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    <asp:Label ID="lblTitle" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form">
        <fieldset>
        <asp:Panel ID="pnlTaskForm" runat="server">
            <div class="widget">
                <div class="title"><img src="http://localhost:12345/TaskTracker/images/icons/light/stop-watch.png" alt="" class="title-icon" />
                <h6>Task Information</h6></div>
                <div class="form-row">
                    <label>Template</label>
                    <div class="form-right"><span class="one-half">
                        <asp:DropDownList ID="ddlTemplate" runat="server"
                            AutoPostBack="true" 
                            onselectedindexchanged="ddlTemplate_SelectedIndexChanged">
                            <asp:ListItem>Innovation</asp:ListItem>
                            <asp:ListItem>Structured</asp:ListItem>
                            <asp:ListItem>Basic</asp:ListItem>
                        </asp:DropDownList>
                    </span></div>
                    <div class="clear"></div>
                    </div>
                <asp:Panel ID="pnlTemplate" runat="server">
                    <div class="form-row"> 
                        <h2>Idea Stage</h2>
                        <label>Problem</label>
                        <div class="form-right"><span class="one-half">
                        <asp:TextBox ID="txt1" runat="server" MaxLength="50" 
                            TextMode="MultiLine" placeholder="Max 50 characters here" />
                        </span></div>
                        <div class="clear"></div>
                    </div>
                    <div class="form-row">
                        <label>Alitenate Solution</label>
                        <div class="form-right"><span class="one-half">
                        <asp:TextBox ID="txt2" runat="server" MaxLength="50" 
                            TextMode="MultiLine" placeholder="Max 50 characters here" />
                        </span></div>
                        <div class="clear"></div>
                    </div>
                    <div class="form-row">
                        <label>Solution</label>
                        <div class="form-right"><span class="one-half">
                        <asp:TextBox ID="txt3" runat="server" MaxLength="50" 
                            TextMode="MultiLine" placeholder="Max 50 characters here" />
                        </span></div>
                        <div class="clear"></div>
                    </div>
                    <div class="form-row">
                        <label>Customer Segments</label>
                        <div class="form-right"><span class="one-half">
                        <asp:TextBox ID="txt4" runat="server" MaxLength="50" 
                            TextMode="MultiLine" placeholder="Max 50 characters here" />
                        </span></div>
                        <div class="clear"></div>
                    </div>
                    <div class="form-row">
                        <label>Early Adopters</label>
                        <div class="form-right"><span class="one-half">
                        <asp:TextBox ID="txt5" runat="server" MaxLength="50" 
                            TextMode="MultiLine" placeholder="Max 50 characters here" />
                        </span></div>
                        <div class="clear"></div>
                    </div>
                    <div class="form-row">
                        <label>Unique Value Proposition</label>
                        <div class="form-right"><span class="one-half">
                        <asp:TextBox ID="txt6" runat="server" MaxLength="50" 
                            TextMode="MultiLine" placeholder="Max 50 characters here" />
                        </span></div>
                        <div class="clear"></div>
                    </div>
                    <div class="form-row">
                        <label>High-Level Concept</label>
                        <div class="form-right"><span class="one-half">
                        <asp:TextBox ID="txt7" runat="server" MaxLength="50" 
                            TextMode="MultiLine" placeholder="Max 50 characters here" />
                        </span></div>
                        <div class="clear"></div>
                    </div>
                    <div class="form-row">
                        <label>Channels</label>
                        <div class="form-right"><span class="one-half">
                        <asp:TextBox ID="txt8" runat="server" MaxLength="50" 
                            TextMode="MultiLine" placeholder="Max 50 characters here" />
                        </span></div>
                        <div class="clear"></div>
                    </div>
                    <div class="form-row">
                        <label>Revenue Streams</label>
                        <div class="form-right"><span class="one-half">
                        <asp:TextBox ID="txt9" runat="server" MaxLength="50" 
                            TextMode="MultiLine" placeholder="Max 50 characters here" />
                        </span></div>
                        <div class="clear"></div>
                    </div>
                    <div class="form-row">
                        <label>Cost Structure</label>
                        <div class="form-right"><span class="one-half">
                        <asp:TextBox ID="txt10" runat="server" MaxLength="50" 
                            TextMode="MultiLine" placeholder="Max 50 characters here" />
                        </span></div>
                        <div class="clear"></div>
                    </div>
                    <div class="form-row">
                        <label>Unfair Advantage</label>
                        <div class="form-right"><span class="one-half">
                        <asp:TextBox ID="txt11" runat="server" MaxLength="50" 
                            TextMode="MultiLine" placeholder="Max 50 characters here" />
                        </span></div>
                        <div class="clear"></div>
                    </div>
                    <div class="form-row">
                        <label><h2>Pirate Metrics</h2></label>
                        <div class="form-right">
                        <asp:CheckBoxList ID="cblMetrics" runat="server"
                            RepeatDirection="Horizontal">
                            <asp:ListItem>Acquisition</asp:ListItem>
                            <asp:ListItem>Activation</asp:ListItem>
                            <asp:ListItem>Retention</asp:ListItem>
                            <asp:ListItem>Revenue</asp:ListItem>
                            <asp:ListItem>Referral</asp:ListItem>
                        </asp:CheckBoxList>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="form-row"> 
                        <h2>Development Stage</h2>
                        <br />
                        <label>Choose Roles</label>
                        <div class="form-right">
                        <asp:DropDownList ID="ddlContacts" runat="server" />
                            <asp:DropDownList ID="ddlRole" runat="server">
                                <asp:ListItem>Developer</asp:ListItem>
                                <asp:ListItem>Designer</asp:ListItem>
                                <asp:ListItem>QA</asp:ListItem>
                            </asp:DropDownList><span class="one-third">
                            <asp:TextBox ID="txtTaskRole" runat="server" />
                            </span>
                        </div><div class="clear"></div>
                    </div>
                    <div class="form-row">
                        <asp:LinkButton ID="btnAddTask" runat="server" class="wide-button blue-button" 
                            Text="Add a Task" Width="200" />
                    </div>
                    </asp:Panel>
                </div>
                <asp:Panel ID="pnlBasic" runat="server" Visible="false">
                <div class="form-row">
                    <label>Task Name</label>
                    <div class="form-right"><span class="one-half">
                    <asp:TextBox ID="txtName" runat="server" MaxLength="50" placeholder="Max 50 characters here" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                        runat="server" ErrorMessage="" ControlToValidate="txtName" />
                    </span></div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label for="labelFor">Category</label>
                    <div class="form-right"><span class="one-half">
                        <asp:TextBox ID="txtCategory" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                        runat="server" ErrorMessage="" ControlToValidate="txtCategory" />
                    </span>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label>Start Date / Time</label>
                    <div class="form-right">
                        <asp:TextBox ID="txtStartDate" runat="server" class="datepicker" /> / 
                        <asp:TextBox ID="txtStartTime" runat="server" class="time-picker" size="8" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                        runat="server" ErrorMessage="" ControlToValidate="txtStartDate" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                        runat="server" ErrorMessage="" ControlToValidate="txtStartTime" />
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label>End Date / Time</label>
                    <div class="form-right">
                        <asp:TextBox ID="txtEndDate" runat="server" class="datepicker" /> / 
                        <asp:TextBox ID="txtEndTime" runat="server" class="time-picker" size="8" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                        runat="server" ErrorMessage="" ControlToValidate="txtEndDate" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" 
                        runat="server" ErrorMessage="" ControlToValidate="txtEndTime" />
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="form-row">
                    <label>Delegate To</label>
                    <div class="form-right"><asp:Button ID="btnDelegate" runat="server" Text="Select Contact"  /></div>
                    <div class="clear"></div>
                </div>
                 <div class="form-row">
                    <label>Reminder Settings</label>
                    <div class="form-right">
                        <asp:CheckBox ID="cbEmail" runat="server" Text="Email" />
                        <asp:CheckBox ID="cbMobile" runat="server" Text="Mobile" />
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
                <div class="form-row">
                    <asp:LinkButton ID="btnAdd" runat="server" class="wide-button blue-button" 
                        Text="Add a Task" Width="200" OnClick="btnAdd_Click" />
                    <asp:LinkButton ID="btnUpdate" runat="server" class="wide-button blue-button" 
                        Text="Update a Task" Width="200" OnClick="btnUpdate_Click" />
                </div>
                </asp:Panel>
                
            </div>
            </asp:Panel>
        </fieldset>
    </form>
</asp:Content>

