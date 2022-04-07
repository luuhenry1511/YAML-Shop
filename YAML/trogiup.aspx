<%@ Page Title="Trợ giúp" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="trogiup.aspx.cs" Inherits="YAML.trogiup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="CSS/trogiup.css" type="text/css" />
    <section>
            <div id="help">
            <asp:Menu ID="Menu1" runat="server"  OnMenuItemClick="Menu1_MenuItemClick" Orientation="Horizontal" Font-Size="Large" Height="45px" StaticMenuItemStyle-CssClass="tab"
 StaticSelectedStyle-CssClass="selectedTab" CssClass="tabs" DisappearAfter="100">
            
            <DynamicHoverStyle BackColor="#990000" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle BackColor="#FFFBD6" />
            <DynamicSelectedStyle BackColor="#FFCC66" />

                <Items >
                    <asp:MenuItem Text="Tài khoản của bạn " Value="0">
                    </asp:MenuItem>
                    <asp:MenuItem Text="Giỏ hàng " Value="1"></asp:MenuItem>
                    <asp:MenuItem Text="Sửa đổi đơn đặt hàng " Value="2"></asp:MenuItem>
                    <asp:MenuItem Text="Thay đổi giá " Value="3"></asp:MenuItem>
                    <asp:MenuItem Text="Thư thông báo " Value="4"></asp:MenuItem>
                </Items>
            
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle BackColor="black" ForeColor="White"/>
        
            </asp:Menu>
            <div class="tabContents">
        <asp:MultiView ID="MultiView1" runat="server" >
            <asp:View ID="View0" runat="server">Tại Yaml.com, quý khách có thể mua hàng với tư cách là KHÁCH hoặc khách hàng ĐÃ ĐĂNG KÝ.

Việc đăng ký rất đơn giản. Chúng tôi sẽ chỉ yêu cầu quý khách cung cấp những thông tin cần thiết và hữu ích cho quá trình mua hàng.

Trong mẫu đăng ký, quý khách sẽ tìm thấy các ví dụ về định dạng có thể giúp quý khách khi nhập các thông tin như số điện thoại.
Quý khách có thể xem thông tin về đơn đặt hàng của mình bằng cách truy cập vào tài khoản của quý khách nếu quý khách là khách hàng đã đăng ký, hoặc nhấp vào liên kết mà chúng tôi đã gửi kèm cho quý khách trong thư Xác nhận đơn hàng trong trường hợp quý khách là khách vãng lai.
                
            </asp:View>
            <asp:View ID="View1" runat="server">Trong giỏ hàng, quý khách có thể xem nội dung đơn hàng của mình và thay đổi số lượng hàng hoặc xóa sản phẩm trong đơn hàng.

Xin lưu ý rằng chúng tôi không đảm bảo rằng các sản phẩm trong giỏ hàng là còn hàng. Do đó, nếu một sản phẩm hết hàng, chúng tôi sẽ thông báo cho quý khách ngay trong phần này.</asp:View>
        <asp:View ID="View2" runat="server">Sau khi hoàn tất việc mua hàng, chúng tôi sẽ gửi cho quý khách thư điện tử xác nhận với thông tin chi tiết của đơn hàng.
Lưu ý rằng quý khách sẽ không thể hủy hoặc thay đổi nếu đơn hàng của quý khách đang được chuẩn bị.</asp:View>
            <asp:View ID="View3" runat="server">Giá của tất cả các mặt hàng của chúng tôi tại các cửa hàng đều tương đương với giá niêm yết trên trang web.

Nếu có bất kỳ sự khác biệt nào giữa giá niêm yết trên trang web và giá in trên nhãn sản phẩm, giá chính xác sẽ được hiển thị tại thời điểm mua hàng.

Xin lưu ý rằng chúng tôi sẽ không thực hiện điều chỉnh giá đối với các sản phẩm đã được giảm giá trước đó.</asp:View>
            <asp:View ID="View4" runat="server">Đăng ký theo dõi để luôn được cập nhật với các xu hướng mới nhất! Xem thêm thông tin trong phần Thư thông báo.</asp:View>
        </asp:MultiView>
       </div>     
            
     </div>
</section>
</asp:Content>
