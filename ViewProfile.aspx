<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewProfile.aspx.cs" Inherits="ViewProfile" %>

<%@ Register Src="~/CurrentUserinfo.ascx" TagPrefix="uc1" TagName="CurrentUserinfo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <uc1:CurrentUserinfo runat="server" ID="CurrentUserinfo" />

</asp:Content>

