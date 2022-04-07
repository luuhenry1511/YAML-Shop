using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YAML
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            XLDL x = new XLDL();
            string maDM = Request.QueryString["maDM"];
            gdv.DataSource = x.GetData("select top 8 * from SANPHAM WHERE MONTH(NgayCapNhat)=9 order by day(NgayCapNhat) desc");
            gdv.DataBind();
        }
    }
}