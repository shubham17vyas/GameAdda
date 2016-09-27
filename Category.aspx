<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT [Game_Id], [Game_Name], [Game_Genre], [Game_Image], [Game_Price] FROM [Games] WHERE ([Game_Cate] = @Game_Cate)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Game_Cate" QueryStringField="Game_Cate" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
     <asp:ListView ID="ListView1" runat="server" DataKeyNames="Game_Id" DataSourceID="SqlDataSource1" GroupItemCount="2">
            <AlternatingItemTemplate>
                <td id="Td1" runat="server" style="background-color:#b77575">
                    <table>

                        <tr>

                            <td>

                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Game_Id", "GameDetail.aspx?Game_Id={0}") %>'>
                                <asp:Image ID="Image1" ImageUrl='<%# Eval("Game_Image", "Productimages/{0}") %>' Width="130px" Height="150px" runat="server" />
                                    </asp:HyperLink>
                            </td>

                            <td>

                              <%--Title and price go here--%>

                                 Name:
                    <asp:Label ID="Prod_NameLabel" runat="server" Text='<%# Eval("Game_Name") %>' />
                    <br /><br />
                                 
                                Price:
                    <asp:Label ID="Prod_PriceLabel" runat="server" Text='<%# Eval("Game_Price","{0:c}") %>' />
                    <br />
                                </td>

                              Genre:
                    <asp:Label ID="lblGenre1" runat="server" Text='<%# Eval("Game_Genre") %>' Font-Bold="true" />
                    <br />
                                </td>
                    
                    
                    
                    
                            
                 
                    </tr>
                      </table>  
                    </td>
            </AlternatingItemTemplate>

            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">Game_Id:
                    <asp:Label ID="Game_IdLabel1" runat="server" Text='<%# Eval("Game_Id") %>' />
                    <br />Game_Name:
                    <asp:TextBox ID="Game_NameTextBox" runat="server" Text='<%# Bind("Game_Name") %>' />
                    <br />Game_Genre:
                    <asp:TextBox ID="Game_GenreTextBox" runat="server" Text='<%# Bind("Game_Genre") %>' />
                    <br />
                    Game_Image:
                    <asp:TextBox ID="Game_ImageTextBox" runat="server" Text='<%# Bind("Game_Image") %>' />
                    <br />
                    Game_Price:
                    <asp:TextBox ID="Game_PriceTextBox" runat="server" Text='<%# Bind("Game_Price", "{0:c}") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">Game_Id:
                    <asp:TextBox ID="Game_IdTextBox" runat="server" Text='<%# Bind("Game_Id") %>' />
                    <br />Game_Name:
                    <asp:TextBox ID="Game_NameTextBox" runat="server" Text='<%# Bind("Game_Name") %>' />
                    <br />Game_Genre:
                    <asp:TextBox ID="Game_GenreTextBox" runat="server" Text='<%# Bind("Game_Genre") %>' />
                    <br />
                    Game_Image:
                    <asp:TextBox ID="Game_ImageTextBox" runat="server" Text='<%# Bind("Game_Image") %>' />
                    <br />
                    Game_Price:
                    <asp:TextBox ID="Game_PriceTextBox" runat="server" Text='<%# Bind("Game_Price", "{0:c}") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td id="Td1" runat="server" style="background-color:#FFF8DC;">
                    <table>

                        <tr>

                            <td>

                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Game_Id", "GameDetail.aspx?Game_Id={0}") %>'>
                                <asp:Image ID="Image1" ImageUrl='<%# Eval("Game_Image", "ProductImages/{0}") %>'  runat="server" Width="130px" Height="150px" />
                                    </asp:HyperLink>
                            </td>

                            <td>

                              <%--Title and price go here--%>

                                 Name:
                    <asp:Label ID="Game_NameLabel" runat="server" Text='<%# Eval("Game_Name") %>' />
                    <br /><br />
                                 
                                Price:
                    <asp:Label ID="Game_PriceLabel" runat="server" Text='<%# Eval("Game_Price","{0:c}") %>' />
                    <br />
                                </td>

                             Genre:
                    <asp:Label ID="lblGenre" runat="server" Text='<%# Eval("Game_Genre") %>' Font-Bold="true" />
                    <br />
                                </td>
                    
                    
                            
                 
                    </tr>
                      </table>  
                    </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">Game_Id:
                    <asp:Label ID="Game_IdLabel" runat="server" Text='<%# Eval("Game_Id") %>' />
                    <br />Game_Name:
                    <asp:Label ID="Game_NameLabel" runat="server" Text='<%# Eval("Game_Name") %>' />
                    <br />Game_Genre:
                    <asp:Label ID="Game_GenreLabel" runat="server" Text='<%# Eval("Game_Genre") %>' />
                    <br />Game_Image:
                    <asp:Label ID="Game_ImageLabel" runat="server" Text='<%# Eval("Game_Image") %>' />
                    <br />
                    Game_Price:
                    <asp:Label ID="Game_PriceLabel" runat="server" Text='<%# Eval("Game_Price","{0:c}") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>

    </asp:Content>

