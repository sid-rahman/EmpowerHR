<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmpowerHR._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {

    });

    function updateEmployee(btn) {
        const selectedRow = $(btn).closest("tr");
        const employeeId = selectedRow.find(".employee-id").text();
        const firstName = selectedRow.find(".first-name").text();
        const lastName = selectedRow.find(".last-name").text();
        const division = selectedRow.find(".division").text();
        const building = selectedRow.find(".building").text();
        const title = selectedRow.find(".title").text();
        const room = selectedRow.find(".room").text();
    }

</script>

  <asp:GridView ID="EmployeeGridView" runat="server" AutoGenerateColumns="False"
    ShowFooter="False" CssClass="table table-bordered text-center" HeaderStyle-BackColor="#76ABAE" HeaderStyle-ForeColor="White" 
      AllowPaging="true" PageSize="5" PagerStyle-CssClass="pagination">
    <Columns> 
     <asp:TemplateField HeaderText="Employee Id">
        <ItemTemplate>
            <asp:Label ID="EmployeeId" CssClass="employee-id" runat="server" Text='<%#Bind("EmployeeId") %>'></asp:Label>
        </ItemTemplate>
     </asp:TemplateField>
    <asp:TemplateField HeaderText="First Name">
        <ItemTemplate>
            <asp:Label ID="FirstName" CssClass="first-name" runat="server" Text='<%#Bind("FirstName") %>'> </asp:Label>
        </ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Last Name">
        <ItemTemplate>
            <asp:Label ID="LastName" CssClass="last-name" runat="server" Text='<%#Bind("LastName") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Division">
        <ItemTemplate>
            <asp:Label ID="Division" CssClass="division" runat="server" Text='<%#Bind("Division") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
        <asp:TemplateField HeaderText="Building">
        <ItemTemplate>
            <asp:Label ID="Building" CssClass="building" runat="server" Text='<%#Bind("Building") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
        <asp:TemplateField HeaderText="Title">
        <ItemTemplate>
            <asp:Label ID="Title" CssClass="title" runat="server" Text='<%#Bind("Title") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
        <asp:TemplateField HeaderText="Room">
        <ItemTemplate>
            <asp:Label ID="Room" CssClass="room" runat="server" Text='<%#Bind("Room") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
  <asp:TemplateField HeaderText="Actions">
      <ItemTemplate>
          <asp:Button ID="btnUpdateEmoloyee" runat="server" Text="Update" CssClass="btn btn-outline-primary" OnClientClick="updateEmployee(this)" />
          <asp:Button ID="btnDeleteEmployee" runat="server" Text="Delete" CssClass="btn btn-outline-danger" CommandArgument='<%# Eval("EmployeeId") %>' OnClick="btnDeleteEmployee_Click" />
      </ItemTemplate>
    </asp:TemplateField>

    </Columns>
   </asp:GridView>

</asp:Content>
