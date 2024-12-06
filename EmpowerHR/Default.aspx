<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmpowerHR._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $('#insertOrUpdate').on('hidden.bs.modal', function () {
            $('.modalInputField').removeAttr('required');
        });

        $('#insertOrUpdate').on('shown.bs.modal', function () {
            $('.modalInputField').attr('required', 'true');
        });
    });

    function dispalyUpdateEmployeeModal(btn) {  
        $('#modalTitle').text('Update Employee');
        const selectedRow = $(btn).closest("tr");
        $('#<%= modaluniqueId.ClientID %>').val(selectedRow.find(".employee-id").text());
        $('#<%= modalfirstName.ClientID %>').val(selectedRow.find(".first-name").text());
        $('#<%= modallastName.ClientID %>').val(selectedRow.find(".last-name").text());
        $('#<%= modaldivision.ClientID %>').val(selectedRow.find(".division").text());
        $('#<%= modalbuilding.ClientID %>').val(selectedRow.find(".building").text());
        $('#<%= modaltitle.ClientID %>').val(selectedRow.find(".title").text());
        $('#<%= modalroom.ClientID %>').val(parseInt(selectedRow.find(".room").text()));

        $('#insertOrUpdate').modal('show');
    }

    function displayAddEmployeeModal(btn) {
        $('#modalTitle').text('Add Employee');
        $('.modalInputField').val('');
        $('#insertOrUpdate').modal('show');
    }

</script>

    <div class="row mb-3 bg-gradient">
        <div class="col-md-6">
            <asp:Button ID="btnAddEmployee" runat="server" Text="Add New Employee" CssClass="btn btn-outline-primary" BorderStyle="Outset" OnClientClick="displayAddEmployeeModal(this); return false;" />
        </div>
        <div class="col-md-6 d-flex justify-content-end">
            <div class="input-group" style="max-width: 300px;">
                <asp:TextBox ID="searchEmployeeId" TextMode="Number" min="1" runat="server" CssClass="form-control" BorderStyle="Outset" placeholder="Enter Employee ID"></asp:TextBox>
                <asp:Button ID="btnSearchEmployee" runat="server" Text="Search" CssClass="btn btn-success text-white" OnClick="btnSearchEmployee_Click" />
            </div>
        </div>
    </div>

  <asp:GridView ID="EmployeeGridView" runat="server" AutoGenerateColumns="False"
    ShowFooter="False" CssClass="table table-bordered text-center" HeaderStyle-BackColor="#41464b" HeaderStyle-ForeColor="White" 
      AllowPaging="true" OnPageIndexChanging="EmployeePageIndexChanging" PageSize="5" PagerStyle-CssClass="pagination">
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
          <asp:Button ID="btnUpdateEmoloyee" runat="server" Text="Update" CssClass="btn btn-outline-info" BorderStyle="Outset" OnClientClick="dispalyUpdateEmployeeModal(this); return false;" />
          <asp:Button ID="btnDeleteEmployee" runat="server" Text="Delete" CssClass="btn btn-outline-danger" BorderStyle="Outset" CommandArgument='<%# Eval("EmployeeId") %>' OnClick="btnDeleteEmployee_Click" />
      </ItemTemplate>
    </asp:TemplateField>

    </Columns>
      <EmptyDataTemplate>
        <tr>
          <td class="text-start">No data available</td>
        </tr>
      </EmptyDataTemplate>
   </asp:GridView>

<!-- Modal start-->
<div class="modal fade " id="insertOrUpdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-md">
      <div class="modal-content">
         <div class="modal-header">
            <h1 id="modalTitle" class="modal-title fs-5">
                Update Employee
            </h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">

            <asp:TextBox ID="modaluniqueId" CssClass="form-control mb-1" style="display:none;" runat="server" />

            <label for="modalfirstName" class="fw-bold">First Name</label>
            <asp:TextBox ID="modalfirstName" CssClass="form-control mb-2 modalInputField" runat="server" />

             <label for="modallastName" class="fw-bold">Last Name</label>
            <asp:TextBox ID="modallastName" CssClass="form-control mb-2 modalInputField" runat="server" />

            <label for="modaldivision" class="fw-bold">Division</label>
            <asp:TextBox ID="modaldivision" CssClass="form-control mb-2 modalInputField" runat="server" />

            <label for="modalbuilding" class="fw-bold">Building</label>
            <asp:TextBox ID="modalbuilding" CssClass="form-control mb-2 modalInputField" runat="server" />

            <label for="modaltitle" class="fw-bold">Title</label>
            <asp:TextBox ID="modaltitle" CssClass="form-control mb-2 modalInputField" runat="server" />

            <label for="modalroom" class="fw-bold">Room</label>
            <asp:TextBox ID="modalroom" type="number" CssClass="form-control mb-2 modalInputField" runat="server" />

         </div>

         <div class="modal-footer">
            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
            <asp:Button ID="btnSave" CssClass="btn btn-dark" Text=" Save " runat="server" OnClick="btnSave_Click" />
         </div> 
      </div>
   </div>
</div>
<!-- Modal end -->

</asp:Content>
