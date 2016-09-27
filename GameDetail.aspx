<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GameDetail.aspx.cs" Inherits="Games" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT * FROM [Games] WHERE ([Game_Id] = @Game_Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Game_Id" QueryStringField="Game_Id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

      <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" DataKeyNames="Game_Id" OnItemCommand="FormView1_ItemCommand1">
            <EditItemTemplate>
                GameID
                <asp:Label ID="txtid" runat="server" Text='<%# Eval("Game_Id") %>' />
                <br />
                Name:
                <asp:TextBox ID="txtname" runat="server" Text='<%# Bind("Game_Name") %>' />
                <br />
                Image:
                <asp:TextBox ID="txtimage" runat="server" Text='<%# Bind("Game_Image") %>' />
                <br />
                Price:
                <asp:TextBox ID="txtprice" runat="server" Text='<%# Bind("Game_Price", "{0:c}") %>' />
                <br />
                Genre:
                <asp:TextBox ID="txtgenre" runat="server" Text='<%# Bind("Game_Genre") %>' />
                <br />
               Category:
                <asp:TextBox ID="txttype" runat="server" Text='<%# Bind("Game_Cate") %>' />
                <br />
               
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                 GameID
                <asp:Label ID="txtid" runat="server" Text='<%# Eval("Game_Id") %>' />
                <br />
                Name:
                <asp:TextBox ID="txtname" runat="server" Text='<%# Bind("Game_Name") %>' />
                <br />
                Image:
                <asp:TextBox ID="txtimage" runat="server" Text='<%# Bind("Game_Image") %>' />
                <br />
                Price:
                <asp:TextBox ID="txtprice" runat="server" Text='<%# Bind("Game_Price", "{0:c}") %>' />
                <br />
                Genre:
                <asp:TextBox ID="txtgenre" runat="server" Text='<%# Bind("Game_Genre") %>' />
                <br />
               Category:
                <asp:TextBox ID="txttype" runat="server" Text='<%# Bind("Game_Cate") %>' />
                <br />
              
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                             
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Game_Image","Productimages/{0}") %>' Width="250px" Height="300" />
                <br />
                        </td>

                        <td>
                
                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Game_Id") %>' />
               
                Name:
                <asp:Label ID="lblname" runat="server" Text='<%# Bind("Game_Name") %>' Font-Size="Large" Font-Bold="true" Width="250px"/>
                <br />
                Image:
                <asp:Label ID="lblimage" runat="server" Text='<%# Bind("Game_Image") %>' Font-Size="Large" Font-Bold="true"/>
                <br />
                Price:
                <asp:Label ID="lblprice" runat="server" Text='<%# Eval("Game_Price", "{0:c}") %>' Font-Size="Large" Font-Bold="true"/>
                <br />
                Genre:
                <asp:Label ID="lblgenre" runat="server" Text='<%# Bind("Game_Genre") %>' Font-Size="Large" Font-Bold="true"/>
                <br />
               Category:
                <asp:Label ID="lbltype" runat="server" Text='<%# Bind("Game_Cate") %>' Font-Size="Large" Font-Bold="true"/>
                <br />
 </td>
                        </tr>
                </table>
                <h2  style="font-family: Arial, Helvetica, sans-serif">
                <asp:Button ID="addToCartButton" runat="server" CssClass="SmallButtonText" 
                    Text="Add to Cart" />
            </h2>
            </ItemTemplate>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:FormView>

    
    </asp:Content>

