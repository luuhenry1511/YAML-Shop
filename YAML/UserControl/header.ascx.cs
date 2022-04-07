using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace YAML.UserControl
{
    public partial class header : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
            if (Session["Giohang"] != null)
            {
                DataTable dt = new DataTable();
                dt = (DataTable)Session["Giohang"];
                System.Int32 tongSL = 0;
                foreach (DataRow r in dt.Rows)
                {
                    tongSL += Convert.ToInt32(r["SoLuong"]);
                    lbTongSL.Text = tongSL.ToString();
                }
            }
            
            if (Session["TenDN"] != null)
            {
                aTaiKhoan.Visible = false;
                aDangNhap.Visible = false;
                aQuanTri.Visible = false;
                aTTTK.Visible = true;
                lbTenTK.Visible = true;
                lbTenTK.Text = Session["TenDN"].ToString();
                btDangXuat.Visible = true;
            }
            else
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
        }

        protected void btDangXuat_Click(object sender, EventArgs e)
        {
            Session["TenDN"] = null;
            Session["GioHang"] = null;
            Session["TenDNAdmin"] = null;
            Response.Redirect("index.aspx");
        }
    

        protected void Imgdangxuat_Click(object sender, ImageClickEventArgs e)
        {
            Session["TenDN"] = null;
            Session["GioHang"] = null;
            Response.Redirect("index.aspx");
        }


    }
}