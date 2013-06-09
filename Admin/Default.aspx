<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Dashboard
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="dashboard" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <div class="widgets">
        <div class="one-half">
            <div class="widget">
                    <div class="title"><img src="http://localhost:12345/TaskTracker/images/icons/light/user-2.png" alt="" class="title-icon" /><h6>Staff Members List</h6></div>
                    <ul class="users-lists">
                        <li>
                            <a href="#" title="" class="float-left"><img class="id-pic" src="images/icons/control/32/users.png" alt="" /></a>
                            <div class="user-informations">
                                <a href="#" title=""><strong>Ritchie Lonnie</strong></a>
                                <i>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</i>	
                            </div>
                            <div class="user-links">
                                <a href="#" title="Edit Privileges" class="tipW"><img src="http://localhost:12345/TaskTracker/images/icons/puser.png" alt="" /></a>
                                <a href="#" title="Send an email" class="tipW"><img src="http://localhost:12345/TaskTracker/images/icons/pEmail.png" alt="" /></a>
                            </div>
                            <div class="clear"></div>
                        </li>
                        <li>
                            <a href="#" title="" class="float-left"><img class="id-pic" src="images/icons/control/32/users.png" alt="" /></a>
                                <div class="user-informations">
                                <a href="#" title=""><strong>Delbert Trenton</strong></a>
                                <i>Lead developer, Italy</i>	
                            </div>
                            <div class="user-links">
                                <a href="#" title="Edit Privileges" class="tipW"><img src="http://localhost:12345/TaskTracker/images/icons/puser.png" alt="" /></a>
                                <a href="#" title="Send an email" class="tipW"><img src="http://localhost:12345/TaskTracker/images/icons/pEmail.png" alt="" /></a>
                            </div>
                            <div class="clear"></div>
                        </li>
                        <li>
                            <a href="#" title="" class="float-left"><img class="id-pic" src="images/icons/control/32/users.png" alt="" /></a>
                            <div class="user-informations">
                                <a href="#" title=""><strong>Boyd Joey</strong></a>
                                <i>Lead Designer, England</i>	
                            </div>
                            <div class="user-links">
                                <a href="#" title="Edit Privileges" class="tipW"><img src="http://localhost:12345/TaskTracker/images/icons/puser.png" alt="" /></a>
                                <a href="#" title="Send an email" class="tipW"><img src="http://localhost:12345/TaskTracker/images/icons/pEmail.png" alt="" /></a>
                            </div>
                            <div class="clear"></div>
                        </li>
                        <li>
                            <a href="#" title="" class="float-left"><img class="id-pic" src="images/icons/control/32/users.png" alt="" /></a>
                            <div class="user-informations">
                                <a href="#" title=""><strong>Godfrey Kevin</strong></a>
                                <i>CEO, United States Of America</i>	
                            </div>
                            <div class="user-links">
                                <a href="#" title="Edit Privileges" class="tipW"><img src="http://localhost:12345/TaskTracker/images/icons/puser.png" alt="" /></a>
                                <a href="#" title="Send an email" class="tipW"><img src="http://localhost:12345/TaskTracker/images/icons/pEmail.png" alt="" /></a>
                            </div>
                            <div class="clear"></div>
                        </li>
                    </ul>
                </div>
        </div>
    </div>
</asp:Content>

