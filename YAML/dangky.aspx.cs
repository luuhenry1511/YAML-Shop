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
    public partial class dangky : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            XLDL x = new XLDL();
            try
            {
                string str1 = @"Select * from KHACHHANG Where TenDN=N'" + Username.Text + "'";
                if (x.GetData(str1).Rows.Count > 0)
                {
                    lblLoi.Text = "Tên đăng nhập đã tồn tại.";
                    lblLoi.Visible = true;
                    hoten.Focus();
                }
                else
                {
                    SqlConnection con = new SqlConnection(XLDL.strCon);
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    cmd.CommandText = @"INSERT INTO KHACHHANG (HoTenKH, DiaChiKH, DienThoaiKH, Email, TenDN, MatKhau) VALUES (@Hoten, @Diachi, @Dienthoai, @Email, @TenDN, @MatKhau)";
                    cmd.Parameters.Add("@Hoten", SqlDbType.NVarChar, 50);
                    cmd.Parameters["@Hoten"].Value = hoten.Text;
                    cmd.Parameters.Add("@Diachi", SqlDbType.NVarChar, 50);
                    cmd.Parameters["@Diachi"].Value = diachi.Text;
                    cmd.Parameters.Add("@Dienthoai", SqlDbType.NVarChar, 10);
                    cmd.Parameters["@Dienthoai"].Value = Sodt.Text;
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 50);
                    cmd.Parameters["@Email"].Value = Email.Text;
                    cmd.Parameters.Add("@TenDN", SqlDbType.NVarChar, 15);
                    cmd.Parameters["@TenDN"].Value = Username.Text;
                    cmd.Parameters.Add("@MatKhau", SqlDbType.NVarChar, 15);
                    cmd.Parameters["@MatKhau"].Value = pass.Text;
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("dangnhap.aspx");
                }
            }
            catch
            {
                lblLoi.Text = "Thất bại!";
            }
        }
    }
}