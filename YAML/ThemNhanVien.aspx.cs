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
    public partial class ThemNhanVien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            rblgioitinh.SelectedValue = "1";
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            int gioitinh, QuyenAd;
            string HoTenAd, DiaChiAd, DienThoai, TenDNAd, MatKhauAd, Email, NgaySinh;
            HoTenAd = txttennv.Text;
            DiaChiAd = txtdiachi.Text;
            DienThoai = txtdienthoai.Text;
            TenDNAd = txttendn.Text;
            MatKhauAd = txtmk.Text;
            gioitinh = Convert.ToInt32(rblgioitinh.SelectedItem.Value);
            Email = txtemail.Text;
            QuyenAd = int.Parse(txtquyen.Text);
            NgaySinh = Ngaysinh.Text;
            try
            {
                SqlConnection con = new SqlConnection(XLDL.strCon);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                cmd.CommandText = @"INSERT INTO ADMIN(HoTenAd, DiaChiAd, DienThoai, TenDNAd, MatKhauAd, NgaySinhAd, GioiTinhAd, EmailAd, QuyenAd) VALUES 
                    (N'" + HoTenAd + "',N'" + DiaChiAd + "',N'" + DienThoai + "','" + TenDNAd + "','" + MatKhauAd + "','" +NgaySinh+ "'," + gioitinh +", '"+ Email +"', "+QuyenAd +")";

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("TrangAdmin.aspx");
            }
            catch (Exception ex)
            {
                lbLoi.Text = ex.ToString();

            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrangAdmin.aspx");
        }
    }
}