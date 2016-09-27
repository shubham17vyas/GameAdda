<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LatestTweets.aspx.cs" Inherits="LatestTweets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>TWEETS</h1>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT [TweetId], [Tweet] FROM [Tweets] ORDER BY [TweetId] DESC"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TweetId" DataSourceID="SqlDataSource1" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="646px">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="TweetId" HeaderText="TweetId" InsertVisible="False" ReadOnly="True" SortExpression="TweetId" />
            <asp:BoundField DataField="Tweet" HeaderText="Tweet" SortExpression="Tweet" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>

     <asp:TextBox ID="TextBox1" align="center" runat="server" Height="55px" Width="638px"></asp:TextBox><br/><br/>
        <asp:Button ID="Button1" align="center" runat="server" Text="Post" OnClick="Button1_Click" />
        
        <br />
        <asp:Label ID="Label1" ForeColor="#0000ff" runat="server" Visible="False"></asp:Label>


</asp:Content>

