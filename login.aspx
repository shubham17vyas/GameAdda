<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
      <asp:Login ID="Login1" runat="server" BorderPadding="4" CreateUserText="Click here to register" CreateUserUrl="CreateUser.aspx" 
            DestinationPageUrl="Default.aspx" Font-Names="Verdana" Font-Size="0.8em" 
            ForeColor="#333333" PasswordRecoveryText="Forgot Passwword? Click here" 
            PasswordRecoveryUrl="RecoverPassword.aspx" Height="185px" 
    TextLayout="TextOnTop" Width="554px" BackColor="#E3EAEB" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="1px">
            <TextBoxStyle Font-Size="0.8em" />
            <LoginButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" 
                BorderWidth="1px" Font-Names="Verdana"
                ForeColor="#1C5E55" Font-Size="0.8em" />
            <LayoutTemplate>
                <table border="0" cellpadding="4" cellspacing="0" 
                    style="border-collapse:collapse;">
                    <tr>
                        <td>
                            <table border="0" cellpadding="0" style="height:300px;width:655px;">
                                <tr>
                                    <td align="center" 
                                        style="color:White;background-color:#1C5E55;font-size:0.9em;font-weight:bold;">
                                        Log In</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User 
                                        Name:</asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server" Height="20px" 
                                            Width="144px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                            ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                            ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" Height="20px" 
                                            TextMode="Password" Width="142px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                            ControlToValidate="Password" ErrorMessage="Password is required." 
                                            ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="color:Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="auto-style1">
                                        <asp:Button ID="LoginButton" runat="server" BackColor="White" 
                                            BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" 
                                            Font-Names="Verdana" ForeColor="#1C5E55" Text="Log In" 
                                            ValidationGroup="Login1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:HyperLink ID="CreateUserLink" runat="server" NavigateUrl="CreateUser.aspx">Click 
                                        here to register</asp:HyperLink>
                                        <br />
                                        <asp:HyperLink ID="PasswordRecoveryLink" runat="server" 
                                            NavigateUrl="RecoverPassword.aspx">Forgot Passwword? Click here</asp:HyperLink>
                                        <br />
                                        <br />
                                        Admin<br />
                                        username: admin<br />
                                        password: admin1!<br />
                                        <br />
                                        Customer<br />
                                        username: user<br />
                                        password: user123!</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <TitleTextStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="0.9em" 
                ForeColor="White" />
        </asp:Login>

</asp:Content>

