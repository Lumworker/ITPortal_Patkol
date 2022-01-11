using Microsoft.Reporting.WebForms;
using MobileTask.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITPortal
{
    public partial class ITTAG_report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void print_ITTAG(object sender, EventArgs e)
        {
            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            string deviceInfo = null;
            String IT_TAG_Code_Start = snsIT_TAG_Code_Start.Text;
            String IT_TAG_Code_End = snsIT_TAG_Code_End.Text;
            DataTable dt = new ClassBrowseNew().C_Get_Print_VW_IT_TAG_Master(IT_TAG_Code_Start, IT_TAG_Code_End);
            ReportDataSource rds = new ReportDataSource("DataSet1", dt);
            // Setup the report viewer object and get the array of bytes
            ReportViewer viewer = new ReportViewer();
            viewer.Reset();
            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.DataSources.Add(rds);
            viewer.LocalReport.ReportPath = Server.MapPath("./Report/IT TAG.rdl");
            viewer.LocalReport.EnableHyperlinks = false;
            viewer.LocalReport.EnableExternalImages = true;
            //viewer.LocalReport.ExecuteReportInCurrentAppDomain(System.Reflection.Assembly.GetExecutingAssembly().Evidence);
            ReportParameter[] param = new ReportParameter[2];
            param[0] = new ReportParameter("IT_TAG_Code_Start", IT_TAG_Code_Start);
            param[1] = new ReportParameter("IT_TAG_Code_End", IT_TAG_Code_End);
            viewer.LocalReport.SetParameters(param);
            byte[] bytes = viewer.LocalReport.Render("PDF", deviceInfo, out mimeType, out encoding, out extension, out streamIds, out warnings);

            // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
            Response.Buffer = true;
            Response.Clear();
            Response.ContentType = mimeType;
            Response.AddHeader("content-disposition", "attachment; filename=Print ITTAG " + IT_TAG_Code_Start + "-" + IT_TAG_Code_End + "." + extension);
            Response.BinaryWrite(bytes); // create the file
            Response.Flush(); // send it to the client to download
        }
        protected void Export_Charge_Excel(object sender, EventArgs e)
        {

            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            string deviceInfo = null;

            DataTable dt = new DataTable();
            String Reportdate = DateTime.Now.ToString("yyyy-MM-dd");
            String sReturnDate = snssReturnDate.Text;
            String eReturnDate = snseReturnDate.Text;
            String Company = snsCompany.Text;
            String TagGroup = snsTagGroup.Text;
            String textRate = snsRate.Text;
            String Currency = snsCurrency.Text;
            double Rate = double.Parse(textRate, CultureInfo.InvariantCulture);
            dt = new ClassBrowseNew().SP_Rpt_ITCharge(Reportdate, sReturnDate, eReturnDate, Company, TagGroup, Rate, Currency);
            //Get Query
            ReportDataSource rds = new ReportDataSource("DataSet1", dt);
            // Setup the report viewer object and get the array of bytes
            ReportViewer viewer = new ReportViewer();
            viewer.Reset();
            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.DataSources.Add(rds);
            viewer.LocalReport.ReportPath = Server.MapPath("./Report/RPT_ITCharge_Detail.rdl");
            viewer.LocalReport.EnableHyperlinks = false;
            viewer.LocalReport.EnableExternalImages = true;
            //viewer.LocalReport.ExecuteReportInCurrentAppDomain(System.Reflection.Assembly.GetExecutingAssembly().Evidence);
            ReportParameter[] param = new ReportParameter[7];
            param[0] = new ReportParameter("Reportdate", Reportdate);
            param[1] = new ReportParameter("sReturnDate", sReturnDate);
            param[2] = new ReportParameter("eReturnDate", eReturnDate);
            param[3] = new ReportParameter("Company", Company);
            param[4] = new ReportParameter("TagGroup", TagGroup);
            param[5] = new ReportParameter("Rate", textRate);
            param[6] = new ReportParameter("CUR", Currency);
            viewer.LocalReport.SetParameters(param);
            byte[] bytes = viewer.LocalReport.Render("EXCEL", deviceInfo, out mimeType, out encoding, out extension, out streamIds, out warnings);

            // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
            Response.Buffer = true;
            Response.Clear();
            Response.ContentType = mimeType;
            Response.AddHeader("content-disposition", "attachment; filename=Chart " + textRate + "(" + sReturnDate + " to " + eReturnDate + ")." + extension);
            Response.BinaryWrite(bytes); // create the file
            Response.Flush(); // send it to the client to download
        }
        //protected void Export_Chart_Excel(object sender, EventArgs e)
        //{
        //    //String IDXXXX = snsIDXXXX.Text;
        //    DataTable dt = new DataTable();
        //    String Reportdate = "";
        //    String sReturnDate = snssReturnDate.Text;
        //    String eReturnDate = snseReturnDate.Text;
        //    String Company = snsCompany.Text;
        //    String TagGroup = snsTagGroup.Text;
        //    String textRate = snsRate.Text;
        //    double Rate = double.Parse(textRate, CultureInfo.InvariantCulture);
        //    dt = new ClassBrowseNew().SP_Rpt_ITCharge(Reportdate, sReturnDate, eReturnDate, Company, TagGroup, Rate);
        //    //Get Query

        //    GridView GV = new GridView();
        //    GV.AllowPaging = false;
        //    GV.DataSource = dt;
        //    GV.DataBind();
        //    if (GV.Rows.Count > 0)
        //    {
        //        Response.Clear();
        //        Response.Buffer = true;

        //        Response.AddHeader("content-disposition", "attachment; filename=Chart " + textRate + "(" + sReturnDate + " to " + eReturnDate + ").xls");
        //        Response.Charset = "";
        //        Response.ContentType = "application/vnd.ms-excel";
        //        StringWriter sw = new StringWriter();
        //        HtmlTextWriter hw = new HtmlTextWriter(sw);

        //        for (int i = 0; i > GV.Rows.Count; i++)
        //        {
        //            GV.Rows[i].Attributes.Add("class", "textmode");
        //        }
        //        GV.RenderControl(hw);
        //        String style = @"<style> .textmode{mso-number-format:\@;}</style>";
        //        Response.Write(style);
        //        Response.Output.Write("<html><head><META http-equiv=Content-Type content=text/html; charset=utf-8></head><body><FONT face=Tahoma>" + sw.ToString() + "</FONT></Body></Html>");
        //        Response.Flush();
        //        Response.End();
        //    }
        //    else
        //    {
        //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No Data')", true);
        //    }
        //}
            protected void Export_Charge_PDF(object sender, EventArgs e)
            {
                Warning[] warnings;
                string[] streamIds;
                string mimeType = string.Empty;
                string encoding = string.Empty;
                string extension = string.Empty;
                string deviceInfo = null;
                //String Reportdate = "2021-05-14";
                //String sReturnDate = "2021-05-01";
                //String eReturnDate = "2021-05-31";
                //String Company = "";
                //String TagGroup = "";
                //String Rate = "32.2345";

                DataTable dt = new DataTable();
                String Reportdate = DateTime.Now.ToString("yyyy-MM-dd");
                String sReturnDate = snssReturnDate.Text;
                String eReturnDate = snseReturnDate.Text;
                String Company = snsCompany.Text;
                String TagGroup = snsTagGroup.Text;
                String textRate = snsRate.Text;
                String Currency = snsCurrency.Text;
                double Rate = double.Parse(textRate, CultureInfo.InvariantCulture);
                dt = new ClassBrowseNew().SP_Rpt_ITCharge(Reportdate, sReturnDate, eReturnDate, Company, TagGroup, Rate, Currency);
                //Get Query
                ReportDataSource rds = new ReportDataSource("DataSet1", dt);
                // Setup the report viewer object and get the array of bytes
                ReportViewer viewer = new ReportViewer();
                viewer.Reset();
                viewer.ProcessingMode = ProcessingMode.Local;
                viewer.LocalReport.DataSources.Add(rds);
                viewer.LocalReport.ReportPath = Server.MapPath("./Report/RPT_ITCharge_Summary.rdl");
                viewer.LocalReport.EnableHyperlinks = false;
                viewer.LocalReport.EnableExternalImages = true;
                //viewer.LocalReport.ExecuteReportInCurrentAppDomain(System.Reflection.Assembly.GetExecutingAssembly().Evidence);
                ReportParameter[] param = new ReportParameter[7];
                param[0] = new ReportParameter("Reportdate", Reportdate);
                param[1] = new ReportParameter("sReturnDate", sReturnDate);
                param[2] = new ReportParameter("eReturnDate", eReturnDate);
                param[3] = new ReportParameter("Company", Company);
                param[4] = new ReportParameter("TagGroup", TagGroup);
                param[5] = new ReportParameter("Rate", textRate);
                param[6] = new ReportParameter("CUR", Currency);
                viewer.LocalReport.SetParameters(param);
                byte[] bytes = viewer.LocalReport.Render("PDF", deviceInfo, out mimeType, out encoding, out extension, out streamIds, out warnings);

                // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
                Response.Buffer = true;
                Response.Clear();
                Response.ContentType = mimeType;
                Response.AddHeader("content-disposition", "attachment; filename=Chart "+ textRate + "("+ sReturnDate+" to " + eReturnDate + ")."+ extension);
                Response.BinaryWrite(bytes); // create the file
                Response.Flush(); // send it to the client to download
        }
        protected void Export_ITTAG_Detail_Excel(object sender, EventArgs e)
        {

            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            string deviceInfo = null;

            DataTable dt = new DataTable();
            String Owner = snsOwner.Text;
            String AssetCompany = snsAssetCompany.Text;
            String MainType = snsMainType.Text;
            String TypeName = snsTypeName.Text;
            String TagGroup = snsTagGroup_SD.Text;
            String PurchaseType = snsPurchaseType.Text;
            String VendorPurchase = snsVendorPurchase.Text;
            String sStartContractDate = snssStartContractDate.Text;
            String eStartContractDate = snseStartContractDate.Text;
            String sExpireContractDate = snssExpireContractDate.Text;
            String eExpireContractDate = snseExpireContractDate.Text;
            String sBorrowDueDate = snssBorrowDueDate.Text;
            String StatusTag = snsStatusTag.Text;
            String eBorrowDueDate = snseBorrowDueDate.Text;
            String Statususage = snsStatususage.Text;
            String Emp = snsEmp.Text;
            String Company = snsCompany.Text;
            String BusinessGroup = snsBusinessGroup.Text;
            String EmpDept = snsEmpDept.Text;
            String EmpLevel = snsEmpLevel.Text;
            String EmpLocation = snsEmpLocation.Text;
            String EmpJobTitle = snsEmpJobTitle.Text;
            dt = new ClassBrowseNew().SP_Rpt_ITDetail( Owner,  AssetCompany,  MainType
            ,  TypeName,  TagGroup,  PurchaseType,  VendorPurchase
            ,  sStartContractDate,  eStartContractDate,  sExpireContractDate
            ,  eExpireContractDate,  StatusTag,  sBorrowDueDate,  eBorrowDueDate
            ,  Statususage,  Emp,  Company,  BusinessGroup,  EmpDept
            ,  EmpLevel,  EmpLocation,  EmpJobTitle);
            //Get Query
            ReportDataSource rds = new ReportDataSource("DataSet1", dt);
            // Setup the report viewer object and get the array of bytes
            ReportViewer viewer = new ReportViewer();
            viewer.Reset();
            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.DataSources.Add(rds);
            viewer.LocalReport.ReportPath = Server.MapPath("./Report/RPT_ITTag_Detail.rdl");
            viewer.LocalReport.EnableHyperlinks = false;
            viewer.LocalReport.EnableExternalImages = true;
            //viewer.LocalReport.ExecuteReportInCurrentAppDomain(System.Reflection.Assembly.GetExecutingAssembly().Evidence);
            ReportParameter[] param = new ReportParameter[22];
            param[0] = new ReportParameter("Owner", Owner);
            param[1] = new ReportParameter("AssetCompany", AssetCompany);
            param[2] = new ReportParameter("MainType", MainType);
            param[3] = new ReportParameter("TypeName", TypeName);
            param[4] = new ReportParameter("PurchaseType", PurchaseType);
            param[5] = new ReportParameter("VendorPurchase", VendorPurchase);
            param[6] = new ReportParameter("sStartContractDate", sStartContractDate);
            param[7] = new ReportParameter("eStartContractDate", eStartContractDate);
            param[8] = new ReportParameter("sExpireContractDate", sExpireContractDate);
            param[9] = new ReportParameter("eExpireContractDate", eExpireContractDate);
            param[10] = new ReportParameter("sBorrowDueDate", sBorrowDueDate);
            param[11] = new ReportParameter("StatusTag", StatusTag);
            param[12] = new ReportParameter("eBorrowDueDate", eBorrowDueDate);
            param[13] = new ReportParameter("Statususage", Statususage);
            param[14] = new ReportParameter("Emp", Emp);
            param[15] = new ReportParameter("Company", Company);
            param[16] = new ReportParameter("BusinessGroup", BusinessGroup);
            param[17] = new ReportParameter("EmpDept", EmpDept);
            param[18] = new ReportParameter("EmpLevel", EmpLevel);
            param[19] = new ReportParameter("EmpLocation", EmpLocation);
            param[20] = new ReportParameter("EmpJobTitle", EmpJobTitle);
            param[21] = new ReportParameter("TagGroup", TagGroup);
            viewer.LocalReport.SetParameters(param);
            byte[] bytes = viewer.LocalReport.Render("EXCEL", deviceInfo, out mimeType, out encoding, out extension, out streamIds, out warnings);

            // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
            Response.Buffer = true;
            Response.Clear();
            Response.ContentType = mimeType;
            Response.AddHeader("content-disposition", "attachment; filename=ITReport_Detail." + extension);
            Response.BinaryWrite(bytes); // create the file
            Response.Flush(); // send it to the client to download
        }
        protected void Export_ITTAG_Summary_Excel(object sender, EventArgs e)
        {

            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            string deviceInfo = null;

            DataTable dt = new DataTable();
            String Owner = snsOwner.Text;
            String AssetCompany = snsAssetCompany.Text;
            String MainType = snsMainType.Text;
            String TypeName = snsTypeName.Text;
            String TagGroup = snsTagGroup_SD.Text;
            String PurchaseType = snsPurchaseType.Text;
            String VendorPurchase = snsVendorPurchase.Text;
            String sStartContractDate = snssStartContractDate.Text;
            String eStartContractDate = snseStartContractDate.Text;
            String sExpireContractDate = snssExpireContractDate.Text;
            String eExpireContractDate = snseExpireContractDate.Text;
            String StatusTag = snsStatusTag.Text;

            dt = new ClassBrowseNew().SP_Rpt_ITDetail( Owner,  AssetCompany,  MainType
            ,  TypeName,  TagGroup,  PurchaseType,  VendorPurchase
            ,  sStartContractDate,  eStartContractDate,  sExpireContractDate
            ,  eExpireContractDate,  StatusTag,  "",  ""
            ,  "",  "",  "",  "",  ""
            ,  "",  "",  "");
            //Get Query
            ReportDataSource rds = new ReportDataSource("DataSet1", dt);
            // Setup the report viewer object and get the array of bytes
            ReportViewer viewer = new ReportViewer();
            viewer.Reset();
            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.DataSources.Add(rds);
            viewer.LocalReport.ReportPath = Server.MapPath("./Report/RPT_ITTag_Summary.rdl");
            viewer.LocalReport.EnableHyperlinks = false;
            viewer.LocalReport.EnableExternalImages = true;
            //viewer.LocalReport.ExecuteReportInCurrentAppDomain(System.Reflection.Assembly.GetExecutingAssembly().Evidence);
            ReportParameter[] param = new ReportParameter[12];
            param[0] = new ReportParameter("Owner", Owner);
            param[1] = new ReportParameter("AssetCompany", AssetCompany);
            param[2] = new ReportParameter("MainType", MainType);
            param[3] = new ReportParameter("TypeName", TypeName);
            param[4] = new ReportParameter("TagGroup", TagGroup);
            param[5] = new ReportParameter("PurchaseType", PurchaseType);
            param[6] = new ReportParameter("VendorPurchase", VendorPurchase);
            param[7] = new ReportParameter("sStartContractDate", sStartContractDate);
            param[8] = new ReportParameter("eStartContractDate", eStartContractDate);
            param[9] = new ReportParameter("sExpireContractDate", sExpireContractDate);
            param[10] = new ReportParameter("eExpireContractDate", eExpireContractDate);
            param[11] = new ReportParameter("StatusTag", StatusTag);
            viewer.LocalReport.SetParameters(param);
            byte[] bytes = viewer.LocalReport.Render("EXCEL", deviceInfo, out mimeType, out encoding, out extension, out streamIds, out warnings);

            // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
            Response.Buffer = true;
            Response.Clear();
            Response.ContentType = mimeType;
            Response.AddHeader("content-disposition", "attachment; filename=ITReport_Summary." + extension);
            Response.BinaryWrite(bytes); // create the file
            Response.Flush(); // send it to the client to download
        }

        protected void Export_ITMaintenance_Click(object sender, EventArgs e)
        {
            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            string deviceInfo = null;

            DataTable dt = new DataTable();
            String Owner = snsMA_Owner.Text;
            String AssetCompany = snsMA_AssetCompany.Text;
            String MainType = snsMA_MainType.Text;
            String TypeName = snsMA_TypeName.Text;
            String TagGroup = snsMA_TagGroup.Text;
            String PurchaseType = snsMA_PurchaseType.Text;
            String VendorMA = snsMA_VendorMA.Text;
            String StatusTag = snsMA_StatusTag.Text;
            String sRepairDate = snsMA_sRepairDate.Text;
            String eRepairDate = snsMA_eRepairDate.Text;
            String sCommitDate = snsMA_sCommitDate.Text;
            String eCommitDate = snsMA_eCommitDate.Text;
            String sReturnDate = snsMA_sReturnDate.Text;
            String eReturnDate = snsMA_eReturnDate.Text;
            String StatusRepair = snsMA_StatusRepair.Text;
            dt = new ClassBrowseNew().SP_Rpt_ITMaintenance(Owner, AssetCompany, MainType
            , TypeName, TagGroup, PurchaseType, VendorMA, StatusTag
            , sRepairDate, eRepairDate, sCommitDate, eCommitDate
            , sReturnDate, eReturnDate , StatusRepair);
            //Get Query
            ReportDataSource rds = new ReportDataSource("DataSet1", dt);
            // Setup the report viewer object and get the array of bytes
            ReportViewer viewer = new ReportViewer();
            viewer.Reset();
            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.DataSources.Add(rds);
            viewer.LocalReport.ReportPath = Server.MapPath("./Report/RPT_ITMaintenance.rdl");
            viewer.LocalReport.EnableHyperlinks = false;
            viewer.LocalReport.EnableExternalImages = true;
            //viewer.LocalReport.ExecuteReportInCurrentAppDomain(System.Reflection.Assembly.GetExecutingAssembly().Evidence);
            if (sRepairDate == "")
            {
                sRepairDate = null;
            }
            if (eRepairDate == "")
            {
                eRepairDate = null;
            }
            if (sCommitDate == "")
            {
                sCommitDate = null;
            }
            if (eCommitDate == "")
            {
                eCommitDate = null;
            }
            if (sReturnDate == "")
            {
                sReturnDate = null;
            }
            if (eReturnDate == "")
            {
                eReturnDate = null;
            }
            ReportParameter[] param = new ReportParameter[15];
            param[0] = new ReportParameter("Owner", Owner);
            param[1] = new ReportParameter("AssetCompany", AssetCompany);
            param[2] = new ReportParameter("MainType", MainType);
            param[3] = new ReportParameter("TypeName", TypeName);
            param[4] = new ReportParameter("TagGroup", TagGroup);
            param[5] = new ReportParameter("PurchaseType", PurchaseType);
            param[6] = new ReportParameter("StatusTag", StatusTag);
            param[7] = new ReportParameter("VendorMA", VendorMA);
            param[8] = new ReportParameter("sRepairDate", sRepairDate);
            param[9] = new ReportParameter("eRepairDate", eRepairDate);
            param[10] = new ReportParameter("sCommitDate", sCommitDate);
            param[11] = new ReportParameter("eCommitDate", eCommitDate);
            param[12] = new ReportParameter("sReturnDate", sReturnDate);
            param[13] = new ReportParameter("eReturnDate", eReturnDate);
            param[14] = new ReportParameter("StatusRepair", StatusRepair);
            viewer.LocalReport.SetParameters(param);
            byte[] bytes = viewer.LocalReport.Render("EXCEL", deviceInfo, out mimeType, out encoding, out extension, out streamIds, out warnings);

            // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
            Response.Buffer = true;
            Response.Clear();
            Response.ContentType = mimeType;
            Response.AddHeader("content-disposition", "attachment; filename=Report_ITMaintenance." + extension);
            Response.BinaryWrite(bytes); // create the file
            Response.Flush(); // send it to the client to download

        }

        protected void Export_History_Click(object sender, EventArgs e)
        {
            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            string deviceInfo = null;

            DataTable dt = new DataTable();
            String Owner = snsHis_Owner.Text;
            String AssetCompany = snsHis_AssetCompany.Text;
            String MainType = snsHis_MainType.Text;
            String TypeName = snsHis_TypeName.Text;
            String TagGroup = snsHis_TagGroup.Text;
            String PurchaseType = snsHis_PurchaseType.Text;
            String StatusTag = snsHis_StatusTag.Text;

            String sStartDate = snsHis_sStartDate.Text;
            String eStartDate = snsHis_eStartDate.Text;
            String sReturnDate = snsHis_sReturnDate.Text;
            String eReturnDate = snsHis_eReturnDate.Text;
            dt = new ClassBrowseNew().SP_Rpt_ITDetail(
            Owner, AssetCompany, MainType
            , TypeName, TagGroup, PurchaseType
            , StatusTag, sStartDate, eStartDate
            , sReturnDate, eReturnDate);
            //Get Query
            ReportDataSource rds = new ReportDataSource("DataSet1", dt);
            // Setup the report viewer object and get the array of bytes
            ReportViewer viewer = new ReportViewer();
            viewer.Reset();
            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.DataSources.Add(rds);
            viewer.LocalReport.ReportPath = Server.MapPath("./Report/RPT_ITUsedHistory.rdl");
            viewer.LocalReport.EnableHyperlinks = false;
            viewer.LocalReport.EnableExternalImages = true;
            //viewer.LocalReport.ExecuteReportInCurrentAppDomain(System.Reflection.Assembly.GetExecutingAssembly().Evidence);
            ReportParameter[] param = new ReportParameter[11];
            param[0] = new ReportParameter("Owner", Owner);
            param[1] = new ReportParameter("AssetCompany", AssetCompany);
            param[2] = new ReportParameter("MainType", MainType);
            param[3] = new ReportParameter("TypeName", TypeName);
            param[4] = new ReportParameter("TagGroup", TagGroup);
            param[5] = new ReportParameter("PurchaseType", PurchaseType);
            param[6] = new ReportParameter("StatusTag", StatusTag);
            param[7] = new ReportParameter("sStartDate", sStartDate);
            param[8] = new ReportParameter("eStartDate", eStartDate);
            param[9] = new ReportParameter("sReturnDate", sReturnDate);
            param[10] = new ReportParameter("eReturnDate", eReturnDate);
            viewer.LocalReport.SetParameters(param);
            byte[] bytes = viewer.LocalReport.Render("EXCEL", deviceInfo, out mimeType, out encoding, out extension, out streamIds, out warnings);

            // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
            Response.Buffer = true;
            Response.Clear();
            Response.ContentType = mimeType;
            Response.AddHeader("content-disposition", "attachment; filename=ITReport_History." + extension);
            Response.BinaryWrite(bytes); // create the file
            Response.Flush(); // send it to the client to download
        }
    }
}