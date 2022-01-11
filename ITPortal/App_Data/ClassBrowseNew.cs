using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Collections.Specialized;
using System.Globalization;
using System.Text;
using System.Collections.Generic;
using System.Collections;
using System.Web.UI;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;
using System.Linq;
using ITPortal;

namespace MobileTask.AppCode
{
    public class ClassBrowseNew
    {
        //public static String con = "Data Source=K2DB1\\K2DBC1;Initial Catalog=K2;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        public static String con = "Data Source=K2DB1\\K2DBC1;Initial Catalog=K2;Persist Security Info=True;User ID=dv;Password=@Wanlapa; Connect Timeout=0; pooling=true; Max Pool Size=5000";
        public static String conDev = "Data Source=K2DEVDB1\\K2DEVDBC1;Initial Catalog=K2;Persist Security Info=True;User ID=dv;Password=@Wanlapa; Connect Timeout=0; pooling=true; Max Pool Size=5000";
        public static String conK2_5 = "Data Source=K2DB5;Initial Catalog=K2;Persist Security Info=True;User ID=dv;Password=@Wanlapa; Connect Timeout=0; pooling=true; Max Pool Size=5000";
        public static String conK2_Dev5 = "Data Source=K2dev5;Initial Catalog=K2;Persist Security Info=True;User ID=sa;Password=@Patkol.com@123; Connect Timeout=0; pooling=true; Max Pool Size=5000";
        public static String conSC_Portal = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=SC_Portal;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        public static String conPatkol = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=PATKOL_K2APP_DATA;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        public static String conITPortal = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=IT_Portal;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        public static String conHrPotal = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=HRPortal;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        public static String conPKS = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=ERP_PKS_App;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        public static String conTG = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=ERP_TG_App;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        public static String conCRP2_PKS = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=CRP2_PKS_App;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        public static String conPKMS = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=ERP_PKMS_APP;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";



        string PK = System.Configuration.ConfigurationManager.AppSettings["PK"];
        string Site = System.Configuration.ConfigurationManager.AppSettings["Site"];
        string PKM = System.Configuration.ConfigurationManager.AppSettings["PKM"];
        string PKT = System.Configuration.ConfigurationManager.AppSettings["PKT"];
        string SPN = System.Configuration.ConfigurationManager.AppSettings["SPN"];
        string PH = System.Configuration.ConfigurationManager.AppSettings["PH"];
        string IND = System.Configuration.ConfigurationManager.AppSettings["IND"];
        string MY = System.Configuration.ConfigurationManager.AppSettings["MY"];
        string TG = System.Configuration.ConfigurationManager.AppSettings["TG"];
        string CTG = System.Configuration.ConfigurationManager.AppSettings["CTG"];
        string HA = System.Configuration.ConfigurationManager.AppSettings["HA"];
        string CHA = System.Configuration.ConfigurationManager.AppSettings["CHA"];

        public string ConnectK2_Version(string version)
        {
            string connect = "";
            if (version == "V4")
            {
                connect = con;
            }
            else if (version == "V5")
            {
                //connect = conK2_5;
                connect = conK2_Dev5;
            }
            return connect;
        }

        public string SeletSite_ref(string site_ref)
        {
            string connn = "";
            if (site_ref == PK)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLERP_PK"].ConnectionString;
            }
            else if (site_ref == PKM)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLERP_PKM"].ConnectionString;
            }
            else if (site_ref == PKT)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLERP_PKT"].ConnectionString;
            }
            else if (site_ref == SPN)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLERP_SPN"].ConnectionString;
            }
            else if (site_ref == PH)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLOverseaPH"].ConnectionString;
            }
            else if (site_ref == IND)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLOverseaID"].ConnectionString;
            }
            else if (site_ref == MY)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLOverseaMY"].ConnectionString;
            }
            else if (site_ref == TG)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLERP_TG"].ConnectionString;
            }
            else if (site_ref == HA)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLERP_HA"].ConnectionString;
            }

            return connn;
        }


        public String GetUser()
        {
            var UserDomain = HttpContext.Current.Request.LogonUserIdentity.Name;
            UserDomain = UserDomain.Replace("PATKOL\\", "");
            return UserDomain;
        }

        public List<ArrayList> GetK2(string Search)
        {
            List<ArrayList> GetK2 = new List<ArrayList>();

            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = "SELECT TOP(500) [K2ID], [Subject], [K2Vers] FROM [VW_Temp_WorkflowTask_Search] ";

                if (Search != "")
                {
                    sql += " WHERE [K2ID] LIKE ('%" + Search + "%') OR [Subject] LIKE ('%" + Search + "%') OR [K2Vers] LIKE ('%" + Search + "%')";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetK2.Add(detail);
                        }
                    }
                }
            }
            return GetK2;
        }

        public List<ArrayList> GetProcessData(string K2ID, string K2ver)
        {
            List<ArrayList> GetProcessData = new List<ArrayList>();

            using (SqlConnection conn = new SqlConnection(ConnectK2_Version(K2ver)))
            {
                string sql = "SELECT [ID], [ProcessData], [Value] FROM [VW_ProcessData] WHERE ProcInstID = " + K2ID;

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetProcessData.Add(detail);
                        }
                    }
                }
            }
            return GetProcessData;
        }


        public void SP_ProcessData_Update(int ProcInstID, int ID, string Value, string K2ver)
        {
            SqlConnection connect = new SqlConnection(ConnectK2_Version(K2ver));
            SqlCommand cmd = new SqlCommand("SP_ProcessData_Update", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ProcInstID", ProcInstID);
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Value", Value);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public List<ArrayList> GetSite_ref()
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conPatkol))
            {
                string sql = "SELECT [SiteRef],Corp_NameEN FROM [dbo].[SiteDatabase] sb LEFT JOIN TB_company cp ON sb.SiteRef = cp.Corp_Name WHERE [ShowEntries] = 1";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetLevel()
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHrPotal))
            {
                string sql = "SELECT [Level_Emp] FROM [dbo].[TB_Pyramid_Level]";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetCostcenter()
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHrPotal))
            {
                string sql = "SELECT DISTINCT [Costcenter] FROM [HRPortal].[dbo].[VW_Dept_AllSite] WHERE [Costcenter] LIKE '%5IT7%'";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetIT_TAG(string site_ref,string IT_TAG_CODE, string IT_TAG_BAND, string EmpNum)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP(1000) [IT_Tag_Code],[Tag_Group],[Purchase_Type],[Start_Contract_date],[Expire_Contract_date]" +
                    ",[Detail],[Brand],[Model],[Volume],[Status],[SN]" +
                    " ,[Product_Key],[PONumber],[UnitPrice],[Vendor],[Asset_of_Company]" +
                    ",[Asset_No],[Asset_Date],[Processor],[CPU_Clock]" +
                    ",[RAM],[HDD],[Create_Date],[Create_By],[Update_Date],[Update_By] " +
                    "FROM  [dbo].[TB_IT_TAG_MASTER_New]";
                    if(site_ref !="" || IT_TAG_CODE != "" || IT_TAG_BAND !="" || EmpNum !="" )
                {
                    //ต้องทำเพิ่ม หลังเป็น VW
                    sql += "where ";
                    sql += "[Asset_of_Company] like '%" + site_ref + "%' AND ";
                    sql += "[IT_Tag_Code] like '%" + IT_TAG_CODE + "%' AND ";
                    sql += "[Brand] like '%" + IT_TAG_BAND + "%' AND ";
                    sql += "[EmpNum] like '%" + EmpNum + "%' ";

                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetIT_TAG_New(string Asset_of_Company, string TagGroupName,  string TAG_Status, string Maintype,string ITTAG,string TypeName)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP (500) [IT_Tag_Code],[Tag_Group],[MainType],[TypeName],[TagGroup],[TagGroupName],[Tag_Group_Status],[Used],[Volume],[TAG_Status],[Asset_of_Company],[Start_Contract_date],[Expire_Contract_date] FROM [IT_Portal].[dbo].[VW_IT_TAG_PE_Browse]";
                    if(TagGroupName != "" || Asset_of_Company != "" || TAG_Status != "" || Maintype != "" || ITTAG !=""|| TypeName !="")
                {
                    //ต้องทำเพิ่ม หลังเป็น VW
                    sql += "where ";
                    sql += "[TagGroupName] like '%" + TagGroupName + "%' AND ";
                    sql += "[Asset_of_Company] like '%" + Asset_of_Company + "%' AND ";
                    sql += "[TAG_Status] like '" + TAG_Status + "%' AND ";
                    sql += "[IT_Tag_Code] like '%" + ITTAG + "%' AND ";
                    sql += "[MainType] like '%" + Maintype + "%' AND";
                    sql += "[TypeName] like '%" + TypeName + "%' ";

                }
                sql += " order by [IT_Tag_Code],[Asset_of_Company]";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetIT_TAG_New_SearchBrowse(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP (1000) [IT_Tag_Code],[Tag_Group],[MainType],[TypeName],[TagGroup],[TagGroupName],[Tag_Group_Status],[Used],[Volume],[TAG_Status],[Asset_of_Company],[Start_Contract_date],[Expire_Contract_date] FROM [IT_Portal].[dbo].[VW_IT_TAG_PE_Browse]";
                    if(search != "")
                {
                    //ต้องทำเพิ่ม หลังเป็น VW
                    sql += "where ";
                    sql += "[TAG_Status] like 'Active' AND (";
                    sql += "[TagGroupName] like '%" + search + "%' OR ";
                    sql += "[Asset_of_Company] like '%" + search + "%' OR ";
                    sql += "[IT_Tag_Code] like '%" + search + "%' OR ";
                    sql += "[MainType] like '%" + search + "%' )";

                }
                sql += " order by [IT_Tag_Code],[Asset_of_Company]";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetIT_TAG_Assign(string Group)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT [site_ref],[IT_TAG_CODE],[IT_TAG_GROUP],[IT_TAG_DETAIL],[IT_TAG_BAND],[IT_TAG_SELL],[IT_TAG_MODEL],[IT_TAG_DATE],[IT_TAG_ASSTNO],[IT_TAG_PRICE],[IT_TAG_IMAGE],[IT_TAG_FILENAME],[IT_TAG_SN],[IT_TAG_LOCATION],[IT_TAG_CONTRACT],[CPU],[HDD],[RAM],[WINDOWS],[IT_PS_ID],[EmpNum],convert(varchar, [IT_PS_DATE], 101) as [IT_PS_DATE],[ReturnDate],[IT_PS_DETAIL],[IT_PS_CHARGE],[Fullname] FROM [VW_PMOnline_IT_TAG_Assign]";
                if (Group != "")
                {
                    sql += " Where IT_TAG_GROUP = '" + Group + "' ";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetIT_TAG_Assign_New(string Group)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP (1000) [IT_Tag_Code],[Tag_Group],[Purchase_Type]" +
                    ",[Start_Contract_date],[Expire_Contract_date],[Detail],[Brand],[Model],[Volume],[TAG_Status]" +
                    ",[SN],[Product_Key],[PONumber],[UnitPrice],[Vendor]," +
                    "[Asset_of_Company],[Asset_No],[Asset_Date],[Processor],[CPU_Clock],[RAM]" +
                    ",[HDD],[Owner],[MainType],[TypeName],[Emp_num],[FullName]" +
                    "FROM[IT_Portal].[dbo].[VW_PMOnline_IT_TAG_Assign_V2]";
                if (Group != "")
                {
                    sql += " Where [Tag_Group] = '" + Group + "' ";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetIT_TAG_Group(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT IT_TAG_GROUP FROM VW_PMOnline_IT_TAG_Group";
                if(search != "")
                {
                    sql += " where IT_TAG_GROUP = '" + search + " '";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetIT_TAG_Group_New(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT distinct [TagGroup],[TagGroupName] FROM [dbo].[TB_IT_TAG_Group]";
                if (search != "")
                {
                    sql += " where TagGroup like '%" + search + "%' OR TagGroupName like '%" + search + "%' ";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetIT_TAG_Group_New_PMoneline(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT [TagGroup],[TagGroupName],[MainType] FROM [dbo].[VW_IT_TAG_Group]";
                sql += " where [MainType] = 'Hardware' ";
                if (search != "")
                {
                    sql += " AND  ( TagGroup like '%" + search + "%' OR TagGroupName like '%" + search + "%' )";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetFillterCharge_IT_TAG_Group_New(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT [TagGroup],[TagGroupName],[Typename] FROM [dbo].[VW_IT_TAG_Group]";
                if (search != "")
                {
                    sql += " AND  ( TagGroup like '%" + search + "%' OR TagGroupName like '%" + search + "%' )";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetCheckList_Type()
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT [ID],[Name] FROM [TB_PMOnline_CheckList_Type]";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetCheckList_Group(string Type_id)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT [ID],[Type_ID],[IT_TAG_Group] FROM [dbo].[TB_PMOnline_CheckList_Group]";
                if( Type_id != "")
                {
                    sql += "where [TYPE_ID] = '" + Type_id + "' ";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetCheckList_Detail(string Type_id)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT [ID] ,[Type_ID] ,[Level],[Name],[Status] FROM [TB_PMOnline_CheckList_Detail]";
                if (Type_id != "")
                {
                    sql += "where [TYPE_ID] = '" + Type_id + "' ";
                }
                sql += "order by [Level]";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> HR_Employee(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHrPotal))
            {

                string sql = "SELECT TOP(1000) [res_id],[Fullname],[Level],[costcenter],[site_ref],[UserAD],[Emp_Status],[Emp_ManagerID] FROM [HRPortal].[dbo].[VW_HR_Employee_Authen]";
                if (search != "")
                {
                    sql += " WHERE  [res_id] like '" + search + "%' OR [Fullname] like '" + search + "%' ";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }

        public List<ArrayList> GetType(string SiteRef)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "EXEC SP_Report_Permission_Browse '','','" + SiteRef + "','RefType'";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> SetPositionPage(string Position)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT [Position],[Cost_Center],[Level],[Fullname],[UserAD] FROM [dbo].[VW_PMOnline_Permission] ";
                if(Position != "")
                {
                    sql += "WHERE [UserAD] = '" + GetUser() + "' AND ([Position] like '%" + Position + "%' OR [Position] = 'Admin')";
                }
                else
                {
                    sql += "WHERE [UserAD] = '" + GetUser() + "' AND ( [Position] = 'Admin')";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
      
        public List<ArrayList> VW_PMOnline_IT_TAG(string site_ref, string IT_TAG_CODE, string Fullname)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT [site_ref],[IT_TAG_CODE],[Fullname] FROM [dbo].[VW_PMOnline_IT_TAG]";
                if (site_ref != "" || IT_TAG_CODE != "" || Fullname != "" )
                {
                    sql += "where ";
                        sql += "[site_ref] like '%"+ site_ref + "%' OR " ;
                        sql += "[IT_TAG_CODE] like '%" + IT_TAG_CODE + "%' OR " ;
                        sql += "[Fullname] like '%" + Fullname + "%'  " ;

                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        //public List<ArrayList> VW_PMOnline_IT_TAG_Assign_Report(string site_ref, string IT_TAG, string EmpNum, string IT_TAG_GROUP)
        //{
        //    List<ArrayList> GetData = new List<ArrayList>();
        //    using (SqlConnection conn = new SqlConnection(conITPortal))
        //    {
        //        string sql = "SELECT [ID],[site_ref],[IT_TAG_GROUP],[IT_TAG],[EmpNum],[Status],[Assign_Date],[CreateDate],[CreateBy],[Fullname] FROM [dbo].[VW_PMOnline_IT_TAG_Assign_Report]";
        //        if (site_ref != "" || IT_TAG != "" || EmpNum != "" || IT_TAG_GROUP != "" )
        //        {
        //            sql += "where ";
        //                sql += "[site_ref] like '%"+ site_ref +"%' OR " ;
        //                sql += "[IT_TAG] like '%" + IT_TAG + "%' OR " ;
        //                sql += "[IT_TAG_GROUP] like '%" + IT_TAG_GROUP + "%' OR " ;
        //                sql += "[EmpNum] like '%" + EmpNum + "%'  " ;

        //        }
        //        using (SqlCommand cmd = new SqlCommand(sql, conn))
        //        {
        //            cmd.CommandType = CommandType.Text;
        //            conn.Open();
        //            using (var reader = cmd.ExecuteReader())
        //            {
        //                while (reader.Read())
        //                {
        //                    ArrayList detail = new ArrayList();
        //                    for (int i = 0; i < reader.FieldCount; i++)
        //                    {
        //                        detail.Add(reader[i].ToString());
        //                    }
        //                    GetData.Add(detail);
        //                }
        //            }
        //            conn.Close();
        //        }
        //    }
        //    return GetData;
        //}
        public List<ArrayList> VW_PMOnline_IT_TAG_Assign_Report_V2(string IT_TAG, string IT_TAG_GROUP, string Status, string EmpNum)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP (1000) [ID],[IT_TAG],[Status],[Assign_Date],[CreateDate],[CreateBy],[site_ref],[Emp_num],[FullName],[Tag_Group] FROM [dbo].[VW_PMOnline_IT_TAG_Assign_Report_V2]";
                if (IT_TAG != "" || IT_TAG_GROUP != "" || Status != "" || EmpNum != "" )
                {
                    sql += "where ";
                        sql += "([IT_TAG] like '%" + IT_TAG + "%' AND " ;
                        sql += "[Tag_Group] like '%" + IT_TAG_GROUP + "%' AND " ;
                        sql += "[Emp_num] like '%" + EmpNum + "%' AND " ;
                        sql += "[Status] like '%" + Status + "%'  )" ;

                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandType = CommandType.Text;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                    conn.Close();
                }
            }
            return GetData;
        }


        public List<ArrayList> GetPermission()
        {
            List<ArrayList> GetPermission = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conITPortal))
            {
                string sql = "SELECT [ID],[Position],[Cost_Center],[Level],[Emp_Num],[Fullname],[UserAD] FROM [dbo].[VW_PMOnline_Permission] order by [Position]  ";
               
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPermission.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPermission;
        }
        public List<ArrayList> GetVW_IT_TAG_Permission(string Portal, string Empnum, string Page, string Permission)
        {
            List<ArrayList> GetPermission = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP (1000) [ID],[Emp_num],[name],[dept],[Uf_Level],[Portal] ,[Page],[Permission] FROM [dbo].[VW_IT_TAG_Permission] ";

                if (Portal != "" || Empnum != "" || Page != "" || Permission != "")
                {
                    sql += "where ";
                    sql += "([Portal] like '%" + Portal + "%' AND ";
                    sql += "[Emp_num] like '%" + Empnum + "%' AND ";
                    sql += "[Page] like '%" + Page + "%' AND ";
                    sql += "[Permission] like '%" + Permission + "%'  )";

                }
                sql += " ORDER BY [Emp_num],[ID]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPermission.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPermission;
        }
        public List<ArrayList> CheckPermission(string Portal, string Page)
        {
            List<ArrayList> GetPermission = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conITPortal))
            {
                string sql = "SELECT  [ID],[Emp_num],[name],[dept],[Uf_Level],[Portal] ,[Page],[Permission],[UserAD] FROM [dbo].[VW_IT_TAG_Permission] " +
                    " WHERE [Portal] = '" + Portal + "' AND[Page] = '" + Page + "' AND [UserAD] = '" + GetUser() + "' ";
               
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPermission.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPermission;
        }
        public string SP_IT_TAG_Permission(int ID, string Portal, string Page, string Emp_num, string Permission)
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_IT_TAG_Permission", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Portal", Portal);
            cmd.Parameters.AddWithValue("Page", Page);
            cmd.Parameters.AddWithValue("Emp_num", Emp_num);
            cmd.Parameters.AddWithValue("Permission", Permission);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());
            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            con.Close();
            return returnData;
        }


        public List<ArrayList> SP_Report_Permission_Browse(string RefType, string Search, string SiteRef, string Status)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "EXEC SP_Report_Permission_Browse '" + RefType + "','" + Search + "','" + SiteRef + "','" + Status + "'";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }

        public List<ArrayList> GetReport_Permission(string SiteRef, string RefType, string RufNum, string Username, string AutType)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP(500) [ID],[RefType],[RufNum],[Username],[site_ref],[AutType],[Description],[eff_date],[end_date],[Source],[Destination],[reference]" +
                    " FROM  [IT_Portal].[dbo].[VW_Report_Permission] " +
                    " WHERE [RefType] = '" + RefType + "' " +
                    " AND [site_ref] = '" + SiteRef + "' " +
                    " AND [RufNum] LIKE('%" + RufNum + "%')  " +
                    " AND [Username] LIKE('%" + Username + "%') " +
                    " AND ( [AutType] LIKE('%" + AutType + "%') OR [AutType] is null)";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> VW_Ctr_Permission(string Username, string SiteRef, string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(SiteRef)))
            {
                string sql = "SELECT TOP(100) RufNum as 'RefNum' FROM [dbo].[VW_Ctr_Permission]  WHERE [Username] = '" + Username + "' AND RufNum LIKE ('%" + search + "%')";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> VW_Ctr_PermissionProjPortal(string Username, string SiteRef, string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(SiteRef)))
            {
                string sql = "SELECT TOP(100) RefNum FROM [dbo].[VW_Ctr_PermissionProjPortal] WHERE [Username] = '" + Username + "' AND [RefNum] LIKE ('%" + search + "%')";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> VW_Ctr_Permission_Rpt_User(string Username, string SiteRef)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT RefNum FROM VW_Ctr_Permission_Rpt_User WHERE [Username] = '" + Username + "' AND site_ref = '" + SiteRef + "'";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public string SP_Report_Permission_Save(int ID, string RefType, string RufNum, string Username,
            string site_ref, string AuthenType, string EndDate, string EffectDate, string Reference)
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_Report_Permission_Save", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("RefType", RefType);
            cmd.Parameters.AddWithValue("RufNum", RufNum);
            cmd.Parameters.AddWithValue("Username", Username);
            cmd.Parameters.AddWithValue("site_ref", site_ref);
            cmd.Parameters.AddWithValue("UserBy", GetUser());
            cmd.Parameters.AddWithValue("AutType", AuthenType);
            cmd.Parameters.AddWithValue("reference", Reference);
            cmd.Parameters.AddWithValue("eff_date", EndDate);
            cmd.Parameters.AddWithValue("end_date", EffectDate);
            //cmd.Parameters.AddWithValue("Msg", "");
            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            con.Close();
            return returnData;
        }
        public List<ArrayList> TB_WorkflowType(string Search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conDev))
            {
                string sql = "SELECT [WorkflowType],[WorkflowType] + ' - ' + [Description] as 'Name' FROM [dbo].[TB_WorkflowType] WHERE [WorkflowType] NOT IN (SELECT [WFType] FROM  [dbo].[TB_K2TableName]  )";

                if (Search != "")
                {
                    sql = " AND [WorkflowType] = '" + Search + "'";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public string CheckWFType(string Workflow_Type, string Table_Name, string SelectType)
        {
            string GetData = "";
            using (SqlConnection conn = new SqlConnection(conDev))
            {
                string sql = "SELECT TOP 1 ID FROM [dbo].[TB_ColumnName] WHERE  [WFType] = '" + Workflow_Type + "'";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            GetData = reader["ID"].ToString();
                        }
                    }
                }
            }
            return GetData;
        }
        public string SP_ColumnName_Insert(string Workflow_Type, string Table_Name, string SelectType)
        {
            SqlConnection condb = new SqlConnection(conK2_Dev5);
            SqlCommand cmd = new SqlCommand("SP_ColumnName_Insert", condb);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("WFType", Workflow_Type);
            cmd.Parameters.AddWithValue("TBName", Table_Name);
            //cmd.Parameters.AddWithValue("Msg", "");
            condb.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            condb.Close();
            return returnData;
        }
        public List<ArrayList> SearchWFType(string Workflow_Type, string Table_Name, string SelectType)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conK2_Dev5))
            {
                string sql = "SELECT * FROM [dbo].[TB_ColumnName] WHERE  [WFType] = '" + Workflow_Type + "'";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public string SP_ColumnName_Update(string id, string column, string value)
        {
            SqlConnection condb = new SqlConnection(conK2_Dev5);
            SqlCommand cmd = new SqlCommand("SP_ColumnName_Update", condb);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", id);
            cmd.Parameters.AddWithValue("ColumnTB", column);
            cmd.Parameters.AddWithValue("Name", value);
            //cmd.Parameters.AddWithValue("Msg", "");
            condb.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            condb.Close();
            return returnData;
        }

        public DataTable SP_ColumnName_select(string Table_Name)
        {
            string sql = "EXEC SP_ColumnName_select '" + Table_Name + "' ";
            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conK2_Dev5);
            SqlCommand cmd = new SqlCommand(sql, connection);
            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();
            return DT;
        }

        public void SP_TBK2TableName_insert(string WFType, string TB_Name, string SP_Name, string Typeflow)
        {
            SqlConnection con = new SqlConnection(conDev);
            SqlCommand cmd = new SqlCommand("SP_TBK2TableName_insert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("WFType", WFType);
            cmd.Parameters.AddWithValue("TB_Name", TB_Name);
            cmd.Parameters.AddWithValue("SP_Name", SP_Name);
            cmd.Parameters.AddWithValue("Type", Typeflow);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        
        public void SP_PMOnline_CheckList_Type(string id, string name)
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_PMOnline_CheckList_Type", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", id);
            cmd.Parameters.AddWithValue("Name", name);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void SP_PMOnline_CheckList_Group(string ID, string Type_ID, string IT_TAG_Group)
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_PMOnline_CheckList_Group", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Type_ID", Type_ID);
            cmd.Parameters.AddWithValue("IT_TAG_Group", IT_TAG_Group);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void SP_PMOnline_CheckList_Detail(string ID, string Type_ID, string Level, string Name, string Status)
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_PMOnline_CheckList_Detail", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Type_ID", Type_ID);
            cmd.Parameters.AddWithValue("Level", Level);
            cmd.Parameters.AddWithValue("Name", Name);
            cmd.Parameters.AddWithValue("Status", Status);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void SP_PMOnline_Assign_Insert(string IT_TAG, string IT_TAG_GROUP,string site_ref)
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_PMOnline_Assign_Insert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("IT_TAG", IT_TAG);
            cmd.Parameters.AddWithValue("IT_TAG_GROUP", IT_TAG_GROUP);
            cmd.Parameters.AddWithValue("Username", GetUser());
            cmd.Parameters.AddWithValue("site_ref", site_ref);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void SP_PMOnline_Permission(int ID, string Position, string Emp_Num,string Type)
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_PMOnline_Permission", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Position", Position);
            cmd.Parameters.AddWithValue("Emp_Num", Emp_Num);
            cmd.Parameters.AddWithValue("Username", GetUser());
            cmd.Parameters.AddWithValue("Type", Type);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void SP_Salesforce_ImportIcash(string site_ref)
        {
            SqlConnection con = new SqlConnection(SeletSite_ref(site_ref));
            SqlCommand cmd = new SqlCommand("SP_Salesforce_ImportIcash", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.ExecuteNonQuery();
            //SqlDataReader rs = cmd.ExecuteReader();
            //string returnData = "";
            //if (rs.Read())
            //{
            //    returnData = rs["msg"].ToString();
            //}
            con.Close();
        }


        public void SP_Salesforce_BackUpIcash(string site_ref)
        {
            SqlConnection con = new SqlConnection(SeletSite_ref(site_ref));
            SqlCommand cmd = new SqlCommand("SP_Salesforce_BackUpIcash", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public DataTable VW_SFiCsh_Format_V2_PK(string siteRef)
        {
            //string filePath = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
            //string dbFile = filePath + @"\sqlfile.txt";
            DataTable DT = new DataTable();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(siteRef)))
            {
                string sql = "SELECT [site_ref],[emp_num],CONVERT(char(10), [disc_date],126)as 'disc_date',CONVERT(char(10), [Approve_date],126)as 'Approve_date',[appointment_num],[appointment_amt],[appointment_line]," +
                    "[pay_type_num],CONVERT(char(10), [working_date],126)as 'working_date',[amt],[proj_num],[task_num],[appointment_type],[cutoff],[batch id],[Appointment_create_by],[Appointment_record_by]" +
                    " FROM [dbo].[VW_SFiCsh_Format_V2] ORDER by emp_num,appointment_num,[pay_type_num] ";
                //string sql = "SELECT TOP (10) * FROM [dbo].[TB_Home_Group]";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    conn.Open();
                    //cmd.Connection = conn;
                    //cmd.CommandType = CommandType.Text;
                    //cmd.CommandText = sql;
                    //cmd.CommandTimeout = 0;
                    DT.Load(cmd.ExecuteReader());
                    conn.Close();
                }
            }
            return DT;
        }

        public DataTable VW_SFiCsh_Format_Temp_CutOff(string strDate, string endDate,string siteRef)
        {
            DataTable DT = new DataTable();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(siteRef)))
            {
                string sql = "SELECT [emp_num],CONVERT(char(10), [disc_date],126)as 'disc_date',CONVERT(char(10), [Approve_date],126)as 'Approve_date'," +
                    "[appointment_num],[appointment_amt],[appointment_line],[pay_type_num],CONVERT(char(10), [working_date],126)as 'working_date'," +
                    "[amt],[proj_num],[task_num],[appointment_type],[cutoff],[batch id],[Appointment_create_by],[Appointment_record_by] " +
                    " FROM [dbo].[VW_SFiCsh_Format_Temp_CutOff]" +
                    "  WHERE CONVERT(date,working_date) BETWEEN convert(datetime, '" + strDate + "', 103) and convert(datetime, '" + endDate + "', 103)";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    conn.Open();
                    //cmd.Connection = conn;
                    //cmd.CommandType = CommandType.Text;
                    //cmd.CommandText = sql;
                    //cmd.CommandTimeout = 0;
                    DT.Load(cmd.ExecuteReader());
                    conn.Close();
                }
            }

            return DT;
        }

        public void SP_TB_OT_Salesforce_Process(string site_ref)
        {
            SqlConnection con = new SqlConnection(SeletSite_ref(site_ref));
            SqlCommand cmd = new SqlCommand("SP_TB_OT_Salesforce_Process", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.ExecuteNonQuery();
            //SqlDataReader rs = cmd.ExecuteReader();
            //string returnData = "";
            //if (rs.Read())
            //{
            //    returnData = rs["msg"].ToString();
            //}
            con.Close();
        }

        public DataTable VW_OT_Salesforce_Temp(string siteRef)
        {
            DataTable DT = new DataTable();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(siteRef)))
            {
                string sql = "SELECT * FROM VW_OT_Salesforce_Temp ORDER BY ID ";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    conn.Open();
                    //cmd.Connection = conn;
                    //cmd.CommandType = CommandType.Text;
                    //cmd.CommandText = sql;
                    //cmd.CommandTimeout = 0;
                    DT.Load(cmd.ExecuteReader());
                    conn.Close();
                }
            }

            return DT;
        }

        public void SP_TB_OT_Salesforce_Archive(string site_ref)
        {
            SqlConnection con = new SqlConnection(SeletSite_ref(site_ref));
            SqlCommand cmd = new SqlCommand("SP_TB_OT_Salesforce_Archive", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.ExecuteNonQuery();
            //SqlDataReader rs = cmd.ExecuteReader();
            //string returnData = "";
            //if (rs.Read())
            //{
            //    returnData = rs["msg"].ToString();
            //}
            con.Close();
        }
        public void SP_PMOnline_sync_CheckList()
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_PMOnline_sync_CheckList", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.ExecuteNonQuery();
            //SqlDataReader rs = cmd.ExecuteReader();
            //string returnData = "";
            //if (rs.Read())
            //{
            //    returnData = rs["msg"].ToString();
            //}
            con.Close();
        }
        public List<ArrayList> TB_IT_TAG_Group(string Owner,string MainType,string TypeName,string Status)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP(1000) [ID],[Owner],[MainType],[TypeName],[TagGroup],[TagGroupName],[Status],[ReportSeq] FROM [dbo].[TB_IT_TAG_Group] ";

                if (Owner != "" || MainType != "" || TypeName != "" || Status != "" )
                {
                    sql += " WHERE [Owner] like '%" + Owner + "%' AND [MainType] like '%" + MainType + "%' AND [TypeName] like '%" + TypeName + "%' AND [Status] like '%" + Status + "%' ";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> VW_IT_TAG_Group(string MainType,string TypeName,string Status)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP (1000) [ID],[MainType],[TypeName],[TagGroup],[TagGroupName],[Status],[ReportSeq],[Used],[Total] FROM [dbo].[VW_IT_TAG_Group]";

                if ( MainType != "" || TypeName != "" || Status != "" )
                {
                    sql += " WHERE   [MainType] like '%" + MainType + "%' AND [TypeName] like '%" + TypeName + "%' AND [Status] like '%" + Status + "%' ";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> Browse_Generate_IT_TAG_Group(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP(1000) [ID],[Owner],[MainType],[TypeName],[TagGroup],[TagGroupName],[Status],[ReportSeq] FROM [dbo].[TB_IT_TAG_Group] WHERE [Status] = 'Active' ";

                if (search != "" )
                {
                    sql += " And ( [TagGroup] like '%" + search + "%' OR [MainType] like '%" + search + "%' OR [TypeName] like '%" + search + "%' )  ";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public string SP_IT_TAG_Group(int ID ,string MainType, string TypeName, string TagGroup, string TagGroupName, string Status, int ReportSeq)
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_IT_TAG_Group", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("MainType", MainType);
            cmd.Parameters.AddWithValue("TypeName", TypeName);
            cmd.Parameters.AddWithValue("TagGroup", TagGroup);
            cmd.Parameters.AddWithValue("TagGroupName", TagGroupName);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("ReportSeq", ReportSeq);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());
            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["Msg"].ToString();
            }
            con.Close();
            return returnData;
        }

        public List<ArrayList> GetSite_HRPortal()
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHrPotal))
            {
                string sql = "SELECT TOP (1000) [Corp_Name],[Corp_NameEN] FROM [dbo].[TB_company]";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetLocation()
        {
            List<ArrayList> GetLocation = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conPKS))
            {
                string sql = " select [Location], [Description] from [VW_Location]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetLocation.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetLocation;
        }
        public List<ArrayList> GetIT_TAG_Charge()
        {
            List<ArrayList> GetLocation = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conITPortal))
            {
                string sql = " SELECT [ID],[Tag_Group],[Charge1],[Charge2],[Charge3],[TagGroupName],[MainType] FROM [dbo].[VW_IT_TAG_Charge]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetLocation.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetLocation;
        }
        public void SP_IT_TAG_Charge(int ID, string Tag_Group, int Charge1,int Charge2,int Charge3)
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_IT_TAG_Charge", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Tag_Group", Tag_Group);
            cmd.Parameters.AddWithValue("Charge1", Charge1);
            cmd.Parameters.AddWithValue("Charge2", Charge2);
            cmd.Parameters.AddWithValue("Charge3", Charge3);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public string SP_IT_TAG_Master(string IT_Tag_Code, string Tag_Group, string Purchase_Type, string Start_Contract_date, string Expire_Contract_date
            , string Detail, string Brand, string Model, int Volume, string Status, string SN, string Product_Key
            , string PONumber, double UnitPrice, string Vendor, string Asset_of_Company, string Asset_No, string Asset_Date
            , string Processor, string CPU_Clock, string RAM, string HDD,string Owner
            ,string Inactive_Reason,string Detail_Reason,string Inactive_Date, string Stauts)
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_IT_TAG_Master_V2", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("IT_Tag_Code", IT_Tag_Code);
            cmd.Parameters.AddWithValue("Tag_Group", Tag_Group);
            cmd.Parameters.AddWithValue("Purchase_Type", Purchase_Type);
            cmd.Parameters.AddWithValue("Start_Contract_date", Start_Contract_date);
            cmd.Parameters.AddWithValue("Expire_Contract_date", Expire_Contract_date);
            cmd.Parameters.AddWithValue("Detail", Detail);
            cmd.Parameters.AddWithValue("Brand", Brand);
            cmd.Parameters.AddWithValue("Model", Model);
            cmd.Parameters.AddWithValue("Volume", Volume);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("SN", SN);
            cmd.Parameters.AddWithValue("Product_Key", Product_Key);
            cmd.Parameters.AddWithValue("PONumber", PONumber);
            cmd.Parameters.AddWithValue("UnitPrice", UnitPrice);
            cmd.Parameters.AddWithValue("Vendor", Vendor);
            cmd.Parameters.AddWithValue("Asset_of_Company", Asset_of_Company);
            cmd.Parameters.AddWithValue("Asset_No", Asset_No);
            cmd.Parameters.AddWithValue("Asset_Date", Asset_Date);
            cmd.Parameters.AddWithValue("Processor", Processor);
            cmd.Parameters.AddWithValue("CPU_Clock", CPU_Clock);
            cmd.Parameters.AddWithValue("RAM", RAM);
            cmd.Parameters.AddWithValue("HDD", HDD);
            cmd.Parameters.AddWithValue("Owner", Owner);
            cmd.Parameters.AddWithValue("Inactive_Reason", Inactive_Reason);
            cmd.Parameters.AddWithValue("Detail_Reason", Detail_Reason);
            cmd.Parameters.AddWithValue("Inactive_Date", Inactive_Date);
            cmd.Parameters.AddWithValue("Username", GetUser());
            cmd.Parameters.AddWithValue("Stauts", Stauts);
            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["IT_Tag_Code"].ToString();
            }

            con.Close();
            return returnData;
        }
        public List<ArrayList> VW_IT_TAG_Master(string ITTAG)
        {
            List<ArrayList> GetLocation = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conITPortal))
            {
                string sql = " SELECT [IT_Tag_Code],[Tag_Group],[Purchase_Type],[Start_Contract_date]" +
                    ",[Expire_Contract_date],[Detail],[Brand],[Model],[Volume],[TAG_Status],[SN]" +
                    ",[Product_Key],[PONumber],[UnitPrice],[Vendor],[Asset_of_Company],[Asset_No]" +
                    ",[Asset_Date],[Processor],[CPU_Clock],[RAM],[HDD],[Group_ID],[Owner],[MainType]" +
                    ",[TypeName],[TagGroup],[TagGroupName],[Tag_Group_Status],[ReportSeq],[Vendor_Name] " +
                    ",[Inactive_Reason],[Detail_Reason],[Inactive_Date]" +
                    " FROM[IT_Portal].[dbo].[VW_IT_TAG_Master]";

                if(ITTAG != "")
                {
                    sql += "  WHERE[IT_Tag_Code] = '"+ ITTAG + "' ";
                }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetLocation.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetLocation;
        }
        public List<ArrayList> Get_Tranfer_VW_IT_TAG_PE_Browse(string Tranfer_Type,string TypeCondition, string search,string Browse_Step)
        {
            List<ArrayList> GetLocation = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conITPortal))
            {
                string sql = " SELECT TOP (1000) [IT_Tag_Code],[Tag_Group],[MainType],[TypeName],[TagGroup],[TagGroupName],[Used],[Volume] FROM [dbo].[VW_IT_TAG_PE_Browse]";

                if (Tranfer_Type == "Normal")
                {
                    if (TypeCondition != "")
                    {
                        sql += "   WHERE [TypeName] = '" + TypeCondition + "'";
                        if (search != "")
                        {
                            sql += "AND ([IT_Tag_Code] like '%" + search + "%' or [TagGroupName] like '%" + search + "%')";
                        }
                    }

                }
                else if (Tranfer_Type == "JD")
                {
                    if (TypeCondition != "")
                    {
                        //sql += "   WHERE [Tag_Group] = '" + TypeCondition + "'";
                        sql += "   WHERE [TypeName] = '" + TypeCondition + "'";
                        if (search != "")
                        {
                            sql += "AND ([IT_Tag_Code] like '%" + search + "%' or [TagGroupName] like '%" + search + "%')";
                        }
                    }

                }
                else
                {
                    sql += "  WHERE [IT_Tag_Code] like '%" + search + "%' or [TagGroupName] like '%" + search + "%'";
                }
                sql += "  And [TAG_Status] = 'Active'";
                //if(Browse_Step == "New")
                //{
                //    sql += "  And [Tag_Group_Status] = 'Active'";
                //}
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetLocation.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetLocation;
        }
        public List<ArrayList> Get_Print_VW_IT_TAG_Master(string Taggroup,string search)
        {
            List<ArrayList> GetLocation = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conITPortal))
            {
                string sql = " SELECT [IT_Tag_Code],[Tag_Group],[Purchase_Type],[Start_Contract_date]" +
                    ",[Expire_Contract_date],[Detail],[Brand],[Model],[Volume],[TAG_Status],[SN]" +
                    ",[Product_Key],[PONumber],[UnitPrice],[Vendor],[Asset_of_Company],[Asset_No]" +
                    ",[Asset_Date],[Processor],[CPU_Clock],[RAM],[HDD],[Group_ID],[Owner],[MainType]" +
                    ",[TypeName],[TagGroup],[TagGroupName],[Tag_Group_Status],[ReportSeq] " +
                    "FROM[IT_Portal].[dbo].[VW_IT_TAG_Master]";
                    sql += "   WHERE [MainType]	<>  'Software'";
                    if(Taggroup != "")
                    {
                        sql+= " AND [Tag_Group] ='"+ Taggroup + "'" ;
                    }
                    if (search != "")
                    {
                        sql += " AND ([IT_Tag_Code] like '%" + search + "%' or [TagGroupName] like '%" + search + "%')";
                    }
                

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetLocation.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetLocation;
        }
        public DataTable C_Get_Print_VW_IT_TAG_Master(string IT_TAG_Code_Start, string IT_TAG_Code_End)
        {
            string sql = " EXEC [dbo].[SP_IT_TAG_Export_PrintITTAG] '"+ IT_TAG_Code_Start + "','"+ IT_TAG_Code_End + "'";

            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();
            return DT;
        }

        public DataTable SP_Rpt_ITCharge (string Reportdate, string sReturnDate, string eReturnDate, string Company, string TagGroup,double Rate,string Currency)
        {
            string sql = " EXEC SP_Rpt_ITCharge '"+ Reportdate + "' , '"+ sReturnDate + "' , '"+ eReturnDate + "' ,'"+ Company + "' ,'"+ TagGroup + "',"+ Rate+ " ,'"+ Currency+"'";

            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();
            return DT;
        }


        public DataTable SP_Rpt_ITDetail(string Owner, string AssetCompany, string MainType
            , string TypeName, string TagGroup, string PurchaseType, string VendorPurchase
            , string sStartContractDate, string eStartContractDate, string sExpireContractDate
            , string eExpireContractDate, string StatusTag, string sBorrowDueDate,string eBorrowDueDate
            , string Statususage, string Emp, string Company, string BusinessGroup, string EmpDept
            , string EmpLevel, string EmpLocation, string EmpJobTitle)
        {
            string sql = " EXEC SP_Rpt_ITDetail '" + Owner + "' ,'" + AssetCompany + "' ,'" + MainType + "' " +
                ",'" + TypeName + "' ,'" + TagGroup + "' ,'" + PurchaseType + "' ,'" + VendorPurchase + "' " +
                ",'" + sStartContractDate + "' " + ",'" + eStartContractDate + "' ,'" + sExpireContractDate + "' " +
                ",'" + eExpireContractDate + "' ,'" + StatusTag + "' " +
                ",'" + Emp + "' ,'" + Company + "' ,'" + BusinessGroup + "' ,'" + EmpDept + "' " +
                ",'" + EmpLevel + "' ,'" + EmpLocation + "' ,'" + sBorrowDueDate +"' "+
                ",'" + sBorrowDueDate + "' ,'" + eBorrowDueDate + "' ,'" + Statususage + "'  ";

            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();
            return DT;
        }


        public DataTable SP_Rpt_ITDetail(string Owner,string  AssetCompany,string  MainType
            ,string  TypeName,string  TagGroup,string  PurchaseType
            ,string  StatusTag,string  sStartDate,string  eStartDate
            ,string  sReturnDate,string  eReturnDate)
        {
            string sql = "Exec [SP_Rpt_ITUsedHistory] " +
                "'"+ Owner + "' , '"+ AssetCompany + "','"+ MainType + "','"+ TypeName + "'" +
                ",'"+ TagGroup + "','"+ PurchaseType + "','"+ StatusTag + "'" +
                ",'"+ sStartDate + "','"+ eStartDate + "','"+ sReturnDate + "','"+ eReturnDate + "'  ";

            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();
            return DT;
        }


        public List<ArrayList> GET_PE_VW_IT_TAG_PE_Browse(string search,string type)
        {
            List<ArrayList> GetLocation = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conITPortal))
            {
            string sql = " SELECT TOP (1000) [IT_Tag_Code],[Tag_Group],[MainType],[TypeName],[TagGroup],[TagGroupName],[Used],[Volume] FROM  [dbo].[VW_IT_TAG_PE_Browse]";
                    if(type != "")
                    {
                    sql += " WHERE  [MainType] ='" + type + "' ";
                    //sql += " AND [TAG_Status] ='Active' ";
                        if (search != "")
                        {
                            sql += " AND ( [IT_Tag_Code] like '%" + search + "%' or [TagGroupName] like '%" + search + "%' or [Tag_Group] like '%" + search + "%' ) ";
                        }
                    }
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetLocation.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetLocation;
        }

        public List<ArrayList> VW_PO_AllSite(string Search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT DISTINCT TOP(30)[site_ref],[po_num],[po_line],[item],[Uf_ItemLongDesc],[Uf_ExpenseDesc],[Uf_AssetNumber],[vend_num],[vend_nane],[item_cost_conv],[AssetDate] FROM [IT_Portal].[dbo].[VW_PO_AllSite] WHERE [vend_nane] is not null  ";
                
                    sql += " AND ([po_num] like '%" + Search + "%' OR [vend_num] like '%" + Search + "%' OR [vend_nane] like '%" + Search + "%'  )";
              
                sql += " order by [po_num]";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public void SP_IT_TAG_Accessory(int ID, string Name, string Detail, double Price,string Date,string IT_TAG_Code)
        {
            
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_IT_TAG_Accessory", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Name", Name);
            cmd.Parameters.AddWithValue("Detail", Detail);
            cmd.Parameters.AddWithValue("Price", Price);
            cmd.Parameters.AddWithValue("Date", Date);
            cmd.Parameters.AddWithValue("ITTAGCode", IT_TAG_Code);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public List<ArrayList> TB_IT_TAG_Accessory(string ITTAG)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP (1000) [ID],[Name],[Detail], CAST(Price AS DECIMAL(18,2)) as 'Price' ,[Date],[IT_TAG_Code],[Create_Date],[Create_By],[Update_Date],[Update_By] FROM [dbo].[TB_IT_TAG_Accessory]";
                sql += " WHERE IT_TAG_Code = '"+ ITTAG + "'";
                sql += "order by [Name]";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> VW_Vendor_All(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP (1000) [site_ref],[vend_num],[name] FROM  [dbo].[VW_Vendor_All]  ";
                if(search != "")
                {
                    sql += " WHERE [vend_num] like '%" + search + "%' OR [name] like '%"+ search + "%' " ;
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public string SP_IT_TAG_MA(int ID, string IT_TAG_Code, string Vendor_Num,string Vendor_Site_ref, string PO_Case_Number, string Repair_Date, string Commit_Date
            , string Return_Date, double Price, string Detail, string Status)
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_IT_TAG_MA", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("IT_TAG_Code", IT_TAG_Code);
            cmd.Parameters.AddWithValue("Vendor_Num", Vendor_Num);
            cmd.Parameters.AddWithValue("Vendor_Site_ref", Vendor_Site_ref);
            cmd.Parameters.AddWithValue("PO_Case_Number", PO_Case_Number);
            cmd.Parameters.AddWithValue("Repair_Date", Repair_Date);
            cmd.Parameters.AddWithValue("Commit_Date", Commit_Date);
            cmd.Parameters.AddWithValue("Return_Date", Return_Date);
            cmd.Parameters.AddWithValue("Price", Price);
            cmd.Parameters.AddWithValue("Detail", Detail);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());
            //cmd.Parameters.AddWithValue("Msg", "");
            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["Msg"].ToString();
                returnData = rs["ID"].ToString();
            }
            con.Close();
            return returnData;
        }
        public List<ArrayList> GET_TB_IT_TAG_MA(string IITAG)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP (1000) [ID],[IT_TAG_Code],[Vendor_Num],[PO_Case_Number],[Repair_Date],[Commit_Date],[Return_Date],[Price],[Detail],[Status],[Vendor_Site_ref],[site_ref],[name] FROM [dbo].[VW_IT_TAG_MA]  ";
                if (IITAG != "")
                {
                    sql += " WHERE [IT_TAG_Code] =  '" + IITAG + "' ";
                }
                sql += " Order by [Status] ";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public string SP_IT_TAG_MA_IMG(int ID, int MA_ID, string Path, string Detail)
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_IT_TAG_MA_IMG", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("MA_ID", MA_ID);
            cmd.Parameters.AddWithValue("Path", Path);
            cmd.Parameters.AddWithValue("Detail", Detail);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());
            //cmd.Parameters.AddWithValue("Msg", "");
            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["Msg"].ToString();
                returnData = rs["ID"].ToString();
            }
            con.Close();
            return returnData;
        }

        public List<ArrayList> GET_TB_IT_TAG_MA_Img(string MA_ID)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP (1000) [ID],[MA_ID],[Path],[Detail] FROM  [dbo].[TB_IT_TAG_MA_Img] ";
                if (MA_ID != "")
                {
                    sql += " WHERE [MA_ID] =  '" + MA_ID + "' ";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public string SP_IT_TAG_Peripheral(int ID, string IT_TAG_Code_Main, string IT_TAG_Code_Sub)
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_IT_TAG_Peripheral", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("IT_TAG_Code_Main", IT_TAG_Code_Main);
            cmd.Parameters.AddWithValue("IT_TAG_Code_Sub", IT_TAG_Code_Sub);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());
            //cmd.Parameters.AddWithValue("Msg", "");
            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["Msg"].ToString();
                returnData = rs["ID"].ToString();
            }
            con.Close();
            return returnData;
        }

        public List<ArrayList> VW_IT_TAG_Peripheral(string ITTAG)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP (100) [ID],[IT_TAG_Code_Main],[IT_TAG_Code_Sub],[TagGroup]" +
                    ",[TagGroupName],[TypeName],[MainType],[Owner],[Detail] FROM [dbo].[VW_IT_TAG_Peripheral]";
                if (ITTAG != "")
                {
                    sql += " WHERE [IT_TAG_Code_Main] =  '" + ITTAG + "' ";
                }
                sql += "Order by [IT_TAG_Code_Sub]";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> Get_Jobs_Title(string search,string site)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHrPotal))
            {
                string sql = "SELECT TOP (1000) [site_ref] ,[job_id],[stat],[uf_jobTitleEn],[Uf_JobTitle] FROM [dbo].[VW_Position_AllSite]";
                sql += " WHERE [site_ref] ='"+ site + "'";
                if (search != "")
                {
                    sql += " AND ( [job_id] like  '%" + search + "%' OR [Uf_JobTitle] like  '%" + search + "%' )";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> SD_Get_Jobs_Title(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHrPotal))
            {
                string sql = "SELECT TOP (1000) [job_id],[stat],[uf_jobTitleEn],[Uf_JobTitle] FROM [dbo].[VW_Position_AllSite]";
                
                if (search != "")
                {
                    sql += " WHERE [job_id] like  '%" + search + "%' OR [Uf_JobTitle] like  '%" + search + "%'  ";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> Get_JD_BrowseJobs_Title(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHrPotal))
            {
                string sql = "SELECT DISTINCT [job_id],[stat],[uf_jobTitleEn],[Uf_JobTitle] FROM [dbo].[VW_Position_AllSite]";
               
                if (search != "")
                {
                    sql += " WHERE  [job_id] like  '%" + search + "%' OR [Uf_JobTitle] like  '%" + search + "%' ";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> Get_Site_Ref(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHrPotal))
            {
                string sql = "SELECT [Site_Ref],[Site_Name_EN],[Site_Name_TH] FROM  [dbo].[VW_Company]";
                if (search != "")
                {
                    sql += " WHERE [Site_Ref] like  '%" + search + "%' OR [Site_Name_TH] like  '%" + search + "%'  OR [Site_Name_EN] like  '%" + search + "%' ";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> Report_search_site_ref()
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHrPotal))
            {
                string sql = "SELECT [Site_Ref],[Site_Name_EN],[Site_Name_TH] FROM  [dbo].[VW_Company]";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> Get_BUGroup(string search,string site_ref)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHrPotal))
            {
                string sql = "SELECT [site_ref],[Uf_Group],[GroupDesc] FROM  [dbo].[VW_BuGroup_AllSite]";
                sql += "WHERE [site_ref] = '" + site_ref + "'";
                if (search != "")
                {
                    sql += "AND  ([site_ref] like  '%" + search + "%' OR [Uf_Group] like  '%" + search + "%' )";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> SD_search_BUGroup()
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHrPotal))
            {
                string sql = "SELECT DISTINCT [Uf_Group],[GroupDesc] FROM  [dbo].[VW_BuGroup_AllSite]";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> Get_JD_BrowseSearchBUGroup(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHrPotal))
            {
                string sql = "SELECT DISTINCT [Uf_Group],[GroupDesc] FROM  [dbo].[VW_BuGroup_AllSite] ";
                if (search != "")
                {
                    sql += "WHERE  [Uf_Group] like  '%" + search + "%' OR [GroupDesc] like  '%" + search + "%' ";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> Get_Level(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHrPotal))
            {
                string sql = "SELECT  [Level] FROM  [dbo].[VW_EmployeeLevel]";
                if (search != "")
                {
                    sql += " WHERE [Level] like  '%" + search + "%' ";
                }

                sql += " Order by Level";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public string SP_IT_TAG_Software_JD(string JD_Code, string Main_Company, string BU_Group, string Level, string Job_Title, string Job_Desc, string Software_Group, string Status, string Action)
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_IT_TAG_Software_JD", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("JD_Code", JD_Code);
            cmd.Parameters.AddWithValue("Main_Company", Main_Company);
            cmd.Parameters.AddWithValue("BU_Group", BU_Group);
            cmd.Parameters.AddWithValue("Level", Level);
            cmd.Parameters.AddWithValue("Job_Title", Job_Title);
            cmd.Parameters.AddWithValue("Job_Desc", Job_Desc);
            cmd.Parameters.AddWithValue("Software_Group", Software_Group);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());
            cmd.Parameters.AddWithValue("Action", Action);
            //cmd.Parameters.AddWithValue("Msg", "");
            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["Msg"].ToString();
                returnData = rs["JD_Code"].ToString();
            }
            con.Close();
            return returnData;
        }
        public List<ArrayList> GET_JD_Master(string SiteRef, string BUGroup, string JD_Code, string  Level, string  Type_Name, string  Job_Title, string  TagGroup, string  Status)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT DISTINCT TOP (1000) [JD_Code],[Main_Company],[BU_Group],[Level],[Job_Title],[Uf_JobTitle],[Job_Desc],[Software_Group]" +
                    ",[Status] FROM  [VW_IT_TAG_Software_Group_JD_Search]";
                if (SiteRef != "" ||  BUGroup != "" || JD_Code != "" || Level != "" || Type_Name != "" || Job_Title != "" || TagGroup != "" || Status !="")
                {
                    sql += "   WHERE [Main_Company] like '%"+ SiteRef + "%'" +
                        " AND [BU_Group] like '%"+ BUGroup + "%'" +
                        " AND [JD_Code] like '%" + JD_Code + "%'" +
                        " AND [Level] like '%" + Level + "%'" +
                        //" AND [TypeName] like '%"+ Type_Name + "%'" +
                        " AND [Job_Title] like '%" + Job_Title + "%'" +
                        //" AND [Tag_Group] like '%"+ TagGroup + "%'" +
                        " AND [Status] like '%" + Status + "%'"; 
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i<reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                                GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> VW_IT_TAG_PE_Software_JD(string JD_Code,string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP (1000) [IT_Tag_Code],[JD_Code],[Tag_Group],[Start_Contract_date],[Expire_Contract_date],[MainType],[TypeName],[TagGroup],[TagGroupName],[Tag_Group_Status],[Used],[Volume] FROM [IT_Portal].[dbo].[VW_IT_TAG_PE_Software_JD]";

                sql += "  WHERE [JD_Code] = '" + JD_Code + "'";
                if (search != "")
                {
                    sql += "  AND [Tag_Group] = '" + search + "'";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i<reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                                GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GET_JD_Detail(string JD_Code, string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT [ID],[JD_Code],[Tag_Group],[MainType],[TagGroupName],[TypeName] FROM  [dbo].[VW_IT_TAG_Software_Group_JD_Detail]";

                sql += "  WHERE [JD_Code] = '" + JD_Code + "'";
                if (search != "")
                {
                    sql += "  AND [Tag_Group] = '" + search + "'";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i<reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                                GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> Search_TAG_Group(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP(1000) [ID],[Owner],[MainType],[TypeName],[TagGroup],[TagGroupName],[Status],[ReportSeq] FROM [dbo].[TB_IT_TAG_Group] ";

                if (search != "" )
                {
                    sql += " WHERE [TagGroup] like '%" + search + "%' AND [TagGroupName] like '%" + search + "%' ";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> JD_Search_TAG_Group(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP(1000) [ID],[Owner],[MainType],[TypeName],[TagGroup],[TagGroupName],[Status],[ReportSeq] FROM [dbo].[TB_IT_TAG_Group] ";
                sql += "WHERE [MainType] = 'Software'";
                if (search != "" )
                {
                    sql += " AND ([TagGroup] like '%" + search + "%' OR [TagGroupName] like '%" + search + "%') ";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> JD_Homesearch_TypeName(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT DISTINCT [TypeName]   FROM [dbo].[VW_IT_TAG_Master]";
                if (search != "" )
                {
                    sql += " Where [TypeName] like '%" + search + "%'   ";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> Report_search_TypeName( )
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT DISTINCT [TypeName] FROM [dbo].[VW_IT_TAG_Group]";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> Report_search_TagGroupName()
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT DISTINCT [TagGroup],[TagGroupName] FROM [dbo].[VW_IT_TAG_Group]";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public string SP_IT_TAG_Software_JD_Detail(int ID, string JD_Code, string Tag_Group, string Action)
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_IT_TAG_Software_JD_Detail", con); 
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("JD_Code", JD_Code);
            cmd.Parameters.AddWithValue("Tag_Group", Tag_Group);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());
            cmd.Parameters.AddWithValue("Action", Action);
            //cmd.Parameters.AddWithValue("Msg", "");
            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["Msg"].ToString();
                returnData = rs["ID"].ToString();
            }
            con.Close();
            return returnData;
        }

        public List<ArrayList> GET_JD_Detail(string JDCode)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = " SELECT [ID],[JD_Code],[Tag_Group],[MainType],[TagGroupName],[TypeName] FROM  [dbo].[VW_IT_TAG_Software_Group_JD_Detail]";
                if (JDCode != "")
                {
                    sql += " WHERE [JD_Code] = '" + JDCode + "'";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> Get_User_PE(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHrPotal))
            {
                string sql = " SELECT TOP (100) [Site_Ref],[Emp_Num],[sname],[name],[dept],[Uf_Level],[Uf_Location],[Uf_PositionID],[Uf_Jobtitle],[Uf_JobTitleEN],[BUGroup],[BUGroupDesc]  FROM[dbo].[VW_Employee]  WHERE [LANGUAGE] = 'TH' ";
                if (search != "")
                {
                    sql += " AND ( [Emp_Num] like '%" + search + "%' OR [Emp_Num] like '%" + search + "%'OR [name] like '%" + search + "%' )";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> Get_JD_SWGroup(string BU_Group,string Level, string Job_Title,string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = " SELECT TOP (1000) [JD_Code],[Main_Company],[BU_Group],[Level],[Job_Title],[Job_Desc],[Software_Group],[Status]  FROM [TB_IT_TAG_Software_Group_JD]";
               
                    sql += " WHERE [BU_Group] = '"+ BU_Group + "' AND [Level] = '"+ Level + "' AND [Job_Title] ='"+ Job_Title + "' ";
                if(search != "")
                {
                    sql += " AND ([BU_Group] like '%" + search + "%' AND [Level] like '%" + search + "%' AND [Job_Title] like '%" + search + "%') ";
                }
                
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> PE_Get_JD_SWGroup(string BU_Group,string Level, string Job_Title,string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = " SELECT TOP (1000) [JD_Code],[Main_Company],[BU_Group],[Level],[Job_Title],[Job_Desc],[Software_Group],[Status]  FROM [TB_IT_TAG_Software_Group_JD]";
               
                    sql += " WHERE [BU_Group] = '"+ BU_Group + "' AND [Level] = '"+ Level + "' AND [Job_Title] ='"+ Job_Title + "' AND [Status] = 'Active' ";
                if(search != "")
                {
                    sql += " AND ([BU_Group] like '%" + search + "%' AND [Level] like '%" + search + "%' AND [Job_Title] like '%" + search + "%') ";
                }
                
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> VW_IT_TAG_PE_ALL(string EmpNum,string IT_TAG_Code)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = " SELECT TOP (1000) [ID],[IT_TAG_Code],[StartDate],[BorrowDueDate],[ReturnDate]" +
                    ",[ProjectNo],[Detail],[Status],[JD_Code],[PE_Type],[Emp_num],[MainType],[TypeName]" +
                    ",[TagGroup],[TagGroupName],[FullName],[CostCenter],[CostCenterDesc]" +
                    ",[Level],[JobTitle_ID],[JobTitle_Name],[Language],[BUGroup],[BUGroupDesc] " +
                    "FROM  [dbo].[VW_IT_TAG_PE_ALL]";
                 if(EmpNum != "")
                {
                    sql += " WHERE [Emp_num] = '" + EmpNum + "'";
                }
                if (IT_TAG_Code != "")
                {
                    sql += " WHERE [IT_TAG_Code] = '" + IT_TAG_Code + "'";
                }
                sql += " order by [ID] DESC ";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> Tranfer_VW_IT_TAG_PE_ALL(string IT_TAG_Code,string Tranfer_Type)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = " SELECT TOP (1000) [ID],[IT_TAG_Code],[StartDate],[BorrowDueDate],[ReturnDate]" +
                    ",[ProjectNo],[Detail],[Status],[JD_Code],[PE_Type],[Emp_num],[MainType],[TypeName]" +
                    ",[TagGroup],[TagGroupName],[FullName],[CostCenter],[CostCenterDesc]" +
                    ",[Level],[JobTitle_ID],[JobTitle_Name],[Language],[BUGroup],[BUGroupDesc] " +
                    "FROM  [dbo].[VW_IT_TAG_PE_ALL] WHERE  [Status] IN ('Used','Borrowed') ";

                sql += " AND  ([IT_TAG_Code] = '" + IT_TAG_Code + "') ";

                if (Tranfer_Type == "JD")
                {
                    sql += "   AND ( [PE_Type] IN ('Software_JD') )";
                }
                else if (Tranfer_Type == "Normal")
                {
                    sql += "   AND  ([PE_Type] IN ('Software','Hardware'))   ";
                }

                sql += "order by [ID] desc ";
            
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }public List<ArrayList> Tranfer_Complete_VW_IT_TAG_PE_ALL(string SQLIN)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = " SELECT TOP (1000) [ID],[IT_TAG_Code],[StartDate],[BorrowDueDate],[ReturnDate]" +
                    ",[ProjectNo],[Detail],[Status],[JD_Code],[PE_Type],[Emp_num],[MainType],[TypeName]" +
                    ",[TagGroup],[TagGroupName],[FullName],[CostCenter],[CostCenterDesc]" +
                    ",[Level],[JobTitle_ID],[JobTitle_Name],[Language],[BUGroup],[BUGroupDesc] " +
                    "FROM  [dbo].[VW_IT_TAG_PE_ALL] ";
                if (SQLIN != "")
                {
                    sql += " WHERE ID IN ("+SQLIN+")";
                }
                sql += "order by [IT_TAG_Code] ";
            
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> VW_IT_TAG_PE_Peripheral(string EmpNum)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT [ID],[IT_TAG_Code_Main],[Emp_num],[IT_TAG_Code_Sub],[MainType],[TypeName],[TagGroup],[TagGroupName],[StartDate_MainTag],[ReturnDate_MainTag] FROM [dbo].[VW_IT_TAG_PE_Peripheral]";
               
                    sql += " WHERE [Emp_num] = '" + EmpNum + "' order by [ID] DESC";
            
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public string SP_IT_TAG_PE(int ID, string IT_TAG_Code, string StartDate, string BorrowDueDate,
            string ReturnDate, string ProjectNo, string Detail, string Status,
            string JD_Code, string PE_Type, string Emp_num,string Action)
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_IT_TAG_PE", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("IT_TAG_Code", IT_TAG_Code);
            cmd.Parameters.AddWithValue("StartDate", StartDate);
            cmd.Parameters.AddWithValue("BorrowDueDate", BorrowDueDate);
            cmd.Parameters.AddWithValue("ReturnDate", ReturnDate);
            cmd.Parameters.AddWithValue("ProjectNo", ProjectNo);
            cmd.Parameters.AddWithValue("Detail", Detail);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("JD_Code", JD_Code);
            cmd.Parameters.AddWithValue("PE_Type", PE_Type);
            cmd.Parameters.AddWithValue("Emp_num", Emp_num);
            cmd.Parameters.AddWithValue("Action", Action);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());
            //cmd.Parameters.AddWithValue("Msg", "");
            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["Msg"].ToString();
                returnData = rs["ID"].ToString();
            }
            con.Close();
            return returnData;
        }
        public List<ArrayList> VW_IT_TAG_Monitoring_ExpireTag(string DayStart, string DayEnd)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP (200) [IT_Tag_Code],[Tag_Group],[Purchase_Type],[Start_Contract_date],[Expire_Contract_date],[MainType],[TypeName],[TagGroupName],[Tag_Group_Status],[Month],[Month_Name] FROM [dbo].[VW_IT_TAG_Monitoring_ExpireTag]";

                if(DayStart != "" && DayEnd != "")
                {
                    sql += "   Where [Expire_Contract_date] between convert(datetime, '" + DayStart + "', 105) AND convert(datetime, '" + DayEnd + "', 105)";
                }
                sql += " order by [Expire_Contract_date] ";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> VW_IT_TAG_Monitoring_Commit_MA(string DayStart, string DayEnd)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP (200) [ID],[IT_TAG_Code],[site_ref],[Vendor_Num],[Vendor_Site_ref],[Vendor_Name],[PO_Case_Number],[Repair_Date],[Commit_Date]" +
                    ",[Return_Date],[Price],[Detail],[Status],[Purchase_Type],[Tag_Group],[TagGroupName],[MainType],[Days],[Month_Name]" +
                    "FROM [dbo].[VW_IT_TAG_Monitoring_Commit_MA] ";
                sql += " WHERE [Status] = 'Repairing' ";

                if (DayStart != "" && DayEnd != "")
                {
                    sql += "   AND [Commit_Date] between convert(datetime, '" + DayStart + "', 105) AND convert(datetime, '" + DayEnd + "', 105)";
                }

                sql += " order by [Commit_Date] ";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> VW_IT_TAG_Monitoring_Borrow(string DayStart, string DayEnd)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP (200) [ID],[IT_TAG_Code],[StartDate],[BorrowDueDate],[Detail],[Status],[Emp_num]" +
                    ",[ProjectNo],[MainType],[TypeName],[TagGroup],[TagGroupName],[FullName],[CostCenter],[CostCenterDesc]" +
                    ",[Level],[JobTitle_ID],[JobTitle_Name],[Days],[Month_Name]" +
                    "FROM[IT_Portal].[dbo].[VW_IT_TAG_Monitoring_Borrow] ";

                if(DayStart != "" && DayEnd != "")
                {
                    sql += "   Where [BorrowDueDate] between convert(datetime, '" + DayStart + "', 105) AND convert(datetime, '" + DayEnd + "', 105)";
                }

                sql += " order by [BorrowDueDate] ";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> VW_IT_TAG_Monitoring_NewJD()
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conITPortal))
            {
                string sql = "SELECT TOP (1000) [JD_Code],[Emp_num],[name],[dept],[BUGroup],[Uf_Level],[JD_Code_Old],[Level_Old]" +
                    ",[BU_Group_Old],[Job_Desc_Old],[Job_Title_Old],[JD_Code_New],[Level_New]" +
                    ",[BU_Group_New],[Job_Desc_New],[Job_Title_New] FROM[dbo].[VW_IT_TAG_Monitoring_NewJD] ";
                
                sql += " order by [JD_Code] ";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public string SP_IT_TAG_PE_Transfer_Multi(int ID, string IT_TAG_Code_Old,string IT_TAG_Code_New, string StartDate,string Action)
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_IT_TAG_PE_Transfer_Multi", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("IT_TAG_Code_Old", IT_TAG_Code_Old);
            cmd.Parameters.AddWithValue("IT_TAG_Code_New", IT_TAG_Code_New);
            cmd.Parameters.AddWithValue("StartDate", StartDate);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());
            cmd.Parameters.AddWithValue("Action", Action);
            //cmd.Parameters.AddWithValue("Msg", "");
            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["Msg"].ToString();
                returnData = rs["ID"].ToString();
            }
            con.Close();
            return returnData;
        }
        public string SP_IT_TAG_Log_Transfer(int ID, string IT_TAG_Code_Old,string IT_TAG_Code_New, string StartDate)
        {
            SqlConnection con = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand("SP_IT_TAG_Log_Transfer", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("IT_TAG_Code_Old", IT_TAG_Code_Old);
            cmd.Parameters.AddWithValue("IT_TAG_Code_New", IT_TAG_Code_New);
            cmd.Parameters.AddWithValue("StartDate", StartDate);
            cmd.Parameters.AddWithValue("UserBy", GetUser());
            //cmd.Parameters.AddWithValue("Msg", "");
            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["Msg"].ToString();
                returnData = rs["ID"].ToString();
            }
            con.Close();
            return returnData;
        }
        public List<ArrayList> PermissionGetUsername(string search)
        {
            List<ArrayList> GetPermission = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHrPotal))
            {
                string sql = "SELECT TOP (1000) [Emp_Num],[name],[dept],[Uf_Level],[Uf_UserAD] FROM  [dbo].[VW_Employee] WHERE[Language] = 'TH' AND[Emp_Status] = 'Active' AND [Uf_UserAD] IS NOT NULL";
                if (search != "")
                {
                    sql += " AND ([name] like '" + search + "%' OR [Emp_Num] like '" + search + "%')";
                }
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPermission.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPermission;
        }
        public List<ArrayList> VW_Proj_projum_projdesc_AllSite(string search)
        {
            List<ArrayList> GetPermission = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conSC_Portal))
            {
                string sql = "SELECT TOP (1000) [proj_num],[proj_desc] FROM [dbo].[VW_Proj_projum_projdesc_AllSite] ";
                if (search != "")
                {
                    sql += " WHERE [proj_num] like '" + search + "%' ";
                }
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPermission.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPermission;
        }
        public List<ArrayList> VW_HR_List_Company(string search)
        {
            List<ArrayList> Company = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHrPotal))
            {
                string sql = " SELECT [Costcenter],[CostcenterDesc],[Divition],[BU_Group],[BU_GroupDesc] FROM [HRPortal].[dbo].[VW_Dept_AllSite] where ";

                if (search != "") { search = '%' + search + '%'; sql += "( [Costcenter] LIKE '" + search + "' or [CostcenterDesc] LIKE '" + search + "' or [BU_GroupDesc] LIKE '" + search + "') AND"; }
                sql += " [BU_GroupDesc] IS NOT NULL ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            Company.Add(detail);
                        }
                    }
                }
            }
            return Company;
        }
        public List<ArrayList> VW_Location(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conSC_Portal))
            {
                string sql = "SELECT TOP (1000) [Location],[Description] FROM  [dbo].[VW_Location]";
                if (search != "")
                {
                    sql += " WHERE [Location] like  '%" + search + "%' OR [Description] like  '%" + search + "%'  ";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }



        public DataTable SP_Rpt_ITMaintenance(string Owner,string  AssetCompany,string  MainType
            ,string  TypeName,string  TagGroup,string  PurchaseType,string VendorMA, string  StatusTag
            ,string  sRepairDate,string  eRepairDate,string  sCommitDate,string  eCommitDate
            ,string  sReturnDate,string  eReturnDate ,string  StatusRepair)
        {
            string sql = " EXEC SP_Rpt_ITMaintenance '" + Owner + "' ,'" + AssetCompany + "' ,'" + MainType + "' " +
                ",'" + TypeName + "' ,'" + TagGroup + "' ,'" + PurchaseType + "' ,'" + StatusTag + "' " +
                ",'" + VendorMA + "' "+ ",'" + sRepairDate + "' ,'" + eRepairDate + "' " +
                ",'" + sCommitDate + "' ,'" + eCommitDate + "' ,'" + sReturnDate + "' ,'" + eReturnDate + "' " +
                ",'" + StatusRepair + "'";

            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conITPortal);
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();
            return DT;
        }

        public DataTable Export_Step4_1(string sql,string siteRef)
        {
            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(SeletSite_ref(siteRef));
            //SqlConnection connection = new SqlConnection(conPKS);
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();
            return DT;
        }

        public void DeleteSaleForce_Temp( string site_ref)
        {

                using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
                {
                    string sql = "DELETE FROM [dbo].[TB_SF_Customer_infor]";
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.CommandTimeout = 300;
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            
        }

        public void CrateSaleForce_Temp(List<ArrayList> Array_value, string site_ref)
        {

            foreach (ArrayList ch in Array_value)
            {
                using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
                //using (SqlConnection conn = new SqlConnection(conCRP2_PKS))
                {
                    string sql = "INSERT INTO [dbo].[TB_SF_Customer_infor] ([SalesforceID],[Customer_Num]) VALUES('" + ch[0] + "','" + ch[1] + "')";
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.CommandTimeout = 300;
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            //Insert Table Temp
        }


        public string GetConfName(string SiteRef)
        {
            string sql;
            sql = "SELECT ConfName FROM [PATKOL_K2APP_DATA].[dbo].SiteDatabase WHERE SiteRef ='" + SiteRef + "'";
            SqlConnection con = new SqlConnection(conPKS);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ConfName"].ToString();
            }
            con.Close();

            return returnData;
        }


    }
}
