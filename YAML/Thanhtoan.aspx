<%@ Page Title="Thanh toán" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Thanhtoan.aspx.cs" Inherits="YAML.Thanhtoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="CSS/thanhtoan.css" type="text/css">
    
    <section>
    <div id="khungbaongoai">
            <h2>THÔNG TIN ĐƠN ĐẶT HÀNG</h2>
            <div id="tttaikhoan" class="tttk">
                <h3>THÔNG TIN TÀI KHOẢN</h3>
                <p>Họ tên: <asp:Label ID="lbHoTen" runat="server"  CssClass="NhanNoiDung"></asp:Label></p>
                <p>Địa chỉ: <asp:Label ID="lbDiaChi" runat="server"  CssClass="NhanNoiDung"></asp:Label></p>
                <p>Điện thoại: <asp:Label ID="lbDienThoai" runat="server" CssClass="NhanNoiDung"></asp:Label></p>
                <p>Email: <asp:Label ID="lbEmail" runat="server" CssClass="NhanNoiDung"></asp:Label></p>
            </div>
            <div id="ttgiohang" class="ttgh">
                <h3>THÔNG TIN GIỎ HÀNG</h3>
                <asp:GridView ID="gvGioHang" CssClass="gvttgh" runat="server" Width=752px Height="200px" AutoGenerateColumns="False" Enabled="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                    <Columns>
            <asp:BoundField DataField="STT" HeaderStyle-CssClass="Chitiet" ItemStyle-CssClass="Chitietstt" HeaderText="STT" >
    
                <HeaderStyle CssClass="Chitiet"></HeaderStyle>

                <ItemStyle CssClass="Chitietstt" HorizontalAlign="Center"></ItemStyle>
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
                <ItemStyle CssClass="Chitiettensp"></ItemStyle>
            </asp:BoundField>

            <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" HeaderStyle-CssClass="Chitiet" ItemStyle-CssClass="Chitietdongia" SortExpression="DonGia" >
                <HeaderStyle CssClass="Chitiet"></HeaderStyle>
                <ItemStyle CssClass="Chitietdongia" HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            

            <asp:TemplateField HeaderText="Số lượng" HeaderStyle-CssClass="Chitiet"> <ItemTemplate>
                <asp:TextBox ID="txtSoLuong" runat="server" CssClass="txtSL" Text='<%#Bind("SoLuong")%>' TextMode="Number"></asp:TextBox> </ItemTemplate> 
                <HeaderStyle CssClass="Chitiet"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

            <asp:BoundField HeaderText="Thành tiền" HeaderStyle-CssClass="Chitiet" ItemStyle-CssClass="Chitietthanhtien" DataField="ThanhTien">
                <HeaderStyle CssClass="Chitiet"></HeaderStyle>
                <ItemStyle CssClass="Chitietthanhtien" HorizontalAlign="Center"></ItemStyle>
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
                
                
                <p>Tổng thành tiền:<asp:Label ID="lbTongTien" CssClass="tongtien" runat="server"></asp:Label> VNĐ</p>
            </div>
            <div id="ttgiaohang" class="ttgh">
                <h3>THÔNG TIN GIAO HÀNG</h3>
                <p>Ngày giao:</p> 
                <div id="calendar">
                        <asp:Calendar ID="calNgayGiao" CssClass="lichgiao" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="450px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                        </asp:Calendar>
                </div>
                <p>Người nhận: <asp:TextBox ID="txtNguoiNhan" runat="server" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RqNguoiNhan" runat="server" ErrorMessage="Người nhận không được rỗng" ControlToValidate="txtNguoiNhan"></asp:RequiredFieldValidator> </p>
                <p>Địa chỉ: <asp:TextBox ID="txtDiaChiNhan" runat="server" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RqDiaChi" runat="server" ErrorMessage="Địa chỉ không được rỗng" ControlToValidate="txtDiaChiNhan"></asp:RequiredFieldValidator> </p>
                <p>Điện thoại: <asp:TextBox ID="txtDienThoaiNhan" runat="server" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RqDienThoai" runat="server" ErrorMessage="Số điện thoại không được rỗng" ControlToValidate="txtDienThoaiNhan"></asp:RequiredFieldValidator> </p>
                <p>Hình thức thanh toán: 
                    <asp:RadioButtonList ID="rblHinhThucThanhToan" runat="server" CssClass="rbl">
                                                <asp:ListItem Value="0">Thanh toán trực tiếp</asp:ListItem>
                                                <asp:ListItem Value="1">Thanh toán sau khi nhận hàng</asp:ListItem>
                    </asp:RadioButtonList></p>
                <p>Hình thức giao hàng: 
                    <asp:RadioButtonList ID="rblHinhThucGiaoHang" runat="server" CssClass="rbl">
                        <asp:ListItem Value="0">Giao trực tiếp</asp:ListItem>
                        <asp:ListItem Value="1">Chuyển giao</asp:ListItem>
                    </asp:RadioButtonList></p>
            </div>
            <asp:Button ID="btDongY" runat="server" CssClass="btDongY" Text="Xác nhận" OnClick="btDongY_Click" />
            <asp:Label ID="LBThongBaoLoi" runat="server" ></asp:Label>
    </div>
   </section>
</asp:Content>
