using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace YAML
{
    public partial class TrangAdmin : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int index;
                if (Session["chimuc"] == null)
                {
                    index = 0;
                    MultiView1.ActiveViewIndex = index;
                }
                else
                {
                    index = int.Parse(Session["chimuc"].ToString());
                    MultiView1.ActiveViewIndex = index;
                }
            }
            ThemDM.Visible = false;
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            int index = int.Parse(e.Item.Value);
            MultiView1.ActiveViewIndex = index;
            Session["chimuc"] = index;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Xoadm")
            {
                try
                {
                    XLDL x = new XLDL();
                    int chiso = int.Parse(e.CommandArgument.ToString());
                    int ma = int.Parse(gvDanhMuc.Rows[chiso].Cells[0].Text);

                    DataTable dt = x.GetData("Select MaSP FROM SANPHAM WHERE MaDM= " + ma);
                    if (dt.Rows.Count > 0)
                    { lbLoi.Text = "Danh mục này đã có sản phẩm. Bạn cần xóa tất cả sản phẩm của danh mục này trước!";
                        Response.Write("<script>alert('Danh mục này đã có sản phẩm. Bạn cần xóa tất cả sản phẩm của danh mục này trước!')</script>");
                    }
                        
                    else
                    {
                        string str = "DELETE FROM DANHMUC WHERE MaDM=" + ma;
                        XLDL.Execute(str);
                        Response.Redirect("TrangAdmin.aspx");
                    }

                }
                catch
                {
                    lbLoi.Text = "Thất bại!";
                }
            }
        }

        protected void gvDanhMuc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int MaDM = int.Parse(gvDanhMuc.DataKeys[e.RowIndex].Value.ToString());
            string name = (gvDanhMuc.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;

            if (name == "")
            {
                Response.Write("<script>alert('Tên danh mục không được rỗng')</script>");
            }
            else
            {
                XLDL.Execute(@"UPDATE DANHMUC SET TenDM = N'" + name+"' where MaDM='"+MaDM+"'");
                gvDanhMuc.EditIndex = -1;

                Response.Redirect("TrangAdmin.aspx");
            }
        }

        protected void btnThemDMmoi_Click(object sender, EventArgs e)
        {
            string TenDM;
            TenDM = txtTenDM.Text;
            try
            {
                SqlConnection con = new SqlConnection(XLDL.strCon);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                cmd.CommandText = @"INSERT INTO DANHMUC(TenDM) VALUES (N'" + TenDM + "')";
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("TrangAdmin.aspx");
            }
            catch
            {
                lbLoi.Text = "Lỗi khi thêm danh mục";
                Response.Write("<script>alert('Lỗi khi thêm danh mục')</script>");
            }
        }

        protected void btnHuyDM_Click(object sender, EventArgs e)
        {
            ThemDM.Visible = false;
        }

        protected void btnThemDM_Click(object sender, EventArgs e)
        {
            ThemDM.Visible = true;
        }

        protected void gvSanPham_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Xoa")
            {
                try
                {
                    int chiso = int.Parse(e.CommandArgument.ToString());
                    int ma = int.Parse(gvSanPham.Rows[chiso].Cells[0].Text);
                    string str = "DELETE FROM SANPHAM WHERE MaSP=" + ma;
                    XLDL.Execute(str);
                    Response.Redirect("TrangAdmin.aspx");
                }
                catch
                {
                    lbLoi.Text = "Thất bại!";
                }
            }
        }

        protected void gvSanPham_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int MaSP = int.Parse(gvSanPham.DataKeys[e.RowIndex].Value.ToString());
            string TenSP = (gvSanPham.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
            string DonGia = (gvSanPham.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
            string MoTa = (gvSanPham.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text;
            string Hinh = (gvSanPham.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text;
            string NgayCapNhat = (gvSanPham.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox).Text;
             NgayCapNhat = String.Format("{0:dd/MM/yyyy}", NgayCapNhat);
            string SoLuongBan = (gvSanPham.Rows[e.RowIndex].Cells[6].Controls[0] as TextBox).Text;
            if (TenSP == "")
            {
                Response.Write("<script>alert('Tên sản phẩm không được rỗng')</script>");
            }
            else
            {
                XLDL.Execute(@"UPDATE SANPHAM SET TenSP = N'" + TenSP + "', DonGia =" + DonGia + ", MoTa ='" + MoTa + "', Hinh =  N'" + Hinh + "', NgayCapNhat = N'" + NgayCapNhat + "', SoLuongBan = " + SoLuongBan + " WHERE MaSP =" + MaSP);
                gvSanPham.EditIndex = -1;

                Response.Redirect("TrangAdmin.aspx");
            }
        }

        protected void btThemSP_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThemSanPham.aspx");
        }


        protected void btnThemKhachHang_Click(object sender, EventArgs e)
        {

        }

        protected void gvKhachHang_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Xoa")
            {
                try
                {
                    int chiso = int.Parse(e.CommandArgument.ToString());
                    int ma = int.Parse(gvSanPham.Rows[chiso].Cells[0].Text);
                    string str = "DELETE FROM KHACHHANG WHERE MaKH=" + ma;
                    XLDL.Execute(str);
                    Response.Redirect("TrangAdmin.aspx");
                }
                catch
                {
                    lbLoi.Text = "Thất bại!";
                }
            }
        }

        protected void gvKhachHang_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int MaKH = int.Parse(gvKhachHang.DataKeys[e.RowIndex].Value.ToString());
            string HoTenKH = (gvKhachHang.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
            string DiaChiKH = (gvKhachHang.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
            string DienThoai = (gvKhachHang.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text;
            string TenDN = (gvKhachHang.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text;
            string MatKhau = (gvKhachHang.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox).Text;
            string Email = (gvKhachHang.Rows[e.RowIndex].Cells[6].Controls[0] as TextBox).Text;
            if (HoTenKH == "")
            {
                Response.Write("<script>alert('Tên Khách hàng không được rỗng')</script>");
            }
            else
            {
                XLDL.Execute(@"UPDATE KHACHHANG SET HoTenKH = N'" + HoTenKH + "', DiaChiKH =N'" + DiaChiKH + "', DienThoaiKH ='" + DienThoai + "', TenDN =  N'" + TenDN + "', MatKhau = N'" + MatKhau + "', Email = '" + Email + "' WHERE MaKH =" + MaKH);
                gvSanPham.EditIndex = -1;

                Response.Redirect("TrangAdmin.aspx");
            }
        }

        protected void gvAdmin_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Xoa")
            {
                try
                {
                    int chiso = int.Parse(e.CommandArgument.ToString());
                    int ma = int.Parse(gvAdmin.Rows[chiso].Cells[0].Text);
                    string str = "DELETE FROM ADMIN WHERE MaAdmin=" + ma;
                    XLDL.Execute(str);
                    Response.Redirect("TrangAdmin.aspx");
                }
                catch
                {
                    lbLoi.Text = "Thất bại!";
                }
            }
        }

        protected void gvAdmin_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int MaAdmin = int.Parse(gvAdmin.DataKeys[e.RowIndex].Value.ToString());
            string HoTenAd = (gvAdmin.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
            string DiaChiAd = (gvAdmin.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
            string DienThoai = (gvAdmin.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text;
            string TenDNAd = (gvAdmin.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text;
            string MatKhauAd = (gvAdmin.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox).Text;
            string NgaySinhAd = (gvAdmin.Rows[e.RowIndex].Cells[6].Controls[0] as TextBox).Text;
            string GioiTinhAd = (gvAdmin.Rows[e.RowIndex].Cells[7].Controls[0] as TextBox).Text;
            string Email = (gvAdmin.Rows[e.RowIndex].Cells[8].Controls[0] as TextBox).Text;
            string QuyenAd = (gvAdmin.Rows[e.RowIndex].Cells[9].Controls[0] as TextBox).Text;
            if (HoTenAd == "")
            {
                Response.Write("<script>alert('Tên nhân viên không được rỗng')</script>");
            }
            else
            {
                XLDL.Execute(@"UPDATE ADMIN SET HoTenAd = N'" + HoTenAd + "', DiaChiAd =N'" + DiaChiAd + "', DienThoai ='" + DienThoai + "', TenDNAd =  N'" + TenDNAd + "', MatKhauAd = N'" + MatKhauAd+ "', NgaySinhAd= N'"+  NgaySinhAd+ "', GioiTinhAd= '"+GioiTinhAd+ "', EmailAd = '" + Email + "' WHERE MaAdmin =" + MaAdmin);
                gvSanPham.EditIndex = -1;

                Response.Redirect("TrangAdmin.aspx");
            }
        }

        protected void btnThemAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThemNhanVien.aspx");
        }
    }
}