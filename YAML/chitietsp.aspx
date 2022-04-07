<%@ Page Title="Chi tiết sản phẩm" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="chitietsp.aspx.cs" Inherits="YAML.chitietsp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link rel="stylesheet" href="CSS/chitietsp.css" type="text/css">
    <section>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="MaSP" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand" >
        <ItemTemplate>
        <div class="chitiet">
                    <img src='<%# "Image/somitaydai/" + Eval("Hinh") %>'>
           
                <ul class="sp">
                <li><h2><asp:Label ID="TenSPLabel" runat="server" Text='<%# Eval("TenSP") %>' /></h2></li>
                <li>Mã sản phẩm: <asp:Label ID="MaSPLabel" runat="server" Text='<%# Eval("MaSP") %>' /></li>
                <li><h3>Giá: <asp:Label ID="DonGiaLabel" runat="server" Text='<%# String.Format("{0:0,0 VNĐ}",  Eval("DonGia")).Replace(",",".") %>' /></h3></li>
                <li>Mô tả: <asp:Label ID="MoTaLabel" runat="server" Text='<%# Eval("MoTa") %>' /></li>
                    <li>Số lượng: <asp:TextBox ID="txtSoLuong" CssClass="txtSL" runat="server" Text="1" TextMode="Number"></asp:TextBox></li>
                    <li>
                        <asp:Button ID="btnThemGH" CssClass="chonmua" runat="server" Text="Chọn mua" CommandName="addtoCart" CommandArgument='<%# Eval("MaSP") %>' />
            <img id="cart" src="Image/cart.png"></li>
            </ul>
             <div id="chinhsach">
                <table>
                    <tr>
                        <td>
                            <b>GIAO HÀNG TẬN NHÀ</b> <br/>
                                Từ 1 đến 3 ngày	
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="Image/pd_policies_1.jpg">
                            <b>SHIP CODE</b> Trên toàn quốc
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="Image/pd_policies_2.jpg">
                            <b>ĐƯỢC PHÉP ĐỔI HÀNG NẾU KHÔNG VỪA Ý</b>
                            <br/>  Trong vòng 7 ngày
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="Image/money.png">
                            <b>THANH TOÁN</b> Thanh toán khi nhận hàng
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="Image/pd_policies_4.jpg">
                            <b>HỖ TRỢ MUA NHANH</b>
                            <br/>0937 996 036
                        </td>
                    </tr>
                </table>
            </div>
                </ItemTemplate>
            </asp:DataList>
            
        
           
            <div id="dexuat">
                <p>Đề xuất dành cho bạn:</p>
                <div class="sanpham"> <a href=""><img class="hinhsp" src="Image/somitaydai/So Mi Nam Y2010 Caro TD A04.jpg"></a>
                    <p>Sơ Mi Nam Y2010 Caro TD A04</p>
                    <p class="dongia"><span class="gia">225,000 VNĐ</span></p>
                  </div>
                  <div class="sanpham"> <a href=""><img class="hinhsp" src="Image/somitaydai/So Mi Nam Y2010 TD A04.jpg"></a>
                    <p>Sơ Mi Nam Y2010 TD A04</p>
                    <p class="dongia"><span class="gia">255,000 VNĐ</span></p>
                  </div>
                  <div class="sanpham"> <a href=""><img class="hinhsp" src="Image/somitaydai/So Mi Nam Y2010 TD J01.jpg"></a>
                    <p>Sơ Mi Nam Y2010 TD J01</p>
                    <p class="dongia"><span class="gia">255,000 VNĐ</span></p>
                  </div>
                  <div class="sanpham"> <a href=""><img class="hinhsp" src="Image/somitaydai/So Mi Nam Ma Bu TD KM11.jpg"></a>
                    <p>Sơ Mi Nam Ma Bư TD KM11</p>
                    <p class="dongia"><span class="gia">285,000 VNĐ</span></p><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [SANPHAM] WHERE ([MaSP] = @MaSP)" >
                      <SelectParameters>
                          <asp:QueryStringParameter Name="MaSP" QueryStringField="maSP" Type="Int32" />
                      </SelectParameters>
                      </asp:SqlDataSource>
                  </div>
            </div>
        </div>
     </section>
</asp:Content>
