<%@ Page Title="Danh mục sản phẩm" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="danhmuc.aspx.cs" Inherits="YAML.danhmuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <section>
            <article class="aosomitaydai">
              <p id="aosomitaydai" class ="tieude" align="center">
                  <asp:label ID="lblDM" runat="server" text=""></asp:label>
              </p>
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
           
          </section>
</asp:Content>
