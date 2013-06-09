<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="dashboard" runat="server">
    <!-- Dashboard Controls area -->
    <div class="dash-controls">
        <div class="wrapper">
        	<div class="secondary-controller">
            	<ul>
                    <li><a href="Tasks.aspx" title=""><img src="http://localhost:12345/TaskTracker/images/icons/control/32/tasks.png" alt="" /><span>Task List</span></a></li>
                	<li><a href="Task.aspx?mode=add" title=""><img src="http://localhost:12345/TaskTracker/images/icons/control/32/page.png" alt="" /><span>Add new Task</span></a></li>
                </ul>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <div class="widgets">
        <div class="one-half">
            <!-- My tasks table widget -->
            <div class="widget">
                <div class="title"><img src="http://localhost:12345/TaskTracker/images/icons/light/stop-watch.png" alt="" class="title-icon" />
                <h6>My Tasks</h6>
                <div class="num">
                    <asp:Panel ID="pnlCountTasks" runat="server" Visible="false">
                        <a href="Tasks.aspx" class="blue-number">
                            <asp:Label ID="lblCountTasks" runat="server" />
                        </a>
                    </asp:Panel>
                </div></div>
                <table cellpadding="0" cellspacing="0" width="100%" class="standard-table task-widget-t">
                    <thead>
                        <tr>
                            <td>Description</td>
                            <td width="100">Status</td>
                            <td width="60">Actions</td>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="lvTasks" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td class="<%# Eval("TaskColor") %>"><a href="Task.aspx?ID=<%# Eval("TaskID") %>" title=""><%# Eval("TaskName") %></a></td>
                                    <td><span class="<%# Eval("color") %> font-size11"><%# Eval("Status") %></span></td>
                                    <td class="action-buttons">
                                        <a href="Task.aspx?ID=<%# Eval("TaskID") %>&mode=edit" 
                                            title="Update" class="tipS">
                                            <img src="http://localhost:12345/TaskTracker/images/icons/edit.png" 
                                            alt="" /></a>
                                        <a href="Task.aspx?ID=<%# Eval("TaskID") %>&mode=delete" 
                                            title="Remove" class="tipS">
                                            <img src="http://localhost:12345/TaskTracker/images/icons/remove.png" 
                                            alt="" /></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <tr>
                                    <td>--</td>
                                    <td>--</td>
                                    <td>--</td>
                                </tr>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </tbody>
                </table> 
            </div>
        </div>
        
        <!-- 2 columns widgets -->
        <div class="one-half">
            
            <!-- Search -->
            <div class="search-widget">
                <form id="Form1" runat="server">
                    <asp:TextBox ID="txtSearch" runat="server" placeholder="What are you looking for ?" />
                    <asp:Button ID="btnSearch" runat="server" />
                </form>
            </div>
            
            <!-- custom widget -->
            <div class="widget">
                <div class="title">
                    <img src="http://localhost:12345/TaskTracker/images/icons/light/pencil.png" alt="" class="title-icon" />
                    <h6>Custom Widget</h6>
                    <div class="top-icons-wrapper">
                        <a href="#" class="tipS" title="Refresh Box"><img src="http://localhost:12345/TaskTracker/images/icons/light/refresh-3.png" alt="" /></a>
                        <a href="#" class="tipS" title="Edit"><img src="http://localhost:12345/TaskTracker/images/icons/light/create-_-write.png" alt="" /></a>
                    </div>
                </div>
                <div class="body">
                    <p>Do something here</p>
                </div>
            </div>                
        <div class="clear"></div>
    </div>
    </div>
</asp:Content>

