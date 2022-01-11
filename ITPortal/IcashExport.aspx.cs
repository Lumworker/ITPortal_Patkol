using Ionic.Zip;
using MobileTask.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace ITPortal
{
    public partial class IcashExport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public void SFiCsh_Export(object sender, EventArgs e)
        {
            string site_ref = snssite_ref.Text;
            DataTable dt = new ClassBrowseNew().VW_SFiCsh_Format_V2_PK(site_ref);
            GridView GV = new GridView();
            GV.AllowPaging = false;
            GV.DataSource = dt;
            GV.DataBind();
            var time = DateTime.Now.ToString("yyyyMMdd");
            var times = DateTime.Now.ToString("yyyy-MM-dd");
            string txt = string.Empty;
            txt += "";

            //if (GV.Rows.Count > 0)
            //{
            //---------------Browse Download---------------
            foreach (DataColumn column in dt.Columns)
            {
                // Add the header to the text file
                txt += column.ColumnName + "\t" ;
            }
            // Insert a new line.
            txt += "\r\n";
            foreach (DataRow row in dt.Rows)
            {
                foreach (DataColumn column in dt.Columns)
                {
                    // Insert the Data rows.
                    txt += row[column.ColumnName].ToString() + "\t";
                }
                // Insert a  new line.
                txt += "\r\n";
            }
            //Response.Clear();
            //Response.Buffer = true;
            //Response.AddHeader("content-disposition", "attachment;filename=" + @"\iCash_Salesforce" + time + "_test.txt");
            //Response.Charset = "";
            //Response.ContentType = "application/text";
            //Response.Output.Write(txt);
            //Response.Flush();
            //Response.End();

            string path = @"\\\\PORTALAPP01\\ITPortal\\ITPortalFiles\\IcashExport\\";
            string txtpath = path + "iCash_Salesforce" + time + ".txt";
            string excelpath = path + times + ".xls";
            string txtpathTG = path + "iCash_Salesforce" + time + "_TG.txt";
            string excelpathTG = path + times + "_TG.xls";
            string txtpathHA = path + "iCash_Salesforce" + time + "_HA.txt";
            string excelpathHA = path + times + "_HA.xls";
                
            if (site_ref== "ERP_PK")
            {
                int check = 0;
                //--------------PK site----------
                if (GV.Rows.Count > 0)
                {
                    StreamWriter Strwriter = new StreamWriter(txtpath);
                    Strwriter.Write(txt);
                    Strwriter.Flush();
                    Strwriter.Close();

                    StringWriter sw = new StringWriter();
                    HtmlTextWriter hw = new HtmlTextWriter(sw);
                    for (int i = 0; i > GV.Rows.Count; i++)
                    {
                        GV.Rows[i].Attributes.Add("class", "textmode");
                    }
                    GV.RenderControl(hw);
                    string renderedGridView = sw.ToString();
                    System.IO.File.WriteAllText(excelpath, renderedGridView);
                }
                else
                {
                    check += 1;
                }
                //--------------------TG site----------------------
                string txt_TG = string.Empty;
                txt_TG += "";
                DataTable dt_TG = new ClassBrowseNew().VW_SFiCsh_Format_V2_PK("ERP_TG");
                GridView GV_TG = new GridView();
                GV_TG.AllowPaging = false;
                GV_TG.DataSource = dt_TG;
                GV_TG.DataBind();
                if (GV_TG.Rows.Count > 0)
                {
                    //---------------notepad Download---------------
                    foreach (DataColumn column in dt_TG.Columns)
                    {
                        // Add the header to the text file
                        txt_TG += column.ColumnName + "\t";
                    }
                    // Insert a new line.
                    txt_TG += "\r\n";
                    foreach (DataRow row in dt_TG.Rows)
                    {
                        foreach (DataColumn column in dt_TG.Columns)
                        {
                            // Insert the Data rows.
                            txt_TG += row[column.ColumnName].ToString() + "\t";
                        }
                        // Insert a  new line.
                        txt_TG += "\r\n";
                    }
                    StreamWriter StrwriterTG = new StreamWriter(txtpathTG);
                    StrwriterTG.Write(txt_TG);
                    StrwriterTG.Flush();
                    StrwriterTG.Close();
                    //---------------------excel----------------
                    StringWriter sw_TG = new StringWriter();
                    HtmlTextWriter hw_TG = new HtmlTextWriter(sw_TG);
                    for (int i = 0; i > GV_TG.Rows.Count; i++)
                    {
                        GV_TG.Rows[i].Attributes.Add("class", "textmode");
                    }
                    GV_TG.RenderControl(hw_TG);
                    string renderedGridView_TG = sw_TG.ToString();
                    System.IO.File.WriteAllText(excelpathTG, renderedGridView_TG);
                }
                else
                {
                    check += 1;
                }
                if (check != 2)
                {
                    //--------------zip---------------
                    using (ZipFile zip = new ZipFile())
                    {
                        Response.Clear();
                        Response.BufferOutput = false;
                        string zipName = "SF_Icash_export_" + times + ".zip";
                        Response.ContentType = "application/zip";
                        Response.AddHeader("content-disposition", "attachment; filename=" + zipName);

                        zip.AddDirectory(path, "files");
                        zip.Save(Response.OutputStream);
                        //------------Delete all files------------
                        System.IO.DirectoryInfo di = new DirectoryInfo(path);

                        foreach (FileInfo file in di.GetFiles())
                        {
                            file.Delete();
                        }
                        foreach (DirectoryInfo dir in di.GetDirectories())
                        {
                            dir.Delete(true);
                        }
                        SP_Salesforce_BackUpIcash(site_ref);
                        Response.End();
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No Data')", true);
                }
                
            }
            else if (site_ref == "ERP_HA")
            {
                if (GV.Rows.Count > 0)
                {
                    StreamWriter StrwriterTG = new StreamWriter(txtpathHA);
                    StrwriterTG.Write(txt);
                    StrwriterTG.Flush();
                    StrwriterTG.Close();

                    StringWriter sw = new StringWriter();
                    HtmlTextWriter hw = new HtmlTextWriter(sw);
                    for (int i = 0; i > GV.Rows.Count; i++)
                    {
                        GV.Rows[i].Attributes.Add("class", "textmode");
                    }
                    GV.RenderControl(hw);
                    string renderedGridView = sw.ToString();
                    System.IO.File.WriteAllText(excelpathHA, renderedGridView);

                    //--------------zip---------------
                    using (ZipFile zip = new ZipFile())
                    {
                        Response.Clear();
                        Response.BufferOutput = false;
                        string zipName = "SF_Icash_export_" + times + ".zip";
                        Response.ContentType = "application/zip";
                        Response.AddHeader("content-disposition", "attachment; filename=" + zipName);

                        zip.AddDirectory(path, "files");
                        zip.Save(Response.OutputStream);
                        //------------Delete all files------------
                        System.IO.DirectoryInfo di = new DirectoryInfo(path);

                        foreach (FileInfo file in di.GetFiles())
                        {
                            file.Delete();
                        }
                        foreach (DirectoryInfo dir in di.GetDirectories())
                        {
                            dir.Delete(true);
                        }
                        SP_Salesforce_BackUpIcash(site_ref);
                        Response.End();
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No Data')", true);
                }
            }
            //--------------excel-------------
            //if (site_ref == "ERP_PK")
            //{
            //    StringWriter sw = new StringWriter();
            //    HtmlTextWriter hw = new HtmlTextWriter(sw);
            //    for (int i = 0; i > GV.Rows.Count; i++)
            //    {
            //        GV.Rows[i].Attributes.Add("class", "textmode");
            //    }
            //    GV.RenderControl(hw);
            //    string renderedGridView = sw.ToString();
            //    System.IO.File.WriteAllText(excelpath, renderedGridView);
            //    System.IO.File.WriteAllText(excelpathTG, renderedGridView);
            //}
            //else if (site_ref == "ERP_HA")
            //{
            //    StringWriter sw = new StringWriter();
            //    HtmlTextWriter hw = new HtmlTextWriter(sw);
            //    for (int i = 0; i > GV.Rows.Count; i++)
            //    {
            //        GV.Rows[i].Attributes.Add("class", "textmode");
            //    }
            //    GV.RenderControl(hw);
            //    string renderedGridView = sw.ToString();
            //    System.IO.File.WriteAllText(excelpathHA, renderedGridView);
            //}

                
                

            //---------------Save on folder---------------
            //using (StreamWriter file = new StreamWriter(dbFile, false, Encoding.UTF8))
            //{
            //    foreach (DataColumn column in dt.Columns)
            //    {
            //        // Add the header to the text file
            //        txt += column.ColumnName + "\t\t";
            //    }
            //    // Insert a new line.
            //    txt += "\r\n";
            //    foreach (DataRow row in dt.Rows)
            //    {
            //        foreach (DataColumn column in dt.Columns)
            //        {
            //            // Insert the Data rows.
            //            txt += row[column.ColumnName].ToString() + "\t\t";
            //        }
            //        // Insert a  new line.
            //        txt += "\r\n";
            //    }
            //    file.WriteLine(txt);

            //}
            //------------------------save Excel------------------------
            //Response.Clear();
            //Response.Buffer = true;
            //Response.AddHeader("content-disposition", "attachment;filename=" + @"\" + times + "_test.xls");
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
            //Response.End();


        //}
        //else
        //{
        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No Data')", true);
        //}



        }

        [WebMethod]
        public static void SP_Salesforce_BackUpIcash(string site_ref)
        {
            new ClassBrowseNew().SP_Salesforce_BackUpIcash(site_ref);
        }

        [WebMethod]
        public static void TG_SFiCsh_Notepad(string site_ref)
        {
            DataTable dt = new ClassBrowseNew().VW_SFiCsh_Format_V2_PK(site_ref);
            GridView GV = new GridView();
            GV.AllowPaging = false;
            GV.DataSource = dt;
            GV.DataBind();
            var time = DateTime.Now.ToString("yyyyMMdd");
            var times = DateTime.Now.ToString("yyyy-MM-dd");
            string filePath = "\\\\utility-01\\SyteLine\\Report\\IcashTmp\\Salesforce";//------\\utility-01\\SyteLine\\Report\\IcashTmp\\Salesforce
            string filePathExcel = "\\\\utility-01\\SyteLine\\Report\\IcashTmp\\Salesforce\\!Back Up Data";
            string dbFile = filePath + @"\iCash_Salesforce" + time + "_TG.txt";
            string dbFileExcel = filePathExcel + @"\" + times + "_TG.xls";
            string txt = string.Empty;
            txt += "";

            if (GV.Rows.Count > 0)
            {
                //---------------Save on folder---------------
                using (StreamWriter file = new StreamWriter(dbFile, false, Encoding.UTF8))
                {

                    foreach (DataColumn column in dt.Columns)
                    {
                        // Add the header to the text file
                        txt += column.ColumnName + "\t\t";
                    }
                    // Insert a new line.
                    txt += "\r\n";
                    foreach (DataRow row in dt.Rows)
                    {
                        foreach (DataColumn column in dt.Columns)
                        {
                            // Insert the Data rows.
                            txt += row[column.ColumnName].ToString() + "\t\t";
                        }
                        // Insert a  new line.
                        txt += "\r\n";
                    }
                    file.WriteLine(txt);
                }

                //------------------------save Excel------------------------
                //if (GV.Rows.Count > 0)
                //{
                System.IO.StringWriter sw = new System.IO.StringWriter();
                System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);

                // Render grid view control.
                GV.RenderControl(htw);

                // Write the rendered content to a file.
                string renderedGridView = sw.ToString();
                System.IO.File.WriteAllText(dbFileExcel, renderedGridView);
            }

        }

        [WebMethod]
        public static void HA_SFiCsh_Notepad(string site_ref)
        {
            DataTable dt = new ClassBrowseNew().VW_SFiCsh_Format_V2_PK(site_ref);
            GridView GV = new GridView();
            GV.AllowPaging = false;
            GV.DataSource = dt;
            GV.DataBind();
            var time = DateTime.Now.ToString("yyyyMMdd");
            var times = DateTime.Now.ToString("yyyy-MM-dd");
            string filePath = "\\\\utility-01\\SyteLine\\Report\\IcashTmp\\Salesforce";//------\\utility-01\\SyteLine\\Report\\IcashTmp\\Salesforce
            string filePathExcel = "\\\\utility-01\\SyteLine\\Report\\IcashTmp\\Salesforce\\!Back Up Data";
            string dbFile = filePath + @"\iCash_Salesforce" + time + "_HA.txt";
            string dbFileExcel = filePathExcel + @"\" + times + "_HA.xls";
            string txt = string.Empty;
            txt += "";
            if (GV.Rows.Count > 0)
            {
                //---------------Save on folder---------------
                using (StreamWriter file = new StreamWriter(dbFile, false, Encoding.UTF8))
                {

                    foreach (DataColumn column in dt.Columns)
                    {
                        // Add the header to the text file
                        txt += column.ColumnName + "\t\t";
                    }
                    // Insert a new line.
                    txt += "\r\n";
                    foreach (DataRow row in dt.Rows)
                    {
                        foreach (DataColumn column in dt.Columns)
                        {
                            // Insert the Data rows.
                            txt += row[column.ColumnName].ToString() + "\t\t";
                        }
                        // Insert a  new line.
                        txt += "\r\n";
                    }
                    file.WriteLine(txt);
                }

                //------------------------save Excel------------------------
                //if (GV.Rows.Count > 0)
                //{
                System.IO.StringWriter sw = new System.IO.StringWriter();
                System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);

                // Render grid view control.
                GV.RenderControl(htw);

                // Write the rendered content to a file.
                string renderedGridView = sw.ToString();
                System.IO.File.WriteAllText(dbFileExcel, renderedGridView);
            }

        }

    }
}