<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="MembrRegister.Member" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function validate() {
            var name = document.getElementById("txtName").value;
            var email = document.getElementById("txtEmailId").value;
            var phoneno = document.getElementById("txtPhoneNo").value;
            var address = document.getElementById("txtAddress").value;
            if (name == "" || email == "" || phoneno == "" || address == "") {
                alert("Fill All the Fields");
                return false;
            }
            else {
                return true;
            }
        }
    </script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Name</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="txtName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Email Id</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="txtEmailId" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Phone Number</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="txtPhoneNo" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="btnInsert" CssClass="btn btn-success" runat="server" Text="Insert" Height="30" Width="70" OnClick="btnInsert_Click" OnClientClick="return validate();" />
            <br />
            <br />
            <asp:GridView CssClass="table table-striped table-bordered table-hover" ID="GridView1" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" runat="server" AutoGenerateColumns="false" OnRowEditing="GridView1_RowEditing">
                <Columns>
                    <asp:BoundField DataField="txtName" HeaderText="Member Name" />
                    <asp:BoundField DataField="txtEmailId" HeaderText="Email Id" />
                    <asp:BoundField DataField="txtPhoneNo" HeaderText="Phone No" />
                    <asp:BoundField DataField="txtAddress" HeaderText="Address" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton Text="Edit" runat="server" CommandName="Edit" />
                            <asp:LinkButton Text="Delete" runat="server" OnClick="OnDelete" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton Text="Update" runat="server" OnClick="OnUpdate" />
                            <asp:LinkButton Text="Cancel" runat="server" OnClick="OnCancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

    </form>
</body>
</html>
