<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucProductsByCategory.ascx.cs" Inherits="de1.UserControl.ucProductsByCategory" %>
<asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="EntityDataSource1">
    <ItemTemplate>
        <div class="ProductsListWrapper">
            <div class="ProductsTitle">
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
            </div>
            <asp:Image ID="ProductImage" runat="server" Width="100px" Height="100px" ImageUrl='<%# "~/images/Beverages/" + Eval("ImageFilePath") %>'/>
            <asp:HyperLink NavigateUrl='<%# "~/Details.aspx?id=" + Eval("id") %>' ID="HyperLink1" runat="server">View Details</asp:HyperLink>
        </div>
    </ItemTemplate>
    <LayoutTemplate>
        <div id="itemPlaceholderContainer" runat="server" style="">
            <span runat="server" id="itemPlaceholder" />
        </div>
        <div style="">
            <asp:DataPager ID="DataPager1" runat="server" PageSize="3">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
        </div>
    </LayoutTemplate>
</asp:ListView>
<asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=QLDoUongEntities1" DefaultContainerName="QLDoUongEntities1" EnableFlattening="False" EntitySetName="Beverages" 
    Where="it.Category.CatID=@CatID">
    <WhereParameters>
        <asp:QueryStringParameter Name="CatID" QueryStringField="CatID" Type="Int32"/>
    </WhereParameters>
</asp:EntityDataSource>

