<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CurrentUserinfo.ascx.cs" Inherits="Membership_CurrentUserinfo" %>
<style type="text/css">
    .auto-style1 {
        width: 124px;
    }
    .auto-style2 {
        width: 276px;
    }
</style>
<%--<h1>
    <asp:Label ID="Label1" runat="server" ></asp:Label></h1>--%>

<h1>Welcome  <asp:LoginName ID="LoginName1" runat="server" />!
</h1>

<asp:ChangePassword ID="ChangePassword1" runat="server" BackColor="#E3EAEB" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" Width="397px">
    <CancelButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
    <ChangePasswordButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
    <ContinueButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
    <PasswordHintStyle Font-Italic="True" ForeColor="#1C5E55" />
    <TextBoxStyle Font-Size="0.8em" />
    <TitleTextStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
</asp:ChangePassword>

<h1>Your Profile Information</h1>

<table>
    <tr>
        <td class="auto-style1">First Name</td>
        <td class="auto-style2">
            <asp:TextBox ID="txtFirstName" runat="server" Width="270px"></asp:TextBox></td>
    </tr>
    <tr>
        <td class="auto-style1">Last Name</td>
        <td class="auto-style2">
            <asp:TextBox ID="txtLastName" runat="server" Width="270px"></asp:TextBox></td>
    </tr>
    <tr>
        <td class="auto-style1">Birth Date</td>
        <td class="auto-style2">
            <asp:TextBox ID="txtBirthDate" runat="server" Width="270px"></asp:TextBox></td>
    </tr>
    <tr>
        <td class="auto-style1">Street Address</td>
        <td class="auto-style2">
            <asp:TextBox ID="txtStreet" runat="server" Width="270px"></asp:TextBox></td>
    </tr>
    <tr>
        <td class="auto-style1">City</td>
        <td class="auto-style2">
            <asp:TextBox ID="txtCity" runat="server" Width="270px"></asp:TextBox></td>
    </tr>
    <tr>
        <td class="auto-style1">State</td>
        <td class="auto-style2">
            <asp:TextBox ID="txtState" runat="server" Width="270px"></asp:TextBox></td>
    </tr>
     <tr>
        <td class="auto-style1">Zip Code</td>
        <td class="auto-style2">
            <asp:TextBox ID="txtZip" runat="server" Height="16px" Width="270px"></asp:TextBox></td>
    </tr>
     <tr>
        <td class="auto-style1">Country</td>
        <td class="auto-style2">
            <asp:TextBox ID="txtCountry" runat="server" Height="16px" Width="270px"></asp:TextBox></td>
    </tr>
</table>
<br />
<asp:Button ID="Button1" runat="server" Text="Update Profile" OnClick="Button1_Click" />
