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
    public partial class Thanhtoan : System.Web.UI.Page
    {
        XLDL x = new XLDL();
        private int MaKH;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["TenDN"] == null)
            {
                Response.Redirect("dangnhap.aspx");
            }
            if (Session["GioHang"] == null)
            {
                Response.Redirect("giohang.aspx");
            }
            if (Session["TenDN"] != null)
            {
                string s = "SELECT MaKH, HoTenKH, DiaChiKH, DienThoaiKH, Email FROM KHACHHANG WHERE TenDN ='" + Session["TenDN"].ToString() + "'";
                DataTable dt = x.GetData(s);
                if (dt.Rows.Count > 0)
                {
                    MaKH = int.Parse(dt.Rows[0][0].ToString());
                    lbHoTen.Text = dt.Rows[0][1].ToString();
                    lbDiaChi.Text = dt.Rows[0][2].ToString();
                    lbDienThoai.Text = dt.Rows[0][3].ToString();
                    lbEmail.Text = dt.Rows[0][4].ToString();
                }
            }
            if (Session["GioHang"] != null)
            {
                DataTable dt = new DataTable();
                dt = (DataTable)Session["GioHang"];
                System.Decimal tongThanhTien = 0;
                foreach (DataRow r in dt.Rows)
                {
                    r["ThanhTien"] = Convert.ToInt32(r["SoLuong"]) * Convert.ToDecimal(r["DonGia"]);
                    tongThanhTien += Convert.ToDecimal(r["ThanhTien"]);
                    lbTongTien.Text = tongThanhTien.ToString();
                }
                gvGioHang.DataSource = dt;
                gvGioHang.DataBind();
            }
            if (!IsPostBack)
            {
                calNgayGiao.SelectedDate = DateTime.Today;
            }
        }

        protected void btDongY_Click(object sender, EventArgs e)
        {
            int httt, htgh;
            string TenNguoiNhan, DiaChiNhan, DienThoaiNhan;
            TenNguoiNhan = txtNguoiNhan.Text;
            DiaChiNhan = txtDiaChiNhan.Text;
            DienThoaiNhan = txtDienThoaiNhan.Text;

            httt = Convert.ToInt32(rblHinhThucThanhToan.SelectedItem.Value);
            htgh = Convert.ToInt32(rblHinhThucGiaoHang.SelectedItem.Value);
            float tongThanhTien = float.Parse(lbTongTien.Text);
            try
            {
                SqlConnection con = new SqlConnection(XLDL.strCon);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                /* Lưu thông tin vào Table DONDATHANG */
                cmd.CommandText = @"INSERT INTO DONDATHANG(MaKH, NgayDH, TriGia, NgayGiaoHang, TenNguoiNhan, DiaChiNhan, DienThoaiNhan, HTThanhToan, HTGiaoHang) VALUES (" + MaKH + ", @created, " + tongThanhTien + ",@ngaygiaohang,N'"
                    + TenNguoiNhan + "', N'" + DiaChiNhan + "', '" + DienThoaiNhan + "'," + httt +"," + htgh+ ")";
                cmd.Parameters.Add("@created", SqlDbType.SmallDateTime);
                cmd.Parameters["@created"].Value = DateTime.Today;
                cmd.Parameters.Add("@ngaygiaohang", SqlDbType.SmallDateTime);
                cmd.Parameters["@ngaygiaohang"].Value = calNgayGiao.SelectedDate.ToString();
                cmd.ExecuteNonQuery();
                con.Close();

                /* lấy mã đơn hàng vừa lưu vào table DonDatHang */
                string s = "SELECT MAX (SoDH) FROM DONDATHANG WHERE MaKH = " + MaKH;
                int Sodonhang = int.Parse(x.GetData(s).Rows[0][0].ToString());
                DataTable dt = new DataTable();
                dt = (DataTable)Session["GioHang"];
                int MaSP, SoLuong;
                float DonGia;

                /* Lưu sản phẩm vào table DONHANG */
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    MaSP = int.Parse(dt.Rows[i]["MaSP"].ToString());
                    SoLuong = int.Parse(dt.Rows[i]["SoLuong"].ToString());
                    DonGia = float.Parse(dt.Rows[i]["DonGia"].ToString());
                    s = "INSERT INTO CTDATHANG(SoDH, MaSP, SoLuong, DonGia) VALUES(" + Sodonhang + "," + MaSP + ", " + SoLuong + "," + DonGia + ")";
                    XLDL.Execute(s);
                }
                Session["GioHang"] = null;
                Response.Redirect("Xacnhandonhang.aspx");
            }
            catch (SqlException ex)
            {
                LBThongBaoLoi.Text = "Lỗi trong quá trình cập nhật dữ liệu";
            }


        }
    }
}