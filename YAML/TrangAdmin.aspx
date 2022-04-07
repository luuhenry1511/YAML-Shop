<%@ Page Title="Trang quản trị" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="TrangAdmin.aspx.cs" Inherits="YAML.TrangAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         
    <link rel="stylesheet" href="CSS/trangquantri.css" type="text/css" />
    <section>
     <div id="quantri">
         <div id="menu">
            <asp:Menu ID="Menu1" runat="server"  OnMenuItemClick="Menu1_MenuItemClick" Orientation="Horizontal" Font-Size="Large" Height="45px" StaticMenuItemStyle-CssClass="tab"
 StaticSelectedStyle-CssClass="selectedTab" CssClass="tabs" DisappearAfter="3">
            
            <DynamicHoverStyle BackColor="#990000" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle BackColor="#FFFBD6" />
            <DynamicSelectedStyle BackColor="#FFCC66" />

                <Items >
                    <asp:MenuItem Text="Danh mục " Value="0"></asp:MenuItem>
                    <asp:MenuItem Text="Sản phẩm " Value="1"></asp:MenuItem>
                    <asp:MenuItem Text="Khách hàng " Value="2"></asp:MenuItem>
                    <asp:MenuItem Text="Nhân viên " Value="3"></asp:MenuItem>
                </Items>
            
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle BackColor="black" ForeColor="White"/>
        
            </asp:Menu>
        </div>
         <!-- Phần hiển thị -->

        <div class="tabContents">
        <asp:MultiView ID="MultiView1" runat="server" >
            <asp:View ID="View0" runat="server">
                <div class="vungchonthem">
                    <asp:Button ID="btnThemDM" CssClass="btnThem" runat="server" Text="THÊM DANH MỤC" OnClick="btnThemDM_Click" />
                </div>
               <div class="Ad_pro_wrap" id="ThemDM" runat="server">
                    <h4>THÊM DANH MỤC MỚI</h4>
                    <p>Tên danh mục mới</p>
                    <asp:TextBox ID="txtTenDM" CssClass="txtTenDM" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng điền tên danh mục." ControlToValidate="txtTenDM"></asp:RequiredFieldValidator>
                    <p>&nbsp </p>
                    <asp:Button ID="btnThemDMmoi" CssClass="nutdieukhien" runat="server" Text="Thêm" OnClick="btnThemDMmoi_Click" />
                    <asp:Button ID="btnHuyDM" CssClass="nutdieukhien" runat="server" Text="Hủy" CausesValidation="False" OnClick="btnHuyDM_Click" />
               </div>
                <asp:GridView ID="gvDanhMuc" runat="server" DataKeyNames="MaDM" CssClass="gridviewDM" DataSourceID="Danhmucsp" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" Width="439px" OnRowUpdating="gvDanhMuc_RowUpdating" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" >
                    <Columns>
                        <asp:BoundField DataField="MaDM" HeaderText="Mã danh mục" ReadOnly="True" />
                        <asp:BoundField HeaderText="Tên danh mục" DataField="TenDM" />
                        <asp:ButtonField Text="Xóa" CommandName="Xoadm" HeaderText="Xóa" ItemStyle-CssClass="gvbutton" ControlStyle-CssClass="gvbutton" ><ControlStyle CssClass="gvbutton" /><ItemStyle CssClass="gvbutton" /></asp:ButtonField>
                        <asp:CommandField CancelText="Hủy" DeleteText="" EditText="Sửa" ShowEditButton="True" UpdateText="Lưu" EditImageUrl="~/Image/refresh.png" ItemStyle-CssClass="gvbutton" ControlStyle-CssClass="gvbutton" HeaderText="Chỉnh sửa"><ControlStyle CssClass="gvbutton" /><ItemStyle CssClass="gvbutton" /></asp:CommandField>
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
                
                <asp:SqlDataSource ID="Danhmucsp" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [DANHMUC]"></asp:SqlDataSource>
                
            </asp:View>
            <asp:View ID="View1" runat="server">
                <asp:Button ID="btThemSP" CssClass="btnThem" runat="server" Text="THÊM SẢN PHẨM" OnClick="btThemSP_Click"  />
                <asp:GridView ID="gvSanPham" runat="server" CssClass="gridviewSP" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="MaSP" DataSourceID="SanPham" OnRowCommand="gvSanPham_RowCommand" OnRowUpdating="gvSanPham_RowUpdating" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="1078px">
                    <Columns>
                        <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" ><ItemStyle Width="50px" /></asp:BoundField>
                        <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" ><ControlStyle Width="100px" /></asp:BoundField>
                        <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" />
                        <asp:BoundField DataField="MoTa" HeaderText="Mô tả" ItemStyle-CssClass="mota"><ItemStyle Width="100px" /></asp:BoundField>
                        <asp:BoundField DataField="Hinh" HeaderText="Hình" ><ControlStyle Width="60px" />
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NgayCapNhat" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày cập nhật" ><ControlStyle Width="100px" />
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SoLuongBan" HeaderText="Số lượng bán" ><ControlStyle Width="30px" />
                        <FooterStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:ButtonField CommandName="Xoa" Text="Xóa" HeaderText="Xóa" ItemStyle-CssClass="gvbutton" ControlStyle-CssClass="gvbutton" ><ControlStyle CssClass="gvbutton" /><ItemStyle CssClass="gvbutton" /></asp:ButtonField>
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Lưu" ItemStyle-CssClass="gvbutton" ControlStyle-CssClass="gvbutton" HeaderText="Chỉnh sửa"><ControlStyle CssClass="gvbutton" /><ItemStyle CssClass="gvbutton" /></asp:CommandField>
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
                <asp:SqlDataSource ID="SanPham" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [SANPHAM]"></asp:SqlDataSource>
            </asp:View>
        <asp:View ID="View2" runat="server">
            
            <asp:GridView ID="gvKhachHang" runat="server" CssClass="gridviewKH" AutoGenerateColumns="False" DataKeyNames="MaKH" DataSourceID="Khachhang" OnRowCommand="gvKhachHang_RowCommand" OnRowUpdating="gvKhachHang_RowUpdating" Width="1073px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowPaging="True" >
                <Columns>
                    <asp:BoundField DataField="MaKH" HeaderText="MaKH" InsertVisible="False" ReadOnly="True" SortExpression="MaKH" ><ControlStyle Width="50px" /></asp:BoundField>
                    <asp:BoundField DataField="HoTenKH" HeaderText="Tên khách hàng" ><ControlStyle Width="100px" /></asp:BoundField>
                    <asp:BoundField DataField="DiaChiKH" HeaderText="Địa chỉ khách hàng" ><ControlStyle Width="200px" /></asp:BoundField>
                    <asp:BoundField DataField="DienThoaiKH" HeaderText="Số điện thoại" ><ControlStyle Width="60px" /></asp:BoundField>
                    <asp:BoundField DataField="TenDN" HeaderText="Tên đăng nhập" ><ControlStyle Width="60px" /></asp:BoundField>
                    <asp:BoundField DataField="MatKhau" HeaderText="Mật khẩu" ><ControlStyle Width="60px" /></asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email" ><ControlStyle Width="200px" /></asp:BoundField>
                    <asp:ButtonField CommandName="Xoa" HeaderText="Xóa" Text="Xóa" ItemStyle-CssClass="gvbutton" ControlStyle-CssClass="gvbutton"><ControlStyle CssClass="gvbutton" /><ItemStyle CssClass="gvbutton" Width="50px" /></asp:ButtonField>
                    <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Lưu" ItemStyle-CssClass="gvbutton" ControlStyle-CssClass="gvbutton" HeaderText="Chỉnh sửa"><ControlStyle CssClass="gvbutton" /><ItemStyle CssClass="gvbutton" Width="50px" /></asp:CommandField>
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
            <asp:SqlDataSource ID="Khachhang" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [KHACHHANG]"></asp:SqlDataSource>
        </asp:View>
            <asp:View ID="View3" runat="server">
                <asp:Button ID="btnThemAdmin" CssClass="btnThem" runat="server" Text="THÊM NHÂN VIÊN" OnClick="btnThemAdmin_Click"  />
                <asp:GridView ID="gvAdmin" runat="server" CssClass="gridviewAD" AutoGenerateColumns="False" OnRowCommand="gvAdmin_RowCommand" DataKeyNames="MaAdmin" DataSourceID="Admin" OnRowUpdating="gvAdmin_RowUpdating" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="1078px" AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="MaAdmin" HeaderText="Mã nhân viên" ReadOnly="True" ><ControlStyle Width="50px" /></asp:BoundField>
                        <asp:BoundField DataField="HoTenAd" HeaderText="Họ tên nhân viên" ><ControlStyle Width="100px" /></asp:BoundField>
                        <asp:BoundField DataField="DiaChiAd" HeaderText="Địa chỉ" ><ControlStyle Width="100px" /></asp:BoundField>
                        <asp:BoundField DataField="DienThoai" HeaderText="Số điện thoại" ><ControlStyle Width="100px" /></asp:BoundField>
                        <asp:BoundField DataField="TenDNAd" HeaderText="Tên đăng nhập" ><ControlStyle Width="100px" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="MatKhauAd" HeaderText="Mật khẩu" ><ControlStyle Width="100px" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NgaySinhAd" HeaderText="Ngày sinh" DataFormatString="{0:dd/MM/yyyy}" ApplyFormatInEditMode="True" ><ControlStyle Width="100px" /></asp:BoundField>
                        <asp:BoundField DataField="GioiTinhAd" HeaderText="Giới tính" ><ControlStyle Width="50px" /></asp:BoundField>
                        <asp:BoundField DataField="EmailAd" HeaderText="Email" ><ControlStyle Width="100px" /></asp:BoundField>
                        <asp:BoundField DataField="QuyenAd" HeaderText="Quyền" ><ControlStyle Width="50px" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:ButtonField CommandName="Xoa" HeaderText="Xóa" Text="Xóa" ItemStyle-CssClass="gvbutton" ControlStyle-CssClass="gvbutton"><ControlStyle CssClass="gvbutton" /><ItemStyle CssClass="gvbutton" /></asp:ButtonField>
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Lưu" ItemStyle-CssClass="gvbutton" ControlStyle-CssClass="gvbutton" HeaderText="Chỉnh sửa"><ControlStyle CssClass="gvbutton" /><ItemStyle CssClass="gvbutton" /></asp:CommandField>
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
                <asp:SqlDataSource ID="Admin" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [ADMIN]"></asp:SqlDataSource>
            </asp:View>
            
        </asp:MultiView>
        <div class="loi">
            <asp:Label ID="lbLoi" CssClass="tbloi" runat="server"></asp:Label>
        </div>
       </div>     
            
     </div>
    </section>
</asp:Content>
