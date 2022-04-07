using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace YAML
{
    public partial class giohang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*XLDL x = new XLDL();
       if (Request.QueryString["maSP"]!=null)
        {
            int MaSP = int.Parse(Request.QueryString["maSP"]);
            DataTable dt = x.GetData("Select TenSP, DonGia, Hinh from SANPHAM where MaSP=" + MaSP);
            string Hinh= dt.Rows[0][2].ToString();
            string TenSanPham = dt.Rows[0][0].ToString();
            float DonGia = float.Parse(dt.Rows[0][1].ToString());
            int SoLuong = int.Parse(Request.QueryString["SoLuong"]);
            
            ThemVaoGioHang(MaSP, TenSanPham, DonGia, SoLuong, Hinh);
            
        }

       if (Session["GioHang"] != null)
        {
            Panel1.Visible = false;
            DataTable dt = new DataTable();
            dt = (DataTable)Session["GioHang"];
            System.Decimal TongThanhTien = 0;
            foreach (DataRow r in dt.Rows)
            {

                r["ThanhTien"] = Convert.ToInt32(r["SoLuong"]) * Convert.ToDecimal(r["DonGia"]);
                TongThanhTien += Convert.ToDecimal(r["ThanhTien"]);
                lbTongThanhTien.Text = TongThanhTien.ToString();
            }
            gvDonHang.DataSource = dt;
            gvDonHang.DataBind();
        }*/
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("STT");
                dt.Columns.Add("MaSP");
                dt.Columns.Add("TenSP");
                dt.Columns.Add("DonGia");
                dt.Columns.Add("SoLuong");
                dt.Columns.Add("Hinh");
                dt.Columns.Add("ThanhTien");


                DataTable check = (DataTable)Session["GioHang"];


                if (check != null)
                {
                    int dem = check.Rows.Count;
                    if (dem == 0)
                    {
                        Panel1.Visible = true;
                        lbTongThanhTien.Visible = false;
                    }
                    else
                    {
                        Panel1.Visible = false;

                    }
                }
                else
                {
                    Panel1.Visible = true;

                }
                if (Request.QueryString["MaSP"] != null)
                {

                    if (Session["GioHang"] == null)
                    {

                        dr = dt.NewRow();
                        String query = "SELECT * FROM SANPHAM WHERE MaSP = " + Request.QueryString["maSP"];
                        string mycon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString.ToString();
                        SqlConnection scon = new SqlConnection(mycon);
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = query;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["STT"] = 1;
                        dr["MaSP"] = ds.Tables[0].Rows[0]["MaSP"].ToString();
                        dr["Hinh"] = ds.Tables[0].Rows[0]["Hinh"].ToString();
                        dr["TenSP"] = ds.Tables[0].Rows[0]["TenSP"].ToString();
                        dr["DonGia"] = ds.Tables[0].Rows[0]["DonGia"].ToString();
                        dr["SoLuong"] = Request.QueryString["SoLuong"];
                        int amount = Convert.ToInt16(Request.QueryString["SoLuong"].ToString());
                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["DonGia"].ToString());
                        int totalprice = amount * price;
                        dr["ThanhTien"] = totalprice;

                        dt.Rows.Add(dr);
                        gvDonHang.DataSource = dt;
                        gvDonHang.DataBind();
                        Session["GioHang"] = dt;
                        lbTongThanhTien.Text = grandtotal().ToString();

                        Response.Redirect("giohang.aspx");

                    }
                    else
                    {

                        dt = (DataTable)Session["GioHang"];
                        int sr;
                        sr = dt.Rows.Count;
                        dr = dt.NewRow();
                        int MaSanPham = int.Parse(Request.QueryString["MaSP"]);
                        String query = "SELECT * FROM SANPHAM WHERE SANPHAM.MaSP = " + Request.QueryString["MaSP"];
                        string mycon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString.ToString(); 
                        SqlConnection scon = new SqlConnection(mycon);
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = query;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        int dong = SPDaCoTrongGioHang(MaSanPham, dt);
                        int SoLuong = int.Parse(Request.QueryString["SoLuong"]);
                        if (dong != -1)
                        {
                            dt.Rows[dong]["SoLuong"] = Convert.ToInt32(dt.Rows[dong]["SoLuong"]) + SoLuong;
                        }
                        else
                        {
                            dr["STT"] = sr + 1;
                            dr["MaSP"] = ds.Tables[0].Rows[0]["MaSP"].ToString();
                            dr["TenSP"] = ds.Tables[0].Rows[0]["TenSP"].ToString();
                            dr["Hinh"] = ds.Tables[0].Rows[0]["Hinh"].ToString();
                            dr["DonGia"] = ds.Tables[0].Rows[0]["DonGia"].ToString();
                            dr["SoLuong"] = Request.QueryString["SoLuong"];
                            int amount = Convert.ToInt16(Request.QueryString["SoLuong"].ToString());
                            int price = Convert.ToInt32(ds.Tables[0].Rows[0]["DonGia"].ToString());
                            int totalprice = amount * price;
                            dr["ThanhTien"] = totalprice;
                            dt.Rows.Add(dr);
                        }

                        gvDonHang.DataSource = dt;
                        gvDonHang.DataBind();
                        Session["GioHang"] = dt;
                        lbTongThanhTien.Text = grandtotal().ToString();

                        Response.Redirect("giohang.aspx");
                    }
                }
                else
                {
                    dt = (DataTable)Session["GioHang"];
                    gvDonHang.DataSource = dt;
                    gvDonHang.DataBind();

                    if (gvDonHang.Rows.Count > 0)
                    {
                        lbTongThanhTien.Text = grandtotal().ToString();
                    }
                }
            }
        }
        public void ThemVaoGioHang(int MaSanPham, string TenSanPham, float DonGia, int SoLuong, string Hinh)
        {
            DataTable dt;
            if (Session["GioHang"] == null)
            {
                dt = new DataTable();
                dt.Columns.Add("STT");
                dt.Columns.Add("MaSP");
                dt.Columns.Add("TenSP");
                dt.Columns.Add("DonGia");
                dt.Columns.Add("SoLuong");
                dt.Columns.Add("Hinh");
                dt.Columns.Add("ThanhTien");
            }
            else
                dt = (DataTable)Session["GioHang"];
            int dong = SPDaCoTrongGioHang(MaSanPham, dt);
            if (dong != -1)
            {
                dt.Rows[dong]["SoLuong"] = Convert.ToInt32(dt.Rows[dong]["SoLuong"]) + SoLuong;
            }
            else
            {
                int sr;
                sr = dt.Rows.Count;
                DataRow dr = dt.NewRow();
                dr["STT"] = sr + 1;
                dr["MaSP"] = MaSanPham;
                dr["TenSP"] = TenSanPham;
                dr["DonGia"] = DonGia;
                dr["SoLuong"] = SoLuong;
                dr["Hinh"] = Hinh;
                dr["ThanhTien"] = DonGia * SoLuong;
                dt.Rows.Add(dr);
            }
            Session["GioHang"] = dt;
            Response.Redirect("giohang.aspx");
        }
        //Hàm kiểm tra sản phẩm đã có thì tăng số lượng
        public static int SPDaCoTrongGioHang(int MaSanPham, DataTable dt)
        {
            int dong = -1;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (int.Parse(dt.Rows[i]["MaSP"].ToString()) == MaSanPham)
                {
                    dong = i;
                    break;
                }
            }
            return dong;
        }



        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["GioHang"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["ThanhTien"].ToString());
                i = i + 1;
            }
            return gtotal;
        }

        protected void gvDonHang_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Xoa")
            {
                int chiso = int.Parse(e.CommandArgument.ToString());
                try
                {
                    DataTable dt = (DataTable)Session["GioHang"];
                    dt.Rows.RemoveAt(chiso);
                    Session["GioHang"] = dt;
                    Response.Redirect("giohang.aspx");
                }
                catch
                {
                    Response.Redirect("giohang.aspx");
                }
            }
        }

        protected void btXoaGioHang_Click(object sender, EventArgs e)
        {
            Session["GioHang"] = null;
            Response.Redirect("index.aspx");
        }

        protected void btCapNhat_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)Session["GioHang"];
            foreach (GridViewRow r in gvDonHang.Rows)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (Convert.ToString(gvDonHang.DataKeys[r.DataItemIndex].Value) == dr["MaSP"].ToString())
                    {
                        TextBox t = (TextBox)r.Cells[4].FindControl("txtSoluong");
                        if (Convert.ToInt32(t.Text) <= 0)
                        {
                            dt.Rows.Remove(dr);
                        }
                        else
                        {
                            dr["SoLuong"] = t.Text;
                            dr["ThanhTien"] = Convert.ToInt32(t.Text.ToString()) * Convert.ToInt32(dr["DonGia"]);
                        }
                        break;
                    }
                }
            }
            Session["GioHang"] = dt;
            Response.Redirect("giohang.aspx");
        }
        protected void btTiepTucMua_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void gvDonHang_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["GioHang"];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                string qdata;
                string dtdata;
                sr = Convert.ToInt32(dt.Rows[i]["STT"].ToString());
                TableCell cell = gvDonHang.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);

                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    break;
                }
            }
            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["STT"] = i;
                dt.AcceptChanges();
            }
            Session["GioHang"] = dt;
            Response.Redirect("giohang.aspx");
        }

        protected void btThanhToan_Click(object sender, EventArgs e)
        {
            Response.Redirect("Thanhtoan.aspx");
        }
    }
}