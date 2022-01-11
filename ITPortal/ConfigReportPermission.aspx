<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConfigReportPermission.aspx.cs" Inherits="ITPortal.ConfigReportPermission" %>

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

        .float-left {
            float: left;
        }

        .center {
            margin: 0 auto;
            float: none;
        }
    </style>

    <div class="page-header">
        <h2>Config Report Permission</h2>
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
            </div>
            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                
                 <button class="btn btn-default" id="btnClear"  style="display:none;" type="button" data-toggle="modal">Clear</button>
                <button class="btn btn-info" id="Search" type="button" data-toggle="modal" disabled>Search</button>
                <button class="btn btn-success modalshow" data-buttontype="new" type="button" data-toggle="modal">New</button>
            </div>
        </div>

    </div>
    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-body">

                <div class="row">
                    <%--Search Button Browse --%>
                    <%--<div class="col-md-12">
                        <div class="row form-group">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>--%>
                <div class="col-md-12">
                    <div class="col-md-6 col-xs-12">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-2 col-xs-12">
                                    <label class="control-label">Type :</label>
                                </div>
                                <div class="col-md-10 col-xs-12">
                                    <select class="form-control max-wide" id="Type">
                                        <option value="">=======Please Select Type=======</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End row col-md-6 col-xs-12-->
                </div>
                    <!--End col-md-12-->
                    <div class="col-md-12">
                        <div class="col-md-12 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-1 col-xs-12">
                                        <label class="control-label">Authen Type :</label>
                                    </div>
                                    <div class="col-md-11 col-xs-12">
                                        <div class="input-group">
                                            <input id="AuthenType" type="text" class="form-control max-wide" disabled>
                                            <input id="PermissionLevel" type="hidden" class="form-control max-wide" disabled>
                                            <div class="input-group-btn">
                                                <button class="btn btn-default Browse_1" data-modaltype="Home" type="button" data-type="AuthenType">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End row col-md-6 col-xs-12-->
                    </div>
                    <!--End col-md-12-->
                    <div class="col-md-12" id="Step2" style="display: none;">
                        <div class="col-md-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2 col-xs-12">
                                        <label class="control-label" id="txtRefMenu">Ref Menu :</label>
                                    </div>
                                    <div class="col-md-10 col-xs-12">
                                        <div class="input-group">
                                            <input id="RefMenu" type="text" class="form-control max-wide" disabled>
                                            <%--<input id="hiddenRefMenu" type="text" class="form-control max-wide" disabled>--%>
                                            <div class="input-group-btn">
                                                <button class="btn btn-default Browse_modal Browse_2" id="Browse_2" data-modaltype="Home" type="button" data-type="AuthenType">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End row col-md-6 col-xs-12-->
                        <div class="col-md-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2 col-xs-12">
                                        <label class="control-label" id="txtDivision">Division :</label>
                                    </div>
                                    <div class="col-md-10 col-xs-12">
                                        <div class="input-group">
                                            <input id="Division" type="text" class="form-control max-wide" disabled>
                                            <input id="hiddenUser" type="hidden" class="form-control max-wide" disabled>
                                            <div class="input-group-btn">
                                                <button class="btn btn-default Browse_modal Browse_3" data-modaltype="Home" type="button" data-type="AuthenType">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End row col-md-6 col-xs-12-->
                    </div>
                    <!--End col-md-12-->
                </div>

                <%--Search Button Browse --%>
                <div class="row form-group">
                    <div class="row">
                        <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
                        </div>
                        <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-body">
                <%--Table Search (TB)--%>
                <div class="row" id="ColumnSearch" style="display: none;">
                    <div class="col-md-12">
                        <table id="TbListValue" class="table table-striped table-bordered responsive dt-responsive nowrap" style="width: 100%">
                            <thead>
                                <tr class="header">
                                    <th>RefType</th>
                                    <th>RefMenu</th>
                                    <th>Division</th>
                                    <th>Site_ref</th>
                                    <th>effect Date</th>
                                    <th>End Date</th>
                                    <th>AuthenType</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id='TBbodyValue'></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <%--ModalNew&Edit  --%>
    <div class="modal fade" id="modalBrowse" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                            <div class="col-md-9 col-lg-9 col-sm-12">
                                <h4 id="txtbrowseHeader" class="modal-title">Text</h4>
                            </div>
                            <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="max-width: 100%; max-height: 500px;">
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <%--ModalType DropDown  --%>
                            <div class="row form-group">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="col-md-2 col-sm-2 col-xs-12">
                                        <label class="control-label">Type :</label>
                                    </div>
                                    <div class="col-md-10 col-sm-10  col-xs-12">
                                        <div class="input-group">
                                            <div>
                                                <select class="form-control" id="ModalData_Type">
                                                    <option value="">=======Please Select Type=======</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--ModalAuthenType  --%>
                            <div class="row form-group">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="col-md-2 col-sm-2 col-xs-12">
                                        <label class="control-label">Authen Type :</label>
                                    </div>
                                    <div class="col-md-10 col-sm-10 col-xs-12">
                                        <div class="input-group">
                                            <input id="ModalData_AuthenType" type="text" class="form-control max-wide" disabled>
                                            <input id="ModalData_PermissionLevel" type="hidden" class="form-control max-wide" disabled>
                                            <div class="input-group-btn">
                                                <button class="btn btn-default Browse_1" type="button" data-type="AuthenType" data-modaltype="Data">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group" id="ModalData_Step2" style="display: none;">
                                <%--ModalRefMenu Browse --%>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label" id="ModalData_txtRefMenu">Ref Num :</label>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <div class="input-group">
                                            <input id="ModalData_RefMenu" type="text" class="form-control max-wide" disabled>
                                            <%--<input id="ModalData_hiddenRefMenu" type="text" class="form-control max-wide" disabled>--%>
                                            <div class="input-group-btn">
                                                <button class="btn btn-default Browse_2" id="BrowseEdit_2" type="button" data-type="RefMenu" data-modaltype="Data">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%--ModalDivision Browse --%>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label" id="ModalData_txtDivision">Division :</label>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <div class="input-group">
                                            <input id="ModalData_Division" type="text" class="form-control max-wide" disabled>
                                            <%--<input id="ModalData_hiddenUser" type="text" class="form-control max-wide" disabled>--%>
                                            <div class="input-group-btn">
                                                <button class="btn btn-default Browse_3" type="button" data-type="RefMenu" data-modaltype="Data">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--Effect date --%>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                </div>
                            </div>

                            <%--Effect date --%>
                            <div class="row form-group" id="divtime" style="display:none;">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">Effect Date :</label>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <div class='input-group date' id="ModalData_EffectDate">
                                            <input type='text' class="form-control max-wide" id="inputEffectDate" autocomplete="off" readonly="readonly" />
                                            <span class="input-group-addon">
                                                <i class="glyphicon glyphicon-calendar"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <%--End date --%>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">End date :</label>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <div class='input-group date' id="ModalData_EndDate">
                                            <input type='text' class="form-control max-wide" id="inputEndDate" autocomplete="off" readonly="readonly" />
                                            <span class="input-group-addon">
                                                <i class="glyphicon glyphicon-calendar"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <%--End date --%>
                            <div class="row form-group">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="col-md-2 col-sm-2 col-xs-12">
                                        <label class="control-label">Reference :</label>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <div class='input-group date'>
                                            <textarea class="form-control" id="ModalData_Reference" rows="5" cols="60"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div id="btnModalType">
                        <%--<button class="btn btn-warning submit"  type="button" data-toggle="modal" style="margin-right:10px;">Search </button>--%>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <%--modal SiteRef --%>
    <div class="modal fade" id="modalSiteRef" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-xs">
            <div class="modal-content">
                <%--<div class="modal-header">
                </div>--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%; text-align: center; height: 500px;">
                    <div style="margin-top: 25%;">
                        <label style="font-size: 20px;">Select a company</label>
                        <select class="form-control center" style="max-width: 70%; margin-top: 1rem;" id="SiteRef">
                            <option value="">=======Please Select a company=======</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <%--modalBrowse --%>
    <div class="modal fade" id="modalBrowseSearch" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-xs">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 id="browseHeader" class="modal-title">Text</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="form-group col-md-9 col-lg-9 col-sm-12">
                            <div id="search_box">
                                <input type="text" id="SearchBrowse" placeholder="Search.." class="form-control max-wide" autocomplete="off">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <table id="TbListBrowse" class="table table-striped table-bordered table-responsive">
                        <thead>
                            <tr class="header" id="TBheaderBrowse">
                                <th style="width: 20%">ID</th>
                                <th>Title</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id='TBbodyBrowse'></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">

        $(document).ready(function () {
            $("#modalSiteRef").modal("show");
            //$("#ModalData_EffectDate").datetimepicker({ format: "d/m/yy H:i" });
            //$("#ModalData_EndDate").datetimepicker({ format: "d/m/yy H:i" });
            $("#inputEffectDate").datetimepicker({ format: "d/m/Y H:i" });
            $("#inputEndDate").datetimepicker({ format: "d/m/Y H:i" });
            var TbListValue = $('#TbListValue').DataTable({
                searching: true,
                responsive: true,
            });
            //GetSite_ref
            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("Default.aspx/GetSite_ref")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                success: GetSite_ref
            });

            //Authen Type :
            $(".Browse_1").on("click", function () {
                $("#TBheaderBrowse").empty();
                var TBheader = '<th style="width: 25%">Permistion Type</th><th>Permission Level</th><th>Description</th>';
                $("#TBheaderBrowse").append(TBheader);
                var modal = $(this).attr("data-modalType");
                var fragment = '';
                $("#RefMenu").val("");
                $("#Division").val("");
                $("#hiddenUser").val("");
                $("#search_box").empty();
                $("#TBbodyBrowse").empty();
                $("#browseHeader").text('Authen Type');
                if (modal == "Home") {
                    SearchBox('HomeAuthType');
                    var RefType = $("#Type").val() != "" ? $("#Type").val() : '';
                    if (RefType != "") {
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ RefType: RefType, Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'AuthType' }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var id = val[0];
                                        var PermissionType = val[1];
                                        var PermissionLevel = val[2];
                                        var Description = val[3];
                                        var Source = val[4];
                                        var Destination = val[5];

                                        fragment += '<tr data-Source=' + Source + ' data-PermissionLevel=' + PermissionLevel + ' data-Destination=' + Destination + ' >';
                                        fragment += '<td><a class="clickselectAuthenType" href="javascript:void(0)" >' + PermissionType + '</a></td>';
                                        fragment += '<td><a class="clickselectAuthenType" href="javascript:void(0)" >' + PermissionLevel + '</a></td>';
                                        fragment += '<td><a class="clickselectAuthenType" href="javascript:void(0)" >' + Description + '</a></td>';
                                        fragment += '</tr>';
                                    });
                                }
                                $("#TBbodyBrowse").append(fragment);
                                $("#modalBrowseSearch").modal("show");
                            }
                        });
                    } else {swal("กรุณาเลือก Type!", "", "info"); }
                }
                else if (modal == "Data") {
                    SearchBox('DataAuthType');
                    var CheckAuthenTypeIsNull = sessionStorage.getItem("CheckCheckAuthenTypeIsNull");
                    //sessionStorage.setItem("CheckAuthenTypeIsNull", "None");
                    var RefType = $("#ModalData_Type").val() != "" ? $("#ModalData_Type").val() : '';
                    
                    if (RefType != "") {
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ RefType: RefType, Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'AuthType' }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var id = val[0];
                                        var PermissionType = val[1];
                                        var PermissionLevel = val[2];
                                        var Description = val[3];
                                        var Source = val[4];
                                        var Destination = val[5];

                                        fragment += '<tr data-Source=' + Source + ' data-PermissionLevel=' + PermissionLevel + ' data-Destination=' + Destination + ' >';
                                        fragment += '<td><a class="clickselectModalDataAuthenType" href="javascript:void(0)" >' + PermissionType + '</a></td>';
                                        fragment += '<td><a class="clickselectModalDataAuthenType" href="javascript:void(0)" >' + PermissionLevel + '</a></td>';
                                        fragment += '<td><a class="clickselectModalDataAuthenType" href="javascript:void(0)" >' + Description + '</a></td>';
                                        fragment += '</tr>';
                                    });
                                }
                                
                                $("#TBbodyBrowse").append(fragment);
                                $("#modalBrowseSearch").modal("show");
                            }
                        });
                    } else { swal("กรุณาเลือก Type!", "", "info"); }
                }
            });
            //Division Menu Report:
            $(".Browse_2").on("click", function () {
                $("#search_box").empty();
                $("#TBheaderBrowse").empty();
                var modal = $(this).attr("data-modalType");
                var fragment = '';
                var TBheader = '<th style="width: 20%">ID</th><th>Title</th><th></th>';
                $("#TBbodyBrowse").empty();
                $("#search_box").empty();
                $("#TBheaderBrowse").append(TBheader);
                if (modal == "Home") {
                    //console.log('Home');
                    var RefType = $("#Type").val() != "" ? $("#Type").val() : '';
                    var Source = sessionStorage.getItem("Source");
                    if (Source == "Department") {
                        SearchBox('HomeDepartment');
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ RefType: RefType, Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'Costcenter' }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var Divition = val[0];
                                        var DivitionDesc = val[1] != '' ? val[1] : '-';
                                        fragment += '<tr>';
                                        fragment += '<td><a class="clickselectRefMenuDivision" href="javascript:void(0)" >' + Divition + '</a></td>';
                                        fragment += '<td><a class="clickselectRefMenuDivision" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                        fragment += '</tr>';
                                    });
                                } else {
                                    fragment += '<tr><td>Not Data</td></tr>';
                                }
                            }
                        });
                    }
                    else if (Source == "Project") {
                        SearchBox('HomeProject');
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ RefType: RefType, Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'ProjectNo' }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var Divition = val[0];
                                        var DivitionDesc = val[1] != '' ? val[1] : '-';

                                        fragment += '<tr>';
                                        fragment += '<td><a class="clickselectRefMenuProject" href="javascript:void(0)" >' + Divition + '</a></td>';
                                        fragment += '<td><a class="clickselectRefMenuProject" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                        fragment += '</tr>';
                                    });
                                }
                            }
                        });
                    }
                    else if (Source == "Report") {
                        SearchBox('HomeReport');
                        $("#TBheaderBrowse").empty();
                        var TBheader = "<th>Menu Name</th>";
                        $("#TBheaderBrowse").append(TBheader);
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ RefType: RefType, Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'Menu' }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var Divition = val[0];
                                        fragment += '<tr>';
                                        fragment += '<td><a class="clickselectRefMenu" href="javascript:void(0)" >' + Divition + '</a></td>';
                                        fragment += '</tr>';
                                    });
                                }
                            }
                        });
                    }
                    //2021-09-17 WO ADD Start
                    else if (Source == "BUGroup") {
                        SearchBox('HomeBUGroup');
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ RefType: RefType, Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'BUGroup' }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var Divition = val[0];
                                        var DivitionDesc = val[1] != '' ? val[1] : '-';
                                        fragment += '<tr>';
                                        fragment += '<td><a class="clickselectRefMenuBUGroup" href="javascript:void(0)" >' + Divition + '</a></td>';
                                        fragment += '<td><a class="clickselectRefMenuBUGroup" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                        fragment += '</tr>';
                                    });
                                } else {
                                    fragment += '<tr><td>Not Data</td></tr>';
                                }
                            }
                        });
                    }
                //2021-09-17 WO ADD END

                }
                else if (modal == "Data") {
                    var RefType = $("#ModalData_Type").val() != "" ? $("#ModalData_Type").val() : '';
                    var Source = sessionStorage.getItem("SourceModalData");
                    if (Source == "Department") {
                        SearchBox('DataDepartment');
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ RefType: RefType, Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'Costcenter' }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var Divition = val[0];
                                        var DivitionDesc = val[1] != '' ? val[1] : '-';
                                        fragment += '<tr>';
                                        fragment += '<td><a class="clickselectModalDataRefMenuDivision" href="javascript:void(0)" >' + Divition + '</a></td>';
                                        fragment += '<td><a class="clickselectModalDataRefMenuDivision" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                        fragment += '</tr>';
                                    });
                                }
                            }
                        });
                    }
                    else if (Source == "Project") {
                        SearchBox('DataProject');
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ RefType: RefType, Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'ProjectNo' }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var Divition = val[0];
                                        var DivitionDesc = val[1] != '' ? val[1] : '-';
                                        fragment += '<tr>';
                                        fragment += '<td><a class="clickselectModalDataRefMenuProject" href="javascript:void(0)" >' + Divition + '</a></td>';
                                        fragment += '<td><a class="clickselectModalDataRefMenuProject" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                        fragment += '</tr>';
                                    });
                                }
                            }
                        });
                    }
                    else if (Source == "Report") {
                        SearchBox('DataReport');
                        $("#TBheaderBrowse").empty();
                        var TBheader = "<th>Menu Name</th>";
                        $("#TBheaderBrowse").append(TBheader);
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ RefType: RefType, Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'Menu' }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var Divition = val[0];
                                        fragment += '<tr>';
                                        fragment += '<td><a class="clickselectModalDataRefMenu" href="javascript:void(0)" >' + Divition + '</a></td>';
                                        fragment += '</tr>';
                                    });
                                }
                            }
                        });
                    }
                    //2021-09-17 WO ADD Start
                    else if (Source == "BUGroup") {
                        SearchBox('DataBUGroup');
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ RefType: RefType, Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'BUGroup' }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var Divition = val[0];
                                        var DivitionDesc = val[1] != '' ? val[1] : '-';
                                        fragment += '<tr>';
                                        fragment += '<td><a class="clickselectModalDataRefMenuBUGroup" href="javascript:void(0)" >' + Divition + '</a></td>';
                                        fragment += '<td><a class="clickselectModalDataRefMenuBUGroup" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                        fragment += '</tr>';
                                    });
                                }
                            }
                        });
                    }
                    //2021-09-17 WO ADD End
                }
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });
            //end browse 2

            $(".Browse_3").on("click", function () {
                var modal = $(this).attr("data-modalType");
                var RefType = $("#Type").val();
                var fragment = '';
                //var browse_type = $(this).attr("data-type");
                $("#search_box").empty();
                $("#TBbodyBrowse").empty();
                $("#TBheaderBrowse").empty();
                var TBheader = '<th style="width: 20%">ID</th><th>Title</th><th></th>';
                $("#TBheaderBrowse").append(TBheader);
                if (modal == "Home") {
                    var Division = sessionStorage.getItem("Destination");
                    var title = $('#txtDivision').text();
                    $("#browseHeader").text(title);
                    if (Division == "User") {
                        SearchBox('Browse3_HomeUser');
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ RefType: RefType, Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'User' }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var EmpNum = val[0];
                                        var Name = val[1] != '' ? val[1] : '-';
                                        var UsernName = val[2] != '' ? val[2] : '-';
                                        fragment += '<tr data-username="' + UsernName + '">';
                                        fragment += '<td><a class="clickselectUser" href="javascript:void(0)" >' + EmpNum + '</a></td>';
                                        fragment += '<td><a class="clickselectUser" href="javascript:void(0)" >' + Name + '</a></td>';
                                        fragment += '<td><a class="clickselectUser" href="javascript:void(0)" >' + UsernName + '</a></td>';
                                        fragment += '</tr>';
                                    });
                                }
                            }
                        });
                    }
                    else if (Division == "Department") {
                        SearchBox('Browse3_HomeDepartment');
                        var RefType = $("#Type").val() != "" ? $("#Type").val() : '';
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ RefType: RefType, Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'Costcenter' }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var Divition = val[0];
                                        var DivitionDesc = val[1] != '' ? val[1] : '-';
                                        fragment += '<tr>';
                                        fragment += '<td><a class="clickselectDepartment" href="javascript:void(0)" >' + Divition + '</a></td>';
                                        fragment += '<td><a class="clickselectDepartment" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                        fragment += '</tr>';
                                    });
                                }
                            }
                        });
                    }
                    else if (Division == "Division") {
                        SearchBox('Browse3_HomeDivision');
                        var RefType = $("#Type").val() != "" ? $("#Type").val() : '';
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ RefType: RefType, Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'Division' }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var Divition = val[0];
                                        var DivitionDesc = val[1] != '' ? val[1] : '-';
                                        fragment += '<tr>';
                                        fragment += '<td><a class="clickselectDivision" href="javascript:void(0)" >' + Divition + '</a></td>';
                                        fragment += '<td><a class="clickselectDivision" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                        fragment += '</tr>';
                                    });
                                }
                            }
                        });
                    }
                    //2021-09-17 WO ADD Start
                    else if (Division == "BUGroup") {
                        SearchBox('Browse3_HomeBUGroup');
                        var RefType = $("#Type").val() != "" ? $("#Type").val() : '';
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ RefType: RefType, Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'BUGroup' }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var Divition = val[0];
                                        var DivitionDesc = val[1] != '' ? val[1] : '-';
                                        fragment += '<tr>';
                                        fragment += '<td><a class="clickselectBUGroup" href="javascript:void(0)" >' + Divition + '</a></td>';
                                        fragment += '<td><a class="clickselectBUGroup" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                        fragment += '</tr>';
                                    });
                                }
                            }
                        });
                    }
                    //2021-09-17 WO ADD End
                }
                //end browse3 home 
                else if (modal == "Data") {
                    var RefType = $("#ModalData_Type").val();
                    var title = $('#ModalData_txtDivision').text();
                    $("#browseHeader").text(title);
                    var Division = sessionStorage.getItem("DestinationModalData");
                    if (Division == "User") {
                        SearchBox('Browse3_DataUser');
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ RefType: RefType, Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'User' }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var EmpNum = val[0];
                                        var Name = val[1] != '' ? val[1] : '-';
                                        var UsernName = val[2] != '' ? val[2] : '-';
                                        fragment += '<tr data-username="' + UsernName + '">';
                                        fragment += '<td><a class="clickselecModalDataUser" href="javascript:void(0)" >' + EmpNum + '</a></td>';
                                        fragment += '<td><a class="clickselecModalDataUser" href="javascript:void(0)" >' + Name + '</a></td>';
                                        fragment += '<td><a class="clickselecModalDataUser" href="javascript:void(0)" >' + UsernName + '</a></td>';
                                        fragment += '</tr>';
                                    });
                                }
                            }
                        });
                    }
                    else if (Division == "Department") {
                        SearchBox('Browse3_DataDepartment');
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ RefType: RefType, Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'Costcenter' }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var Divition = val[0];
                                        var DivitionDesc = val[1] != '' ? val[1] : '-';
                                        fragment += '<tr>';
                                        fragment += '<td><a class="clickselectModalDataDepartment" href="javascript:void(0)" >' + Divition + '</a></td>';
                                        fragment += '<td><a class="clickselectModalDataDepartment" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                        fragment += '</tr>';
                                    });
                                }
                            }
                        });
                    }

                    else if (Division == "Division") {
                        SearchBox('Browse3_DataDivision');
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ RefType: RefType, Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'Division' }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var Divition = val[0];
                                        var DivitionDesc = val[1] != '' ? val[1] : '-';
                                        fragment += '<tr>';
                                        fragment += '<td><a class="clickselectModalDivision" href="javascript:void(0)" >' + Divition + '</a></td>';
                                        fragment += '<td><a class="clickselectModalDivision" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                        fragment += '</tr>';
                                    });
                                }
                            }
                        });
                    }
                    //2021-09-17 WO ADD Start
                    else if (Division == "BUGroup") {
                        SearchBox('Browse3_DataBUGroup');
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ RefType: RefType, Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'BUGroup' }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var Divition = val[0];
                                        var DivitionDesc = val[1] != '' ? val[1] : '-';
                                        fragment += '<tr>';
                                        fragment += '<td><a class="clickselectModalBUGroup" href="javascript:void(0)" >' + Divition + '</a></td>';
                                        fragment += '<td><a class="clickselectModalBUGroup" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                        fragment += '</tr>';
                                    });
                                }
                            }
                        });
                    }
                    //2021-09-17 WO ADD End
                }
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });

            //end Briwse 3


            $(document).on("click", ".modalshow", function () {
                var buttontype = $(this).attr("data-buttontype");
                //console.log(buttontype);
                var fragment = "";
                $("#modalBrowse").modal("show");
                $("#btnModalType").empty();
                $("#ModalData_AuthenType").val("");
                $("#ModalData_RefMenu").val("");
                $("#ModalData_Division").val("");
                $("#ModalData_PermissionLevel").val("");
                $("#inputEffectDate").val("");
                $("#inputEndDate").val("");
                $("#ModalData_Reference").val("");
                $("#ModalData_Type").val($("#ModalData_Type option:first").val());

                if (buttontype == 'new') {
                    $("#txtbrowseHeader").text("New");
                    $("#ModalData_Step2").attr("style", "display: none;");
                    fragment += '<button class="btn btn-success submitNew_Edit" data-btnType="New"  type="button" data-toggle="modal" style="margin-right:10px;" disabled>Create</button>';
                }
                else if (buttontype == 'edit') {
                    $("#ModalData_Step2").attr("style", "display: show;");
                    $("#txtbrowseHeader").text("Edit");
                    var RefType = $(this).closest("tr").find("td:nth-child(1)").text();
                    var RefMenu = $(this).closest("tr").find("td:nth-child(2)").text();
                    var Division = $(this).closest("tr").find("td:nth-child(3)").text();
                    var EffectDate = $(this).closest("tr").find("td:nth-child(5)").text();
                    var EndDate = $(this).closest("tr").find("td:nth-child(6)").text();
                    var AuthenType = $(this).closest("tr").find("td:nth-child(7)").text();
                    var description = $(this).attr("data-description") == "" ? RefMenu : $(this).attr("data-description");
                    var reference = $(this).attr("data-reference");
                    var id = $(this).attr("data-id");
                    var Source = $(this).attr("data-Source");
                    var Destination = $(this).attr("data-Destination");

                    if (RefType.toLowerCase() == "project") {
                        $("#ModalData_Type").val($("#ModalData_Type option:eq(1)").val());
                    }
                    else if (RefType.toLowerCase() == "report") {
                        $("#ModalData_Type").val($("#ModalData_Type option:eq(2)").val());
                    }
                    else if (RefType.toLowerCase() == "projectportal") {
                        $("#ModalData_Type").val($("#ModalData_Type option:eq(3)").val());
                    }

                    $("#ModalData_RefMenu").val(RefMenu);
                    $("#ModalData_Division").val(Division);
                    $("#ModalData_PermissionLevel").val(AuthenType);
                    $("#inputEffectDate").val(EffectDate);
                    $("#inputEndDate").val(EndDate);
                    $("#ModalData_Reference").val(reference);
                    if (AuthenType == "") {
                        swal("กรุณาเลือก Authen Type!", "", "info"); 
                        sessionStorage.setItem("CheckCheckAuthenTypeIsNull", "None");
                        $("#ModalData_txtRefMenu").text("RefNum");
                        $("#ModalData_txtDivision").text("Username");
                        fragment += '<button class="btn btn-warning submitNew_Edit" data-btnType="Edit" type="button" id="btnsaveEdit" data-id="' + ID + '" data-toggle="modal" style="margin-right:10px;" disabled >Submit Edit </button>';
                    } else {
                        var ID = $(this).attr("data-id");
                        sessionStorage.setItem("SourceModalData", Source);
                        sessionStorage.setItem("DestinationModalData", Destination);
                        $("#ModalData_txtRefMenu").text(Source);
                        $("#ModalData_txtDivision").text(Destination);
                        fragment += '<button class="btn btn-warning submitNew_Edit" data-btnType="Edit" type="button" id="btnsaveEdit" data-id="' + ID + '" data-toggle="modal" style="margin-right:10px;" >Submit Edit </button>';
                        if (Source == "Common") {
                            document.getElementById("BrowseEdit_2").disabled = true;
                            $("#ModalData_RefMenu").val("Common");
                        }
                        else {
                            document.getElementById("BrowseEdit_2").disabled = false;
                        }
                        $("#ModalData_AuthenType").val(description);
                    }
                }
                //console.log(fragment);
                $("#btnModalType").append(fragment);
            });

            $(document).on("click", "#Search", function () {
                LoadData("SearchHome");
            });

            function LoadData(Search) {
                $("#IMGUpload").modal("show");
                TbListValue.clear().draw();
                $("#TBbodyValue").empty();
                if (Search == "SearchHome") {
                    var RefType = $("#Type").val();
                    var RufNum = $("#RefMenu").val();
                    var Username = sessionStorage.getItem("Destination") == "User" ? $("#hiddenUser").val() : $("#Division").val();
                    var AutType = $("#PermissionLevel").val();
                }
                else if (Search == "SearchNew") {
                    var RefType = $("#ModalData_Type").val();
                    var RufNum = $("#RefMenu").val();
                    //var Username = sessionStorage.getItem("DestinationModalData") == "User" ? $("#ModalData_Division").val() : $("#ModalData_Division").val();
                    var Username = $("#ModalData_Division").val();
                    var AutType = $("#ModalData_PermissionLevel").val();
                    //console.log("RefType: " + RefType + "RufNum: " + RufNum + "Username: " + Username + "AutType: " + AutType)
                }
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GetReport_Permission") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ RefType: RefType, RufNum: RufNum, Username: Username, AutType: AutType, SiteRef: sessionStorage.getItem("SiteRef") }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var RefType = val[1];
                                var RefNum = val[2];
                                var Username = val[3];
                                var site_Ref = val[4];
                                var AutType = val[5];
                                var Description = val[6];
                                var eff_date = val[7];
                                var end_date = val[8];
                                var Source = val[9];
                                var Destination = val[10];
                                var reference = val[11];

                                TbListValue.row.add([RefType, RefNum, Username, site_Ref, eff_date, end_date, AutType,
                                    '<button class="btn btn-warning modalshow" data-buttontype="edit" type="button" data-ID="' + ID + '" data-Description="' + Description + '"data-Source="' + Source + '"data-Destination="' + Destination + '"data-reference="' + reference + '" data-toggle="modal">Edit </button>']).draw().node();
                                sessionStorage.setItem("DestinationModalData", '');
                                $("#ModalData_AuthenType").val('');
                                $("#ModalData_RefMenu").val('');
                                $("#inputEndDate").val('');
                                $("#inputEffectDate").val('');
                                $("#ModalData_Division").val('');
                                $("#ModalData_hiddenUser").val('');
                                $("#ModalData_Reference").val('');
                                $("#IMGUpload").modal("hide");
                            });
                        } else {
                            TbListValue.row.add(['Not Deta', 'Not Deta', 'Not Deta', 'Not Deta', 'Not Deta', 'Not Deta', 'Not Deta', 'Not Deta', 'Not Deta']).draw().node();
                             $("#IMGUpload").modal("hide");}
                    }
                });
                
                $("#modalBrowse").modal("hide");
                $("#txtbrowseHeader").text("Search");
                $("#ColumnSearch").attr("style", "display: show;");
                $("#btnClear").attr("style", "display: show;");
            }
            $(document).on("click", "#btnClear", function () {
                
                $("#Type").val($("#Type option:first").val());
                $("#Division").val("");
                $("#AuthenType").val("");
                $("#RefMenu").val("");
                $("#PermissionLevel").val("");
                $("#hiddenUser").val("");
                document.getElementById("Search").disabled = true;
                $("#Step2").attr("style", "display: none;");
                $("#ModalData_Type").val($("#ModalData_Type option:first").val());
                $("#ModalData_Division").val("");
                $("#ModalData_AuthenType").val("");
                $("#ModalData_RefMenu").val("");
                $("#btnClear").attr("style", "display: none;");
                $("#ModalData_Step2").attr("style", "display: none;");
                document.getElementsByClassName("submitNew_Edit")[0].disabled = true;
                
            });

            $(document).on("click", ".submitNew_Edit", function () {
                var btnType = $(this).attr("data-btnType");
                var ID = $(this).attr("data-id");
                var RefType = $("#ModalData_Type").val();
                var RufNum = $("#ModalData_RefMenu").val();
                var Username = $("#ModalData_Division").val();
                var site_ref = sessionStorage.getItem("SiteRef");
                var AuthenType = $("#ModalData_PermissionLevel").val();
                var Reference = $("#ModalData_Reference").val();
                var EndDate = $("#inputEndDate").val();
                var EffectDate = $("#inputEffectDate").val();
                if (btnType == "New") {
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Save") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: 0, RefType: RefType, RufNum: RufNum, Username: Username, site_ref: site_ref, AuthenType: AuthenType, EndDate: EndDate, EffectDate: EffectDate, Reference: Reference }),
                        success: function (response) {
                            if (response.d == "Permission have exists") {
                                swal("Data is Dupicate", response.d, "error");
                            }
                            else {
                                $("#IMGUpload").modal("show");
                                swal("Create success", "", "success");
                                $("#ModalData_Step2").attr("style", "display: none;");
                                $("#modalBrowse").modal("hide");

                                $("#Step2").attr("style", "display: show;");
                                if (RefType.toLowerCase() == "project") {
                                    $("#Type").val($("#ModalData_Type option:eq(1)").val());
                                }
                                else if (RefType.toLowerCase() == "report") {
                                    $("#Type").val($("#ModalData_Type option:eq(2)").val());
                                }
                                else if (RefType.toLowerCase() == "projectportal") {
                                    $("#Type").val($("#ModalData_Type option:eq(3)").val());
                                }
                                $("#RefMenu").val(RufNum)
                                
                                $("#Division").val($("#ModalData_Division").val());
                                $("#hiddenUser").val(Username)
                                sessionStorage.setItem("SiteRef", site_ref);
                                $("#PermissionLeve").val(AuthenType);
                                $("#AuthenType").val($("#ModalData_AuthenType").val());
                                LoadData("SearchNew");
                            }

                        }
                    });
                }
                else if (btnType == "Edit") {
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Save") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: ID, RefType: RefType, RufNum: RufNum, Username: Username, site_ref: site_ref, AuthenType: AuthenType, EndDate: EndDate, EffectDate: EffectDate, Reference: Reference }),
                        success: function (response) {
                            if (response.d == "Permission have exists") {
                                swal("Plase Check Data", response.d, "error");
                            }
                            else {
                                $("#IMGUpload").modal("show");
                                swal("Create success", "", "success");
                                LoadData("SearchNew");
                                $("#ModalData_Step2").attr("style", "display: none;");
                                $("#modalBrowse").modal("hide");
                            }

                        }
                    });
                }
            });

            //onClick Select Authen Type
            $(document).on("click", ".clickselectAuthenType", function () {
                var Description = $(this).closest("tr").find("td:nth-child(3)").text();
                var Source = $(this).closest("tr").attr("data-Source");
                var Destination = $(this).closest("tr").attr("data-Destination");
                var PermissionLevel = $(this).closest("tr").attr("data-PermissionLevel");
                sessionStorage.setItem("Source", Source);
                sessionStorage.setItem("Destination", Destination);

                $("#AuthenType").val(Description);
                $("#PermissionLevel").val(PermissionLevel);
                $("#txtRefMenu").text(Source);
                $("#txtDivision").text(Destination);
                if (Source == "Common") {
                    document.getElementById("Browse_2").disabled = true;
                    $("#RefMenu").val("Common");
                }
                else {
                    document.getElementById("Browse_2").disabled = false;
                }
                $("#Step2").attr("style", "display: show;");
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", ".clickselectModalDataAuthenType", function () {
                var Description = $(this).closest("tr").find("td:nth-child(3)").text();
                var Source = $(this).closest("tr").attr("data-Source");
                var Destination = $(this).closest("tr").attr("data-Destination");
                var PermissionLevel = $(this).closest("tr").attr("data-PermissionLevel");
                sessionStorage.setItem("SourceModalData", Source);
                sessionStorage.setItem("DestinationModalData", Destination);
                //if (CheckAuthenTypeIsNull != "None") {
                      $("#ModalData_RefMenu").val("");
                      $("#ModalData_Division").val("");
                      //sessionStorage.setItem("CheckAuthenTypeIsNull", '');
                      //}
                var AuthenTypeIsNull = sessionStorage.getItem("AuthenTypeIsNull");
                if (AuthenTypeIsNull !== "") {
                    sessionStorage.setItem("AuthenTypeIsNull", "");
                    document.getElementById("btnsaveEdit").disabled = false;
                }
                $("#ModalData_AuthenType").val(Description);
                $("#ModalData_PermissionLevel").val(PermissionLevel);
                $("#ModalData_txtRefMenu").text(Source);
                $("#ModalData_txtDivision").text(Destination);
                if (Source == "Common") {
                    document.getElementById("BrowseEdit_2").disabled = true;
                    $("#ModalData_RefMenu").val("Common");
                }
                else {
                    document.getElementById("BrowseEdit_2").disabled = false;
                }
                $("#ModalData_Step2").attr("style", "display: show;");
                $("#modalBrowseSearch").modal("hide");
            });



            $(document).on("click", ".clickselectDivision", function () {
                var Division = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#Division").val(Division);
                $("#modalBrowseSearch").modal("hide");
            });

            //2021-09-17 WO ADD Start
            $(document).on("click", ".clickselectBUGroup", function () {
                var Division = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#Division").val(Division);
                $("#modalBrowseSearch").modal("hide");
            });
            //2021-09-17 WO ADD End

            $(document).on("click", ".clickselectRefMenuDivision", function () {
                var RefMenu = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#RefMenu").val(RefMenu);
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", ".clickselectRefMenuProject", function () {
                var RefMenu = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#RefMenu").val(RefMenu);
                $("#modalBrowseSearch").modal("hide");
            });

            //2021-09-17 WO ADD Start
            $(document).on("click", ".clickselectRefMenuBUGroup", function () {
                var RefMenu = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#RefMenu").val(RefMenu);
                $("#modalBrowseSearch").modal("hide");
            });
            //2021-09-17 WO ADD END

            $(document).on("click", ".clickselectUser", function () {
                var tr = $(this).closest("tr");
                var Division = tr.find("td:nth-child(2)").text();
                var user = tr.attr('data-username');
                $("#hiddenUser").val(user);
                $("#Division").val(Division);
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", ".clickselectRefMenu", function () {
                //var RefMenu = $(this).closest("tr").find("td:nth-child(2)").text();
                var ID = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#RefMenu").val(ID);
                //$("#hiddenRefMenu").val(ID);
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", ".clickselectModalDataRefMenu", function () {
                //var RefMenu = $(this).closest("tr").find("td:nth-child(2)").text();
                var RefMenu = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#ModalData_RefMenu").val(RefMenu);
                //$("#ModalData_hiddenRefMenu").val(RefMenu);
                $("#AutType").val(RefMenu);
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", ".clickselectModalDataRefMenuDivision", function () {
                var ID = $(this).closest("tr").find("td:nth-child(1)").text();
                var RefMenu = $(this).closest("tr").find("td:nth-child(2)").text();
                $("#ModalData_RefMenu").val(ID);
                //$("#ModalData_hiddenRefMenu").val(ID);
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", ".clickselectModalDataRefMenuProject", function () {
                var RefMenu = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#ModalData_RefMenu").val(RefMenu);
                $("#modalBrowseSearch").modal("hide");
            });

            //2021-09-17 WO ADD Start
            $(document).on("click", ".clickselectModalDataRefMenuBUGroup", function () {
                var RefMenu = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#ModalData_RefMenu").val(RefMenu);
                $("#modalBrowseSearch").modal("hide");
            });
            //2021-09-17 WO ADD End

            $(document).on("click", ".clickselecModalDataUser", function () {
                var tr = $(this).closest("tr");
                var Division = tr.find("td:nth-child(2)").text();
                var user = tr.attr('data-username');
                //$("#ModalData_hiddenUser").val(user);
                //$("#ModalData_hiddenUser").val(user);
                $("#ModalData_Division").val(user);
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", ".clickselectModalDataDepartment", function () {
                var ID = $(this).closest("tr").find("td:nth-child(1)").text();
                //var Department = $(this).closest("tr").find("td:nth-child(2)").text();
                $("#ModalData_Division").val(ID);
                //$("#ModalData_hiddenUser").val(ID);
                $("#modalBrowseSearch").modal("hide");
            });
            $(document).on("click", ".clickselectDepartment", function () {
                var ID = $(this).closest("tr").find("td:nth-child(1)").text();
                //var Department = $(this).closest("tr").find("td:nth-child(2)").text();
                $("#Division").val(ID);
                $("#hiddenUser").val(ID);
                $("#modalBrowseSearch").modal("hide");
            });
            $(document).on("click", ".clickselectModalDivision", function () {
                var ID = $(this).closest("tr").find("td:nth-child(1)").text();
                //var Division = $(this).closest("tr").find("td:nth-child(2)").text();
                //$("#ModalData_hiddenUser").val(ID);
                $("#ModalData_Division").val(ID);
                $("#modalBrowseSearch").modal("hide");
            });

            //2021-09-17 WO ADD Start
            $(document).on("click", ".clickselectModalBUGroup", function () {
                var ID = $(this).closest("tr").find("td:nth-child(1)").text();
                //var Division = $(this).closest("tr").find("td:nth-child(2)").text();
                //$("#ModalData_hiddenUser").val(ID);
                $("#ModalData_Division").val(ID);
                $("#modalBrowseSearch").modal("hide");
            });
            //2021-09-17 WO ADD End

            $("#SiteRef").on('change', function () {
                var SiteRef = $("#SiteRef").val();
                //console.log(SiteRef);
                if (SiteRef) {
                    sessionStorage.setItem("SiteRef", SiteRef);
                    var value = "";
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ RefType: '', Search: '', SiteRef: sessionStorage.getItem("SiteRef"), Status: 'RefType' }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var Type = val[1];
                                    var Description = val[2];
                                    //console.log(Type);
                                    value += '<option value="' + Type + '">' + Description + '</option>';
                                });
                            } else { }
                            $("#Type").append(value);
                            $("#ModalData_Type").append(value);
                            $("#modalSiteRef").modal("hide");
                        }
                    });
                }
            });
            //onkeyup Browse 1
            $(document).on("keyup", "#HomeAuthType", function () {
                var value = $(this).val().toLowerCase();
                $("#TBbodyBrowse tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });
            $(document).on("keyup", "#DataAuthType", function () {
                var value = $(this).val().toLowerCase();
                $("#TBbodyBrowse tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });


            //onChange Browse 2
            $(document).on("change", "#HomeDepartment", function () {
                $("#TBbodyBrowse").empty();
                var fragment = "";
                var Search = $("#HomeDepartment").val();
                var RefType = $("#Type").val() != "" ? $("#Type").val() : '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ RefType: RefType, Search: Search, SiteRef: sessionStorage.getItem("SiteRef"), Status: 'Costcenter' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Divition = val[0];
                                var DivitionDesc = val[1] != '' ? val[1] : '-';
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectRefMenuDivision" href="javascript:void(0)" >' + Divition + '</a></td>';
                                fragment += '<td><a class="clickselectRefMenuDivision" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });
            $(document).on("change", "#HomeProject", function () {
                $("#TBbodyBrowse").empty();
                var fragment = "";
                var Search = $("#HomeProject").val();
                var RefType = $("#Type").val() != "" ? $("#Type").val() : '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ RefType: RefType, Search: Search, SiteRef: sessionStorage.getItem("SiteRef"), Status: 'ProjectNo' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Divition = val[0];
                                var DivitionDesc = val[1] != '' ? val[1] : '-';

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectRefMenuProject" href="javascript:void(0)" >' + Divition + '</a></td>';
                                fragment += '<td><a class="clickselectRefMenuProject" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });
            $(document).on("change", "#HomeReport", function () {
                $("#TBbodyBrowse").empty();
                var fragment = "";
                var Search = $("#HomeReport").val();
                var RefType = $("#Type").val() != "" ? $("#Type").val() : '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ RefType: RefType, Search: Search, SiteRef: sessionStorage.getItem("SiteRef"), Status: 'Menu' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Divition = val[0];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectRefMenu" href="javascript:void(0)" >' + Divition + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });

            //2021-09-17 WO ADD Start
            $(document).on("change", "#HomeBUGroup", function () {
                $("#TBbodyBrowse").empty();
                var fragment = "";
                var Search = $("#HomeBUGroup").val();
                var RefType = $("#Type").val() != "" ? $("#Type").val() : '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ RefType: RefType, Search: Search, SiteRef: sessionStorage.getItem("SiteRef"), Status: 'BUGroup' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Divition = val[0];
                                var DivitionDesc = val[1] != '' ? val[1] : '-';

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectRefMenuBUGroup" href="javascript:void(0)" >' + Divition + '</a></td>';
                                fragment += '<td><a class="clickselectRefMenuBUGroup" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });
            //2021-09-17 WO ADD End

            $(document).on("change", "#DataDepartment", function () {
                $("#TBbodyBrowse").empty();
                var fragment = "";
                var Search = $("#DataDepartment").val();
                var RefType = $("#Type").val() != "" ? $("#Type").val() : '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ RefType: RefType, Search: Search, SiteRef: sessionStorage.getItem("SiteRef"), Status: 'Costcenter' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Divition = val[0];
                                var DivitionDesc = val[1] != '' ? val[1] : '-';
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectModalDataRefMenuDivision" href="javascript:void(0)" >' + Divition + '</a></td>';
                                fragment += '<td><a class="clickselectModalDataRefMenuDivision" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });
            $(document).on("change", "#DataProject", function () {
                $("#TBbodyBrowse").empty();
                var fragment = "";
                var Search = $("#DataProject").val();
                var RefType = $("#Type").val() != "" ? $("#Type").val() : '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ RefType: RefType, Search: Search, SiteRef: sessionStorage.getItem("SiteRef"), Status: 'ProjectNo' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Divition = val[0];
                                var DivitionDesc = val[1] != '' ? val[1] : '-';
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectModalDataRefMenuProject" href="javascript:void(0)" >' + Divition + '</a></td>';
                                fragment += '<td><a class="clickselectModalDataRefMenuProject" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });
            $(document).on("change", "#DataReport", function () {
                $("#TBbodyBrowse").empty();
                var fragment = "";
                var Search = $("#DataReport").val();
                var RefType = $("#Type").val() != "" ? $("#Type").val() : '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ RefType: RefType, Search: Search, SiteRef: sessionStorage.getItem("SiteRef"), Status: 'Menu' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Divition = val[0];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectModalDataRefMenu" href="javascript:void(0)" >' + Divition + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });

            //2021-09-17 WO ADD Start
            $(document).on("change", "#DataBUGroup", function () {
                $("#TBbodyBrowse").empty();
                var fragment = "";
                var Search = $("#DataBUGroup").val();
                var RefType = $("#Type").val() != "" ? $("#Type").val() : '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ RefType: RefType, Search: Search, SiteRef: sessionStorage.getItem("SiteRef"), Status: 'BUGroup' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Divition = val[0];
                                var DivitionDesc = val[1] != '' ? val[1] : '-';
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectModalDataRefMenuBUGroup" href="javascript:void(0)" >' + Divition + '</a></td>';
                                fragment += '<td><a class="clickselectModalDataRefMenuBUGroup" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });
            //2021-09-17 WO ADD End

            //onChange Browse 3
            $(document).on("change", "#Browse3_HomeUser", function () {
                var Search = $("#Browse3_HomeUser").val();
                var RefType = $("#Type").val();
                var fragment = "";
                $("#TBbodyBrowse").empty();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ RefType: RefType, Search: Search, SiteRef: sessionStorage.getItem("SiteRef"), Status: 'User' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var EmpNum = val[0];
                                var Name = val[1] != '' ? val[1] : '-';
                                var UsernName = val[2];
                                fragment += '<tr data-username="' + UsernName + '">';
                                fragment += '<td><a class="clickselectUser" href="javascript:void(0)" >' + EmpNum + '</a></td>';
                                fragment += '<td><a class="clickselectUser" href="javascript:void(0)" >' + Name + '</a></td>';
                                fragment += '<td><a class="clickselectUser" href="javascript:void(0)" >' + UsernName + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                        $("#TBbodyBrowse").append(fragment);
                        $("#modalBrowseSearch").modal("show");
                    }
                });
            });
            $(document).on("change", "#Browse3_HomeDepartment", function () {
                var Search = $("#Browse3_HomeDepartment").val();
                var fragment = "";
                var RefType = $("#Type").val() != "" ? $("#Type").val() : '';
                $("#TBbodyBrowse").empty();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ RefType: RefType, Search: Search, SiteRef: sessionStorage.getItem("SiteRef"), Status: 'Costcenter' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Divition = val[0];
                                var DivitionDesc = val[1] != '' ? val[1] : '-';
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectDepartment" href="javascript:void(0)" >' + Divition + '</a></td>';
                                fragment += '<td><a class="clickselectDepartment" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });
            $(document).on("change", "#Browse3_HomeDivision", function () {
                var Search = $("#Browse3_HomeDivision").val();
                var fragment = "";
                var RefType = $("#Type").val() != "" ? $("#Type").val() : '';
                $("#TBbodyBrowse").empty();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ RefType: RefType, Search: Search, SiteRef: sessionStorage.getItem("SiteRef"), Status: 'Division' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Divition = val[0];
                                var DivitionDesc = val[1] != '' ? val[1] : '-';
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectDivision" href="javascript:void(0)" >' + Divition + '</a></td>';
                                fragment += '<td><a class="clickselectDivision" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });

            //2021-09-17 WO ADD Start
            $(document).on("change", "#Browse3_HomeBUGroup", function () {
                var Search = $("#Browse3_HomeBUGroup").val();
                var fragment = "";
                var RefType = $("#Type").val() != "" ? $("#Type").val() : '';
                $("#TBbodyBrowse").empty();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ RefType: RefType, Search: Search, SiteRef: sessionStorage.getItem("SiteRef"), Status: 'BUGroup' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Divition = val[0];
                                var DivitionDesc = val[1] != '' ? val[1] : '-';
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectBUGroup" href="javascript:void(0)" >' + Divition + '</a></td>';
                                fragment += '<td><a class="clickselectBUGroup" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });
            //2021-09-17 WO ADD End

            $(document).on("change", "#Browse3_DataUser", function () {
                var RefType = $("#ModalData_Type").val();
                $("#TBbodyBrowse").empty();
                var Search = $("#Browse3_DataUser").val();
                var fragment = "";
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ RefType: RefType, Search: Search, SiteRef: sessionStorage.getItem("SiteRef"), Status: 'User' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var EmpNum = val[0];
                                var Name = val[1] != '' ? val[1] : '-';
                                var UsernName = val[2];
                                fragment += '<tr data-username="' + UsernName + '">';
                                fragment += '<td><a class="clickselecModalDataUser" href="javascript:void(0)" >' + EmpNum + '</a></td>';
                                fragment += '<td><a class="clickselecModalDataUser" href="javascript:void(0)" >' + Name + '</a></td>';
                                fragment += '<td><a class="clickselecModalDataUser" href="javascript:void(0)" >' + UsernName + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("change", "#Browse3_DataDepartment", function () {
                $("#TBbodyBrowse").empty();
                var RefType = $("#ModalData_Type").val();
                var Search = $("#Browse3_DataDepartment").val();
                var fragment = "";
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ RefType: RefType, Search: Search, SiteRef: sessionStorage.getItem("SiteRef"), Status: 'Costcenter' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Divition = val[0];
                                var DivitionDesc = val[1] != '' ? val[1] : '-';
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectModalDataDepartment" href="javascript:void(0)" >' + Divition + '</a></td>';
                                fragment += '<td><a class="clickselectModalDataDepartment" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });
            $(document).on("change", "#Browse3_DataDivision", function () {
                var RefType = $("#ModalData_Type").val();
                $("#TBbodyBrowse").empty();
                var Search = $("#Browse3_DataDivision").val();
                var fragment = "";
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ RefType: RefType, Search: Search, SiteRef: sessionStorage.getItem("SiteRef"), Status: 'Division' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Divition = val[0];
                                var DivitionDesc = val[1] != '' ? val[1] : '-';
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectModalDivision" href="javascript:void(0)" >' + Divition + '</a></td>';
                                fragment += '<td><a class="clickselectModalDivision" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });

            //2021-09-17 WO ADD Start
            $(document).on("change", "#Browse3_DataBUGroup", function () {
                var RefType = $("#ModalData_Type").val();
                $("#TBbodyBrowse").empty();
                var Search = $("#Browse3_DataBUGroup").val();
                var fragment = "";
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_Report_Permission_Browse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ RefType: RefType, Search: Search, SiteRef: sessionStorage.getItem("SiteRef"), Status: 'BUGroup' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Divition = val[0];
                                var DivitionDesc = val[1] != '' ? val[1] : '-';
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectModalBUGroup" href="javascript:void(0)" >' + Divition + '</a></td>';
                                fragment += '<td><a class="clickselectModalBUGroup" href="javascript:void(0)" >' + DivitionDesc + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });
            //2021-09-17 WO ADD End

            $("#Type").on('change', function () {
                var RefType = $("#Type").val();
                $("#Division").val("");
                $("#AuthenType").val("");
                $("#RefMenu").val("");
                $("#PermissionLevel").val("");
                $("#hiddenUser").val("");
                document.getElementById("Search").disabled = false;
                $("#Step2").attr("style", "display: none;");
                if (RefType == "Report") {
                    $('#divtime').css('display', 'none');
                } else {
                    $('#divtime').css('display','block');
                }
            });
            $("#ModalData_Type").on('change', function () {
                var RefType = $("#ModalData_Type").val() != "" ? $("#ModalData_Type").val() : '';
                $("#ModalData_Division").val("");
                $("#ModalData_AuthenType").val("");
                $("#ModalData_RefMenu").val("");
                $("#inputEffectDate").val("");
                $("#inputEndDate").val("");
                if (RefType == "Report") {
                    $('#divtime').css('display', 'none');
                    //console.log("Change");
                    document.getElementById("inputEffectDate").disabled = true;
                    document.getElementById("inputEndDate").disabled = true;
                } else {
                    //console.log("Change not Report");
                    $('#divtime').css('display','block');
                    document.getElementById("inputEffectDate").disabled = false;
                    document.getElementById("inputEndDate").disabled = false;
                }
                //$("#ModalData_hiddenRefMenu").val("");
                //$("#ModalData_hiddenUser").val("");
                document.getElementsByClassName("submitNew_Edit")[0].disabled = false;
                $("#ModalData_Step2").attr("style", "display: none;");
            });

            function GetSite_ref(response) {
                var SiteRef = '';
                if (response.d.length > 0) {
                    $.each(response.d, function (index, val) {
                        var ID = val[0];
                        var company = val[1];
                        //console.log(ID + " " + company+"\n");
                        SiteRef += '<option value="' + ID + '">' + company + '</option>';
                    });
                }
                $("#SiteRef").append(SiteRef);
            }
            function SearchBox(idName) {
                $('<input>').attr({
                    type: 'text',
                    id: idName,
                    placeholder: "Search..",
                    class: "form-control max-wide",
                    autocomplete: "off"
                }).appendTo('#search_box');
            }
        });

    </script>
</asp:Content>
