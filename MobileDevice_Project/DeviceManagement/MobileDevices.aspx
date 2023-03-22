<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MobileDevices.aspx.cs" Inherits="MobileDevice_Project.DeviceManagement.MobileDevice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/bootstrap-datepicker.standalone.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">  
        <div class="col-12">
            <h3>MobileDevices</h3>
            <asp:GridView CssClass="table table-bordered" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsMobileDevice" DataKeyNames="MobileDeviceId">
                <Columns>
                    <asp:TemplateField HeaderText="MobileDevice Name" SortExpression="MobileDeviceName">
                        <EditItemTemplate>
                            <asp:TextBox ValidationGroup="ins" CssClass="form-control" ID="TextBox1" runat="server" Text='<%# Bind("MobileDeviceName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="Textbox1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="MobileDevice name required " Text="MobileDevice name required"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("MobileDeviceName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Model" SortExpression="ModelName">
                        <EditItemTemplate>
                            <asp:DropDownlist DataSourceID="dsModels" DataTextField="ModelName" DataValueField="ModelId" ValidationGroup="ins" CssClass="form-select" ID="TextBox2" runat="server" SelectedValue='<%# Bind("ModelId") %>'></asp:DropDownlist>
                            <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="Textbox2" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Model required "></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ModelName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price" SortExpression="Price">
                        <EditItemTemplate>
                            <asp:TextBox ValidationGroup="ins" CssClass="form-control" ID="TextBox3" runat="server"  Text='<%# Bind("Price", "{0:0.00}") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="Textbox3" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Price required " Text="Price required "></asp:RequiredFieldValidator>
                            <asp:CompareValidator Operator="DataTypeCheck" Type="Double" ValidationGroup="ins" CssClass="text-danger" ControlToValidate="TextBox3" ID="CompareValidator3" runat="server" ErrorMessage="Price Invalid" Text="Price required "></asp:CompareValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                        <EditItemTemplate>
                            <asp:TextBox ValidationGroup="ins" CssClass="form-control" ID="TextBox4" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="Textbox4" Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Quantity is required " Text="Quantity is required"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Relaese Date" SortExpression="RelaeseDate">
                        <EditItemTemplate>
                            <asp:TextBox ValidationGroup="ins" CssClass="form-control date" ID="TextBox5" runat="server" Text='<%# Bind("RelaeseDate", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="Textbox5" Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Relaese date required " Text="Relaese date required"></asp:RequiredFieldValidator>

                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("RelaeseDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Picture" SortExpression="Picture">
                        <EditItemTemplate>
                            <asp:FileUpload CssClass="form-control" ID="FileUpload1" runat="server" />
                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("Picture") %>'/>
                            
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image style="width:40px" CssClass="rounded-circle" ID="Image1" ImageUrl='<%# Eval("Picture", "~/Uploads/{0}") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country Of Origin" SortExpression="CountryOfOrigin">
                        <EditItemTemplate>
                            <asp:TextBox CssClass="form-control" ValidationGroup="ins" ID="TextBox7" runat="server" Text='<%# Bind("CountryOfOrigin") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="Textbox7" Display="Dynamic" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Country is required " Text="Country is required"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("CountryOfOrigin") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton CssClass="btn btn-secondary btn-dm" ValidationGroup="ins" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-danger btn-dm" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton CssClass="btn btn-primary" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-secondary" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="200px" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-12">
            <h3>Add new MobileDevice</h3>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="MobileDeviceId" DataSourceID="dsMobileDevice" DefaultMode="Insert" RenderOuterTable="False" OnItemInserting="FormView1_ItemInserting">
                
                <InsertItemTemplate>
                    <div class="form-group row mb-1">
                        <label class="col-form-label col-2 text-end">
                            Mobile Device Name
                        </label>
                        <div class="col-4">
                             <asp:TextBox ValidationGroup="ins" CssClass="form-control" ID="TextBox1" runat="server" Text='<%# Bind("MobileDeviceName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ed" CssClass="text-danger" ControlToValidate="Textbox1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="MobileDevice name required " Text="MobileDevice name required"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row mb-1">
                        <label class="col-form-label col-2 text-end">
                            Price
                        </label>
                        <div class="col-4">
                             <asp:TextBox ValidationGroup="ed" CssClass="form-control" ID="TextBox3" runat="server" Text='<%# Bind("Price", "{0:0.00}") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ed" CssClass="text-danger" ControlToValidate="Textbox3" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Price required " Text="Price required "></asp:RequiredFieldValidator>
                            <asp:CompareValidator Operator="DataTypeCheck" Type="Double" ValidationGroup="ed" CssClass="text-danger" ControlToValidate="TextBox3" ID="CompareValidator1" runat="server" ErrorMessage="Price Invalid" Text="Price required "></asp:CompareValidator>
                        </div>
                    </div>
                    <div class="form-group row mb-1">
                        <label class="col-form-label col-2 text-end">
                            Quantity
                        </label>
                        <div class="col-4">
                            <asp:TextBox CssClass="form-control" ValidationGroup="ins" ID="TextBox4" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ed" CssClass="text-danger" ControlToValidate="Textbox4" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Quantity is required " Text="Quantity is required"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                      <div class="form-group row mb-1">
                        <label class="col-form-label col-2 text-end">
                            Relaese Date
                        </label>
                        <div class="col-4">
                            <asp:TextBox ValidationGroup="ed" CssClass="form-control date" ID="TextBox5" runat="server" Text='<%# Bind("RelaeseDate", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ed" CssClass="text-danger" ControlToValidate="Textbox5" Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Relaese date required " Text="Relaese date required"></asp:RequiredFieldValidator>
                            
                        </div>
                    </div>
                    
                    <div class="form-group row mb-1">
                        <label class="col-form-label col-2 text-end">
                            Picture
                        </label>
                        <div class="col-4">
                             <asp:FileUpload CssClass="form-control" ID="FileUpload1" runat="server" />
                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("Picture") %>'/>
                            <asp:RequiredFieldValidator ControlToValidate="FileUpload1" ValidationGroup="ed" CssClass="text-danger" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Picture is required" Text="Picture is required"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                     <div class="form-group row mb-1">
                        <label class="col-form-label col-2 text-end">
                            Country Of Origin
                        </label>
                        <div class="col-4">
                             <asp:TextBox CssClass="form-control" ValidationGroup="ed" ID="TextBox7" runat="server" Text='<%# Bind("CountryOfOrigin") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ed" CssClass="text-danger" ControlToValidate="Textbox7" Display="Dynamic" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Country is required " Text="Country is required"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    
                    <div class="form-group row mb-1">
                        <label class="col-form-label col-2 text-end">
                            Model
                        </label>
                        <div class="col-4">
                            <asp:DropDownlist DataSourceID="dsModels" DataTextField="ModelName" DataValueField="ModelId" ValidationGroup="ed" CssClass="form-select" ID="TextBox2" runat="server" SelectedValue='<%# Bind("ModelId") %>'></asp:DropDownlist>
                            <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="Textbox2" ID="RequiredFieldValidator9" runat="server" ErrorMessage="Model required "></asp:RequiredFieldValidator>
                        </div>
                    </div>
                   <div class="form-group row mb-1">
                        <
                        <div class="col-4 offset-2">
                           <asp:LinkButton CssClass="btn btn-secondary btn-sm" ValidationGroup="ed" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton CssClass="btn btn-danger btn-sm" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </div>
                    </div>
                   
                </InsertItemTemplate>
                
            </asp:FormView>
        </div>
    </div>
    <asp:SqlDataSource ID="dsMobileDevice" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDB %>" DeleteCommand="DELETE FROM [MobileDevices] WHERE [MobileDeviceId] = @MobileDeviceId" InsertCommand="INSERT INTO [MobileDevices] ([MobileDeviceName], [Price], [Quantity], [RelaeseDate], [Picture], [CountryOfOrigin], [ModelId]) VALUES (@MobileDeviceName, @Price, @Quantity, @RelaeseDate, @Picture, @CountryOfOrigin, @ModelId)" SelectCommand="SELECT MobileDevices.MobileDeviceId, MobileDevices.MobileDeviceName, MobileDevices.Price, MobileDevices.Quantity, MobileDevices.RelaeseDate, MobileDevices.Picture, MobileDevices.CountryOfOrigin, MobileDevices.ModelId, Models.ModelName FROM MobileDevices INNER JOIN Models ON MobileDevices.ModelId = Models.ModelId" UpdateCommand="UPDATE [MobileDevices] SET [MobileDeviceName] = @MobileDeviceName, [Price] = @Price, [Quantity] = @Quantity, [RelaeseDate] = @RelaeseDate, [Picture] = @Picture, [CountryOfOrigin] = @CountryOfOrigin, [ModelId] = @ModelId WHERE [MobileDeviceId] = @MobileDeviceId">
        <DeleteParameters>
            <asp:Parameter Name="MobileDeviceId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MobileDeviceName" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter DbType="Date" Name="RelaeseDate" />
            <asp:Parameter Name="Picture" Type="String" />
            <asp:Parameter Name="CountryOfOrigin" Type="String" />
            <asp:Parameter Name="ModelId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MobileDeviceName" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter DbType="Date" Name="RelaeseDate" />
            <asp:Parameter Name="Picture" Type="String" />
            <asp:Parameter Name="CountryOfOrigin" Type="String" />
            <asp:Parameter Name="ModelId" Type="Int32" />
            <asp:Parameter Name="MobileDeviceId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsModels" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDB %>" SelectCommand="SELECT [ModelId], [ModelName] FROM [Models]"></asp:SqlDataSource>
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
