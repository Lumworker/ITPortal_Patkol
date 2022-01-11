<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PMOnlineReport.aspx.cs" Inherits="ITPortal.PMOnlineReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .max-wide {
            max-width: 100%;
        }

        .datepicker {
            background: #333;
            border: 1px solid #555;
            color: #EEE;
        }

        .nav-tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
        }

        .ui-datepicker {
            z-index: 2 !important;
        }
    </style>
    <div class="page-header">
        <h2>Reporting Assignment</h2>
        <%--        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
            </div>
            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
            </div>
        </div>--%>
    </div>


    <div class="panel-group">
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="col-md-12">
                    <div class="row">
                       <%-- <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label1" class="col-md-3 col-xs-12 " runat="server" Font-Bold="True" Text="Site Ref"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control max-wide" id="SiteRef">
                                </select>
                            </div>
                        </div>--%>
                        
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Tag Code"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="txtITTag" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                                    <div class="input-group-btn">
                                        <button id="buttonSearchItTag" class="btn btn-default" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label3" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Tag Group"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="txtITTagGroup" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                                    <div class="input-group-btn">
                                        <button id="buttonSearchItTagGroup" class="btn btn-default" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--END Row-->
                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label2" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="รหัสพนักงาน"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="txtEmpnum" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                                    <div class="input-group-btn">
                                        <button id="buttonSearchEmp" class="btn btn-default" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label32" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Status"></asp:Label>
                              <div class="col-md-9 col-xs-12">
                                <select class="form-control max-wide" id="textSearch_Status">
                                    <option value="">=======Please Select Status=======</option>
                                    <option value="Awaiting MA">Awaiting MA</option>
                                    <option value="Awaiting Approve">Awaiting Approve</option>
                                    <option value="Complete">Complete</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <!--END Row-->

                <div class="col-md-12">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <div class="col-md-8 col-xs-12">
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <button type="button" id="btnClearReport" class="btn btn-warning btn-block" style="float: right;">Clear</button>
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <button type="button" id="btnSearchReport" class="btn btn-info btn-block" style="float: right;">Search</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--panel-body-->

            <!--panel-default-->
            <div class="panel panel-default" style="margin-top: 1em;display:none" id="divDataTable">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered center" style="width: 100%" id="tableReportingAssign">
                                    <thead>
                                        <tr>
                                            <th>Site Ref</th>
                                            <th>IT Tag Group</th>
                                            <th>IT Tag</th>
                                            <th>Emp Name</th>
                                            <th>Status</th>
                                            <%--<th></th>--%>
                                        </tr>
                                    </thead>
                                    <tbody id="ListReportingChecklist">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!--panel-body-->
            </div>
            <!--panel-default-->
        </div>
        <!--Panel-Group -->
    </div>

    <div class="modal fade" id="ModalSearchGroup" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">Search Group</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div id="search_box_Group">
                        </div>
                    </div>
                </div>
                <div class="modal-body"  style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <table class="table table-bordered table-responsive">
                        <thead runat="server">
                            <tr>
                                <th>Tag Group</th>
                                <th>Tag Group Name</th>
                                <th>MainType</th>
                            </tr>
                        </thead>
                        <tbody id='TBodySearchGroup'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalSearchITTag" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">Search IT Tag</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div id="search_box_ITTAG">
                        </div>
                    </div>
                </div>
                <div class="modal-body"  style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <table class="table table-bordered table-responsive">
                        <thead runat="server">
                            <tr>
                                <th>Site</th>
                                <th>Tag Code</th>
                                <th>Assign Date</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody id='TBodySearchITTag'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    
    <div class="modal fade" id="ModalSearchEmp" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-7 col-sm-12">
                            <h4 class="modal-title">Search Group</h4>
                        </div>
                        <div class="col-md-5 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div id="search_box_Emp">
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <table class="table table-bordered table-responsive">
                        <thead runat="server">
                            <tr>
                                <th>EmpNum</th>
                                <th>Name </th>
                            </tr>
                        </thead>
                        <tbody id='TBodySearchEmp'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!--Modal -->
    <script>
        $(document).ready(function () {

        <%--    $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("default.aspx/GetSite_ref")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                success: GetSiteRef
            })--%>


            var tableReportingAssign = $("#tableReportingAssign").DataTable({
                searching: true,
                responsive: true,
                "order": []
            });
            

            $("#buttonSearchItTagGroup").on('click', function () {
                var search = "";
                var button = '<input type="text" id="GroupSearch" placeholder="Search Group.." class="form-control max-wide" autocomplete="off">'
                $("#search_box_Group").empty();
                $("#search_box_Group").append(button);
                GetIT_TAG_Group(search);
            });

            $("#buttonSearchItTag").on('click', function () {
                var search = "";
                var button = '<input type="text" id="ITTagSearch" placeholder="Search ITTAG.." class="form-control max-wide" autocomplete="off">';
                $("#search_box_ITTAG").empty();
                $("#search_box_ITTAG").append(button);
                GetIT_TAG(search);
            });
            
            $("#buttonSearchEmp").on('click', function () {
                var search = "";
                var button = '<input type="text" id="EmployeeSearch" placeholder="Search Employee Number.." class="form-control max-wide" autocomplete="off">';
                $("#search_box_Emp").empty();
                $("#search_box_Emp").append(button);
                GetHR_Employee(search);
                $("#ModalSearchEmp").modal("show");
            });

            $("#btnSearchReport").on('click', function () {
                LoadtableReportingAssign();
                $("#IMGUpload").modal("hide");
                $("#divDataTable").css("display", "")
            });
            $("#btnClearReport").on('click', function () {
                //$("#SiteRef").val($("#SiteRef option:first").val());
                $("#txtITTag").val('');
                $("#txtITTagGroup").val('');
                $("#txtEmpnum").val('');
                $("#textSearch_Status").val('');
                $("#divDataTable").css("display", "none");
            });
            //nomal jquery

            $(document).on("click", ".selectGroup", function () {
                var IT_Tag_Group = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#txtITTagGroup").val(IT_Tag_Group);
                $("#ModalSearchGroup").modal("hide");
            });

            $(document).on("click", ".selectITTag", function () {
                var IT_TAG = $(this).closest("tr").find("td:nth-child(2)").text();
                $("#txtITTag").val(IT_TAG);
                $("#ModalSearchITTag").modal("hide");
            });

            $(document).on("click", ".selectEmp", function () {
                var Emp_Num = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#txtEmpnum").val(Emp_Num);
                $("#ModalSearchEmp").modal("hide");
            });

            $(document).on("change", "#EmployeeSearch", function () {
                var search = $("#EmployeeSearch").val();
                GetHR_Employee(search)
            });
            $(document).on("change", "#GroupSearch", function () {
                var search = $("#GroupSearch").val();
                GetIT_TAG_Group(search)
            });
            $(document).on("change", "#ITTagSearch", function () {
                var search = $("#ITTagSearch").val();
                GetIT_TAG(search)
            });
            //document on 


            function LoadtableReportingAssign() {
                $("#IMGUpload").modal("show");
                tableReportingAssign.clear().draw();
                var IT_TAG = $("#txtITTag").val();
                var IT_TAG_GROUP = $("#txtITTagGroup").val();
                var EmpNum = $("#txtEmpnum").val();
                var Status = $("#textSearch_Status").val();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/VW_PMOnline_IT_TAG_Assign_Report_V2") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ IT_TAG:IT_TAG, IT_TAG_GROUP:IT_TAG_GROUP,Status:Status, EmpNum:EmpNum }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[ID],[IT_TAG],[Status],[Assign_Date],[CreateDate],[CreateBy],[site_ref],[Emp_num],[FullName],[Tag_Group]
                                var ID = val[0];
                                var IT_TAG = val[1];
                                var Status = val[2];
                                var Assign_Date = val[3];
                                var CreateDate = val[4];
                                var CreateBy = val[5];
                                var site_ref = val[6];
                                var Emp_num = val[7];
                                var FullName = val[8];
                                var Tag_Group = val[9];
                                var url_link = "http://pkdevelop.patkol.com/PMonline/PMChecklistx?ID=" + ID;
                                tableReportingAssign.row.add([
                                    site_ref,
                                    Tag_Group,
                                    IT_TAG,
                                    FullName,
                                    Status,
                                    //'<td class="center" ><button type="button"   class="btn btn-warning btnReportingChecklist btn-block"  >Check List</button></td> ',
                                ]).draw(false);
                            });
                        }
                    }
                });
            }

            //document Ready End 
        });

        function GetIT_TAG_Group(search) {
            $("#TBodySearchGroup").empty();
            var fragment = "";
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/GetIT_TAG_Group_New_PMoneline") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ search: search }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var TagGroup = val[0];
                            var TagGroupName = val[1];
                            var MainType = val[2];
                            fragment += '<tr>';
                            fragment += '<td><a href="javascript:void(0)" class="selectGroup">' + TagGroup + '</a></td>';
                            fragment += '<td><a href="javascript:void(0)" class="selectGroup">' + TagGroupName + '</a></td>';
                            fragment += '<td><a href="javascript:void(0)" class="selectGroup">' + MainType + '</a></td>';
                            fragment += '</tr>';
                        });
                    }
                    $("#TBodySearchGroup").append(fragment);
                }
            });
            $("#ModalSearchGroup").modal("show");
        }

        function GetIT_TAG(search) {
            $("#TBodySearchITTag").empty();
            var fragment = "";
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/VW_PMOnline_IT_TAG_Assign_Report_V2") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ IT_TAG:search, IT_TAG_GROUP:'',Status:'', EmpNum:'' }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var ID = val[0];
                            var IT_TAG = val[1];
                            var Status = val[2];
                            var Assign_Date = val[3];
                            var CreateDate = val[4];
                            var CreateBy = val[5];
                            var site_ref = val[6];
                            var Emp_num = val[7];
                            var FullName = val[8];
                            var Tag_Group = val[9];
                                var url_link = "http://pkdevelop.patkol.com/PMonline/PMChecklistx?ID=" + ID;

                            fragment += '<tr>';
                            fragment += '<td><a href="javascript:void(0)" class="selectITTag">' + site_ref + '</a></td>';
                            fragment += '<td><a href="javascript:void(0)" class="selectITTag">' + IT_TAG + '</a></td>';
                            fragment += '<td><a href="javascript:void(0)" class="selectITTag">' + Assign_Date.substr(0,10) + '</a></td>';
                            fragment += '<td><a href="javascript:void(0)" class="selectITTag">' + Status + '</a></td>';
                            fragment += '</tr>';
                        });
                    }
                    $("#TBodySearchITTag").append(fragment);
                }
            });
            $("#ModalSearchITTag").modal("show");
        }
        
        function GetHR_Employee(search) {
            $("#TBodySearchEmp").empty();
            var fragment = "";
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/HR_Employee") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ search: search }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                               var res_id = val[0];
                                var Fullname = val[1];
                                var Level = val[2];
                                var costcenter = val[3];
                                var site_ref = val[4];
                                var UserAD = val[5];
                                var Emp_Status = val[6];
                                var Emp_ManagerID = val[7];
                            fragment += '<tr>';
                            fragment += '<td><a href="javascript:void(0)" class="selectEmp">' + res_id + '</a></td>';
                            fragment += '<td><a href="javascript:void(0)" class="selectEmp">' + Fullname + '</a></td>';
                            fragment += '</tr>';
                        });
                    }
                    $("#TBodySearchEmp").append(fragment);
                }
            });
        } 

        //function GetSiteRef(response) {
        //    var siteRef = '';
        //    siteRef += '<option value="">=======Please Select a company=======</option>';
        //    if (response.d.length > 0) {
        //        $.each(response.d, function (index, val) {
        //            var ID = val[0];
        //            var company = val[1];
        //            siteRef += '<option value="'+ID.trim()+'">' + company + '</option>';
        //        });
        //    }
        //    $("#SiteRef").append(siteRef);
        //}



    </script>


</asp:Content>
