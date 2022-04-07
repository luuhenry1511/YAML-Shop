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
    public partial class ThemDanhMuc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            XLDL x = new XLDL();
            DataTable dt = x.GetData("Select MaDM, TenDM from DANHMUC");
            for (int i=0; i<dt.Rows.Count; i++)
            {
                ddlMaDanhMuc.Items.Add("i");
                ddlMaDanhMuc.Items[i].Text = dt.Rows[i][0].ToString();
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            int DonGia, SoLuong, MaDM;
            string TenSP, MoTa, Hinh;
            TenSP = txttensp.Text;
            DonGia = int.Parse(txtdongia.Text);
            MoTa = txtmota.Text;
            Hinh = txtlink.Text;
            MaDM = int.Parse(ddlMaDanhMuc.SelectedItem.ToString());
            SoLuong = int.Parse(txtSoLuongBan.Text);
            Calendar1.SelectedDate = DateTime.Today;
            try
            {
                SqlConnection con = new SqlConnection(XLDL.strCon);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                cmd.CommandText = @"INSERT INTO SANPHAM(TenSP, DonGia, MoTa, Hinh, MaDM, NgayCapNhat, SoLuongBan) VALUES (N'"+TenSP + "'," + DonGia+ ",N'" +MoTa+ "','" + Hinh+ "'," + MaDM + ",@Ngay,"+ SoLuong+ ")";
                cmd.Parameters.Add("@Ngay", SqlDbType.SmallDateTime);
                cmd.Parameters["@Ngay"].Value = Calendar1.SelectedDate.ToString();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("TrangAdmin.aspx");
            }
            catch (Exception ex)
            {
                lbLoi.Text = ex.ToString() ;
                
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrangAdmin.aspx");
        }
    }
}