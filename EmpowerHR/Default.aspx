<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmpowerHR._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

  <asp:GridView ID="EmployeeGridView" runat="server" AutoGenerateColumns="False"
    ShowFooter="False" CssClass="table table-bordered text-center" HeaderStyle-BackColor="#76ABAE" HeaderStyle-ForeColor="White" 
      AllowPaging="true" PageSize="5" PagerStyle-CssClass="pagination">
    <Columns> 
     <asp:TemplateField HeaderText="Employee Id">
        <ItemTemplate>
            <asp:Label ID="EmployeeId" runat="server" Text='<%#Bind("EmployeeId") %>'></asp:Label>
        </ItemTemplate>
     </asp:TemplateField>
    <asp:TemplateField HeaderText="First Name">
        <ItemTemplate>
            <asp:Label ID="FirstName" runat="server" Text='<%#Bind("FirstName") %>'> </asp:Label>
        </ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Last Name">
        <ItemTemplate>
            <asp:Label ID="LastName" runat="server" Text='<%#Bind("LastName") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Division">
        <ItemTemplate>
            <asp:Label ID="Division" runat="server" Text='<%#Bind("Division") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
        <asp:TemplateField HeaderText="Building">
        <ItemTemplate>
            <asp:Label ID="Building" runat="server" Text='<%#Bind("Building") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
        <asp:TemplateField HeaderText="Title">
        <ItemTemplate>
            <asp:Label ID="Title" runat="server" Text='<%#Bind("Title") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
        <asp:TemplateField HeaderText="Room">
        <ItemTemplate>
            <asp:Label ID="Room" runat="server" Text='<%#Bind("Room") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>

    </Columns>
   </asp:GridView>

</asp:Content>
