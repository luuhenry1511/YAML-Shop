<%@ Page Title="Thêm sản phẩm" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ThemSanPham.aspx.cs" Inherits="YAML.ThemDanhMuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="CSS/trangquantri.css" type="text/css" />
    <section>
        <div id="quantri">
              <div class="Ad_pro_wrap" id="VUNGTHEMMON" runat="server">
                <div class="Ad_pro_container">

                    <%--                    <p class="Ad_pro_them_p">THÊM MÓN MỚI</p>--%>
                    <h3>THÔNG TIN SẢN PHẨM</h3>
                    
                    <p class="Ad_pro_p">Tên sản phẩm</p>
                    <asp:TextBox ID="txttensp" CssClass="txtTenDM" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="kiemtra" ControlToValidate="txttensp" runat="server" ErrorMessage="Tên món không được bỏ trống"></asp:RequiredFieldValidator>
                    <p class="Ad_pro_p">Đơn giá</p>
                    <asp:TextBox ID="txtdongia" CssClass="txtTenDM" runat="server" TextMode="Number"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="kiemtra" ControlToValidate="txtdongia" runat="server" ErrorMessage="Đơn giá không được bỏ trống"></asp:RequiredFieldValidator>
                    <p class="Ad_pro_p">Mô tả</p>
                    <asp:TextBox ID="txtmota" CssClass="Ad_pro_multextbox" runat="server" TextMode="MultiLine" Rows="2"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="kiemtra" ControlToValidate="txtmota" runat="server" ErrorMessage="Mô tả sản phẩm không được bỏ trống"></asp:RequiredFieldValidator>
                    <p class="Ad_pro_p">Link hình</p>
                    <asp:TextBox ID="txtlink" CssClass="txtTenDM" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="kiemtra" ControlToValidate="txtlink" runat="server" ErrorMessage="Hình sản phẩm không được bỏ trống"></asp:RequiredFieldValidator>
                    <p class="Ad_pro_p">Mã danh mục</p>
                    <asp:DropDownList ID="ddlMaDanhMuc" runat="server"></asp:DropDownList>
                    <p class="Ad_pro_p">Ngày cập nhật</p>
                    <div id="calendar">
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="400px">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                            <DayStyle Width="14%" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                            <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                            <TodayDayStyle BackColor="#CCCC99" />
                        </asp:Calendar>
                    </div>
                    <p class="Ad_pro_p">Số lượng bán</p>
                    <asp:TextBox ID="txtSoLuongBan" CssClass="txtTenDM" runat="server" TextMode="Number"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="kiemtra" ControlToValidate="txtSoLuongBan" runat="server" ErrorMessage="Số lượng bán không được bỏ trống"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="lbLoi" runat="server"></asp:Label>
                    <p>&nbsp </p>
                    <asp:Button ID="btnThem" CssClass="nutdieukhien" runat="server" Text="Thêm" OnClick="btnThem_Click" />
                    <asp:Button ID="btnHuy" CssClass="nutdieukhien" runat="server" Text="Hủy" OnClick="btnHuy_Click" CausesValidation="False" />
                </div>
            </div>
            </div>
    </section>
</asp:Content>
