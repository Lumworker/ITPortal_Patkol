using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;

namespace ITPortal
{
    /// <summary>
    /// Summary description for LoadOT
    /// </summary>
    public class LoadOT : IHttpHandler
    {
        string PK = System.Configuration.ConfigurationManager.AppSettings["PK"];
        string PKT = System.Configuration.ConfigurationManager.AppSettings["PKT"];
        string HA = System.Configuration.ConfigurationManager.AppSettings["HA"];
        public string SeletSite_ref(string site_ref)
        {
            string connn = "";

            if (site_ref == PK)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLERP_PK"].ConnectionString;
            }
            else if (site_ref == PKT)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLERP_PKT"].ConnectionString;
            }
            else if (site_ref == HA)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLERP_HA"].ConnectionString;
            }

            return connn;
        }
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            try
            {
                //DirectoryInfo DirInfo = new DirectoryInfo(PathUpload + EmpNum + "-" + lblRunning.Text);
                string filePath = "\\\\PORTALAPP01\\ITPortal\\ITPortalFiles";
                if (!Directory.Exists(filePath))
                {
                    Directory.CreateDirectory(filePath);
                }
                string table = "";
                string type = context.Request.Form["type"];
                if (type == "OT")
                {
                    table = "TB_OT_Salesforce_Temp";
                }
                HttpPostedFile file = context.Request.Files["file"];
                string fileName = file.FileName;
                string str_excel = filePath + "\\" + fileName;
                string pathconnect = context.Request.Form["name"];
                string siteRef = context.Request.Form["siteRef"];

                file.SaveAs(str_excel);
                //string excelConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:/Users/Zach/Documents/test1.xls;Extended Properties=Excel 12.0,HDR=Yes;IMEX=1";
                string excelConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + str_excel + ";Extended Properties='Excel 8.0;HDR={1}'";

                // Create Connection to Excel Workbook
                using (OleDbConnection connection = new OleDbConnection(excelConnectionString))
                {
                    OleDbCommand command = new OleDbCommand
                              ("Select * FROM [Sheet1$]", connection);
                    connection.Open(); //HERE IS WHERE THE ERROR IS

                    // Create DbDataReader to Data Worksheet
                    using (DbDataReader dr = command.ExecuteReader())
                    {
                        // SQL Server Connection String-----------

                        //string sqlConnectionString = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=ERP_PKS_App;Persist Security Info=True;User ID=dv;Password=@Wanlapa; Connect Timeout=0; pooling=true; Max Pool Size=50000";
                        // Bulk Copy to SQL Server
                        using (SqlBulkCopy bulkCopy = new SqlBulkCopy(SeletSite_ref(siteRef)))
                        {
                            bulkCopy.DestinationTableName = table;

                            // Set up the column mappings by name.
                            SqlBulkCopyColumnMapping CallPlan =
                                new SqlBulkCopyColumnMapping("Call Plan: Call Plan", "[CallPlan]");
                            bulkCopy.ColumnMappings.Add(CallPlan);
                            
                            SqlBulkCopyColumnMapping Owner_Name =
                                new SqlBulkCopyColumnMapping("Call Plan: Owner Name", "[Owner_Name]");
                            bulkCopy.ColumnMappings.Add(Owner_Name);

                            SqlBulkCopyColumnMapping Actual_Date =
                                new SqlBulkCopyColumnMapping("Actual Date", "[Actual_Date]");
                            bulkCopy.ColumnMappings.Add(Actual_Date);

                            SqlBulkCopyColumnMapping OT_Start =
                                new SqlBulkCopyColumnMapping("OT Start", "[OT_Start]");
                            bulkCopy.ColumnMappings.Add(OT_Start);

                            SqlBulkCopyColumnMapping OT_End =
                                new SqlBulkCopyColumnMapping("OT End", "[OT_End]");
                            bulkCopy.ColumnMappings.Add(OT_End);

                            SqlBulkCopyColumnMapping OT_Detail =
                                new SqlBulkCopyColumnMapping("OT Detail", "[OT_Detail]");
                            bulkCopy.ColumnMappings.Add(OT_Detail);
                            
                            SqlBulkCopyColumnMapping Continue_OT =
                                new SqlBulkCopyColumnMapping("Continue OT", "[Continue_OT]");
                            bulkCopy.ColumnMappings.Add(Continue_OT);

                            //SqlBulkCopyColumnMapping Owner_Name =
                            //    new SqlBulkCopyColumnMapping("OWNERID", "[Visit Start Time]");
                            //bulkCopy.ColumnMappings.Add(Owner_Name);

                            //SqlBulkCopyColumnMapping Owner_Name =
                            //    new SqlBulkCopyColumnMapping("OWNERID", "[Visit End Time]");
                            //bulkCopy.ColumnMappings.Add(Owner_Name);

                            bulkCopy.WriteToServer(dr);
                        }
                    }
                    //                }
                    //                fn_.DeleteFile(PathUpload + EmpNum + "-" + lblRunning.Text + @"\" + Name);
                    //                fn_.DeleteFolder(DirInfo);
                    //            }
                    //        }
                    //    }
                }
                //UpdateRefID();
                if (System.IO.File.Exists(str_excel))
                {
                    try
                    {
                        System.IO.File.Delete(str_excel);
                    }
                    catch (IOException ex)
                    {
                        context.Response.Write(ex);
                    }
                }

                context.Response.Write(str_excel);
            }
            catch (Exception ex)
            {
                context.Response.Write(ex.ToString());
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}