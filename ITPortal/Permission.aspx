<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Permission.aspx.cs" Inherits="ITPortal.Permission" %>

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
    </style>
    <div class="page-header">
        <h2>Maintain Permission</h2>
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
            </div>

            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                <%--<button id="btnModalNew" class="btn btn-info" type="button" data-toggle="modal">New </button>--%>
                <button id="btnModalNew" class="btn btn-info PositionCheck" type="button" data-toggle="modal" style="float: right">New </button>
            </div>
        </div>

    </div>


    <!----End Header---->

    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <table id="TablePermission" class="table" style="width: 100%">
                            <thead>
                                <tr>
                                    <%--<th style="display:none;">ID</th>--%>
                                    <th>Position</th>
                                    <th>EmpNum</th>
                                    <th>Name</th>
                                    <%--<th>Level</th>--%>
                                    <th style="width: 50px;"></th>
                                    <th style="width: 50px;"></th>
                                </tr>
                            </thead>
                            <tbody id='TBbodyBenefits'>
                            </tbody>
                        </table>
                    </div>
                    <!--- End Col-md-12 --->
                </div>
            </div>
        </div>
    </div>
    <%--Start New Permission Modal--%>
    <div class="modal fade" id="modalPermission" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title" id="TitlePermission">New Permission</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                        </div>
                    </div>
                </div>
                <%--Start modal body--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <input id="PermissionID" type="hidden" class="form-control max-wide" disabled>
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Position :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <select class="form-control max-wide" id="Position">
                                    <option value="">======Please Select======</option>
                                    <option value="Admin">Admin</option>
                                    <option value="Creator">Creator</option>
                                    <option value="Checker">Checker</option>
                                </select>
                            </div>
                        </div>
                       <%-- <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Costcenter :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <div class="input-group">
                                    <input id="txtCostcenter" type="text" class="form-control max-wide" disabled>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" id="BrowseHR_Employee" type="button" data-type="CostCenter">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">EmpNum :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <div class="input-group">
                                    <input id="txtEmp_Num" type="text" class="form-control max-wide" disabled>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" id="BrowseHR_Employee" type="button" data-type="CostCenter">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                   <%--     <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Level :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <select class="form-control max-wide" id="Level">
                                </select>
                            </div>
                        </div>--%>
                    </div>
                </div>
                <%--End modal body--%>
                <div class="modal-footer" id="Browsefooter">
                </div>

            </div>
        </div>
    </div>
    <%--End Modal--%>
    <%--Start Browse Modal--%>
    <div class="modal fade" id="modalBrowseHR_Employee" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-xs">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 id="browseHeader" class="modal-title">Search Employee</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                     <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="form-group col-md-9 col-lg-9 col-sm-12">
                            <div id="search_box">
                                <input type="text" id="SearchBrowseHr_Employee" placeholder="Search.." class="form-control max-wide" autocomplete="off">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <table id="TbListBrowse" class="table table-striped table-bordered table-responsive">
                        <thead>
                            <tr class="header">
                                <th>Empnum</th>
                                <th>Name</th>
                            </tr>
                        </thead>
                        <tbody id='TBbodySearchEmployee'></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%--End Browse Modal--%>


    <script>
        $(document).ready(function () {
            var TablePermission = $('#TablePermission').DataTable({
                searching: true,
                responsive: true,
                "order": []
            });
            LoadData();

          <%--  $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("default.aspx/GetLevel")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                success: GetLevel
            })--%>
            
            $("#btnModalNew").on("click", function () {
                $("#PermissionID").val("");
                $("#txtEmp_Num").val("");
                $("#Browsefooter").empty();
                $("#TitlePermission").text("New Position");
                var button = ' <button type="button" class="btn btn-success" id="PermissionSave" data-type="Insert" >Save</button>';
                button += '<button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>';
                $("#Browsefooter").append(button);
                $("#modalPermission").modal("show");
            });

            $(document).on("click", ".btnModalEdit", function () {
                var Position = $(this).closest("tr").find("td:nth-child(1)").text();
                var EmpNum = $(this).closest("tr").find("td:nth-child(2)").text();
                var id = $(this).attr("data-id");
                $("#txtEmp_Num").val(EmpNum);
                $("#Position").val(Position);
                //$("#Level").val(Level);

                $("#Browsefooter").empty();
                $("#TitlePermission").text("Edit Position");
                $("#Browsefooter").empty();
                var button = ' <button type="button" class="btn btn-success" data-id="' + id + '" id="PermissionEdit" data-type="Edit" >Save</button>';
                button += '<button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>';
                $("#Browsefooter").append(button);
                $("#modalPermission").modal("show");
            });

            $("#BrowseHR_Employee").on('click', function () {
                var search = "";
                $("#SearchBrowseHr_Employee").val('');
                GetHR_Employee(search);
                $("#modalBrowseHR_Employee").modal("show");
            });


            $(document).on("click", ".selectCostcenter", function () {
                var CostCenter = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#txtEmp_Num").val(CostCenter);
                $("#modalBrowseHR_Employee").modal("hide");
            });


            $(document).on("click", "#PermissionSave", function () {
                var Position = $("#Position").val();
                var Emp_Num = $("#txtEmp_Num").val();
                //var Level = $("#Level").val();
                var Type = "INSERT"
                var ID = 0;
                SyncPermisstion(Type, ID, Position, Emp_Num);
            });

            $(document).on("click", "#PermissionEdit", function () {
                var Position = $("#Position").val();
                var Emp_Num = $("#txtEmp_Num").val();
                //var Level = $("#Level").val();
                var Type = "EDIT"
                var ID = $(this).attr("data-id");
                SyncPermisstion(Type, ID, Position, Emp_Num);
            });

            $(document).on("click", ".PermissionDelete", function () {
                if (confirm('ยืนยันการลบ ข้อมูล?')) {
                    var Position = '';
                    var Emp_Num = '';
                    //var Level = '';
                    var Type = "DELETE";
                    var ID = $(this).attr("data-id");
                    SyncPermisstion(Type, ID, Position, Emp_Num);
                }
            });
            $(document).on("change", "#SearchBrowseHr_Employee", function () {
                var search = $("#SearchBrowseHr_Employee").val();
                GetHR_Employee(search);
            });

            function GetHR_Employee(search) {
                $("#TBbodySearchEmployee").empty();
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
                                //[res_id],[Fullname],[Level],[costcenter],[site_ref],[UserAD],[Emp_Status],[Emp_ManagerID]
                                var res_id = val[0];
                                var Fullname = val[1];
                                var Level = val[2];
                                var costcenter = val[3];
                                var site_ref = val[4];
                                var UserAD = val[5];
                                var Emp_Status = val[6];
                                var Emp_ManagerID = val[7];
                                fragment += '<tr>';
                                fragment += '<td><a href="javascript:void(0)" class="selectCostcenter">' + res_id + '</a></td>';
                                fragment += '<td><a href="javascript:void(0)" class="selectCostcenter">' + Fullname + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                        $("#TBbodySearchEmployee").append(fragment);
                    }
                });
            }

            function LoadData() {
                TablePermission.clear().draw();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GetPermission")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify(),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                 //[ID],[Position],[Cost_Center],[Level],[Emp_Num],[Fullname],[UserAD]
                                var ID = val[0];
                                var Position = val[1];
                                //var Cost_Center = val[2];
                                //var Level = val[3];
                                var Emp_Num = val[4];
                                var Fullname = val[5];
                                var UserAD = val[6];
                                TablePermission.row.add([Position, Emp_Num,Fullname
                                    , '<button class="btn btn-warning  btnModalEdit" data-id="' + ID + '" type="button" >Edit</button>'
                                    , '<button class="btn btn-danger  PermissionDelete" data-id="' + ID + '" type="button" >Delete</button>']).draw().node();
                            });
                        }
                    }
                });
            }

            function SyncPermisstion(Type, ID, Position, Emp_Num) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_PMOnline_Permission") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, Position: Position, Emp_Num: Emp_Num, Type: Type }),
                    success: function (response) {
                    }
                });
                alert(Type + " Complete");
                LoadData();
                $("#Position").val($("#Position option:first").val());
                $("#txtEmp_Num").val("");
                //$("#Level").val($("#Level option:first").val());
                $("#modalPermission").modal("hide");
            }

           $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("default.aspx/SetPositionPage")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                //data: JSON.stringify({ Position: '' }),
                data: JSON.stringify({ Position: "Creator" }),
                success: PageSetPosition
            })

            function PageSetPosition(response) {
                if (response.d.length > 0) {
                    $.each(response.d, function (index, val) {
                        var Position = val[0];
                        $('.PositionCheck').css('display', 'block');
                        //TablePermission.columns([3]).visible(true);
                        //TablePermission.columns([4]).visible(true);
                        console.log("block");
                    });
                }
                else {
                    $('.PositionCheck').css('display', 'none');
                    TablePermission.columns([3]).visible(false);
                    TablePermission.columns([4]).visible(false);
                }
                //console.log(Position);
            }

        });//end Document Ready

        //function GetLevel(response) {
        //    var Level = '';
        //    Level += '<option value="">=======Please Select Level=======</option>';
        //    if (response.d.length > 0) {
        //        $.each(response.d, function (index, val) {
        //            var Level_Emp = val[0];
        //            Level += '<option value="' + Level_Emp.trim() + '">' + Level_Emp.trim() + '</option>';
        //        });
        //    }
        //    $("#Level").append(Level);
        //}





    </script>
</asp:Content>
