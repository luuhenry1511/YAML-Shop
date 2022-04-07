using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YAML
{
    public partial class danhmuc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            XLDL x = new XLDL();
            string maDM = Request.QueryString["maDM"];
            gdv.DataSource = x.GetData("select [MaSP], [TenSP], [MaDM], [Hinh], [DonGia] FROM [SANPHAM] WHERE [MaDM]=" + maDM);
            gdv.DataBind();
            string TenDM = XLDL.GetValue("Select TenDM From DANHMUC Where MaDM=" + maDM);
            lblDM.Text = TenDM;
        }
    }
}