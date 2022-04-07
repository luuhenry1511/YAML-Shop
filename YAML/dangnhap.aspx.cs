using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace YAML
{
    public partial class dangnhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                XLDL x = new XLDL();
                DataTable dt = x.GetData("Select * from KHACHHANG where TenDN='" + hoten.Text + "' and MatKhau='" + password.Text + "'");
                if (dt.Rows.Count > 0)
                {
                    Session["TenDN"] = hoten.Text;
                    Response.Redirect("index.aspx");
                }
                else
                {

                    dt = x.GetData("Select * from ADMIN where TenDNAd='" + hoten.Text + "' and MatKhauAd='" + password.Text + "'");
                    if (dt.Rows.Count > 0)
                    {
                        Session["TenDNAdmin"] = hoten.Text;
                        Response.Redirect("index.aspx");
                    }
                    label.Visible = true;
                }
            }
            catch
            {
                label.Text = "Thất bại!";
            }
        }
    }
}