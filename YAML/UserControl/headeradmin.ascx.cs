using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YAML.UserControl
{
    public partial class headeradmin : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TenDNAdmin"] != null)
            {
                aTaiKhoan.Visible = false;
                aDangNhap.Visible = false;
                aTTTK.Visible = true;
                lbTenTK.Visible = true;
                aQuanTri.Visible = true;
                lbTenTK.Text = Session["TenDNAdmin"].ToString();
                btDangXuat.Visible = true;
            }
            else
            {
                aTaiKhoan.Visible = true;
                aDangNhap.Visible = true;
                aTTTK.Visible = false;
                lbTenTK.Visible = false;
                aQuanTri.Visible = false;
                lbTenTK.Text = "";
                btDangXuat.Visible = false;
            }
            /*if (Session["TenDN"] != null)
            {
                lblTenDN.Visible = true;
                lblTenDN.Text = Session["TenDN"].ToString();
                Imgdangxuat.Visible = true;
                Imgdangnhap.Visible = false;
            }
            else
            {
                lblTenDN.Text = "";
                Imgdangxuat.Visible = false;
                Imgdangnhap.Visible = true;
            }*/
        }



        protected void btDangXuat_Click(object sender, EventArgs e)
        {
            Session["TenDN"] = null;
            Session["GioHang"] = null;
            Session["TenDNAdmin"] = null;
            Response.Redirect("index.aspx");
        }
    }
}