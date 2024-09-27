<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCategoriesList.ascx.cs" Inherits="de1.UserControl.CategoriesList" %>
<hr />
<h2>Beverage Category Available</h2>
<asp:DataList ID="DataList1" runat="server" DataKeyField="CatID" DataSourceID="EntityDataSource1">
    <ItemTemplate>
        
        <div>
            <asp:HyperLink NavigateUrl='<%# "~/Category.aspx?CatID=" + Eval("CatID") %>' ID="CatNameLabel" runat="server" Text='<%# Eval("CatName") + "(" + Eval("Beverages.Count") + ")" %>'></asp:HyperLink>
        </div>
    </ItemTemplate>
</asp:DataList>
<asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=QLDoUongEntities1" DefaultContainerName="QLDoUongEntities1" EnableFlattening="False" EntitySetName="Categories" Include="Beverages">
</asp:EntityDataSource>

