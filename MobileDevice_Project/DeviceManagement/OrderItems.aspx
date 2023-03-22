<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderItems.aspx.cs" Inherits="MobileDevice_Project.DeviceManagement.OrderItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="OrderId,MobileDeviceId" InsertItemPosition="LastItem">
        
        <EditItemTemplate>
            <tr style="background-color:#008A8C;color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="OrderIdLabel1" runat="server" Text='<%# Eval("OrderId") %>' />
                </td>
                <td>
                    <asp:Label ID="MobileDeviceIdLabel1" runat="server" Text='<%# Eval("MobileDeviceId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ValidationGroup="ins" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ValidationGroup="ins" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>

                    <asp:DropDownList CssClass ="form-select" AppendDataBoundItems="true" DataSourceID="dsOrders" DataTextField="CustomerName" DataValueField="OrderId" ID="DropDownList1" SelectedValue='<%# Bind("OrderId") %>' runat="server">
                        <asp:ListItem Selected="True" Value="">Select one</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="DropDownList1" ID="RequiredFieldValidator2" runat="server" ErrorMessage="OrderId required " Text="OrderId required"></asp:RequiredFieldValidator>
                </td>
                <td>
                     <asp:DropDownList CssClass ="form-select" AppendDataBoundItems="true" DataSourceID="dsMobileDevice" DataTextField="MobileDeviceName" DataValueField="MobileDeviceId" ID="DropDownList2" SelectedValue='<%# Bind("MobileDeviceId") %>' runat="server">
                        <asp:ListItem Selected="True" Value="">Select one</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="DropDownList2" ID="RequiredFieldValidator1" runat="server" ErrorMessage="MobileDevice Id required " Text="MobileDevice Id required"></asp:RequiredFieldValidator>
                <td>
                    <asp:TextBox CssClass="form-control" ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                    <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="QuantityTextBox" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Quantity required " Text="Quantity required"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Eval("OrderId") %>' />
                </td>
                <td>
                    <asp:Label ID="MobileDeviceIdLabel" runat="server" Text='<%# Eval("MobileDeviceId") %>' />
                </td>
                <td>
                    <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table class="table" runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table class="table-bordered" id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server"></th>
                                <th runat="server">OrderId</th>
                                <th runat="server">MobileDeviceId</th>
                                <th runat="server">Quantity</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDB %>" DeleteCommand="DELETE FROM [OrderItems] WHERE [OrderId] = @OrderId AND [MobileDeviceId] = @MobileDeviceId" InsertCommand="INSERT INTO [OrderItems] ([OrderId], [MobileDeviceId], [Quantity]) VALUES (@OrderId, @MobileDeviceId, @Quantity)" SelectCommand="SELECT * FROM [OrderItems]" UpdateCommand="UPDATE [OrderItems] SET [Quantity] = @Quantity WHERE [OrderId] = @OrderId AND [MobileDeviceId] = @MobileDeviceId">
        <DeleteParameters>
            <asp:Parameter Name="OrderId" Type="Int32" />
            <asp:Parameter Name="MobileDeviceId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OrderId" Type="Int32" />
            <asp:Parameter Name="MobileDeviceId" Type="Int32" />
            <asp:Parameter Name="Quantity" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="OrderId" Type="Int32" />
            <asp:Parameter Name="MobileDeviceId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsMobileDevice" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDB %>" SelectCommand="SELECT * FROM [MobileDevices]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsOrders" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDB %>" SelectCommand="SELECT Orders.OrderId, Orders.OrderDate, Orders.DeliveryDate, Orders.CustomerId, Customers.CustomerName FROM Orders INNER JOIN Customers ON Orders.CustomerId = Customers.CustomerId"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
