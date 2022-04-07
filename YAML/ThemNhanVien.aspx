<%@ Page Title="Thêm nhân viên" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ThemNhanVien.aspx.cs" Inherits="YAML.ThemNhanVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="CSS/trangquantri.css" type="text/css" />
    <section>
        <div id="quantri">
        <div class="Ad_pro_wrap" runat="server">

                    <h3>THÔNG TIN NHÂN VIÊN</h3>
                    
                    <p class="Ad_pro_p">Tên nhân viên</p>
                    <asp:TextBox ID="txttennv" CssClass="txtTenDM" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="kiemtra" ControlToValidate="txttennv" runat="server" ErrorMessage="Tên nhân viên được bỏ trống" Display="Dynamic"></asp:RequiredFieldValidator>
                    <p class="Ad_pro_p">Địa chỉ</p>
                    <asp:TextBox ID="txtdiachi" CssClass="txtTenDM" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="kiemtra" ControlToValidate="txtdiachi" runat="server" ErrorMessage="Địa chỉ không được bỏ trống" Display="Dynamic"></asp:RequiredFieldValidator>
                    <p class="Ad_pro_p">Điện thoại</p>
                    <asp:TextBox ID="txtdienthoai" CssClass="txtTenDM" runat="server" ></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="kiemtra" ControlToValidate="txtdienthoai" runat="server" ErrorMessage="Số điện thoại không được bỏ trống" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="phaico10so"  runat="server" ErrorMessage="Số điện thoại không hợp lệ" ControlToValidate="txtdienthoai" Font-Size="Small" ValidationExpression="0\d{9}" CssClass="kiemtra" ForeColor="#FF3300" Display="Dynamic"></asp:RegularExpressionValidator>
            <p class="Ad_pro_p">Tên đăng nhập</p>
                    <asp:TextBox ID="txttendn" CssClass="txtTenDM" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="kiemtra" ControlToValidate="txttendn" runat="server" ErrorMessage="Tên đăng nhập không được bỏ trống" Display="Dynamic"></asp:RequiredFieldValidator>
                    <p class="Ad_pro_p">Mật khẩu</p>
                    <asp:TextBox ID="txtmk" runat="server" CssClass="txtTenDM" ></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Mật khẩu không được bỏ trống" ControlToValidate="txtmk" Display="Dynamic"></asp:RequiredFieldValidator>
                    <p class="Ad_pro_p">Ngày sinh</p>
                    <asp:TextBox ID="Ngaysinh" runat="server" CssClass="txtTenDM" TextMode="DateTime"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Vui lòng điền ngày sinh" ControlToValidate="Ngaysinh" Display="Dynamic"></asp:RequiredFieldValidator>   
                    <p class="Ad_pro_p">Giới tính</p>
                    <asp:RadioButtonList ID="rblgioitinh" runat="server" CssClass="rbl">
                                        <asp:ListItem Value="0"> Nữ</asp:ListItem>
                                        <asp:ListItem Value="1"> Nam</asp:ListItem>
                    </asp:RadioButtonList>
                    
                    <p class="Ad_pro_p">Email</p> 
                    <asp:TextBox ID="txtemail" runat="server" CssClass="txtTenDM"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Email không được bỏ trống" ControlToValidate="txtemail"></asp:RequiredFieldValidator>
                    
            <p class="Ad_pro_p">Quyền admin</p> <br />
                    <asp:TextBox ID="txtquyen" runat="server" CssClass="txtTenDM" TextMode="Number"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Vui lòng điền vào trường này" ControlToValidate="txtmk"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="lbLoi" runat="server"></asp:Label>
                    <p>&nbsp </p>
                    <asp:Button ID="btnThem" CssClass="nutdieukhien" runat="server" Text="Thêm" OnClick="btnThem_Click" />
                    <asp:Button ID="btnHuy" CssClass="nutdieukhien" runat="server" Text="Hủy" OnClick="btnHuy_Click" CausesValidation="False" />
            </div>
            </div>
    </section>
</asp:Content>
