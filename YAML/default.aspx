<%@ Page Title="YAML | Trang chủ" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="YAML.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div id="than">
    <!-- <div id="intro">
        <asp:image id="Image1" imageurl="Image/gioithieuao.jpg" runat="server" />
    </div> -->
    <div id="slider">
        <asp:hyperlink runat="server" NavigateUrl="#"><img src="Image/slide/1.jpg" id="hinhslide" /></asp:HyperLink>
        <div id="previous"><img src="Image/slide/prev.png" onClick="back()"></div>
        <div id="next"><img src="Image/slide/next.png" onClick="next()"></div>
    </div>

    <article class="hangmoive">
                <p class="tieude" align="center">SẢN PHẨM MỚI</p>
                <div id="panel">
                    <a href="#"><img id="hangmoive1" src="Image/hangmoive1.jpg"></a>
                    <a href="#"><img id="hangmoive2" src="Image/panelhangmoive/hangmoive2.jpg"></a>
                    <a href="#"><img id="hangmoive3" src="Image/panelhangmoive/hangmoive3.jpg"></a>
                </div>
                
                <asp:DataList ID="gdv" runat="server" RepeatColumns="4">
                    <ItemTemplate>
                        <table ID="Table1" runat="server" class="sanpham">
                            <tr><td>
                                <asp:Image ID="imghinhsp" CssClass="hinhsp" runat="server" ImageUrl='<%# "../Image/somitaydai/"+ Eval("Hinh") %>' /></td></tr>
                            <tr><td>
                                <asp:HyperLink ID="hpltensp" CssClass="link" runat="server" NavigateUrl='<%# "../chitietsp.aspx?maSP="+ Eval("MaSP") %>' Text='<%# Eval("TenSP") %>'></asp:HyperLink></td></tr>
                            <tr><td>
                                <asp:Label ID="lbgiasp" runat="server" Text='<%# String.Format("{0:0,0 VNĐ}",  Eval("DonGia")).Replace(",",".") %>'></asp:Label></td></tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                
		</article>
        </div>
</asp:Content>
