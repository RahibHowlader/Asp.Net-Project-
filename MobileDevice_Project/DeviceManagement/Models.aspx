<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Models.aspx.cs" Inherits="MobileDevice_Project.DeviceManagement.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="cal-12">
            <asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1" DataKeyNames="ModelId" InsertItemPosition="LastItem">
                
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button CssClass="btn btn-secondary btn-sm" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button CssClass="btn btn-danger btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:TextBox ID="ModelIdTextBox" runat="server" Text='<%# Bind("ModelId") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ModelNameTextBox" runat="server" Text='<%# Bind("ModelName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="BrandTextBox" runat="server" Text='<%# Bind("Brand") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button CssClass="btn btn-primary btn-sm" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button CssClass="btn btn-danger btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox ID="ModelIdTextBox" runat="server" Text='<%# Bind("ModelId") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ModelNameTextBox" runat="server" Text='<%# Bind("ModelName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="BrandTextBox" runat="server" Text='<%# Bind("Brand") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button CssClass="btn btn-danger btn-sm" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="ModelIdLabel" runat="server" Text='<%# Eval("ModelId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ModelNameLabel" runat="server" Text='<%# Eval("ModelName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BrandLabel" runat="server" Text='<%# Eval("Brand") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server"  class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table class="table table-bordered" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">ModelId</th>
                                        <th runat="server">ModelName</th>
                                        <th runat="server">Brand</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="3">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-sm" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Models] WHERE [ModelId] = @ModelId" InsertCommand="INSERT INTO [Models] ([ModelName], [Brand]) VALUES (@ModelName, @Brand)" SelectCommand="SELECT * FROM [Models]" UpdateCommand="UPDATE [Models] SET [ModelName] = @ModelName, [Brand] = @Brand WHERE [ModelId] = @ModelId">
                <DeleteParameters>
                    <asp:Parameter Name="ModelId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ModelName" Type="String" />
                    <asp:Parameter Name="Brand" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ModelName" Type="String" />
                    <asp:Parameter Name="Brand" Type="String" />
                    <asp:Parameter Name="ModelId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="MobileDevice_Project.App_Code.Model" DeleteMethod="delete" InsertMethod="insert" SelectMethod="Get" TypeName="MobileDevice_Project.App_Code.ModelRepo" UpdateMethod="update"></asp:ObjectDataSource>
            
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
