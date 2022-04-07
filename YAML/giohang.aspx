<%@ Page Title="Giỏ hàng" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="giohang.aspx.cs" Inherits="YAML.giohang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="CSS/giohang.css" type="text/css">

    <section>
    <asp:Panel ID="Panel1" runat="server" CssClass="none">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Image/giohangtrong.jpg" Width=850px />
    </asp:Panel>
    <asp:GridView ID="gvDonHang" CssClass="gvGioHang" runat="server" AutoGenerateColumns="False" Width="1084px" Height="265px" DataKeyNames="MaSP" BorderStyle="None" OnRowCommand="gvDonHang_RowCommand" OnRowDeleting="gvDonHang_RowDeleting" BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="STT" HeaderStyle-CssClass="Chitiet" ItemStyle-CssClass="Chitietstt" HeaderText="STT" >
                <HeaderStyle CssClass="Chitiet"></HeaderStyle>
                <ItemStyle CssClass="Chitietstt"></ItemStyle>
            </asp:BoundField>

            
            <asp:TemplateField  ControlStyle-CssClass="spGioHang">
                <ItemTemplate>
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# "~/Image/Somitaydai/" +Eval("Hinh") %>' />
                </ItemTemplate>

<ControlStyle CssClass="spGioHang"></ControlStyle>
            </asp:TemplateField>

            <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" HeaderStyle-CssClass="Chitiet" ItemStyle-CssClass="Chitietmasp" >
<HeaderStyle CssClass="Chitiet"></HeaderStyle>

<ItemStyle CssClass="Chitietmasp" HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" HeaderStyle-CssClass="Chitiet" ItemStyle-CssClass="Chitiettensp"  SortExpression="TenSP" >
                <HeaderStyle CssClass="Chitiet"></HeaderStyle>
                <ItemStyle CssClass="Chitiettensp" HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>

            <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" HeaderStyle-CssClass="Chitiet" ItemStyle-CssClass="Chitietdongia" SortExpression="DonGia" >
                <HeaderStyle CssClass="Chitiet"></HeaderStyle>
                <ItemStyle CssClass="Chitietdongia"></ItemStyle>
            </asp:BoundField>
            

            <asp:TemplateField HeaderText="Số lượng" HeaderStyle-CssClass="Chitiet"> <ItemTemplate>
                <asp:TextBox ID="txtSoLuong" runat="server" CssClass="txtSL" Text='<%#Bind("SoLuong")%>' TextMode="Number"></asp:TextBox> </ItemTemplate> 
                <HeaderStyle CssClass="Chitiet"></HeaderStyle>
            </asp:TemplateField>

            <asp:BoundField HeaderText="Thành tiền" HeaderStyle-CssClass="Chitiet" ItemStyle-CssClass="Chitietthanhtien" DataField="ThanhTien">
                <HeaderStyle CssClass="Chitiet"></HeaderStyle>

<ItemStyle CssClass="Chitietthanhtien" HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>

            <asp:CommandField ButtonType="Button" HeaderText="Xóa" ShowDeleteButton="True" HeaderStyle-CssClass="Chitiet" ControlStyle-CssClass="Chitietxoa" DeleteText="Xóa" >
<ControlStyle CssClass="Chitietxoa"></ControlStyle>

<HeaderStyle CssClass="Chitiet"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
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
        <p class="tongtien">Tổng thành tiền: <asp:Label ID="lbTongThanhTien" runat="server"></asp:Label> VNĐ</p>
        <div class="dieukhien">
            <asp:Button ID="btTiepTucMua" CssClass="nutdieukhien" runat="server" text="Tiếp tục mua" OnClick="btTiepTucMua_Click" /><asp:Button ID="btXoaGioHang" runat="server" CssClass="nutdieukhien" text="Xóa giỏ hàng" OnClick="btXoaGioHang_Click" /><asp:Button ID="btCapNhat" runat="server" CssClass="nutdieukhien" Text="Cập nhật" OnClick="btCapNhat_Click"  /><asp:Button ID="btThanhToan" runat="server" CssClass="nutdieukhien" text="Thanh Toán" OnClick="btThanhToan_Click" />
        </div>
</section>
</asp:Content>
