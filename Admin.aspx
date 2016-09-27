    <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit"  TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" ></asp:ScriptManager>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT [Game_Id], [Game_Name], [Game_Cate], [Game_Genre], [Game_Image], [Game_Price], [Date_Added] FROM [Games]" DeleteCommand="DELETE FROM [Games] WHERE [Game_Id] = @Game_Id" InsertCommand="INSERT INTO [Games] ( [Game_Name], [Game_Genre], [Game_Price], [Game_Cate], [Game_Image], [Date_Added]) VALUES ( @Game_Name, @Game_Genre, @Game_Price, @Game_Cate, @Game_Image, @Date_Added)" UpdateCommand="UPDATE [Games] SET [Game_Name] = @Game_Name, [Game_Cate] = @Game_Cate, [Game_Price] = @Game_Price, [Game_Genre] = @Game_Genre, [Game_Image] = @Game_Image,  WHERE [Game_Id] = @Game_Id">
        <DeleteParameters>
            <asp:Parameter Name="Game_Id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Game_Name" />
            <asp:Parameter Name="Game_Genre" />
            <asp:Parameter Name="Game_Price" />
            <asp:Parameter Name="Game_Cate" />
            <asp:Parameter Name="Game_Image" />
             <asp:Parameter Name="Date_Added" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Game_Name" />
            <asp:Parameter Name="Game_Cate" />
            <asp:Parameter Name="Game_Price" />
            <asp:Parameter Name="Game_Genre" />
            <asp:Parameter Name="Game_Image" />
            <asp:Parameter Name="Game_Id" />
        </UpdateParameters>
    </asp:SqlDataSource>

     <asp:LinkButton ID="AddNewGame" runat="server" onclick="Insert_game">Add a New Product</asp:LinkButton>
    <br />

    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="Game_Id" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None" Width="648px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" 
      >
        <RowStyle BackColor="#E3EAEB" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Select" Text="Edit" Font-Size="XX-Small"></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this item?')" Font-Size="XX-Small"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Game_Id" HeaderText="GAME ID" ReadOnly="True" 
                SortExpression="Game_Id" />
            <asp:BoundField DataField="Game_Name" HeaderText="GAME" 
                SortExpression="Game_Name" />
            <asp:BoundField DataField="Game_Cate" HeaderText="PLATFORM" 
                SortExpression="Game_Cate" />
             <asp:BoundField DataField="Game_Genre" HeaderText="GENRE" 
                SortExpression="Game_Genre" />
            <asp:BoundField DataField="Game_Price" DataFormatString="{0:c}" 
                HeaderText="PRICE" SortExpression="Game_Price" />
           
            <asp:TemplateField HeaderText="Image" SortExpression="Game_Image">
                <ItemTemplate>
                    <img src='ProductImages/<%# Eval("Game_Image") %>' height="100px" alt="Product Image" />
                    
                </ItemTemplate>
               
            </asp:TemplateField>
            <asp:BoundField DataField="Date_Added" HeaderText="Date Added" SortExpression="Date_Added" />
        </Columns>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>

     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Database %>" 
    DeleteCommand="DELETE FROM [Games] WHERE [Game_Id] = @Game_Id" 
    InsertCommand="INSERT INTO [Games] ([Game_Name], [Game_Cate], [Game_Price], [Game_Genre], [Game_Image], [Date_Added]) VALUES (@Game_Name, @Game_Cate, @Game_Price, @Game_Genre, @Game_Image, @Date_Added)" 
    SelectCommand="SELECT * FROM [Games] WHERE ([Game_Id] = @Game_Id)" 
    UpdateCommand="UPDATE [Games] SET [Game_Name] = @Game_Name, [Game_Cate] = @Game_Cate, [Game_Price] = @Game_Price, [Game_Genre] = @Game_Genre, [Game_Image] = @Game_Image, [Date_Added] = @Date_Added WHERE [Game_Id] = @Game_Id">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView2" Name="Game_Id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="Game_Id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Game_Name" Type="String" />
            <asp:Parameter Name="Game_Cate" Type="String" />
            <asp:Parameter Name="Game_Price" Type="Decimal" />
            <asp:Parameter Name="Game_Genre" Type="String" />
            <asp:Parameter Name="Game_Image" Type="String" />
            <asp:Parameter Name="Date_Added" Type="DateTime" />
        </UpdateParameters>
        <InsertParameters>
             <asp:Parameter Name="Game_Name" Type="String" />
            <asp:Parameter Name="Game_Cate" Type="String" />
            <asp:Parameter Name="Game_Price" Type="Decimal" />
            <asp:Parameter Name="Game_Genre" Type="String" />
            <asp:Parameter Name="Game_Image" Type="String" />
            <asp:Parameter Name="Date_Added" Type="DateTime" />
        </InsertParameters>
</asp:SqlDataSource>

     <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Game_Id" DataSourceID="SqlDataSource2" Height="50px" Width="284px"  
       onitemupdated="DetailsView1_ItemUpdated" 
        onitemupdating="DetailsView1_ItemUpdating" 
        onitemcommand="DetailsView1_ItemCommand" 
        EnableViewState="False" Visible="False" style="margin-top: 10px">
    <Fields>
        <asp:BoundField DataField="Game_Id" HeaderText="GAME Id" ReadOnly="True" 
            SortExpression="Game_Id" />
        <asp:BoundField DataField="Game_Name" HeaderText="GAME" 
            SortExpression="Game_Name" />
        <asp:TemplateField HeaderText="PLATFORM" SortExpression="Game_Cate">
            <EditItemTemplate>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT DISTINCT  [Game_Cate] FROM [Games]"></asp:SqlDataSource>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="Game_Cate" DataValueField="Game_Cate"  SelectedValue='<%#Bind("Game_Cate") %>'>
                </asp:DropDownList>
            </EditItemTemplate>
            <InsertItemTemplate>
                 <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT DISTINCT  [Game_Cate] FROM [Games]"></asp:SqlDataSource>
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource6" DataTextField="Game_Cate" DataValueField="Game_Cate"  SelectedValue='<%#Bind("Game_Cate") %>'>
                </asp:DropDownList>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Game_Cate") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="PRICE" SortExpression="Game_Price">
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Game_Price", "{0:c}") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Game_Price", "{0:f}") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" 
                    Text='<%# Bind("Game_Price", "{0:c}") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="GENRE" SortExpression="Game_Genre">
            <EditItemTemplate>
                 <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT DISTINCT [Game_Genre] FROM [Games]"></asp:SqlDataSource>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="Game_Genre" DataValueField="Game_Genre"  SelectedValue='<%#Bind("Game_Genre") %>'>
                </asp:DropDownList>

            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT DISTINCT [Game_Genre] FROM [Games]"></asp:SqlDataSource>
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource5" DataTextField="Game_Genre" DataValueField="Game_Genre" SelectedValue='<%#Bind("Game_Genre") %>'>
                </asp:DropDownList>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Game_Genre") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="GAME Image" SortExpression="Game_Image">
            <ItemTemplate>
            <img src='ProductImages/<%# Eval("Game_Image") %>' height="100px" alt="Product Image" />
               
            </ItemTemplate>
            <EditItemTemplate>
                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Game_Image") %>' />
                  <asp:Label ID="Label1" runat="server" >Current Image: <%# Eval("Game_Image") %></asp:Label> <br />
                <img src='ProductImages/<%# Eval("Game_Image") %>' height="100px" alt="Product Image" />
             
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Label ID="lblUpload" runat="server" ></asp:Label>
            </EditItemTemplate>
            <InsertItemTemplate>
             <asp:FileUpload ID="FileUpload1" runat="server" />

                
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Date Added" SortExpression="Date_Added">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Date_Added", "{0:d}") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>

            <asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("Date_Added", "{0:d}") %>'></asp:TextBox>
            
            <cc1:CalendarExtender ID="CalendarExtender1"  runat="server" TargetControlID="txtDate" >
            </cc1:CalendarExtender>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text ="*" ForeColor ="Red" ErrorMessage="Please Select a date" ControlToValidate ="txtDate"></asp:RequiredFieldValidator>      
                    <asp:RangeValidator ID="RangeValidator1" runat="server" Text ="*" ForeColor ="Red" ErrorMessage="Please enter a date between 1/1/200 and today" ControlToValidate ="txtDate" type ="Date" MinimumValue ="1/1/2000" MaximumValue ="<%# DateTime.Today.ToShortDateString() %>" ></asp:RangeValidator>
                        
                 <br />
                        
                 </EditItemTemplate>
            <InsertItemTemplate>
            <asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("Date_Added", "{0:d}") %>' ></asp:TextBox>
            
                          
                <cc1:CalendarExtender ID="txtDate_CalendarExtender" runat="server" TargetControlID="txtDate"   CssClass="MyCalendar" />
            
                         
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text ="*" ForeColor ="Red" ErrorMessage="Please Select a date" ControlToValidate ="txtDate"></asp:RequiredFieldValidator>      
                <asp:CompareValidator ID="CompareValidator1" runat="server"  Text ="*"  ControlToValidate="txtDate" ForeColor ="Red" ErrorMessage="Please enter today's Date" Type="Date" ValueToCompare="<%# DateTime.Today.ToShortDateString() %>" Operator="Equal"></asp:CompareValidator>
           
                 </InsertItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
    </Fields>
</asp:DetailsView>
    <br />
   
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" ShowMessageBox="true" runat="server" />


    </asp:Content>

