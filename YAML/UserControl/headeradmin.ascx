<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="headeradmin.ascx.cs" Inherits="YAML.UserControl.headeradmin" %>
<div id="logo">
                <a href="index.aspx"><img src="Image/thuonghieu.jpg" height="60"></a>
                
            </div>
            <hr  width="60%" size="10px" align="center" color="red" />
            <div id="dn">
                <ul>
                <li> <div id="forkh">
                   
                               
                  
                <div class="dropdown2">
                    <img class="img-header-right" alt="Tài Khoản" src="../Image/account.jpg" height="25" width="25"/>
                    <a id="aTaiKhoan" runat="server">Tài khoản</a>
                    <asp:Label ID="lbTenTK" runat="server" Text=""></asp:Label>
                    <div class="dropdown-content2">
                        
                        <a id="aDangNhap" runat="server" href="../dangnhap.aspx">Đăng Nhập</a>
                        
                        <a id="aTTTK" runat="server" href="../#">Thông Tin </a>
                        <a id="aQuanTri" runat="server" href="../TrangAdmin.aspx">Trang Quản Trị</a>
                        <asp:Button ID="btDangXuat" runat="server" CssClass="nutdangxuat" Text="Đăng Xuất" OnClick="btDangXuat_Click" />
                        
                    
                     </div>
                </div>
                </li>
                </ul>		
            </div>