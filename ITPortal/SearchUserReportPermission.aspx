<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchUserReportPermission.aspx.cs" Inherits="ITPortal.SearchUserReportPermission" %>

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
        <h2>Check Permission</h2>
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
            </div>
            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">

                   <%--<button class="btn btn-default" id="btnClear" style="display: none;" type="button" data-toggle="modal">Clear</button>--%>
                <button class="btn btn-info" id="Search" type="button" data-toggle="modal" disabled>Search</button>
                <%--<button class="btn btn-success modalshow" data-buttontype="new" type="button" data-toggle="modal">New</button>--%>
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
                        <div class="col-md-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2 col-xs-12">
                                        <label class="control-label" id="txtDivision">User :</label>
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
                        <div class="col-md-6 col-xs-12">
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
                <div class="row form-group">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-6" style="text-align: left;">
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" id="InputSearch" style="text-align: right;display:none;" >
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 col-xs-6"  style="text-align: right;margin-top:0.5rem">
                                    <label>Search :</label>
                                        </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                    <input type="text" id="TBsearch" placeholder="Search.." class="form-control max-wide" autocomplete="off">
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--Table Search (TB)--%>
                <div class="row" id="ColumnSearch" style="display: none;">
                    <div class="col-md-12">
                        <table id="TbListValue" class="table table-striped table-bordered responsive dt-responsive nowrap" style="width: 100%">
                            <thead>
                                <tr class="header">
                                    <th>Title</th>
                                </tr>
                            </thead>
                            <tbody id='TBbodyValue'></tbody>
                        </table>
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
                        <div class="form-group col-md-12 col-lg-12 col-sm-12">
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
    <script>

        $(document).ready(function () {
            $("#modalSiteRef").modal("show");
            var TbListValue = $('#TbListValue').DataTable({
                searching: false,
                responsive: true,
            })

            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("Default.aspx/GetSite_ref")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                success: GetSite_ref
            });

            $(document).on("click", ".clickselectUser", function () {
                var tr = $(this).closest("tr");
                var Division = tr.find("td:nth-child(2)").text();
                var user = tr.attr('data-username');
                $("#hiddenUser").val(user);
                $("#Division").val(Division);
                $("#modalBrowseSearch").modal("hide");
                document.getElementById("Search").disabled = false;
            });

            $(".Browse_3").on("click", function () {
                $("#modalBrowse").modal("show");
                $("#search_box").empty();
                $("#browseHeader").text("User");
                SearchBox('Browse3_HomeUser');
                var RefType = '';
                var fragment = "";
                $("#TBbodyBrowse").empty();
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

            $(document).on("change", "#Browse3_HomeUser", function () {
                var Search = $("#Browse3_HomeUser").val();
                var RefType = '';
                var fragment = "";
                $("#browseHeader").text("User");
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

            $(document).on("keyup", "#TBsearch", function () {
                TbListValue.clear().draw();
                $("#TBbodyValue").empty();
                var RefType = $("#Type").val();
                var Username = $("#hiddenUser").val();
                var search = $("#TBsearch").val()
                if (RefType == "Project") {
                    console.log("change");
                //$("#IMGUpload").modal("show");
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/VW_Ctr_Permission") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Username: Username,  SiteRef: sessionStorage.getItem("SiteRef") ,search :search}),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var value = val[0];
                                    TbListValue.row.add([value]).draw().node();
                                });
                            } else {
                                TbListValue.row.add(['Not Deta']).draw().node();
                            }
                        }
                    });
                }
                else if (RefType == "ProjectPortal") {
                //$("#IMGUpload").modal("show");
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/VW_Ctr_PermissionProjPortal") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Username: Username, SiteRef: sessionStorage.getItem("SiteRef") ,search :search }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var value = val[0];
                                    TbListValue.row.add([value]).draw().node();
                                });
                            } else {
                                TbListValue.row.add(['Not Deta']).draw().node();
                            }
                        }
                    });

                }
                else if (RefType == "Report") {
                //$("#IMGUpload").modal("show");
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/VW_Ctr_Permission_Rpt_User") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Username: Username, SiteRef: sessionStorage.getItem("SiteRef"),search:search }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var value = val[0];
                                    TbListValue.row.add([value]).draw().node();
                                });
                            } else {
                                TbListValue.row.add(['Not Deta']).draw().node();
                            }
                        }
                    });
                }

            });


             function LoadData(Search) {
                TbListValue.clear().draw();
                $("#TBbodyValue").empty();
                var RefType = $("#Type").val();
                //var RufNum = $("#RefMenu").val() != '' ? $("#RefMenu").val() : '';
                var Username = $("#hiddenUser").val();
                //var AutType = $("#PermissionLevel").val();
                var search = $("#TBsearch").val()
                
                if (RefType == "Project") {
                $("#IMGUpload").modal("show");
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/VW_Ctr_Permission") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Username: Username,  SiteRef: sessionStorage.getItem("SiteRef") ,search :''}),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var value = val[0];
                                    TbListValue.row.add([value]).draw().node();
                                    $("#IMGUpload").modal("hide");
                                    $("#InputSearch").attr("style", "display: show;");
                                    $("#ColumnSearch").attr("style", "display: show;");
                                });
                            } else {
                                TbListValue.row.add(['Not Deta']).draw().node();
                                $("#IMGUpload").modal("hide");
                            }
                        }
                    });
                }
                else if (RefType == "ProjectPortal") {
                $("#IMGUpload").modal("show");
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/VW_Ctr_PermissionProjPortal") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Username: Username, SiteRef: sessionStorage.getItem("SiteRef") ,search :'' }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var value = val[0];
                                    TbListValue.row.add([value]).draw().node();
                                    $("#IMGUpload").modal("hide");
                                    $("#InputSearch").attr("style", "display: show;");
                                    $("#ColumnSearch").attr("style", "display: show;");
                                });
                            } else {
                                TbListValue.row.add(['Not Deta']).draw().node();
                                $("#IMGUpload").modal("hide");
                            }
                        }
                    });

                }
                else if (RefType == "Report") {
                $("#IMGUpload").modal("show");
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/VW_Ctr_Permission_Rpt_User") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Username: Username, SiteRef: sessionStorage.getItem("SiteRef"),search:'' }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var value = val[0];
                                    TbListValue.row.add([value]).draw().node();
                                    $("#IMGUpload").modal("hide");
                                    $("#InputSearch").attr("style", "display: none;");
                                    $("#ColumnSearch").attr("style", "display: show;");
                                });
                            } else {
                                TbListValue.row.add(['Not Deta']).draw().node();
                                    $("#IMGUpload").modal("hide");
                            }
                        }
                    });
                }
                //$("#modalBrowse").modal("hide");
                //$("#btnClear").attr("style", "display: show;");
            }

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

            $(document).on("click", "#Search", function () {
                if ($("#Type").val() != "") {
                    $("#TBsearch").val('');
                    LoadData("SearchHome");
                } else {
                    swal("กรุณาเลือก Type!", "", "info");
                }

            });

        });

    </script>
</asp:Content>
