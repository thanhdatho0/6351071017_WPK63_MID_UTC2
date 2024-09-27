<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucManageProducts.ascx.cs" Inherits="de1.UserControl.ucManageBeverage" %>
<table style="width:100%;">
    <tr>
        <td>Product name:</td>
        <td><asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxName" ErrorMessage="Tên đồ uống chưa nhập"></asp:RequiredFieldValidator>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>Price</td>
        <td>
            <asp:TextBox ID="TextBoxPrice" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPrice" ErrorMessage="Mức giá đồ uống chưa nhập"></asp:RequiredFieldValidator>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>Category</td>
        <td><asp:DropDownList ID="DropDownListCategory" runat="server" DataSourceID="EntityDataSource1" DataTextField="Name" DataValueField="ID"></asp:DropDownList></td>
        <td>&nbsp;</td>
    </tr>
    <tr>
    <td>Description</td>
    <td>
        <asp:TextBox ID="TextBoxDescription" TextMode="MultiLine" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxDescription" ErrorMessage="Mô tả thông tin đồ uống chưa nhập"></asp:RequiredFieldValidator>
        </td>
       
    <td>&nbsp;</td>
</tr>
    <tr>
     <td>Picture</td>
     <td>
         <asp:FileUpload ID="FileUploadPicture" runat="server" />
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="FileUploadPicture" ErrorMessage="Hình ảnh đồ uống chưa nhập"></asp:RequiredFieldValidator>
        </td>
     <td>&nbsp;</td>
 </tr>

    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:Button ID="ButtonAddNew" runat="server" Text="Add new" OnClick="ButtonAddNew_Click"/></td>
    </tr>
</table>
<hr />
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="EntityDataSource1">
    <Columns>
                <asp:TemplateField HeaderText="No.">
        <ItemTemplate>
            <%# Container.DataItemIndex+1 %>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Picture">
        <ItemTemplate>
            <asp:Image runat="server" ID="imageProduct" ImageUrl='<%# "~/images/Beverages/" + Eval("ImageFilePath") %>' Width="100px" Height="100px" />
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Name">
        <ItemTemplate>
            <asp:HyperLink ID="HyperLink1" Text='<%# Eval("Name")%>' Target="_blank" runat="server" NavigateUrl='<%# "~/Details.aspx?id="+Eval("id") %>'></asp:HyperLink>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField>
        <ItemTemplate>
            <asp:Button runat="server" OnClientClick="return confirm('Do you really want to delete this product?');" ID="DeleteButton" Text="Delete" CommandName="DeleteProduct" CommandArgument='<%# Eval("id") %>'/>
        </ItemTemplate>
    </asp:TemplateField>


        <asp:TemplateField>
    <ItemTemplate>
        <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="EditProduct" CommandArgument='<%# Eval("id") %>' />
    </ItemTemplate>
</asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=QLDoUongEntities1" DefaultContainerName="QLDoUongEntities1" EnableFlattening="False" EntitySetName="Beverages">
</asp:EntityDataSource>

