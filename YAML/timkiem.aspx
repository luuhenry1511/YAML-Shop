<%@ Page Title="Tìm kiếm" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="timkiem.aspx.cs" Inherits="YAML.timkiem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link rel="stylesheet" href="CSS/timkiem.css" type="text/css">
    <section>
    <asp:TextBox ID="textLook" runat="server" CssClass="txtTim" Height="30" Width="400" placeholder="Nhập nội dung cần tìm..."></asp:TextBox>
    <asp:ImageButton ID="ImageButton1" CssClass="tim" runat="server" ImageUrl="~/Image/look.png" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [SanPham] WHERE dbo.fuConvertToUnsign1(TenSP) LIKE N'%' + dbo.fuConvertToUnsign1(@TenSP) + '%'">
        <SelectParameters>
            <asp:ControlParameter ControlID="textLook" Name="TenSP" PropertyName="Text" Type="String" />
        </SelectParameters>
     </asp:SqlDataSource>
    <asp:DataList ID="Listtimkiem" runat="server" RepeatColumns="4" DataSourceID="SqlDataSource1">
        <ItemTemplate>
                        <table ID="Table1" runat="server" class="sanpham">
                            <tr><td>
                                <asp:Image ID="imghinhsp" CssClass="hinhsp" runat="server" ImageUrl='<%# "../Image/somitaydai/"+ Eval("Hinh") %>' /></td></tr>
                            <tr><td>
                                <asp:HyperLink ID="hpltensp" CssClass="link" runat="server" NavigateUrl='<%# "../chitietsp.aspx?maSP="+ Eval("MaSP") %>' Text='<%# Eval("TenSP") %>'></asp:HyperLink></td></tr>
                            <tr><td>
                                <asp:Label ID="lbgiasp" runat="server" Text='<%# String.Format("{0:0,0 VNĐ}",  Eval("DonGia")).Replace(",",".") %>'></asp:Label></td></tr>
                        </table>
                    </ItemTemplate>
    </asp:DataList>
    </section>
</asp:Content>
