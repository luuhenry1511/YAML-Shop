<%@ Page Title="Thông tin tài khoản" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Thongtintaikhoan.aspx.cs" Inherits="YAML.Thongtintaikhoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="CSS/Thongtintaikhoan.css" type="text/css">
    <section>
        <div id="khungbaongoai">
            <div id="tttaikhoan" class="tttk">
                <h2>THÔNG TIN TÀI KHOẢN</h2>
                <p>Họ tên: <asp:Label ID="lbHoTen" runat="server"  CssClass="NhanNoiDung"></asp:Label></p>
                <p>Địa chỉ: <asp:Label ID="lbDiaChi" runat="server"  CssClass="NhanNoiDung"></asp:Label></p>
                <p>Điện thoại: <asp:Label ID="lbDienThoai" runat="server" CssClass="NhanNoiDung"></asp:Label></p>
                <p>Email: <asp:Label ID="lbEmail" runat="server" CssClass="NhanNoiDung"></asp:Label></p>
            </div>
            <h3>Các đơn hàng</h3>
            <div id="gv">
            <asp:GridView ID="GVCacdonhang" runat="server" CssClass="gvCacdonhang" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="SoDH" HeaderText="Số đơn hàng">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NgayDH" HeaderText="Ngày mua hàng" DataFormatString="{0:dd/MM/yyyy}">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NgayGiaoHang" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày giao hàng" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TriGia" HeaderText="Tổng tiền">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            </div>

        </div>
    </section>
</asp:Content>
