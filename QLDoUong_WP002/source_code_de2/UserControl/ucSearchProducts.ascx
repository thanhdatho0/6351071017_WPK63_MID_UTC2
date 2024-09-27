<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSearchProducts.ascx.cs" Inherits="de1.UserControl.ucSearchProducts" %>
<table class="auto-style1">
    <tr>
        <td class="auto-style2">Name</td>
        <td colspan="2"> 
            <asp:TextBox ID="txtName" runat="server" Width="361px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Price</td>
        <td class="auto-style3">
                <asp:TextBox ID="txtLowPrice" runat="server" Width="161px"></asp:TextBox>
        </td>

        <td class="auto-style4">
              <asp:TextBox ID="txtUPrice" runat="server" Width="161px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
            <asp:Button ID="search" runat="server" Text="Search" />
        </td>
    </tr>
</table>
<asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="EntityDataSource1">
    <EmptyDataTemplate>
        No Beverages Found
    </EmptyDataTemplate>
    <ItemTemplate>
        <div class="ProductsListWrapper">
    <div class="ProductsTitle">
        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
    </div>
    <asp:Image ID="ProductImage" Width="100px" Height="100px" runat="server" ImageUrl='<%# "~/images/Beverages/" + Eval("ImageFilePath") %>'/>
</div>
    </ItemTemplate>
    <LayoutTemplate>
        <div id="itemPlaceholderContainer" runat="server" style="">
            <span runat="server" id="itemPlaceholder" />
        </div>
        <div style="">
            <asp:DataPager ID="DataPager1" runat="server">
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
    where="it.Name like '%' +@TName + '%' and it.Price >= @LowPrice and it.Price <= @UpPrice " >

      <WhereParameters>
       <asp:ControlParameter ControlID="txtName" PropertyName="Text" Name="TName" Type="String" />
      <asp:ControlParameter ControlID="txtLowPrice" Name="LowPrice" PropertyName="Text" Type="Decimal" />
      <asp:ControlParameter ControlID="txtUPrice" Name="UpPrice" PropertyName="Text" Type="Decimal" />
  </WhereParameters>
</asp:EntityDataSource>
<br />


