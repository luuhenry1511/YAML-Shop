<%@ Page Title="Đăng nhập" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="dangnhap.aspx.cs" Inherits="YAML.dangnhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="CSS/Dangnhap.css" type="text/css">
    <section>
    <div id="dangnhap">
            <div class="box">
                
            <div class="input-group" runat="server">
                <p>ĐĂNG NHẬP</p>
                <label>Tên tài khoản</label>
                <br/>
                <asp:TextBox ID="hoten" runat="server" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" display="Dynamic" ControlToValidate="hoten" ErrorMessage="Thông tin bắt buộc" ForeColor="#FF3300" Font-Size="Small" CssClass="Vali" Text="Thông tin bắt buộc"></asp:RequiredFieldValidator>
                <br />
                <br/>
                <label>Mật khẩu</label>
                <br/>
                <asp:TextBox ID="password" CssClass="input-field" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="Thông tin bắt buộc" ForeColor="#FF3300" Font-Size="Small" CssClass="Vali"></asp:RequiredFieldValidator>
                <br/>
                <br />
                <a id="Quenmk" href="">Quên mật khẩu</a>
                
                
                <asp:Button ID="Button1" runat="server" Text="Đăng nhập" CssClass="submit-btn" OnClick="Button1_Click" />
                <asp:Label ID="label" CssClass="lblkt" runat="server" Text="Label" Visible="False">Sai tên đăng nhập hoặc mật khẩu</asp:Label>
                
            </div>
            </div>
            <div id="dangky">
                
                    <p id="title">ĐĂNG KÝ</p>
                    <p align="justify">Nếu quý khách vẫn chưa có tài khoản trên Yaml.com, hãy sử dụng tùy chọn này để truy cập biểu mẫu đăng ký.</p>
                    <br/>
                    <p align="justify">Bằng cách cung cấp cho chúng tôi thông tin chi tiết của quý khách, 
                        quá trình mua hàng trên Yaml.com sẽ là một trải nghiệm thú vị và nhanh chóng hơn.</p>
                <asp:HyperLink ID="linkdk" CssClass="dk" runat="server" NavigateUrl="dangky.aspx" Text="Tạo tài khoản" align="center"></asp:HyperLink>
                        
               
            </div>
        </div>
    </section>
</asp:Content>
