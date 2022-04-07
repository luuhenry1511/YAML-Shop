<%@ Page Title="Đăng ký" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="dangky.aspx.cs" Inherits="YAML.dangky" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link rel="stylesheet" href="CSS/dangky.css" type="text/css">
    <!--CODE ĐĂNG KÝ-->
            <title>Đăng ký</title>
            <h2>
                NHẬP THÔNG TIN CÁ NHÂN CỦA BẠN
            </h2>
     
        <div class="signup">
           
        <div class="box box1">
                <div>
                <div class="inputbox">
                   <label>Họ và tên</label>
                    <asp:textbox runat="server" ID="hoten" CssClass="input-field"  placeholder="Nhập họ và tên"></asp:textbox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập họ tên" ControlToValidate="hoten" Font-Size="Small" ForeColor="#FF3300" CssClass="kiemtra"></asp:RequiredFieldValidator>
                    
                </div>

                <div class="inputbox">
                    <label>Địa chỉ</label>
                    <asp:textbox runat="server" ID="diachi" CssClass="input-field"></asp:textbox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập địa chỉ" ControlToValidate="diachi" Font-Size="Small" CssClass="kiemtra" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    
                </div>

                <div class="inputbox">
                    <label>Email</label>
                    <asp:TextBox ID="Email" CssClass="input-field" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng nhập Email" Font-Size="Small" Display="Dynamic" ControlToValidate="Email" CssClass="kiemtra" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="REVEmail" runat="server" ErrorMessage="Không đúng định dạng email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Email" ForeColor="#FF3300" CssClass="kiemtra" Font-Size="Small" Display="Dynamic"></asp:RegularExpressionValidator>
                    
                    
                </div>
                <div class="inputbox">
                    <label>Số điện thoại</label>
                    <asp:textbox ID="Sodt" runat="server" CssClass="input-field"></asp:textbox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Vui lòng nhập số điện thoại" ControlToValidate="Sodt" Font-Size="Small" CssClass="kiemtra" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="phaico10so"  runat="server" ErrorMessage="Số điện thoại không hợp lệ" ControlToValidate="Sodt" Font-Size="Small" ValidationExpression="0\d{9}" CssClass="kiemtra" ForeColor="#FF3300" Display="Dynamic"></asp:RegularExpressionValidator>
                    
                    
                    
                    
                </div>           
            </div>
        </div>
        <div class="box box2">
                <div>
                <div class="inputbox">
                    <label>Tên tài Khoản</label>
                    <asp:textbox ID="Username" runat="server" CssClass="input-field"></asp:textbox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Vui lòng điền tên đăng nhập" ControlToValidate="Username" Font-Size="Small" CssClass="kiemtra" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <br />
                    

                </div>

                <div class="inputbox">
                    <label>Mật Khẩu</label>
                    <asp:textbox ID="pass" runat="server" CssClass="input-field" TextMode="Password"></asp:textbox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Vui lòng điền mật khẩu" Font-Size="Small" ControlToValidate="pass" ForeColor="#FF3300" CssClass="kiemtra"></asp:RequiredFieldValidator>
                    <br />
                    
                </div>
                <div class="inputbox">
                    <label> Nhập Lại Mật Khẩu</label>
                    <asp:textbox ID="passagain" runat="server" CssClass="input-field" TextMode="Password"></asp:textbox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Không được để trống" Font-Size="Small" ControlToValidate="passagain" CssClass="kiemtra" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CVPass" runat="server" ErrorMessage="Không trùng khớp với mật khẩu" ControlToValidate="passagain" ControlToCompare="pass" Font-Size="Small" CssClass="kiemtra" ForeColor="#FF3300" Display="Dynamic"></asp:CompareValidator>
                    
                </div>
                
            </div>
        </div>     
            
    </div>
         <asp:Button ID="Button1" CssClass="submit-btn" runat="server" Text="Tạo tài khoản" OnClick="Button1_Click" /> 
    <asp:Label ID="lblLoi" runat="server" CssClass="tbLoi" Visible="False"></asp:Label>
</asp:Content>
