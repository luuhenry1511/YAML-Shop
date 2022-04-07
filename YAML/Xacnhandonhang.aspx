<%@ Page Title="Xác nhận đơn hàng" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Xacnhandonhang.aspx.cs" Inherits="YAML.Xacnhandonhang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="CSS/thanhtoan.css" type="text/css">
    <section>
        <div class="Khung">
        <div class="Container">
            <p class="thongtin">THÔNG BÁO</p> <br />
            <p class="thanhcong">Đặt hàng thành công. Đơn hàng của bạn đang được chúng tôi ghi nhận và xử lý. Chúng tôi sẽ phản hồi thông tin sớm nhất có thể đến quý khách. Cảm ơn quý khách đã tin tưởng và lựa chọn YAML!</p>
        </div>
        <asp:Button ID="btnTrangChu" CssClass="btnTrangChu" runat="server" Text="Về Trang Chủ" OnClick="btnTrangChu_Click" />
    </div>
    </section>
</asp:Content>
