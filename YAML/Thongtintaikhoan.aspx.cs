using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace YAML
{
    public partial class Thongtintaikhoan : System.Web.UI.Page
    {
        XLDL x = new XLDL();
        private int MaKH;
        string kh;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TenDN"] != null)
            {
                string s = "SELECT MaKH, HoTenKH, DiaChiKH, DienThoaiKH, Email FROM KHACHHANG WHERE TenDN ='" + Session["TenDN"].ToString() + "'";
                DataTable dt = x.GetData(s);
                if (dt.Rows.Count > 0)
                {
                    MaKH = int.Parse(dt.Rows[0][0].ToString());
                    kh = dt.Rows[0][0].ToString();
                    lbHoTen.Text = dt.Rows[0][1].ToString();
                    lbDiaChi.Text = dt.Rows[0][2].ToString();
                    lbDienThoai.Text = dt.Rows[0][3].ToString();
                    lbEmail.Text = dt.Rows[0][4].ToString();
                }
                GVCacdonhang.DataSource = x.GetData("SELECT[SoDH], [NgayDH], [TriGia], [NgayGiaoHang] FROM[DONDATHANG] WHERE([MaKH]=" + kh + ")");
                GVCacdonhang.DataBind();
            }


        }
    }
}