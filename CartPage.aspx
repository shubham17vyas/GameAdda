<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CartPage.aspx.cs" Inherits="CartPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

          <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br />
    <asp:GridView ID="GridView1" runat="server" GridLines="None" Width="132%" 
        CellPadding="5" AutoGenerateColumns="False" DataKeyNames="ID" 
        onrowcommand="GridView1_RowCommand" 
        onrowediting="GridView1_RowEditing" ShowFooter="True" 
        ondatabound="GridView1_DataBound">
    <HeaderStyle HorizontalAlign="Left" BackColor="#1C5E55" ForeColor="#FFFFFF" 
            Font-Bold="True" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Product" />
            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:c}" />
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                  
                  
                    <asp:TextBox ID="txtQuantity" runat="server" AutoPostBack="false" Text='<%# Bind("Quantity") %>' 
                        Width="41px"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            
             <asp:ButtonField CommandName="Edit" Text="Update Quantity" />
            
            <asp:TemplateField>
            
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="btnRemove" Text="Remove" CommandName="Remove" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                </ItemTemplate>
                <FooterTemplate>
                Total: $<asp:Label ID="lblTotal" runat="server"></asp:Label>
                </FooterTemplate>
            
            </asp:TemplateField>
            
           
            
        </Columns>
        
    <FooterStyle HorizontalAlign="Right" BackColor="#1C5E55" ForeColor="#FFFFFF" 
            Font-Bold="True" />
    <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <br />    
    <br /><br />
    <table style="width:100%">
    <tr>
    <td>
        <a href="Home.aspx">Back to products</a>
    
    </td>
    <td style="text-align:right">
    <asp:LoginView
         ID="LoginView1" runat="server"  >
        <AnonymousTemplate>
            To place your order, please 
            <asp:LoginStatus ID="LoginStatus1" runat="server" /> or <a href="CreateUser.aspx">
                create an account</a>.
        </AnonymousTemplate>
        <LoggedInTemplate>
            <asp:ImageButton ID="btnCheckoutWithPaypal" runat="server" ImageUrl="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" OnClick="btnCheckoutWithPaypal_Click" />
              
        </LoggedInTemplate>
     </asp:LoginView>
     <br />

        <asp:Label ID="lblStatus" runat="server" ></asp:Label>
    </td>
    
    </tr>
    
    </table>

    
    </asp:Content>

