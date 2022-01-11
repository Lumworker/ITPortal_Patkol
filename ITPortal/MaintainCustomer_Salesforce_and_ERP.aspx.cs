using NPOI.SS.UserModel;
using NPOI.SS.Util;
using NPOI.XSSF.UserModel;
using NPOI.HSSF.UserModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NPOI.HSSF.Util;
using MobileTask.AppCode;



using Newtonsoft.Json;
using System.Web.Services;
using System.Collections;

namespace ITPortal
{
    public partial class MaintainCustomer_Salesforce_and_ERP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Export_Step4_1_Click(object sender, EventArgs e)
        {

            String siteRef = sns_siteRef.Text;
            String siteRef_name = sns_siteRef_name.Text;
            string sql = "",name = "";

            if(siteRef_name == "PATKOL ICE SOLUTIONS CO.,LTD.")
            {
                name = "ICE";
                sql = "SELECT [Uf_SalesforceID] as 'ID',[Uf_CustRating] as 'Rating',[terms_code] as 'CREDIT_TERM__C'FROM[dbo].[customer_mst] WHERE ISNULL([Uf_SalesforceID],'') <> ''";
            }
            else if (siteRef_name == "PATKOL PUBLIC COMPANY LIMITED")
            {
                name = "PK";
                sql = "SELECT [Uf_SalesforceID] as 'ID',[Uf_CustRating] as 'RATING',[terms_code] as 'CREDIT_TERM__C'FROM[dbo].[customer_mst] WHERE ISNULL([Uf_SalesforceID],'') <> ''";
            }
            else if (siteRef_name == "TYGIENIC CO., LTD.")
            {
                name = "TG";
                sql = "SELECT [Uf_SalesforceID] as 'ID',[Uf_CustRating] as 'Rating_TG__c',[terms_code] as 'CREDIT_TERM__C' FROM[dbo].[customer_mst] WHERE ISNULL([Uf_SalesforceID],'') <> ''";
            }
            else if (siteRef_name == "HEATAWAY COMPANY LIMITED")
            {
                name = "HA";
                sql = "SELECT [Uf_SalesforceID] as 'ID',[Uf_CustRating] as 'Account_Rating__c ',[terms_code] as 'Payment_Terms__c' FROM[dbo].[customer_mst] WHERE ISNULL([Uf_SalesforceID],'') <> ''";
            }

            IWorkbook workbook;
            DataTable dt = new DataTable();
            dt = new ClassBrowseNew().Export_Step4_1(sql, siteRef);
            //SQL
            

            workbook = new XSSFWorkbook();//for xslx
            //workbook = new HSSFWorkbook();//for xls
            //Set File Type

            ISheet sheet1 = workbook.CreateSheet("Sheet 1");
            //Set Sheet
            IRow row1 = sheet1.CreateRow(0);
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                ICell cell = row1.CreateCell(j);
                String columnName = dt.Columns[j].ToString();
                cell.SetCellValue(columnName);
            }
            //make a header row
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                IRow row = sheet1.CreateRow(i + 1);
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    ICell cell = row.CreateCell(j);
                    String columnName = dt.Columns[j].ToString();
                    cell.SetCellValue(dt.Rows[i][columnName].ToString());
                }
            }
            //loops through data

            using (var exportData = new MemoryStream())
            {
                //Response.Clear();
                //workbook.Write(exportData);
                //Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                //Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", "Export_Customer_Information.CSV"));
                //Response.BinaryWrite(exportData.ToArray());
                //CSV file format
                workbook.Write(exportData);
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                //Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", "Export_Customer_Information.xlsx"));
                Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", name + "_Customer_Rating_" + DateTime.Now.ToString("yyyy-MM-dd") + ".xlsx"));
                Response.BinaryWrite(exportData.ToArray());
                //xlsx file format
                //Response.ContentType = "application/vnd.ms-excel";
                //Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", "Export_Customer_Information.xls"));
                //Response.BinaryWrite(exportData.GetBuffer());
                ////xls file format
                Response.End();
            }

        }

    }
}