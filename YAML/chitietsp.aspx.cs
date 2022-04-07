using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YAML
{
    public partial class chitietsp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            TextBox txtSoLuong = (TextBox)(e.Item.FindControl("txtSoLuong"));
            Response.Redirect("giohang.aspx?maSP=" + e.CommandArgument.ToString() + "&SoLuong=" + txtSoLuong.Text.ToString());
        }


    }
}