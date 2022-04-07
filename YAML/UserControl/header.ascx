<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="YAML.UserControl.header" %>
<section>
<div id="logo">
                <a href="index.aspx"><img src="Image/thuonghieu.jpg" height="60"></a>
                
            </div>
            <hr  width="50%" size="10px" align="center" color="red" />
            <div id="dn">
                <ul>
                <li><div class="dropdown">
                        <button class="dropbtn">SẢN PHẨM </button>
                        <div class="dropdown-content">
                            <div class="container">
                                <div class="item1">
                                    <a href=""><b>ÁO</b></a>
                                    <a href="danhmuc.aspx?maDM=6">Áo thun tay ngắn</a>
                                    <a href="danhmuc.aspx?maDM=7">Áo thun tay dài</a>
                                    <a href="danhmuc.aspx?maDM=8">Áo sơ mi tay ngắn</a>
                                    <a href="danhmuc.aspx?maDM=9">Áo sơ mi tay dài</a>
                                </div>
                                <div class="item2">
                                    <a href=""><b>QUẦN</b></a>
                                    <a href="danhmuc.aspx?maDM=4">Quần Short</a>
                                    <a href="danhmuc.aspx?maDM=1">Quần Jean</a>
                                    <a href="danhmuc.aspx?maDM=5">Quần Kaki</a>
                                    <a href="danhmuc.aspx?maDM=2">Quần Tây</a>
                                    <a href="danhmuc.aspx?maDM=3">Quần Jogger</a>
                                </div>
                            </div>
                    </div></div></li>

                <li><a href="gioithieu.aspx">GIỚI THIỆU</a></li>
                <li><a href="trogiup.aspx">TRỢ GIÚP</a></li>
                <li> <div id="forkh">
                   
                    
                    <asp:ImageButton ID="ImageButton1" runat="server" class="timkiem_bt" height="25" width="25" ImageUrl="~/Image/look.png" PostBackUrl="~/timkiem.aspx" />
                    <a href="giohang.aspx" class="giohang"><img  src="Image/shopping-bag.png" width="25" height="25"></a>
                    (<asp:Label ID="lbTongSL" runat="server" Text="0" CssClass="label" ></asp:Label>)          
                    <!--<asp:ImageButton ID="Imgdangnhap" runat="server" Width="25px" Height="25px" ImageUrl="~/Image/account.jpg" PostBackUrl="~/dangnhap.aspx" /> 
                    
                    <asp:Label ID="lblTenDN" runat="server"></asp:Label> -->
                    <div class="dropdown2">
                        <img class="img-header-right" alt="Tài Khoản" src="../Image/account.jpg" height="25" width="25"/>
                    <a id="aTaiKhoan" runat="server">Tài khoản</a>
                    <asp:Label ID="lbTenTK" runat="server" Text=""></asp:Label>
                    <div class="dropdown-content2">
                        
                        <a id="aDangNhap" runat="server" href="../dangnhap.aspx">Đăng Nhập</a>
                        
                        <a id="aTTTK" runat="server" href="../Thongtintaikhoan.aspx">Thông Tin </a>
                        <a id="aQuanTri" runat="server" href="../TrangAdmin.aspx">Trang Quản Trị</a>
                        <asp:Button ID="btDangXuat" CssClass="nutdangxuat" runat="server" Text="Đăng Xuất" OnClick="btDangXuat_Click" />
                        <!--<asp:ImageButton ID="Imgdangxuat" runat="server" Width="25px" Height="25px" ImageUrl="~/Image/account.jpg" OnClick="Imgdangxuat_Click" /> -->
                    
                     </div>
                    

                    
 
                </div>
            </div>
                </li>
                </ul>		
            </div>
</section>