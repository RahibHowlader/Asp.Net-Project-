<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="MobileDevice_Project.DeviceManagement.Customers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-12">
            <h3>Customers</h3>
            <asp:GridView CssClass="table table-bordered" ID="GridView1" runat="server" AllowPaging="True" DataKeyNames="CustomerId" DataSourceID="dsCustomer" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="CustomerName" SortExpression="CustomerName">
                        <EditItemTemplate>
                             <asp:TextBox CssClass="form-control" ValidationGroup="g2" ID="TextBox1" runat="server" Text='<%# Bind("CustomerName") %>' />
                            <asp:RequiredFieldValidator ControlToValidate="TextBox1" ValidationGroup="g2" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is required" Text="Name is required"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CustomerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                        <EditItemTemplate>
                             <asp:TextBox CssClass="form-control" ValidationGroup="g2" ID="TextBox2" runat="server" Text='<%# Bind("Phone") %>' />
                            <asp:RequiredFieldValidator ControlToValidate="TextBox2" ValidationGroup="g2" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Phone is required" Text="Phone is required"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address" SortExpression="Address">
                        <EditItemTemplate>
                             <asp:TextBox CssClass="form-control" TextMode="MultiLine" ValidationGroup="g2" ID="TextBox3" runat="server" Text='<%# Bind("Address") %>' />
                            <asp:RequiredFieldValidator ControlToValidate="TextBox3" ValidationGroup="g2" CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Address is required" Text="Address is required"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton CssClass="btn btn-secondary btn-sm" ValidationGroup="g2" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-danger btn-sm" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton CssClass="btn btn-success btn-sm" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-danger btn-sm" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
        <div class="col-12">
            <h3>Add New Customer</h3>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="CustomerId" DataSourceID="dsCustomer" DefaultMode="Insert" RenderOuterTable="False">
                
                <InsertItemTemplate>
                    <div class="form-group row mb-1">
                        <label class="col-form-label col-2 text-end">
                            Customer Name
                        </label>
                        <div class="col-4">
                            <asp:TextBox CssClass="form-control" ValidationGroup="g1" ID="TextBox1" runat="server" Text='<%# Bind("CustomerName") %>' />
                            <asp:RequiredFieldValidator ControlToValidate="TextBox1" ValidationGroup="g1" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is required" Text="Name is required"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row mb-1">
                        <label class="col-form-label col-2 text-end">
                            Phone
                        </label>
                        <div class="col-4">
                            <asp:TextBox CssClass="form-control" ValidationGroup="g1" ID="TextBox2" runat="server" Text='<%# Bind("Phone") %>' />
                            <asp:RequiredFieldValidator ControlToValidate="TextBox2" ValidationGroup="g1" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Phone is required" Text="Phone is required"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row mb-1">
                        <label class="col-form-label col-2 text-end">
                            Address
                        </label>
                        <div class="col-4">
                            <asp:TextBox CssClass="form-control" TextMode="MultiLine" ValidationGroup="g1" ID="TextBox3" runat="server" Text='<%# Bind("Address") %>' />
                            <asp:RequiredFieldValidator ControlToValidate="TextBox3" ValidationGroup="g1" CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Address is required" Text="Address is required"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                   <div class="form-group row mb-1">
                        
                        <div class="col-4 offset-2">
                             <asp:LinkButton CssClass="btn btn-primary btn-sm" ValidationGroup="g1" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton CssClass="btn btn-danger btn-sm" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </div>
                    </div>
                   
                </InsertItemTemplate>
                
            </asp:FormView>
        </div>
    </div>
    <asp:SqlDataSource ID="dsCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDB %>" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerId] = @CustomerId" InsertCommand="INSERT INTO [Customers] ([CustomerName], [Phone], [Address]) VALUES (@CustomerName, @Phone, @Address)" SelectCommand="SELECT * FROM [Customers]" UpdateCommand="UPDATE [Customers] SET [CustomerName] = @CustomerName, [Phone] = @Phone, [Address] = @Address WHERE [CustomerId] = @CustomerId">
        <DeleteParameters>
            <asp:Parameter Name="CustomerId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CustomerName" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CustomerName" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="CustomerId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
