<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Tasks.aspx.cs" Inherits="Tasks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    My Tasks
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="dashboard" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <div class="widget">
        <div class="title"><img src="http://localhost:12345/TaskTracker/images/icons/light/frames.png" alt="" class="title-icon" />
        <h6>My Task</h6></div>
        <table cellpadding="0" cellspacing="0" width="100%" class="standard-table">
            <thead>
                <tr>
                    <td>Description</td>
                    <td>Category</td>
                    <td width="100">Status</td>
                    <td width="60">Actions</td>
                </tr>
            </thead>
            <tbody>
                <asp:ListView ID="lvTasks" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td class="<%# Eval("TaskColor") %>"><a href="TaskInfo.aspx?ID=<%# Eval("TaskID") %>" title=""><%# Eval("TaskName") %></a></td>
                            <td><%# Eval("CategoryName") %></td>
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
</asp:Content>

