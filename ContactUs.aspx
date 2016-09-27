<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 95px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border = "0" style="width: 708px; height: 561px;">
    <tr>
        <td class="auto-style1">
            <asp:Label ID="Label1" runat="server" Text="Name*"></asp:Label><br />
        </td>
        <td class="auto-style1">
            <asp:TextBox ID="txtName" runat="server" ValidationGroup = "contact" Width="200px" Height="27px"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
             ControlToValidate = "txtName"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style1">
            <asp:Label ID="Label2" runat="server" Text="Subject*"></asp:Label><br />
        </td>
        <td class="auto-style1">
            <asp:TextBox ID="txtSubject" runat="server" Width="200px" Height="27px"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
             ControlToValidate = "txtSubject"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style1">
            <asp:Label ID="Label3" runat="server" Text="Email*"></asp:Label><br />
        </td>
        <td class="auto-style1">
            <asp:TextBox ID="txtEmail" runat="server" Width="199px" Height="27px"></asp:TextBox><br />
            <asp:RegularExpressionValidator id="valRegEx" runat="server"
            ControlToValidate="txtEmail"
            ValidationExpression=".*@.*\..*"
            ErrorMessage="*Invalid Email address."
            display="dynamic">
            </asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
            ControlToValidate = "txtEmail"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style1"  >
            <asp:Label ID="Label4" runat="server" Text="Body*"></asp:Label>
        </td>
        <td class="auto-style1">
            <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine"  Width="369px" Height="80px" ></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
            ControlToValidate = "txtBody"></asp:RequiredFieldValidator>
        </td>
    </tr>
     <tr>
        <td></td>
        <td>
            <asp:FileUpload ID="FileUpload1" runat="server" />
       </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" />
       </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Label ID="lblMessage" runat="server" Text="" ForeColor = "Green"></asp:Label>
       </td>
    </tr>
</table>
</asp:Content>

