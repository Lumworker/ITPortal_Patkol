using MobileTask.AppCode;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITPortal
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<ArrayList> GetK2(string Search)
        {
            return new ClassBrowseNew().GetK2(Search);
        }

        [WebMethod]
        public static List<ArrayList> GetProcessData(string K2ID, string K2ver)
        {
            return new ClassBrowseNew().GetProcessData(K2ID, K2ver);
        }

        [WebMethod]
        public static void SP_ProcessData_Update(int ProcInstID, int ID, string Value, string K2ver)
        {
            new ClassBrowseNew().SP_ProcessData_Update(ProcInstID, ID, Value, K2ver);
        }
        [WebMethod]
        public static List<ArrayList> GetSite_ref()
        {
            return new ClassBrowseNew().GetSite_ref();
        }
        [WebMethod]
        public static List<ArrayList> GetLevel()
        {
            return new ClassBrowseNew().GetLevel();
        }
        [WebMethod]
        public static List<ArrayList> GetCostcenter()
        {
            return new ClassBrowseNew().GetCostcenter();
        }
        [WebMethod]
        public static List<ArrayList> GetIT_TAG(string site_ref, string IT_TAG_CODE, string IT_TAG_BAND, string EmpNum)
        {
            return new ClassBrowseNew().GetIT_TAG(site_ref, IT_TAG_CODE, IT_TAG_BAND, EmpNum);
        }
        [WebMethod]
        public static List<ArrayList> GetIT_TAG_New(string Asset_of_Company, string TagGroupName, string TAG_Status, string Maintype, string ITTAG, string TypeName)
        {
            return new ClassBrowseNew().GetIT_TAG_New(Asset_of_Company, TagGroupName, TAG_Status, Maintype, ITTAG, TypeName);
        }
        [WebMethod]
        public static List<ArrayList> GetIT_TAG_New_SearchBrowse(string search)
        {
            return new ClassBrowseNew().GetIT_TAG_New_SearchBrowse( search);
        }
        //[WebMethod]
        //public static List<ArrayList> VW_PMOnline_IT_TAG_Assign_Report(string site_ref, string IT_TAG, string EmpNum, string IT_TAG_GROUP)
        //{
        //    return new ClassBrowseNew().VW_PMOnline_IT_TAG_Assign_Report(site_ref, IT_TAG, EmpNum, IT_TAG_GROUP);
        //}
        [WebMethod]
        public static List<ArrayList> VW_PMOnline_IT_TAG_Assign_Report_V2( string IT_TAG, string IT_TAG_GROUP, string Status, string EmpNum)
        {
            return new ClassBrowseNew().VW_PMOnline_IT_TAG_Assign_Report_V2( IT_TAG, IT_TAG_GROUP,Status, EmpNum );
        }
        [WebMethod]
        public static List<ArrayList> SetPositionPage(string Position)
        {
            return new ClassBrowseNew().SetPositionPage(Position);
        }
        //[WebMethod]
        //public static List<ArrayList> GetIT_TAG_Assign(string Group)
        //{
        //    return new ClassBrowseNew().GetIT_TAG_Assign(Group);
        //}
        [WebMethod]
        public static List<ArrayList> GetIT_TAG_Assign_New(string Group)
        {
            return new ClassBrowseNew().GetIT_TAG_Assign_New(Group);
        }
        [WebMethod]
        public static List<ArrayList> GetIT_TAG_Group(string search)
        {
            return new ClassBrowseNew().GetIT_TAG_Group(search);
        }
        [WebMethod]
        public static List<ArrayList> GetIT_TAG_Group_New(string search)
        {
            return new ClassBrowseNew().GetIT_TAG_Group_New(search);
        }
        [WebMethod]
        public static List<ArrayList> GetIT_TAG_Group_New_PMoneline(string search)
        {
            return new ClassBrowseNew().GetIT_TAG_Group_New_PMoneline(search);
        }
        [WebMethod]
        public static List<ArrayList> GetFillterCharge_IT_TAG_Group_New(string search)
        {
            return new ClassBrowseNew().GetFillterCharge_IT_TAG_Group_New(search);
        }
        [WebMethod]
        public static List<ArrayList> GetCheckList_Type()
        {
            return new ClassBrowseNew().GetCheckList_Type();
        }
        [WebMethod]
        public static List<ArrayList> GetCheckList_Group(string Type_id)
        {
            return new ClassBrowseNew().GetCheckList_Group(Type_id);
        }
        [WebMethod]
        public static List<ArrayList> HR_Employee(string search)
        {
            return new ClassBrowseNew().HR_Employee(search);
        }
        [WebMethod]
        public static List<ArrayList> GetCheckList_Detail(string Type_id)
        {
            return new ClassBrowseNew().GetCheckList_Detail(Type_id);
        }
        [WebMethod]
        public static List<ArrayList> VW_PMOnline_IT_TAG(string site_ref, string IT_TAG_CODE, string Fullname)
        {
            return new ClassBrowseNew().VW_PMOnline_IT_TAG(site_ref, IT_TAG_CODE, Fullname);
        }

        [WebMethod]
        public static List<ArrayList> GetPermission()
        {
            return new ClassBrowseNew().GetPermission();
        }

        [WebMethod]
        public static List<ArrayList> GetVW_IT_TAG_Permission(string Portal, string Empnum, string Page, string Permission)
        {
            return new ClassBrowseNew().GetVW_IT_TAG_Permission(Portal, Empnum, Page, Permission);
        }
        [WebMethod]
        public static List<ArrayList> CheckPermission(string Portal,string Page)
        {
            return new ClassBrowseNew().CheckPermission(Portal, Page);
        }

        [WebMethod]
        public static List<ArrayList> SP_Report_Permission_Browse(string RefType, string Search, string SiteRef, string Status)
        {
            return new ClassBrowseNew().SP_Report_Permission_Browse(RefType, Search, SiteRef, Status);
        }
        [WebMethod]
        public static List<ArrayList> GetReport_Permission(string SiteRef, string RefType, string RufNum, string Username, string AutType)
        {
            return new ClassBrowseNew().GetReport_Permission(SiteRef, RefType, RufNum, Username, AutType);
        }
        [WebMethod]
        public static String SP_Report_Permission_Save(int ID, string RefType, string RufNum, string Username, string site_ref, string AuthenType, string EndDate, string EffectDate, string Reference)
        {
            return new ClassBrowseNew().SP_Report_Permission_Save(ID, RefType, RufNum, Username, site_ref, AuthenType, EndDate, EffectDate, Reference);
        }
        [WebMethod]
        public static List<ArrayList> VW_Ctr_Permission(string Username, string SiteRef, string search)
        {
            return new ClassBrowseNew().VW_Ctr_Permission(Username, SiteRef, search);
        }
        [WebMethod]
        public static List<ArrayList> VW_Ctr_PermissionProjPortal(string Username, string SiteRef, string search)
        {
            return new ClassBrowseNew().VW_Ctr_PermissionProjPortal(Username, SiteRef, search);
        }
        [WebMethod]
        public static List<ArrayList> VW_Ctr_Permission_Rpt_User(string Username, string SiteRef)
        {
            return new ClassBrowseNew().VW_Ctr_Permission_Rpt_User(Username, SiteRef);
        }
        [WebMethod]
        public static List<ArrayList> TB_WorkflowType(string Search)
        {
            return new ClassBrowseNew().TB_WorkflowType(Search);
        }
        [WebMethod]
        public static string CheckWFType(string Workflow_Type, string Table_Name, string SelectType)
        {
            return new ClassBrowseNew().CheckWFType(Workflow_Type, Table_Name, SelectType);
        }
        [WebMethod]
        public static void SP_ColumnName_Insert(string Workflow_Type, string Table_Name, string SelectType)
        {
            new ClassBrowseNew().SP_ColumnName_Insert(Workflow_Type, Table_Name, SelectType);
        }
        [WebMethod]
        public static List<ArrayList> SearchWFType(string Workflow_Type, string Table_Name, string SelectType)
        {
            return new ClassBrowseNew().SearchWFType(Workflow_Type, Table_Name, SelectType);
        }
        [WebMethod]
        public static void SP_ColumnName_Update(string id, string column, string value)
        {
            new ClassBrowseNew().SP_ColumnName_Update(id, column, value);
        }

        [WebMethod]
        public static void SP_TBK2TableName_insert(string WFType, string TB_Name, string SP_Name, string Typeflow)
        {
            new ClassBrowseNew().SP_TBK2TableName_insert(WFType, TB_Name, SP_Name, Typeflow);
        }

        [WebMethod]
        public static void SP_Salesforce_ImportIcash(string site_ref)
        {
            new ClassBrowseNew().SP_Salesforce_ImportIcash(site_ref);
        }

        [WebMethod]
        public static void SP_Salesforce_BackUpIcash(string site_ref)
        {
            new ClassBrowseNew().SP_Salesforce_BackUpIcash(site_ref);
        }

        [WebMethod]
        public static void SP_TB_OT_Salesforce_Process(string site_ref)
        {
            new ClassBrowseNew().SP_TB_OT_Salesforce_Process(site_ref);
        }

        [WebMethod]
        public static void SP_PMOnline_CheckList_Type(string id, string name)
        {
            new ClassBrowseNew().SP_PMOnline_CheckList_Type(id, name);
        }

        [WebMethod]
        public static void SP_PMOnline_CheckList_Group(string ID, string Type_ID, string IT_TAG_Group)
        {
            new ClassBrowseNew().SP_PMOnline_CheckList_Group(ID, Type_ID, IT_TAG_Group);
        }
        [WebMethod]
        public static void SP_PMOnline_CheckList_Detail(string ID, string Type_ID, string Level,string Name,string Status)
        {
            new ClassBrowseNew().SP_PMOnline_CheckList_Detail(ID, Type_ID, Level, Name, Status);
        }
        [WebMethod]
        public static void SP_PMOnline_Assign_Insert(string IT_TAG, string IT_TAG_GROUP, string site_ref)
        {
            new ClassBrowseNew().SP_PMOnline_Assign_Insert(IT_TAG, IT_TAG_GROUP, site_ref);
        }
        
        [WebMethod]
        public static void SP_PMOnline_Permission(int ID, string Position, string Emp_Num, string Type)
        {
            new ClassBrowseNew().SP_PMOnline_Permission( ID,  Position, Emp_Num,  Type);
        }
        [WebMethod]
        public static void SP_PMOnline_sync_CheckList()
        {
            new ClassBrowseNew().SP_PMOnline_sync_CheckList();
        }
        [WebMethod]
        public static List<ArrayList> TB_IT_TAG_Group(string Owner, string MainType, string TypeName, string Status)
        {
            return new ClassBrowseNew().TB_IT_TAG_Group(Owner, MainType, TypeName, Status);
        }
        [WebMethod]
        public static List<ArrayList> VW_IT_TAG_Group( string MainType, string TypeName, string Status)
        {
            return new ClassBrowseNew().VW_IT_TAG_Group( MainType, TypeName, Status);
        }
        [WebMethod]
        public static List<ArrayList> Browse_Generate_IT_TAG_Group(string search)
        {
            return new ClassBrowseNew().Browse_Generate_IT_TAG_Group(search);
        }
        [WebMethod]
        public static string SP_IT_TAG_Group(int ID, string MainType, string TypeName, string TagGroup, string TagGroupName, string Status, int ReportSeq)
        {
            return new ClassBrowseNew().SP_IT_TAG_Group(ID,  MainType, TypeName, TagGroup, TagGroupName, Status, ReportSeq);
        }
        [WebMethod]
        public static List<ArrayList> GetSite_HRPortal()
        {
            return new ClassBrowseNew().GetSite_HRPortal();
        }
        [WebMethod]
        public static List<ArrayList> GetLocation()
        {
            return new ClassBrowseNew().GetLocation();
        }
        [WebMethod]
        public static List<ArrayList> GetIT_TAG_Charge()
        {
            return new ClassBrowseNew().GetIT_TAG_Charge();
        }
        [WebMethod]
        public static void SP_IT_TAG_Charge(int ID, string Tag_Group, int Charge1, int Charge2, int Charge3)
        {
            new ClassBrowseNew().SP_IT_TAG_Charge(ID, Tag_Group, Charge1, Charge2, Charge3);
        }
        [WebMethod]
        public static string SP_IT_TAG_Master(string IT_Tag_Code, string Tag_Group, string Purchase_Type, string Start_Contract_date, string Expire_Contract_date
            , string Detail, string Brand, string Model,int Volume, string Status, string SN, string Product_Key
            , string PONumber, double UnitPrice, string Vendor, string Asset_of_Company, string Asset_No, string Asset_Date
            , string Processor, string CPU_Clock, string RAM, string HDD, string Owner
            , string Inactive_Reason, string Detail_Reason, string Inactive_Date, string Stauts)
        {
            return new ClassBrowseNew().SP_IT_TAG_Master(IT_Tag_Code, Tag_Group, Purchase_Type, Start_Contract_date, Expire_Contract_date, Detail, Brand, Model, Volume, Status,
            SN, Product_Key, PONumber, UnitPrice, Vendor, Asset_of_Company, Asset_No, Asset_Date, Processor, CPU_Clock, RAM, HDD, Owner
            , Inactive_Reason, Detail_Reason, Inactive_Date, Stauts);
        }
        [WebMethod]
        public static List<ArrayList> VW_IT_TAG_Master(string ITTAG)
        {
            return new ClassBrowseNew().VW_IT_TAG_Master(ITTAG);
        }
        [WebMethod]
        public static List<ArrayList> VW_PO_AllSite(string search)
        {
            return new ClassBrowseNew().VW_PO_AllSite(search);
        }
        [WebMethod]
        public static void SP_IT_TAG_Accessory(int ID, string Name, string Detail, double Price, string Date, string IT_TAG_Code)
        {
            new ClassBrowseNew().SP_IT_TAG_Accessory(ID, Name, Detail, Price, Date, IT_TAG_Code);
        }
        [WebMethod]
        public static List<ArrayList> TB_IT_TAG_Accessory(string ITTAG)
        {
            return new ClassBrowseNew().TB_IT_TAG_Accessory(ITTAG);
        }
        [WebMethod]
        public static List<ArrayList> VW_Vendor_All(string search)
        {
            return new ClassBrowseNew().VW_Vendor_All(search);
        }
        [WebMethod]
        public static string SP_IT_TAG_MA(int ID, string IT_TAG_Code, string Vendor_Num,string Vendor_Site_ref, string PO_Case_Number, string Repair_Date, string Commit_Date
            , string Return_Date, double Price, string Detail, string Status)
        {
            return new ClassBrowseNew().SP_IT_TAG_MA( ID,  IT_TAG_Code,  Vendor_Num, Vendor_Site_ref,  PO_Case_Number, Repair_Date,  Commit_Date,  Return_Date,  Price,  Detail,  Status);
        }
        [WebMethod]
        public static List<ArrayList> GET_TB_IT_TAG_MA(string ITTAG)
        {
            return new ClassBrowseNew().GET_TB_IT_TAG_MA(ITTAG);
        }
        [WebMethod]
        public static string SP_IT_TAG_MA_IMG(int ID, int MA_ID, string Path, string Detail)
        {
            return new ClassBrowseNew().SP_IT_TAG_MA_IMG(ID, MA_ID, Path, Detail);
        }

        [WebMethod]
        public static List<ArrayList> GET_TB_IT_TAG_MA_Img(string MA_ID)
        {
            return new ClassBrowseNew().GET_TB_IT_TAG_MA_Img(MA_ID);
        }
        [WebMethod]
        public static string SP_IT_TAG_Peripheral(int ID, string IT_TAG_Code_Main, string IT_TAG_Code_Sub)
        {
            return new ClassBrowseNew().SP_IT_TAG_Peripheral(ID, IT_TAG_Code_Main, IT_TAG_Code_Sub);
        }
        [WebMethod]
        public static List<ArrayList> VW_IT_TAG_Peripheral(string ITTAG)
        {
            return new ClassBrowseNew().VW_IT_TAG_Peripheral(ITTAG);
        }
        [WebMethod]
        public static List<ArrayList> Get_Jobs_Title(string search,string site)
        {
            return new ClassBrowseNew().Get_Jobs_Title(search, site);
        }
        [WebMethod]
        public static List<ArrayList> SD_Get_Jobs_Title(string search)
        {
            return new ClassBrowseNew().SD_Get_Jobs_Title(search);
        }
        [WebMethod]
        public static List<ArrayList> Get_Site_Ref(string search)
        {
            return new ClassBrowseNew().Get_Site_Ref(search);
        }
        [WebMethod]
        public static List<ArrayList> Get_BUGroup(string search,string site_ref)
        {
            return new ClassBrowseNew().Get_BUGroup(search, site_ref);
        }
        [WebMethod]
        public static List<ArrayList> Get_JD_BrowseSearchBUGroup(string search)
        {
            return new ClassBrowseNew().Get_JD_BrowseSearchBUGroup(search);
        }
        [WebMethod]
        public static List<ArrayList> Get_JD_BrowseJobs_Title(string search)
        {
            return new ClassBrowseNew().Get_JD_BrowseJobs_Title(search);
        }
        [WebMethod]
        public static List<ArrayList> Get_Level(string search)
        {
            return new ClassBrowseNew().Get_Level(search);
        }
        [WebMethod]
        public static string SP_IT_TAG_Software_JD(string JD_Code, string Main_Company, string BU_Group, string Level, string Job_Title, string Job_Desc, string Software_Group, string Status,string Action)
        {
            return new ClassBrowseNew().SP_IT_TAG_Software_JD(JD_Code, Main_Company, BU_Group, Level, Job_Title, Job_Desc, Software_Group, Status, Action);
        }
        [WebMethod]
        public static List<ArrayList> GET_JD_Master(string SiteRef, string BUGroup, string JD_Code, string Level, string Type_Name, string Job_Title, string TagGroup, string Status)
        {
            return new ClassBrowseNew().GET_JD_Master(SiteRef,  BUGroup,  JD_Code,   Level,   Type_Name,   Job_Title,   TagGroup,   Status);
        }
        [WebMethod]
        public static List<ArrayList> Search_TAG_Group(string search)
        {
            return new ClassBrowseNew().Search_TAG_Group(search);
        }
        [WebMethod]
        public static List<ArrayList> JD_Search_TAG_Group(string search)
        {
            return new ClassBrowseNew().JD_Search_TAG_Group(search);
        }
        [WebMethod]
        public static List<ArrayList> JD_Homesearch_TypeName(string search)
        {
            return new ClassBrowseNew().JD_Homesearch_TypeName(search);
        }
        [WebMethod]
        public static List<ArrayList> Report_search_TypeName()
        {
            return new ClassBrowseNew().Report_search_TypeName();
        }
        [WebMethod]
        public static List<ArrayList> Report_search_site_ref()
        {
            return new ClassBrowseNew().Report_search_site_ref();
        }
        [WebMethod]
        public static List<ArrayList> Report_search_TagGroupName()
        {
            return new ClassBrowseNew().Report_search_TagGroupName();
        }
        [WebMethod]
        public static List<ArrayList> SD_search_BUGroup()
        {
            return new ClassBrowseNew().SD_search_BUGroup();
        }
        [WebMethod]
        public static string SP_IT_TAG_Software_JD_Detail(int ID, string JD_Code, string Tag_Group, string Action)
        {
            return new ClassBrowseNew().SP_IT_TAG_Software_JD_Detail( ID,  JD_Code,  Tag_Group,  Action);
        }
        [WebMethod]
        public static List<ArrayList> VW_IT_TAG_PE_Software_JD(string JDCode,string search)
        {
            return new ClassBrowseNew().VW_IT_TAG_PE_Software_JD(JDCode, search);
        }[WebMethod]
        public static List<ArrayList> GET_JD_Detail(string JDCode,string search)
        {
            return new ClassBrowseNew().GET_JD_Detail(JDCode, search);
        }
        [WebMethod]
        public static string SP_IT_TAG_PE(int ID, string IT_TAG_Code, string StartDate, string BorrowDueDate,
            string ReturnDate, string ProjectNo, string Detail, string Status,string JD_Code, string PE_Type, string Emp_num,string Action)
        {
            return new ClassBrowseNew().SP_IT_TAG_PE( ID,  IT_TAG_Code,  StartDate,  BorrowDueDate,
             ReturnDate,  ProjectNo,  Detail,  Status,  JD_Code,  PE_Type,  Emp_num, Action);
        }

        [WebMethod]
        public static List<ArrayList> GET_PE_VW_IT_TAG_PE_Browse(string search, string type)
        {
            return new ClassBrowseNew().GET_PE_VW_IT_TAG_PE_Browse(search,  type);
        }
        [WebMethod]
        public static List<ArrayList> Get_User_PE(string search)
        {
            return new ClassBrowseNew().Get_User_PE( search);
        }
        [WebMethod]
        public static List<ArrayList> Get_JD_SWGroup(string BU_Group, string Level, string Job_Title,string search)
        {
            return new ClassBrowseNew().Get_JD_SWGroup( BU_Group,  Level,  Job_Title, search);
        }
        [WebMethod]
        public static List<ArrayList> PE_Get_JD_SWGroup(string BU_Group, string Level, string Job_Title,string search)
        {
            return new ClassBrowseNew().PE_Get_JD_SWGroup( BU_Group,  Level,  Job_Title, search);
        }
        [WebMethod]
        public static List<ArrayList> VW_IT_TAG_PE_ALL(string EmpNum,string IT_TAG_Code)
        {
            return new ClassBrowseNew().VW_IT_TAG_PE_ALL(EmpNum, IT_TAG_Code);
        }
        [WebMethod]
        public static List<ArrayList> Tranfer_VW_IT_TAG_PE_ALL(string IT_TAG_Code,string Tranfer_Type)
        {
            return new ClassBrowseNew().Tranfer_VW_IT_TAG_PE_ALL( IT_TAG_Code, Tranfer_Type);
        }
        [WebMethod]
        public static List<ArrayList> Tranfer_Complete_VW_IT_TAG_PE_ALL(string SQLIN)
        {
            return new ClassBrowseNew().Tranfer_Complete_VW_IT_TAG_PE_ALL(SQLIN);
        }
        [WebMethod]
        public static List<ArrayList> VW_IT_TAG_PE_Peripheral(string EmpNum)
        {
            return new ClassBrowseNew().VW_IT_TAG_PE_Peripheral(EmpNum);
        }
        [WebMethod]
        public static List<ArrayList> VW_IT_TAG_Monitoring_ExpireTag(string DayStart, string DayEnd)
        {
            return new ClassBrowseNew().VW_IT_TAG_Monitoring_ExpireTag(DayStart,  DayEnd);
        }
        [WebMethod]
        public static List<ArrayList> VW_IT_TAG_Monitoring_Commit_MA(string DayStart, string DayEnd)
        {
            return new ClassBrowseNew().VW_IT_TAG_Monitoring_Commit_MA(DayStart, DayEnd);
        }
        [WebMethod]
        public static List<ArrayList> VW_IT_TAG_Monitoring_Borrow(string DayStart, string DayEnd)
        {
            return new ClassBrowseNew().VW_IT_TAG_Monitoring_Borrow(DayStart, DayEnd);
        }
        [WebMethod]
        public static List<ArrayList> VW_IT_TAG_Monitoring_NewJD()
        {
            return new ClassBrowseNew().VW_IT_TAG_Monitoring_NewJD();
        }
        [WebMethod]
        public static List<ArrayList> Get_Tranfer_VW_IT_TAG_PE_Browse(string Tranfer_Type, string TypeCondition, string search,string Browse_Step)
        {
            return new ClassBrowseNew().Get_Tranfer_VW_IT_TAG_PE_Browse(Tranfer_Type, TypeCondition, search, Browse_Step);
        }
        [WebMethod]
        public static List<ArrayList> Get_Print_VW_IT_TAG_Master(string Taggroup, string search)
        {
            return new ClassBrowseNew().Get_Print_VW_IT_TAG_Master(Taggroup,search);
        }
        [WebMethod]
        public static List<ArrayList> PermissionGetUsername( string search)
        {
            return new ClassBrowseNew().PermissionGetUsername(search);
        }
        [WebMethod]
        public static string SP_IT_TAG_PE_Transfer_Multi(int ID, string IT_TAG_Code_Old, string IT_TAG_Code_New, string StartDate, string Action)
        {
            return new ClassBrowseNew().SP_IT_TAG_PE_Transfer_Multi(ID, IT_TAG_Code_Old, IT_TAG_Code_New, StartDate, Action);
        }
        [WebMethod]
        public static string SP_IT_TAG_Log_Transfer(int ID, string IT_TAG_Code_Old, string IT_TAG_Code_New, string StartDate)
        {
            return new ClassBrowseNew().SP_IT_TAG_Log_Transfer(ID, IT_TAG_Code_Old, IT_TAG_Code_New, StartDate);
        }
        [WebMethod]
        public static string SP_IT_TAG_Permission(int ID, string Portal, string Page, string Emp_num, string Permission)
        {
            return new ClassBrowseNew().SP_IT_TAG_Permission(ID, Portal, Page, Emp_num, Permission);
        }
        [WebMethod]
        public static List<ArrayList> VW_Proj_projum_projdesc_AllSite(string search)
        {
            return new ClassBrowseNew().VW_Proj_projum_projdesc_AllSite( search);
        }
        [WebMethod]
        public static List<ArrayList> VW_HR_List_Company(string search)
        {
            return new ClassBrowseNew().VW_HR_List_Company(search);
        }
        [WebMethod]
        public static List<ArrayList> VW_Location(string search)
        {
            return new ClassBrowseNew().VW_Location(search);
        }

        [WebMethod]
        public static void CrateSaleForce_Temp(List<ArrayList> Array_value, string site_ref)
        {
             new ClassBrowseNew().CrateSaleForce_Temp(Array_value, site_ref);
        }

        [WebMethod]
        public static void DeleteSaleForce_Temp( string site_ref)
        {
             new ClassBrowseNew().DeleteSaleForce_Temp( site_ref);
        }

        [WebMethod]
        public static string SP_SF_UpdateSalesforceID(string MainComp,string MainComp_name)
        {
            ClassAutomationSL ConAutomat = new ClassAutomationSL();
            ClassBrowseNew ConClassBrowseNew = new ClassBrowseNew();
            string SessionToken, ConfName;

            //MainComp = "CRP2_PKS";
            ConfName = ConClassBrowseNew.GetConfName(MainComp);
            SessionToken = ConAutomat.CheckPermission(ConfName);

            if (SessionToken != "")
            {
                //Param = "<Parameters><Parameter ByRef=\"EmpNum\">" + Empnum + "</Parameter>";
                //Param += "</Parameters>";
                String Param = "<Parameters></Parameters>";
                object result;
                if (MainComp_name == "PATKOL ICE SOLUTIONS CO.,LTD.")
                {
                    result = ConAutomat.CallIDO(SessionToken, "VW_ProjectInfos", "SP_SF_UpdateSalesforceID_ICE", Param);
                }
                else
                {
                    result = ConAutomat.CallIDO(SessionToken, "VW_ProjectInfos", "SP_SF_UpdateSalesforceID", Param);

                }

                Console.WriteLine(result);
                if (result.ToString() == "0")
                {
                    string msg = "Automation Success";
                    return msg;
                }
                else
                {
                    return result.ToString();
                }
            }
            else
            {
                string msg = "Permission limited or Password was incorrect.";
                return msg;
            }

        }

        //[WebMethod]
        //public static void SP_TB_OT_Salesforce_Archive(string site_ref)
        //{
        //    new ClassBrowseNew().SP_TB_OT_Salesforce_Archive(site_ref);
        //}
    }
}