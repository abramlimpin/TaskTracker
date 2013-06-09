<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>TaskTracker</title>
<link href="http://localhost:12345/TaskTracker/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://localhost:12345/TaskTracker/images/favicon.png" rel="shortcut icon" />
<!-- Load Template Main Required Scripts -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
	<script type="text/javascript" src="http://localhost:12345/TaskTracker/js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="http://localhost:12345/TaskTracker/js/plugins/spinner/ui.spinner.js"></script>
	<script type="text/javascript" src="http://localhost:12345/TaskTracker/js/plugins/spinner/jquery.mousewheel.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

	<!-- Load Forms Scripts -->
	<script type="text/javascript" src="http://localhost:12345/TaskTracker/js/plugins/forms/uniform.js"></script>
	<script type="text/javascript" src="http://localhost:12345/TaskTracker/js/plugins/wizard/jquery.form.js"></script>
	<script type="text/javascript" src="http://localhost:12345/TaskTracker/js/plugins/wizard/jquery.form.wizard.js"></script>
	<script type="text/javascript" src="http://localhost:12345/TaskTracker/js/plugins/wizard/jquery.validate.min.js"></script>
	<script type="text/javascript" src="http://localhost:12345/TaskTracker/js/plugins/forms/jquery.inputlimiter.min.js"></script>
	<script type="text/javascript" src="http://localhost:12345/TaskTracker/js/plugins/forms/jquery.maskedinput.min.js"></script>
	<script type="text/javascript" src="http://localhost:12345/TaskTracker/js/plugins/forms/chosen.jquery.min.js"></script>
	<script type="text/javascript" src="http://localhost:12345/TaskTracker/js/plugins/forms/jquery.validationEngine-en.js"></script>
	<script type="text/javascript" src="http://localhost:12345/TaskTracker/js/plugins/forms/jquery.cleditor.js"></script>
	<script type="text/javascript" src="http://localhost:12345/TaskTracker/js/plugins/forms/jquery.tagsinput.min.js"></script>
	<script type="text/javascript" src="http://localhost:12345/TaskTracker/js/plugins/forms/jquery.validationEngine.js"></script>
	<script type="text/javascript" src="http://localhost:12345/TaskTracker/js/plugins/forms/jquery.dualListBox.js"></script>
	<script type="text/javascript" src="http://localhost:12345/TaskTracker/js/plugins/forms/autogrowtextarea.js"></script>

	<!-- Scripts Handlers -->
	<script type="text/javascript" src="http://localhost:12345/TaskTracker/js/custom.js"></script>
</head>

<body class="nobg login-page">
<!-- Main content wrapper -->
<div class="login-wrapper">
    <asp:Panel ID="pnlError" runat="server" Visible="false">
        <div class="note-box note-fail hide-me">
            <p>Invalid username / password.</p>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlLogout" runat="server" Visible="false">
        <div class="note-box note-success hide-me">
            <p>Logged out.</p>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlConfirmed" runat="server" Visible="false">
        <div class="note-box note-success hide-me">
            <p><strong>User Activated!</strong> You may now login.</p>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlExpired" runat="server" Visible="false">
        <div class="note-box note-information hide-me">
            <p>Session expired.</p>
        </div> 
    </asp:Panel>
    <div class="widget">
        <div class="title"><img src="http://localhost:12345/TaskTracker/images/icons/light/user.png" alt="" class="title-icon" />
        <h6>TaskTracker Login</h6></div>
        <form id="validate" class="form" runat="server">
            <fieldset>
                <div class="form-row">
                    <label for="login">Username:</label>
                    <div class="login-input">
                        <asp:TextBox ID="txtEmail" runat="server" class="validate[required]"
                            MaxLength="100" /></div>
                    <div class="clear"></div>
                </div>
                
                <div class="form-row">
                    <label for="pass">Password:</label>
                    <div class="login-input">
                        <asp:TextBox ID="txtPassword" runat="server" class="validate[required]"
                            TextMode="Password" MaxLength="50" /></div>
                    <div class="clear"></div>
                </div>
                
                <div class="login-controllers">
                    <asp:Button ID="btnSignUp" runat="server" Text="Sign Up"
                        PostBackUrl="~/Signup.aspx" />
                    <asp:Button ID="btnLogin" runat="server" class="login-class " Text="Login"
                        OnClick="btnLogin_Click" />
                    <div class="clear"></div>
                </div>
            </fieldset>
        </form>
    </div>
</div>    
</body>
</html>