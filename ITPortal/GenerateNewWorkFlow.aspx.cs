using MobileTask.AppCode;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITPortal
{
    public partial class GenerateNewWorkFlow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string Genarate_javascript(string snsTable_Name)
        {
            String txtJavascript = "";
            DataTable dt = new DataTable();
            dt = new ClassBrowseNew().SP_ColumnName_select(snsTable_Name);
            GridView GVColumn = new GridView();
            GVColumn.AllowPaging = false;
            GVColumn.DataSource = dt;
            GVColumn.DataBind();
            var size = GVColumn.Rows.Count;

            txtJavascript += "<script>" + "\n";
            txtJavascript += "$(document).ready(function () { " + "\n";

            String txtJavascriptSetData = "";
            String txtJavascriptGetData = "";
            String txtJavascriptEvent = "";

            txtJavascriptGetData += "if (K2_GetData_array.length > 0) {" + "\n";
            txtJavascriptSetData += "else {" + "\n";

            for (int i = 11; i < size; i++)
            {
                if (GVColumn.Rows[i].Cells[1].Text == "104")
                {
                    txtJavascriptSetData += " K2_Data_array[" + i + "] = \",null\";" + "\n";
                    txtJavascriptGetData += " K2_GetData_array[" + i + "] == \"True\" ?  $(\"input[name=ckb" + GVColumn.Rows[i].Cells[0].Text + "]\").prop(\"checked\",true) : \"\";" + "\n";

                    txtJavascriptEvent += "//Checkbox" + "\n";
                    txtJavascriptEvent += "$(\"input[name=ckb" + GVColumn.Rows[i].Cells[0].Text + "]\").on('change', function () { " + "\n";
                    txtJavascriptEvent += "if ($(this).is(\":Checked\")) {" + "\n";
                    txtJavascriptEvent += "var value = $(this).is(\":Checked\") ? 1 : 0;" + "\n";
                    txtJavascriptEvent += "var data_index = $(this).attr(\"data-index\");" + "\n";
                    txtJavascriptEvent += "if (data_index) {" + "\n";
                    txtJavascriptEvent += "K2_Data_array[data_index] = \",\" + value + \"\";" + "\n";
                    txtJavascriptEvent += "} ";
                    txtJavascriptEvent += "}" + "\n";
                    txtJavascriptEvent += "});" + "\n";

                    txtJavascriptEvent += "//Radio" + "\n";
                    txtJavascriptEvent += "$(\"input[name=rdo" + GVColumn.Rows[i].Cells[0].Text + "]\").on('change', function () {" + "\n";
                    txtJavascriptEvent += "var value = $(\"input[name=rdo" + GVColumn.Rows[i].Cells[0].Text + "]:checked\").val();" + "\n";
                    txtJavascriptEvent += "var data_index = $(this).attr(\"data-index\");" + "\n";
                    txtJavascriptEvent += "if (data_index) {" + "\n";
                    txtJavascriptEvent += "K2_Data_array[data_index] = \",'\" + value + \"'\";" + "\n";
                    txtJavascriptEvent += "} ";
                    txtJavascriptEvent += "});" + "\n";

                }
                else if (GVColumn.Rows[i].Cells[1].Text == "231" && (GVColumn.Rows[i].Cells[2].Text == "-1" || Int32.Parse(GVColumn.Rows[i].Cells[2].Text) >= 1000))
                {
                    txtJavascriptSetData += " K2_Data_array[" + i + "] = \",'0'\";" + "\n";
                    txtJavascriptGetData += "$(\"#txt" + GVColumn.Rows[i].Cells[0].Text + "\").val(K2_GetData_array[" + i + "]);" + "\n";

                }
                else if (GVColumn.Rows[i].Cells[1].Text == "40" || GVColumn.Rows[i].Cells[1].Text == "61")
                {
                    txtJavascriptSetData += " K2_Data_array[" + i + "] = \",null\";" + "\n";
                    txtJavascriptGetData += "$(\"#txt" + GVColumn.Rows[i].Cells[0].Text + "\").val(K2_GetData_array[" + i + "]);" + "\n";
                    txtJavascriptEvent += "$(\"#txt" + GVColumn.Rows[i].Cells[0].Text + "\").datepicker({ format: 'dd/mm/yyyy' }).datepicker(\"setDate\", new Date());" + "\n";
                }
                else if (GVColumn.Rows[i].Cells[1].Text == "56" || GVColumn.Rows[i].Cells[1].Text == "106")
                {
                    txtJavascriptSetData += " K2_Data_array[" + i + "] = \",null\";" + "\n";
                    txtJavascriptGetData += "$(\"#txt" + GVColumn.Rows[i].Cells[0].Text + "\").val(K2_GetData_array[" + i + "]);" + "\n";
                }
                else
                {
                    txtJavascriptSetData += " K2_Data_array[" + i + "] = \",null\";" + "\n";
                    txtJavascriptGetData += "$(\"#txt" + GVColumn.Rows[i].Cells[0].Text + "\").val(K2_GetData_array[" + i + "]);" + "\n";

                }
            }

            txtJavascriptGetData += "}" + "\n";
            txtJavascriptSetData += "}" + "\n\n";


            txtJavascriptEvent += "$(\"input[type=text], input[type=number], select\").on('change', function () { " + "\n";
            txtJavascriptEvent += "var value = $(this).val(); " + "\n";
            txtJavascriptEvent += "var data_index = $(this).attr(\"data-index\"); " + "\n";
            txtJavascriptEvent += "if (data_index) { " + "\n";
            txtJavascriptEvent += "K2_Data_array[data_index] = \", '\" + value + \"'\"; " + "\n";
            txtJavascriptEvent += "} ";
            txtJavascriptEvent += "}); " + "\n\n";

            txtJavascriptEvent += "$(\"textarea\").on(\"change\", function () {" + "\n";
            txtJavascriptEvent += "var value = $(this).val();" + "\n";
            txtJavascriptEvent += "var data_index = $(this).attr(\"data-index\");" + "\n";
            txtJavascriptEvent += "if (data_index) {" + "\n";
            txtJavascriptEvent += "K2_Data_array[data_index] = \", '\" + value + \"'\";" + "\n";
            txtJavascriptEvent += "} ";
            txtJavascriptEvent += "});" + "\n\n";


            txtJavascriptEvent += "$(\".btnRemark\").on(\"click\", function () {" + "\n";
            txtJavascriptEvent += "var div = $(this).closest(\"div\");" + "\n";
            txtJavascriptEvent += "var value = div.find(\"textarea\").val();" + "\n";
            txtJavascriptEvent += "var viewer = $(\"#lblViewer\").text();" + "\n";
            txtJavascriptEvent += "var d = new Date();" + "\n";
            txtJavascriptEvent += "var date = (\"0\" + d.getDate()).slice(-2) + \"/\" + (\"0\" + (d.getMonth() + 1)).slice(-2) + \"/\" + d.getFullYear() + \" \" + (\"0\" + d.getHours()).slice(-2) + \":\" + (\"0\" + d.getMinutes()).slice(-2) + \":\" + (\"0\" + d.getSeconds()).slice(-2);" + "\n";
            txtJavascriptEvent += "var textarea = div.find(\"textarea\");" + "\n";
            txtJavascriptEvent += "var data_index = textarea.attr(\"data-index\");" + "\n";
            txtJavascriptEvent += "textarea.val(value + \"   \" + viewer + \" \" + date);" + "\n";
            txtJavascriptEvent += "K2_Data_array[data_index] = \",'\" + textarea.val() + \"'\";" + "\n";
            txtJavascriptEvent += "});" + "\n\n";

            
            txtJavascriptEvent += "$(\".btnBrowseClick\").on('click', function() {" + "\n";
            txtJavascriptEvent += "var click = $(this).attr(\"data-click\");" + "\n";
            txtJavascriptEvent += "if (click == \"Employee\")" + "\n";
            txtJavascriptEvent += "{" + "\n";
            txtJavascriptEvent += "$(\"#myInput\").attr(\"data-type\", \"Employee\");" + "\n";
            txtJavascriptEvent += "GetListEmployee(\"\");" + "\n";
            txtJavascriptEvent += "}" + "\n";
            txtJavascriptEvent += "});" + "\n\n";

            txtJavascriptEvent += "$(\"#myInput\").on('change', function() {" + "\n";
            txtJavascriptEvent += "var value = $(this).val();" + "\n";
            txtJavascriptEvent += "var type = $(\"#myInput\").attr(\"data-type\");" + "\n";
            txtJavascriptEvent += "if (type == \"Employee\")" + "\n";
            txtJavascriptEvent += "{" + "\n";
            txtJavascriptEvent += "GetListEmployee(value);" + "\n";
            txtJavascriptEvent += "}" + "\n";
            txtJavascriptEvent += "});" + "\n\n";

            txtJavascriptEvent += "$(document).on('click', '.clickListEmployee', function() {" + "\n";
            txtJavascriptEvent += "var row = $(this).closest(\"tr\");" + "\n";
            txtJavascriptEvent += "var td1 = row.find(\"td:nth-child(1)\").text();" + "\n";
            txtJavascriptEvent += "var td2 = row.find(\"td:nth-child(2)\").text();" + "\n";
            txtJavascriptEvent += "//row.find(\"td:nth-child(1)\").find(\"input[type=text]\").val();" + "\n";
            txtJavascriptEvent += "//row.find(\"td:nth-child(1)\").find(\"input[type=radio]:checked\").val();" + "\n";
            txtJavascriptEvent += "//row.find(\"td:nth-child(1)\").find(\"select\").val();" + "\n";
            txtJavascriptEvent += "$(\"#txtTextBrowse\").val(td1);" + "\n";
            txtJavascriptEvent += "$(\"#lblTextBrowse\").text(td2);" + "\n";
            txtJavascriptEvent += "var data_index = $(\"#txtTextBrowse\").attr(\"data-index\");" + "\n";
            txtJavascriptEvent += "K2_Data_array[data_index] = \",'\" + td1 + \"'\"; " + "\n";
            txtJavascriptEvent += "$(\"#ModalList\").modal(\"hide\");" + "\n";
            txtJavascriptEvent += "});" + "\n";

            txtJavascriptEvent += "function GetListEmployee(search)" + "\n";
            txtJavascriptEvent += "{" + "\n";
            txtJavascriptEvent += "$(\"#Tablethead\").empty();" + "\n";
            txtJavascriptEvent += "$(\"#Tabletbody\").empty();" + "\n";
            txtJavascriptEvent += "$.ajax({" + "\n";
            txtJavascriptEvent += "type: \"POST\"," + "\n";
            txtJavascriptEvent += "async: false," + "\n";
            txtJavascriptEvent += "url: \"<%= ResolveUrl(\"../Default.aspx/ListBrowseEmployee\") %>\"," + "\n";
            txtJavascriptEvent += "contentType: \"application/json; charset=utf-8\"," + "\n";
            txtJavascriptEvent += "dataType: \"json\"," + "\n";
            txtJavascriptEvent += "data: JSON.stringify({ search: search })," + "\n";
            txtJavascriptEvent += "success: function(response) {" + "\n";
            txtJavascriptEvent += "$(\"#ModalTitle\").text(\"List Employee\");" + "\n";
            txtJavascriptEvent += "if (response.d[0].length > 0)" + "\n";
            txtJavascriptEvent += "{" + "\n";
            txtJavascriptEvent += "var framentHeader = '<tr>';" + "\n";
            txtJavascriptEvent += "//$.each(response.d[0], function (index, value) {" + "\n";
            txtJavascriptEvent += "//    framentHeader += '<th>' + value + '</th>';" + "\n";
            txtJavascriptEvent += "//});" + "\n";
            txtJavascriptEvent += "framentHeader += '<th>' + response.d[0][0] + '</th>';" + "\n";
            txtJavascriptEvent += "framentHeader += '<th>' + response.d[0][1] + '</th>';" + "\n";
            txtJavascriptEvent += "framentHeader += '</tr>';" + "\n";
            txtJavascriptEvent += "}" + "\n";
            txtJavascriptEvent += "if (response.d[1].length > 0)" + "\n";
            txtJavascriptEvent += "{" + "\n";
            txtJavascriptEvent += "var framentLine = '';" + "\n";
            txtJavascriptEvent += "$.each(response.d[1], function(index, value) {" + "\n";
            txtJavascriptEvent += "//[Emp_Num],[Name],[Username],[Dept]" + "\n";
            txtJavascriptEvent += "framentLine += '<tr>';" + "\n";
            txtJavascriptEvent += "framentLine += '<td><a href=\"javascript:void(0)\" class=\"clickListEmployee\">' + value[0] + '</a></td>';" + "\n";
            txtJavascriptEvent += "framentLine += '<td><a href=\"javascript:void(0)\" class=\"clickListEmployee\">' + value[1] + '</a></td>';" + "\n";
            txtJavascriptEvent += "framentLine += '</tr>';";
            txtJavascriptEvent += "});" + "\n";
            txtJavascriptEvent += "}" + "\n";
            txtJavascriptEvent += "$(\"#Tablethead\").append(framentHeader);" + "\n";
            txtJavascriptEvent += "$(\"#Tabletbody\").append(framentLine);" + "\n";
            txtJavascriptEvent += "$(\"#ModalList\").modal(\"show\");" + "\n";
            txtJavascriptEvent += "}" + "\n";
            txtJavascriptEvent += "});" + "\n";
            txtJavascriptEvent += "}" + "\n";

            txtJavascript += txtJavascriptGetData + "\n";
            txtJavascript += txtJavascriptSetData + "\n";
            txtJavascript += txtJavascriptEvent + "\n";

            txtJavascript += "});" + "\n";
            txtJavascript += "</script>" + "\n";

            return txtJavascript;
        }

        [WebMethod]
        public static string Genarate_HTML(string snsTable_Name)
        {
            String txtHTML = "";
            DataTable dt = new DataTable();
            dt = new ClassBrowseNew().SP_ColumnName_select(snsTable_Name);
            GridView GVColumn = new GridView();
            GVColumn.AllowPaging = false;
            GVColumn.DataSource = dt;
            GVColumn.DataBind();
            var size = GVColumn.Rows.Count;

            txtHTML += "<div class=\"panel-group\">" + "\n";
            txtHTML += "<div class=\"panel panel-default\">" + "\n";
            txtHTML += "<div class=\"panel -body\">" + "\n";
            txtHTML += "<section>" + "\n";
            txtHTML += "<div class=\"row\">" + "\n";

            int j = 1;
            for (int i = 11; i < size; i++)
            {
                if (j == 1)
                {
                    txtHTML += "<div class=\"col-md-12\">" + "\n";
                }

                if (GVColumn.Rows[i].Cells[1].Text == "104")
                {
                    txtHTML += "<div class=\"col-md-6 col-xs-12\">" + "\n";
                    txtHTML += "<div class=\"form-group\">" + "\n";
                    txtHTML += "<div class=\"row\">" + "\n";
                    txtHTML += "<div class=\"col-md-12 col-xs-12\">" + "\n";
                    txtHTML += "<asp:Label ID=\"Label4\" runat=\"server\" Text=\"" + GVColumn.Rows[i].Cells[0].Text + " :\" ToolTip=\"ชื่อเรื่อง\" CssClass=\"font\" Font-Bold=\"true\"></asp:Label>" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "<div class=\"col-md-12 col-xs-12\">" + "\n";
                    txtHTML += "<div class=\"checkbox\">" + "\n";
                    txtHTML += "<label>" + "\n";
                    txtHTML += "<input name=\"ckb" + GVColumn.Rows[i].Cells[0].Text + "\" type=\"checkbox\" value=\"1\" data-index=\"" + (i) + "\" >Option 1</label>" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "</div><!--End row col-md-6 col-xs-12-->" + "\n";
                }
                else if (GVColumn.Rows[i].Cells[1].Text == "231" && (GVColumn.Rows[i].Cells[2].Text == "-1" || Int32.Parse(GVColumn.Rows[i].Cells[2].Text) >= 1000))
                {
                    txtHTML += "<div class=\"col-md-6 col-xs-12\">" + "\n";
                    txtHTML += "<div class=\"form-group\">" + "\n";
                    txtHTML += "<div class=\"row\">" + "\n";
                    txtHTML += "<div class=\"col-md-12 col-xs-12\">" + "\n";
                    txtHTML += "<asp:Label ID=\"Label3\" runat=\"server\" Text=\"" + GVColumn.Rows[i].Cells[0].Text + " :\" ToolTip=\"ชื่อเรื่อง\" CssClass=\"font\" Font-Bold=\"true\"></asp:Label>" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "<div class=\"col-md-12 col-xs-12 text-right\">" + "\n";
                    txtHTML += "<textarea id=\"txt" + GVColumn.Rows[i].Cells[0].Text + "\" class=\"form-control font txtCal\" data-index=\"" + (i) + "\" rows=\"4\"></textarea>" + "\n";
                    txtHTML += "<button type=\"button\" class=\"btnRemark\"><i class=\"glyphicon glyphicon-time\" aria-hidden=\"true\"></i></button>" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "</div> <!--End row col-md-6 col-xs-12-->" + "\n";
                }
                else if (GVColumn.Rows[i].Cells[1].Text == "40" || GVColumn.Rows[i].Cells[1].Text == "61")
                {
                    txtHTML += "<div class=\"col-md-6 col-xs-12\">" + "\n";
                    txtHTML += "<div class=\"form-group\">" + "\n";
                    txtHTML += "<div class=\"row\">" + "\n";
                    txtHTML += "<div class=\"col-md-12 col-xs-12\">" + "\n";
                    txtHTML += "<asp:Label ID=\"Label10\" runat=\"server\" Text=\"" + GVColumn.Rows[i].Cells[0].Text + " :\" ToolTip=\"ชื่อเรื่อง\" CssClass=\"font\" Font-Bold=\"true\"></asp:Label>" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "<div class=\"col-md-12 col-xs-12\">" + "\n";
                    txtHTML += "<input id=\"txt" + GVColumn.Rows[i].Cells[0].Text + "\" type=\"text\" class=\"form-control\" style=\"max-width: 100%\" placeholder=\"dd/mm/yyyy\" data-index=\"" + (i) + "\">" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "</div> <!--End row col-md-6 col-xs-12-->" + "\n";
                }
                else if (GVColumn.Rows[i].Cells[1].Text == "56" || GVColumn.Rows[i].Cells[1].Text == "106")
                {
                    txtHTML += "<div class=\"col-md-6 col-xs-12\">" + "\n";
                    txtHTML += "<div class=\"form-group\">" + "\n";
                    txtHTML += "<div class=\"row\">" + "\n";
                    txtHTML += "<div class=\"col-md-12 col-xs-12\">" + "\n";
                    txtHTML += "<asp:Label ID=\"Label1\" runat=\"server\" Text=\"" + GVColumn.Rows[i].Cells[0].Text + " :\" ToolTip=\"ชื่อเรื่อง\" CssClass=\"font\" Font-Bold=\"true\"></asp:Label>" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "<div class=\"col-md-12 col-xs-12\">" + "\n";
                    txtHTML += "<input type=\"number\" id=\"txt" + GVColumn.Rows[i].Cells[0].Text + "\" class=\"form-control font txtCal\" data-index=\"" + (i) + "\" />" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "</div> <!--End row col-md-6 col-xs-12-->" + "\n";
                }
                else
                {
                    txtHTML += "<div class=\"col-md-6 col-xs-12\">" + "\n";
                    txtHTML += "<div class=\"form-group\">" + "\n";
                    txtHTML += "<div class=\"row\">" + "\n";
                    txtHTML += "<div class=\"col-md-12 col-xs-12\">" + "\n";
                    txtHTML += "<asp:Label ID=\"Label7\" runat=\"server\" Text=\"" + GVColumn.Rows[i].Cells[0].Text + " :\" ToolTip=\"ชื่อเรื่อง\" CssClass=\"font\" Font-Bold=\"true\"></asp:Label>" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "<div class=\"col-md-12 col-xs-12\">" + "\n";
                    txtHTML += "<input type=\"text\" id=\"txt" + GVColumn.Rows[i].Cells[0].Text + "\" class=\"form-control font txtCal\" data-index=\"" + (i) + "\" />" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "</div>" + "\n";
                    txtHTML += "</div> <!--End row col-md-6 col-xs-12-->" + "\n";
                }

                if (j == 2 || i == (size - 1))
                {
                    txtHTML += "</div>" + "\n";
                    j = 0;
                }
                j++;
            }

            txtHTML += "<div class=\"col-md-12\">" + "\n";
            txtHTML += "<div class=\"col-md-6 col-xs-12\">" + "\n";
            txtHTML += "<div class=\"form-group\">" + "\n";
            txtHTML += "<div class=\"row\">" + "\n";
            txtHTML += "<div class=\"col-md-12 col-xs-12\">" + "\n";
            txtHTML += "<asp:Label ID=\"Label7\" runat=\"server\" Text=\"Case Browse :\" ToolTip=\"ชื่อเรื่อง\" CssClass=\"font\" Font-Bold=\"true\"></asp:Label>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "<div class=\"col-md-12 col-xs-12\">" + "\n";
            txtHTML += "<div class=\"row\">" + "\n";
            txtHTML += "<div class=\"col-md-8\">" + "\n";
            txtHTML += "<div class=\"input-group\">" + "\n";
            txtHTML += "<input type=\"text\" id=\"txtTextBrowse\" class=\"form-control font txtCal\" data-index=\"15\" disabled>" + "\n";
            txtHTML += "<div class=\"input-group-btn\">" + "\n";
            txtHTML += "<button class=\"btn btn-default btnBrowseClick\" type=\"button\" data-click=\"Employee\">" + "\n";
            txtHTML += "<i class=\"glyphicon glyphicon-search\"></i>" + "\n";
            txtHTML += "</button>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "<div class=\"col-md-4 labelTitle\">" + "\n";
            txtHTML += "<span id=\"lblTextBrowse\" class=\"font\">Hello World!!</span>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "</div> <!--End row col-md-6 col-xs-12-->" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "</section>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "<div class=\"modal fade\" id=\"ModalList\" role=\"dialog\">" + "\n";
            txtHTML += "<div class=\"modal-dialog\">" + "\n";
            txtHTML += "<div class=\"modal-content\">" + "\n";
            txtHTML += "<div class=\"modal-header\">" + "\n";
            txtHTML += "<div class=\"col-md-12 col-lg-12 col-sm-12\" style=\"margin-bottom: 1em;\">" + "\n";
            txtHTML += "<div class=\"col-md-9 col-lg-9 col-sm-12\">" + "\n";
            txtHTML += "<h4 class=\"modal-title\" id=\"ModalTitle\"></h4>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "<div class=\"col-md-3 col-lg-3 col-sm-12\" style=\"text-align: right;\">" + "\n";
            txtHTML += "<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "<div class=\"col-md-12 col-lg-12 col-sm-12\">" + "\n";
            txtHTML += "<div class=\"col-md-12 col-lg-12 col-sm-12\">" + "\n";
            txtHTML += "<input type=\"text\" class=\"form-control\" id=\"myInput\" placeholder=\"Search\" autocomplete=\"off\" onkeypress=\"detect_enter_keyboard(event)\" style=\"max-width: 100%\" />" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "<div class=\"modal-body\" style=\"overflow-y: scroll; max-height: 28em;\">" + "\n";
            txtHTML += "<table class=\"table table-bordered table-responsive\">" + "\n";
            txtHTML += "<thead id=\"Tablethead\">" + "\n";
            txtHTML += "</thead>" + "\n";
            txtHTML += "<tbody id='Tabletbody'>" + "\n";
            txtHTML += "</tbody>" + "\n";
            txtHTML += "</table>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "<div class=\"modal-footer\">" + "\n";
            txtHTML += "<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "</div>" + "\n";
            txtHTML += "</div>" + "\n";
            //txtHTML += "" + "\n";
            return txtHTML;
        }



        [WebMethod]
        public static string Genarate_SP(string snsTable_Name)
        {
            String txtCreateSP = "";
            String txtCreateSPSet = "";
            String txtCreateSPInsertP = "";
            String txtCreateSPInsertV = "";
            String txtCreateSPUpdate = "";
            String Querttxt = "";
            DataTable dt = new DataTable();
            dt = new ClassBrowseNew().SP_ColumnName_select(snsTable_Name);
            GridView GVColumn = new GridView();
            GVColumn.AllowPaging = false;
            GVColumn.DataSource = dt;
            GVColumn.DataBind();

            txtCreateSP += "CREATE PROCEDURE [dbo].[SP_" + snsTable_Name.Trim().Substring(3, snsTable_Name.Trim().Length - 3) + "]" + "\n";
            txtCreateSP += "@ID bigint output," + "\n";
            txtCreateSP += "@ProcessInstanceID nvarchar(100)," + "\n";
            txtCreateSP += "@Site_Ref nvarchar(100)," + "\n";
            txtCreateSP += "@Subject nvarchar(100)," + "\n";
            txtCreateSP += "@Cost_Center nvarchar(100)," + "\n";
            txtCreateSP += "@Resource nvarchar(100)," + "\n";
            txtCreateSP += "@Status nvarchar(100)," + "\n";
            txtCreateSP += "@CreateBy nvarchar(100)," + "\n";
            txtCreateSP += "@CreateDate nvarchar(100)," + "\n";
            txtCreateSP += "@WorkflowType nvarchar(100)," + "\n";
            txtCreateSP += "@WorkflowID nvarchar(100), " + "\n";

            ///////////////////////////////////////////////
            int size = GVColumn.Rows.Count;
            int r = 0;
            for (int i = 11; i < size; i++)
            {
                r = i + 1;
                if (r == size)
                {
                    txtCreateSP += "@Step bigint, " + "\n";
                }
                else
                {
                    if (GVColumn.Rows[i].Cells[1].Text == "40" || GVColumn.Rows[i].Cells[1].Text == "61")
                    {
                        txtCreateSPSet += "SET @" + GVColumn.Rows[i].Cells[0].Text + " = (CASE WHEN @" + GVColumn.Rows[i].Cells[0].Text + " = '' THEN NULL ELSE @" + GVColumn.Rows[i].Cells[0].Text + " END) " + "\n";
                    }
                    else if (GVColumn.Rows[i].Cells[1].Text == "106")
                    {
                        txtCreateSPSet += "SET @" + GVColumn.Rows[i].Cells[0].Text + " = (REPLACE(@" + GVColumn.Rows[i].Cells[0].Text + ",',','')) " + "\n";
                        txtCreateSPSet += "SET @" + GVColumn.Rows[i].Cells[0].Text + " = (CASE WHEN @" + GVColumn.Rows[i].Cells[0].Text + " = '' THEN '0' ELSE @" + GVColumn.Rows[i].Cells[0].Text + " END)" + "\n";
                    }
                    else if (GVColumn.Rows[i].Cells[1].Text == "127")
                    {
                        txtCreateSPSet += "SET @" + GVColumn.Rows[i].Cells[0].Text + " = (REPLACE(@" + GVColumn.Rows[i].Cells[0].Text + ",',','')) " + "\n";
                        txtCreateSPSet += "SET @" + GVColumn.Rows[i].Cells[0].Text + " = (CASE WHEN @" + GVColumn.Rows[i].Cells[0].Text + " = '' THEN '0' ELSE @" + GVColumn.Rows[i].Cells[0].Text + " END)" + "\n";
                    }


                    if (GVColumn.Rows[i].Cells[1].Text == "231" && GVColumn.Rows[i].Cells[2].Text == "-1")
                    {
                        txtCreateSP += "@" + GVColumn.Rows[i].Cells[0].Text + " nvarchar(MAX), " + "\n";
                    }
                    else if (GVColumn.Rows[i].Cells[1].Text == "104")
                    {
                        txtCreateSP += "@" + GVColumn.Rows[i].Cells[0].Text + " bit, " + "\n";
                    }
                    else
                    {
                        txtCreateSP += "@" + GVColumn.Rows[i].Cells[0].Text + " nvarchar(100), " + "\n";
                    }

                }

            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////


            txtCreateSP += "@Msg  nvarchar(1000) output ," + "\n";
            txtCreateSP += "@ActionName NVARCHAR(20) " + "\n";
            txtCreateSP += "AS" + "\n";
            txtCreateSP += "set @Msg = 'Complete'" + "\n";
            txtCreateSP += "if @ID = ''" + "\n";
            txtCreateSP += "BEGIN" + "\n";
            ///////////////////////////////////////////////////

            txtCreateSPInsertP += "INSERT INTO " + snsTable_Name.Trim() + "\n";
            txtCreateSPInsertP += "(" + "\n";

            txtCreateSPInsertV += ")" + "\n";
            txtCreateSPInsertV += "VALUES" + "\n";
            txtCreateSPInsertV += "(" + "\n";

            txtCreateSPUpdate += " UPDATE " + snsTable_Name.Trim() + "\n";
            txtCreateSPUpdate += "SET" + "\n";


            int sizeSP = GVColumn.Rows.Count;
            int rSP = 0;
            for (int i = 0; i < sizeSP; i++)
            {
                rSP = i + 1;
                if (rSP == size)
                {
                    txtCreateSPInsertP += GVColumn.Rows[i].Cells[0].Text + "\n";
                    if (GVColumn.Rows[i].Cells[1].Text == "40" || GVColumn.Rows[i].Cells[1].Text == "61")
                    {

                        txtCreateSPInsertV += "CONVERT(DATE,@" + GVColumn.Rows[i].Cells[0].Text + ",103)" + "\n";
                    }

                    else if (GVColumn.Rows[i].Cells[1].Text == "106")
                    {
                        txtCreateSPInsertV += "CONVERT(DECIMAL(18,2),@" + GVColumn.Rows[i].Cells[0].Text + ")" + "\n";
                    }

                    else if (GVColumn.Rows[i].Cells[1].Text == "127")
                    {
                        txtCreateSPInsertV += "CONVERT(integer,@" + GVColumn.Rows[i].Cells[0].Text + ")" + "\n";
                    }
                    else
                    {

                        txtCreateSPInsertV += "@" + GVColumn.Rows[i].Cells[0].Text + "" + "\n";
                    }
                }
                else
                {

                    if (rSP == 9)
                    {

                        txtCreateSPInsertP += GVColumn.Rows[i].Cells[0].Text + "," + "\n";
                        txtCreateSPInsertV += "GETDATE()," + "\n";

                    }
                    else if (rSP == 1 || rSP == 2)
                    {

                    }
                    else if (rSP != 1 || rSP != 2 || rSP != 11)
                    {
                        if (GVColumn.Rows[i].Cells[1].Text == "40" || GVColumn.Rows[i].Cells[1].Text == "61")
                        {

                            txtCreateSPInsertV += "CONVERT(DATE,@" + GVColumn.Rows[i].Cells[0].Text + ",103)," + "\n";
                        }

                        else if (GVColumn.Rows[i].Cells[1].Text == "106")
                        {
                            txtCreateSPInsertV += "CONVERT(DECIMAL(18,2),@" + GVColumn.Rows[i].Cells[0].Text + ")," + "\n";
                        }

                        else if (GVColumn.Rows[i].Cells[1].Text == "127")
                        {
                            txtCreateSPInsertV += "CONVERT(integer,@" + GVColumn.Rows[i].Cells[0].Text + ")," + "\n";
                        }
                        else
                        {

                            txtCreateSPInsertV += "@" + GVColumn.Rows[i].Cells[0].Text + "," + "\n";
                        }
                        txtCreateSPInsertP += GVColumn.Rows[i].Cells[0].Text + "," + "\n";

                    }

                }

                if (rSP == 4)
                {
                    txtCreateSPUpdate += "[Subject] = @Subject" + "\n";


                }
                else if (rSP > 11)
                {
                    if (GVColumn.Rows[i].Cells[1].Text == "40" || GVColumn.Rows[i].Cells[1].Text == "61")
                    {
                        txtCreateSPUpdate += "," + GVColumn.Rows[i].Cells[0].Text + " = CONVERT(DATE,@" + GVColumn.Rows[i].Cells[0].Text + ",103)" + "\n";

                    }

                    else if (GVColumn.Rows[i].Cells[1].Text == "106")
                    {
                        txtCreateSPUpdate += "," + GVColumn.Rows[i].Cells[0].Text + " = CONVERT(DECIMAL(18,2),@" + GVColumn.Rows[i].Cells[0].Text + ")" + "\n";
                    }
                    else if (GVColumn.Rows[i].Cells[1].Text == "127")
                    {
                        txtCreateSPUpdate += "," + GVColumn.Rows[i].Cells[0].Text + " = CONVERT(integer,@" + GVColumn.Rows[i].Cells[0].Text + ")" + "\n";
                    }
                    else
                    {
                        txtCreateSPUpdate += "," + GVColumn.Rows[i].Cells[0].Text + " = @" + GVColumn.Rows[i].Cells[0].Text + "\n";

                    }


                }

            }

            txtCreateSPInsertV += ")" + "\n";
            txtCreateSPInsertV += "SET @ID = @@IDENTITY" + "\n";
            txtCreateSPInsertV += "END" + "\n";
            txtCreateSPInsertV += "ELSE" + "\n";
            txtCreateSPInsertV += "BEGIN" + "\n";

            txtCreateSPUpdate += "WHERE ID = @ID" + "\n";
            txtCreateSPUpdate += "END" + "\n";
            txtCreateSPUpdate += "SELECT @ID as 'ID',@Msg as 'Msg'" + "\n";

            return Querttxt = txtCreateSP + txtCreateSPSet + txtCreateSPInsertP + txtCreateSPInsertV + txtCreateSPUpdate;

        }
    }
}