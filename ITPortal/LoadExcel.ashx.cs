using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Configuration;

namespace ITPortal
{
    /// <summary>
    /// Summary description for LoadExcel
    /// </summary>
    public class LoadExcel : IHttpHandler
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
                if (type == "plan")
                {
                    table = "TB_SFiCash_Plan_Prepare";
                }
                else
                {
                    table = "TB_SFiCash_Actual_Prepare";
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
                            SqlBulkCopyColumnMapping Call_Plan =
                                new SqlBulkCopyColumnMapping("NAME", "[CallPlan_ID]");
                            bulkCopy.ColumnMappings.Add(Call_Plan);

                            if (siteRef == "ERP_HA")
                            {
                                SqlBulkCopyColumnMapping Approval_Status =
                                new SqlBulkCopyColumnMapping("APPROVAL_STATUS__C", "[Approval_Status]");
                                bulkCopy.ColumnMappings.Add(Approval_Status);
                            }
                            else
                            {
                                SqlBulkCopyColumnMapping Approval_Status =
                                new SqlBulkCopyColumnMapping("APPROVALSTATUS__C", "[Approval_Status]");
                                bulkCopy.ColumnMappings.Add(Approval_Status);
                            }

                            SqlBulkCopyColumnMapping Record_Type =
                                new SqlBulkCopyColumnMapping("RECORDTYPEID", "[Record_Type]");
                            bulkCopy.ColumnMappings.Add(Record_Type);

                            SqlBulkCopyColumnMapping Owner_Name =
                                new SqlBulkCopyColumnMapping("OWNERID", "[OwnerName]");
                            bulkCopy.ColumnMappings.Add(Owner_Name);

                            if (type == "plan")
                            {
                                if (siteRef == "ERP_HA")
                                {
                                    SqlBulkCopyColumnMapping Accommodation =
                                        new SqlBulkCopyColumnMapping("PLAN_ACCOMMODATION__C", "[Accommodation]");
                                    bulkCopy.ColumnMappings.Add(Accommodation);

                                    SqlBulkCopyColumnMapping Accommodation_Type =
                                        new SqlBulkCopyColumnMapping("PLAN_ACCOMMODATION_TYPE__C", "[AccommodationType]");
                                    bulkCopy.ColumnMappings.Add(Accommodation_Type);

                                    SqlBulkCopyColumnMapping Allowance =
                                        new SqlBulkCopyColumnMapping("PLAN_ALLOWANCE__C", "[Allowance]");
                                    bulkCopy.ColumnMappings.Add(Allowance);

                                    SqlBulkCopyColumnMapping Province =
                                        new SqlBulkCopyColumnMapping("PROVINCE__C", "[Province]");
                                    bulkCopy.ColumnMappings.Add(Province);

                                    SqlBulkCopyColumnMapping Plan_Entertain_Currency =
                                        new SqlBulkCopyColumnMapping("CURRENCYISOCODE", "[PlanEntertainCurrency]");
                                    bulkCopy.ColumnMappings.Add(Plan_Entertain_Currency);

                                    SqlBulkCopyColumnMapping Plan_Entertain =
                                        new SqlBulkCopyColumnMapping("PLAN_ENTERTAIN__C", "[PlanEntertain]");
                                    bulkCopy.ColumnMappings.Add(Plan_Entertain);

                                    SqlBulkCopyColumnMapping Visit_Date =
                                        new SqlBulkCopyColumnMapping("VISIT_DATE__C", "[visitdate]");
                                    bulkCopy.ColumnMappings.Add(Visit_Date);

                                    SqlBulkCopyColumnMapping Allowance_Type =
                                        new SqlBulkCopyColumnMapping("PLAN_ALLOWANCE_TYPE__C", "[AllowanceType]");
                                    bulkCopy.ColumnMappings.Add(Allowance_Type);
                                }
                                else
                                {
                                    SqlBulkCopyColumnMapping Accommodation =
                                        new SqlBulkCopyColumnMapping("ACCOMMODATION__C", "[Accommodation]");
                                    bulkCopy.ColumnMappings.Add(Accommodation);

                                    SqlBulkCopyColumnMapping Accommodation_Type =
                                        new SqlBulkCopyColumnMapping("ACCOMMODATIONTYPE__C", "[AccommodationType]");
                                    bulkCopy.ColumnMappings.Add(Accommodation_Type);

                                    SqlBulkCopyColumnMapping Allowance =
                                        new SqlBulkCopyColumnMapping("ALLOWANCE__C", "[Allowance]");
                                    bulkCopy.ColumnMappings.Add(Allowance);

                                    SqlBulkCopyColumnMapping Province =
                                        new SqlBulkCopyColumnMapping("PROVINCE__C", "[Province]");
                                    bulkCopy.ColumnMappings.Add(Province);

                                    SqlBulkCopyColumnMapping Plan_Entertain_Currency =
                                        new SqlBulkCopyColumnMapping("CURRENCYISOCODE", "[PlanEntertainCurrency]");
                                    bulkCopy.ColumnMappings.Add(Plan_Entertain_Currency);

                                    SqlBulkCopyColumnMapping Plan_Entertain =
                                        new SqlBulkCopyColumnMapping("ENTERTAIN__C", "[PlanEntertain]");
                                    bulkCopy.ColumnMappings.Add(Plan_Entertain);

                                    SqlBulkCopyColumnMapping Visit_Date =
                                        new SqlBulkCopyColumnMapping("VISITDATE__C", "[visitdate]");
                                    bulkCopy.ColumnMappings.Add(Visit_Date);

                                    SqlBulkCopyColumnMapping Allowance_Type =
                                        new SqlBulkCopyColumnMapping("ALLOWANCETYPE__C", "[AllowanceType]");
                                    bulkCopy.ColumnMappings.Add(Allowance_Type);
                                }

                            }
                            else
                            {
                                if (siteRef == "ERP_HA")
                                {
                                    SqlBulkCopyColumnMapping Actual_Accommodation =
                                        new SqlBulkCopyColumnMapping("ACTUAL_ACCOMMODATION__C", "[Accommodation]");
                                    bulkCopy.ColumnMappings.Add(Actual_Accommodation);

                                    SqlBulkCopyColumnMapping Actual_Accommodation_Type =
                                        new SqlBulkCopyColumnMapping("ACTUAL_ACCOMMODATION_TYPE__C", "[AccommodationType]");
                                    bulkCopy.ColumnMappings.Add(Actual_Accommodation_Type);

                                    SqlBulkCopyColumnMapping Actual_Allowance =
                                        new SqlBulkCopyColumnMapping("ACTUAL_ALLOWANCE__C", "[Allowance]");
                                    bulkCopy.ColumnMappings.Add(Actual_Allowance);

                                    SqlBulkCopyColumnMapping Province =
                                        new SqlBulkCopyColumnMapping("PROVINCE__C", "[Province]");
                                    bulkCopy.ColumnMappings.Add(Province);

                                    SqlBulkCopyColumnMapping Actual_Entertain_Currency =
                                        new SqlBulkCopyColumnMapping("CURRENCYISOCODE", "[EntertainCurrency]");
                                    bulkCopy.ColumnMappings.Add(Actual_Entertain_Currency);

                                    SqlBulkCopyColumnMapping Actual_Entertain =
                                        new SqlBulkCopyColumnMapping("ACTUAL_ENTERTAIN__C", "[Entertain]");
                                    bulkCopy.ColumnMappings.Add(Actual_Entertain);

                                    SqlBulkCopyColumnMapping Expressway =
                                        new SqlBulkCopyColumnMapping("EXPRESSWAY__C", "[Expressway]");
                                    bulkCopy.ColumnMappings.Add(Expressway);

                                    SqlBulkCopyColumnMapping Total_Distance =
                                        new SqlBulkCopyColumnMapping("TOTAL_DISTANCE__C", "[TotalDistance]");
                                    bulkCopy.ColumnMappings.Add(Total_Distance);
                                    
                                    SqlBulkCopyColumnMapping Actual_Traveling_Expense =
                                        new SqlBulkCopyColumnMapping("TRAVEL_EXPENSE__C", "[Travel]");
                                    bulkCopy.ColumnMappings.Add(Actual_Traveling_Expense);

                                    SqlBulkCopyColumnMapping Actual_Date =
                                        new SqlBulkCopyColumnMapping("VISIT_DATE__C", "[visitdate]");
                                    bulkCopy.ColumnMappings.Add(Actual_Date);

                                    SqlBulkCopyColumnMapping Actual_Allowance_Type =
                                        new SqlBulkCopyColumnMapping("ACTUAL_ALLOWANCE_TYPE__C", "[AllowanceType]");
                                    bulkCopy.ColumnMappings.Add(Actual_Allowance_Type);
                                }
                                else
                                {
                                    SqlBulkCopyColumnMapping Actual_Accommodation =
                                        new SqlBulkCopyColumnMapping("ACTUALACCOMMODATION__C", "[Accommodation]");
                                    bulkCopy.ColumnMappings.Add(Actual_Accommodation);

                                    SqlBulkCopyColumnMapping Actual_Accommodation_Type =
                                        new SqlBulkCopyColumnMapping("ACTUALACCOMMODATIONTYPE__C", "[AccommodationType]");
                                    bulkCopy.ColumnMappings.Add(Actual_Accommodation_Type);

                                    SqlBulkCopyColumnMapping Actual_Allowance =
                                        new SqlBulkCopyColumnMapping("ACTUALALLOWANCE__C", "[Allowance]");
                                    bulkCopy.ColumnMappings.Add(Actual_Allowance);

                                    SqlBulkCopyColumnMapping Province =
                                        new SqlBulkCopyColumnMapping("PROVINCE__C", "[Province]");
                                    bulkCopy.ColumnMappings.Add(Province);

                                    //SqlBulkCopyColumnMapping Actual_Entertain_Currency =
                                    //    new SqlBulkCopyColumnMapping("CURRENCYISOCODE", "[EntertainCurrency]");
                                    //bulkCopy.ColumnMappings.Add(Actual_Entertain_Currency);

                                    SqlBulkCopyColumnMapping Actual_Entertain =
                                        new SqlBulkCopyColumnMapping("ACTUALENTERTAIN__C", "[Entertain]");
                                    bulkCopy.ColumnMappings.Add(Actual_Entertain);

                                    SqlBulkCopyColumnMapping Expressway =
                                        new SqlBulkCopyColumnMapping("EXPRESSWAY__C", "[Expressway]");
                                    bulkCopy.ColumnMappings.Add(Expressway);

                                    SqlBulkCopyColumnMapping Total_Distance =
                                        new SqlBulkCopyColumnMapping("TOTALDISTANCE__C", "[TotalDistance]");
                                    bulkCopy.ColumnMappings.Add(Total_Distance);

                                    //SqlBulkCopyColumnMapping Actual_Traveling_Expense_Currency =
                                    //    new SqlBulkCopyColumnMapping("Actual_Traveling_Expense_Currency", "[TravelCurrency]");
                                    //bulkCopy.ColumnMappings.Add(Actual_Traveling_Expense_Currency);

                                    SqlBulkCopyColumnMapping Actual_Traveling_Expense =
                                        new SqlBulkCopyColumnMapping("TRAVEL__C", "[Travel]");
                                    bulkCopy.ColumnMappings.Add(Actual_Traveling_Expense);

                                    SqlBulkCopyColumnMapping Actual_Date =
                                        new SqlBulkCopyColumnMapping("ACTUALDATE__C", "[visitdate]");
                                    bulkCopy.ColumnMappings.Add(Actual_Date);

                                    SqlBulkCopyColumnMapping Actual_Allowance_Type =
                                        new SqlBulkCopyColumnMapping("ACTUALALLOWANCETYPE__C", "[AllowanceType]");
                                    bulkCopy.ColumnMappings.Add(Actual_Allowance_Type);
                                }
                                
                            }




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