<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="MobileDevice_Project.DeviceManagement.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/bootstrap-datepicker.standalone.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-12">
            <h3>Orders</h3>
            <asp:GridView CssClass="table table-bordered" ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="OrderId" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:TemplateField HeaderText="Order Id" InsertVisible="False" SortExpression="OrderId">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("OrderId") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("OrderId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Order Date" SortExpression="OrderDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("OrderDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("OrderDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delivery Date" SortExpression="DeliveryDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DeliveryDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("DeliveryDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Customer Id" SortExpression="CustomerId">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("CustomerId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("CustomerId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton CssClass="btn btn-primary btn-sm" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-danger btn-sm" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-12">
            <h3>Add new Orders</h3>
            <asp:FormView CssClass="table table-bordered" ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="OrderId" DataSourceID="SqlDataSource1" DefaultMode="Insert">
                
                <InsertItemTemplate>
                     <div class="form-group row mb-1">
                        <label class="col-form-label col-2 text-end">
                            Order Date
                        </label>
                        <div class="col-4">
                             <asp:TextBox ValidationGroup="ins" CssClass="form-control date" ID="TextBox1" runat="server" Text='<%# Bind("OrderDate","{0:yyyy-MM-dd}") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="Textbox1" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Order Date required " Text="Order Date required"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                     <div class="form-group row mb-1">
                        <label class="col-form-label col-2 text-end">
                            Delivery Date
                        </label>
                        <div class="col-4">
                             <asp:TextBox ValidationGroup="ins" CssClass="form-control date" ID="TextBox2" runat="server" Text='<%# Bind("DeliveryDate","{0:yyyy-MM-dd}") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="TextBox2" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Delivery Date required " Text="Delivery Date required"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row mb-1">
                        <label class="col-form-label col-2 text-end">
                            Customer Id
                        </label>
                        <div class="col-4">
                            <asp:TextBox ValidationGroup="ins" CssClass="form-control" ID="TextBox3" runat="server" Text='<%# Bind("CustomerId") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="Textbox3" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Customer Id required " Text="Customer Id required"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row mb-1">
                        
                        <div class="col-4 offset-2">
                             <asp:LinkButton CssClass="btn btn-primary btn-sm" ValidationGroup="ins" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton CssClass="btn btn-danger btn-sm" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </div>
                    </div>
                    
<%--                    OrderDate:
                    <asp:TextBox ValidationGroup="ins" ID="OrderDateTextBox" runat="server" Text='<%# Bind("OrderDate") %>' />
                     <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="OrderDateTextBox" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Order date required " Text="Order date required"></asp:RequiredFieldValidator>
                    <br />
                    DeliveryDate:
                    <asp:TextBox ValidationGroup="ins" ID="DeliveryDateTextBox" runat="server" Text='<%# Bind("DeliveryDate") %>' />
                    <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="DeliveryDateTextBox" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Delivery date required " Text="Delivery date required"></asp:RequiredFieldValidator>
                    <br />
                    CustomerId:
                    <asp:TextBox ValidationGroup="ins" ID="CustomerIdTextBox" runat="server" Text='<%# Bind("CustomerId") %>' />
                    <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="CustomerIdTextBox" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Customer Id required " Text="Customer Id required"></asp:RequiredFieldValidator>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />--%>
                </InsertItemTemplate>
                <ItemTemplate>
                    OrderId:
                    <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Eval("OrderId") %>' />
                    <br />
                    OrderDate:
                    <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Bind("OrderDate") %>' />
                    <br />
                    DeliveryDate:
                    <asp:Label ID="DeliveryDateLabel" runat="server" Text='<%# Bind("DeliveryDate") %>' />
                    <br />
                    CustomerId:
                    <asp:Label ID="CustomerIdLabel" runat="server" Text='<%# Bind("CustomerId") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDB %>" DeleteCommand="DELETE FROM [Orders] WHERE [OrderId] = @OrderId" InsertCommand="INSERT INTO [Orders] ([OrderDate], [DeliveryDate], [CustomerId]) VALUES (@OrderDate, @DeliveryDate, @CustomerId)" SelectCommand="SELECT * FROM [Orders]" UpdateCommand="UPDATE [Orders] SET [OrderDate] = @OrderDate, [DeliveryDate] = @DeliveryDate, [CustomerId] = @CustomerId WHERE [OrderId] = @OrderId">
                <DeleteParameters>
                    <asp:Parameter Name="OrderId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Date" Name="OrderDate" />
                    <asp:Parameter DbType="Date" Name="DeliveryDate" />
                    <asp:Parameter Name="CustomerId" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter DbType="Date" Name="OrderDate" />
                    <asp:Parameter DbType="Date" Name="DeliveryDate" />
                    <asp:Parameter Name="CustomerId" Type="Int32" />
                    <asp:Parameter Name="OrderId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
     <script src="../Scripts/jquery-3.6.3.js"></script>
    <script src="../Scripts/bootstrap-datepicker.js"></script>
    <script>
        $(".date").datepicker({
            format: 'yyyy-mm-dd'
        });
    </script>
</asp:Content>
