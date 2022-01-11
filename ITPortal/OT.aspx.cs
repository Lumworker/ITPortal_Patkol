using MobileTask.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITPortal
{
    public partial class OT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public void PK_Export_Excel(object sender, EventArgs e)
        {
            string site_ref = snssite_ref.Text;
            DataTable dt = new ClassBrowseNew().VW_OT_Salesforce_Temp(site_ref);
            GridView GV = new GridView();
            GV.AllowPaging = false;
            GV.DataSource = dt;
            GV.DataBind();
            var time = DateTime.Now.ToString("yyyyMMdd");
            string dbFile = "Salesforce_OT_" + time;

            if (GV.Rows.Count > 0)
            {
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=" + @"\" + dbFile + ".xls");
                Response.Charset = "";
                Response.ContentType = "Application/x-msexcel";
                //Response.ContentType = "application/vnd.ms-excel";
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                for (int i = 0; i > GV.Rows.Count; i++)
                {
                    GV.Rows[i].Attributes.Add("class", "textmode");
                }
                GV.RenderControl(hw);
                String style = @"<style> .textmode{mso-number-format:\@;}</style>";
                Response.Write(style);
                Response.Output.Write("<html><head><META http-equiv=Content-Type content=text/html; charset=utf-8></head><body><FONT face=Tahoma>" + sw.ToString() + "</FONT></Body></Html>");
                Response.Flush();
                SP_TB_OT_Salesforce_Archive(site_ref);
                Response.End();
                //Response.Clear();
                //Response.Buffer = true;
                //Response.AddHeader("content-disposition", "attachment;filename=" + dbFile + ".xls");
                //Response.Charset = "";
                //Response.ContentType = "Application/x-msexcel";
                ////Response.ContentType = "application/vnd.ms-excel";
                //StringWriter sw = new StringWriter();
                //HtmlTextWriter hw = new HtmlTextWriter(sw);

                //for (int i = 0; i > GV.Rows.Count; i++)
                //{
                //    GV.Rows[i].Attributes.Add("class", "textmode");
                //}
                //GV.RenderControl(hw);
                //String style = @"<style> .textmode{mso-number-format:\@;}</style>";
                //Response.Write(style);
                //Response.Output.Write("<html><head><META http-equiv=Content-Type content=text/html; charset=utf-8></head><body><FONT face=Tahoma>" + sw.ToString() + "</FONT></Body></Html>");
                //Response.Flush();
                //SP_TB_OT_Salesforce_Archive(site_ref);
                //Response.End();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No Data')", true);
            }

        }

        [WebMethod]
        public static void SP_TB_OT_Salesforce_Archive(string site_ref)
        {
            new ClassBrowseNew().SP_TB_OT_Salesforce_Archive(site_ref);
        }
    }
}