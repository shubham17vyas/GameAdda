<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Featured.aspx.cs" Inherits="Featured" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT * FROM [Featured]">
    </asp:SqlDataSource>
     <asp:ListView ID="ListView1" runat="server" DataKeyNames="gameId" DataSourceID="SqlDataSource1" GroupItemCount="1" style="margin-right: 7px">
            <AlternatingItemTemplate>
                <td id="Td1" runat="server" style="background-color:#b77575">
                    <table>

                        <tr>

                            <td>

                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("gameId") %>'>
                                <asp:Image ID="Image1" ImageUrl='<%# Eval("g_image", "images/{0}") %>' Width="130px" Height="150px" runat="server" />
                                    </asp:HyperLink>
                            </td>

                            <td>

                              <%--Title and price go here--%>

                                 Name:
                    <asp:Label ID="Prod_NameLabel" runat="server" Text='<%# Eval("name") %>' />
                    <br /><br />
                                </td>

                              Release Date:
                    <asp:Label ID="lbldate" runat="server" Text='<%# Eval("R_date") %>' Font-Bold="true" />
                    <br />
                                </td>                 
                    </tr>
                      </table>  
                    </td>
            </AlternatingItemTemplate>

          <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
          <ItemTemplate>
                <td id="Td1" runat="server" style="background-color:#FFF8DC;">
                    <table>

                        <tr>

                            <td>

                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("gameId") %>'>
                                <asp:Image ID="Image1" ImageUrl='<%# Eval("g_image", "Images/{0}") %>'  runat="server" Width="130px" Height="150px" />
                                    </asp:HyperLink>
                            </td>

                            <td>

                              <%--Title and price go here--%>

                                 Name:
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    <br /><br />
                               
                                </td>

                             Release Date:
                    <asp:Label ID="lblGenre" runat="server" Text='<%# Eval("R_date") %>' Font-Bold="true" />
                    <br />
                                </td>
                          </tr>
                      </table>  
                    </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="Table1" runat="server">
                    <tr id="Tr1" runat="server">
                        <td id="Td2" runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="Tr2" runat="server">
                        <td id="Td3" runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
           </asp:ListView>



</asp:Content>

