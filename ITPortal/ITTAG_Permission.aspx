<%@ Page Title="Permission" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ITTAG_Permission.aspx.cs" Inherits="ITPortal.ITTAG_Permission" %>

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

        .btn-margin-left {
            margin-left: 2px;
        }

        .img-thumbnail {
            display: inline-block;
            max-width: 100%;
            padding: 4px;
            line-height: 1.42857143;
            border: 1px solid #ddd;
            border-radius: 4px;
            -webkit-transition: all .2s ease-in-out;
            -o-transition: all .2s ease-in-out;
            transition: all .2s ease-in-out;
        }

        input[type=checkbox] {
            /* Double-sized Checkboxes */
            -ms-transform: scale(2); /* IE */
            -moz-transform: scale(2); /* FF */
            -webkit-transform: scale(2); /* Safari and Chrome */
            -o-transform: scale(2); /* Opera */
            transform: scale(2);
            padding: 10px;
            margin-right: 1em;
            margin-bottom: 1em;
        }

        /* Might want to wrap a span around your checkbox text */
        .checkboxtext {
            /* Checkbox text */
            font-size: 110%;
            display: inline;
        }

        .sorting_1 {
            text-align: center;
        }

        .center {
            text-align: center;
        }

        .att-margin {
            margin-top: 2.5rem;
        }
    </style>
    <div class="page-header">
        <h2>Permission</h2>
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
            </div>

            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                <button id="btnModalNew" class="btn btn-success Pos_Worker" type="button" data-toggle="modal">New </button>
            </div>
        </div>

    </div>


    <!----End Header---->
    
    <div class="panel-group">
        <div class="panel panel-default" >
            <div class="panel-body">
                <div class="col-md-12">
                    <div class="row">
                     
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label2" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Portal"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <%--<div class="input-group">--%>
                                <select class="form-control max-wide" id="SearchPortal">
                                    <option value="">=======Please Select Portal=======</option>
                                    <option value="ITTAG">ITTAG</option>
                                    <%--<option value="PMOnline">PMOnline</option>--%>
                                </select>
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="EmpNum"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input id="SearchEmpnum" type="text" class="form-control max-wide" disabled>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" data-type="EmpNum" type="button">
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
                            <asp:Label ID="Label13" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Page"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <%--<div class="input-group">--%>
                                <select class="form-control max-wide" id="SearchPage">
                                    <option value="">=======Please Select Page=======</option>
                                    <option value="Generate ITTAG">Generate ITTAG</option>
                                    <option value="Maintain Equipment Owner">Maintain Equipment Owner</option>
                                    <option value="HarMaintain IT Chargedware">Maintain IT Charge</option>
                                    <option value="Maintain ITTAG">Maintain ITTAG</option>
                                    <option value="Maintain Permission">Maintain Permission</option>
                                    <option value="Maintain SW Group (JD)">Maintain SW Group (JD)</option>
                                    <option value="Maintain Tag Group">Maintain Tag Group</option>
                                    <option value="Monitoring">Monitoring</option>
                                    <option value="Report">Report</option>
                                    <option value="Tranfer Owner">IT TAG Tranfer Owner</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label313" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Permission"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select id="SearchPermission" class="form-control max-wide">
                                    <option value="">=== Select Permission ===</option>
                                    <option value="Viewer">Viewer</option>
                                    <option value="Worker">Worker</option>
                                    <option value="Admin">Admin</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                </div>

                <div class="col-md-12">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <div class="col-md-8 col-xs-12">
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <button type="button" id="btnSearchReport_Clear" class="btn btn-warning btn-block" style="float: right;">Clear</button>
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <button type="button" id="btnSearchReport" class="btn btn-info btn-block" style="float: right;">Search</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--panel-body-->
        </div>
    </div>
    <!--Panel-Group -->


    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <table id="TablePermission" class="table" style="width: 100%">
                            <thead>
                                <tr>
                                    <th style="width: 10%">Portal</th>
                                    <th style="width: 10%">Emp Num</th>
                                    <th style="width: 20%">Name</th>
                                    <th style="width: 30%">Page</th>
                                    <th>Permission</th>
                                    <th style="width: 50px"></th>
                                    <th style="width: 50px"></th>
                                    <%--<th style="width: 50px"></th>--%>
                                </tr>
                            </thead>
                            <tbody id=''>
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
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                            <div class="col-md-9 col-lg-9 col-sm-12">
                                <h4 class="modal-title" id="modal-title">New Permission</h4>
                            </div>
                            <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">

                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%--Start modal body--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <div class="row" style="overflow-y: auto; overflow-x: auto; text-align: center;">
                        <div class="col-md-12" style="text-align: center;">
                            <div class="panel-group">
                                <div class="panel-body">
                                    <div class="row">
                                        <div id="smartwizard">
                                            <ul>
                                                <li class="check" data-step="Step1">
                                                    <a href="#step-1">Select User</a>
                                                </li>
                                                <li class="check" data-step="Step2">
                                                    <a href="#step-2">Set Permission</a>
                                                </li>
                                            </ul>
                                            <div>
                                                <div id="step-1" class="">
                                                    <div class="panel-group">
                                                        <div class="panel panel-default" style="margin-top: 1em">
                                                            <div class="panel-heading">
                                                                <h4>Select User Permission</h4>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div class="row">
                                                                    <div class="col-md-12 form-group">
                                                                        <div class="col-md-12">
                                                                            <label class="control-label" style="font-size: 10px; color: red">Step1*</label>
                                                                        </div>
                                                                        <div class="col-md-12 ">
                                                                            <input id="PermissionID" type="hidden" class="form-control max-wide" disabled>
                                                                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                                                                                <div class="col-md-3 col-sm-3 col-xs-3">
                                                                                    <label class="control-label" style="font-size: 13px">User :</label>
                                                                                </div>
                                                                                <div class="col-md-9 col-sm-9 col-xs-9">
                                                                                    <div class="input-group">
                                                                                        <input type="text" class="form-control max-wide textEmpnum" disabled>
                                                                                        <div class="input-group-btn">
                                                                                            <button class="btn btn-default Browse_modal" type="button" data-type="GetUsername">
                                                                                                <i class="glyphicon glyphicon-search"></i>
                                                                                            </button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-12 ">
                                                                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                                                                                <div class="col-md-3 col-sm-3 col-xs-3">
                                                                                    <label class="control-label" style="font-size: 13px">Name :</label>
                                                                                </div>
                                                                                <div class="col-md-9 col-sm-9 col-xs-9">
                                                                                        <input type="text" class="form-control max-wide textName" disabled>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-12 form-group">
                                                                        <div class="col-md-12 ">
                                                                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                                                                                <div class="col-md-3 col-sm-3 col-xs-3">
                                                                                    <label class="control-label" style="font-size: 13px">Portal :</label>
                                                                                </div>
                                                                                <div class="col-md-9 col-sm-9 col-xs-9">
                                                                                    <select  class="form-control max-wide textPortal">
                                                                                        <option value="">=== Select Portal ===</option>
                                                                                        <option value="ITTAG">IT TAG</option>
                                                                                        <%--<option value="PMOnline">PM Online</option>--%>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--======End Step 1======--%>
                                                <div id="step-2" style="overflow-y: auto; overflow-x: auto;">
                                                    <div class="panel-group">
                                                        <div class="col-md-12 col-sm-12" style="max-width: 100%; margin-top: 1em;">
                                                            <div class="row">
                                                                <div class="table-responsive" style="overflow-x: auto;">
                                                                    <table class="table table-hover table-bordered" id="table_Step2_New">
                                                                        <thead>
                                                                            <tr>
                                                                                <th class="center">
                                                                                    <input class="form-check-input center checkboxes" id="checkAll" type="checkbox" style="margin-left: 1em"></th>
                                                                                <th>Page</th>
                                                                                <th>Permission</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody id="List_Step2_New">
                                                                            <tr>
                                                                                <th class="center">
                                                                                    <input class="form-check-input center checkboxes" type="checkbox" style="margin-left: 1em"></th>
                                                                                <th>Maintain ITTAG</th>
                                                                                <th>
                                                                                    <select id="textPermission_1" class="form-control max-wide">
                                                                                        <option value="">=== Select Permission ===</option>
                                                                                        <option value="Viewer">Viewer</option>
                                                                                        <option value="Worker">Worker</option>
                                                                                        <option value="Admin">Admin</option>
                                                                                    </select>
                                                                                </th>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%--</div>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer"></div>
                    </div>
                </div>
                <%--End modal body--%>
                <div class="modal-footer" id="Browsefooter">
                </div>

            </div>
        </div>
    </div>
    <%--End Modal--%>


    <div class="modal fade" id="ModalPermission" role="dialog">
        <div class="modal-dialog modal-xs">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                            <div class="col-md-7 col-sm-12">
                                <h4 class="modal-title"><span id="TitleModalEditPermission"></span></h4>
                            </div>
                            <div class="col-md-5 col-sm-12" style="text-align: right;">
                                <button type="button" class="btn btn-success" id="SaveEditPermission">Save</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <input type="text" id="text_ChargeID" class="form-control max-wide" style="display: none;" autocomplete="off" disabled />
                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <label class="control-label" style="font-size: 13px">User :</label>
                                </div>
                                <div class="col-md-9 col-sm-9 col-xs-9">
                                    <div class="input-group">
                                        <input type="text" class="form-control max-wide textEmpnum" disabled>
                                        <div class="input-group-btn">
                                            <button class="btn btn-default Browse_modal" type="button" data-type="GetUsername">
                                                <i class="glyphicon glyphicon-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <label class="control-label" style="font-size: 13px">Name :</label>
                                </div>
                                <div class="col-md-9 col-sm-9 col-xs-9">
                                        <input type="text" class="form-control max-wide textName" disabled>
                                </div>
                            </div>
                                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                                    <div class="col-md-3 col-sm-3 col-xs-3">
                                        <label class="control-label" style="font-size: 13px">Portal :</label>
                                    </div>
                                    <div class="col-md-9 col-sm-9 col-xs-9">
                                            <select class="form-control max-wide textPortal">
                                                <option value="">=== Select Portal ===</option>
                                                <option value="ITTAG">IT TAG</option>
                                                <%--<option value="PMOnline">PM Online</option>--%>
                                            </select>
                                    </div>
                                </div>
                            
                                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                                    <div class="col-md-3 col-sm-3 col-xs-3">
                                            <label class="control-label" style="font-size: 13px">Page :</label>
                                    </div>
                                    <div class="col-md-9 col-sm-9 col-xs-9">
                                            <select id="textPage" class="form-control max-wide">
                                                <option value="">=== Select Page ===</option>
                                                <option value="Maintain ITTAG">Maintain ITTAG</option>
                                                <option value="Maintain Tag Group">Maintain Tag Group</option>
                                                <option value="Generate ITTAG">Generate ITTAG</option>
                                                <option value="Maintain IT Charge">Maintain IT Charge</option>
                                                <option value="Maintain SW Group (JD)">Maintain SW Group (JD)</option>
                                                <option value="Maintain Equipment Owner">Maintain Equipment Owner</option>
                                                <option value="Tranfer Owner">Tranfer Owner</option>
                                                <option value="Monitoring">Monitoring</option>
                                                <option value="Maintain Permission">Maintain Permission</option>
                                                <option value="Report">Report</option>
                                            </select>
                                    </div>
                                </div>
                            
                                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                                    <div class="col-md-3 col-sm-3 col-xs-3">
                                        <label class="control-label" style="font-size: 13px">Permission :</label>
                                    </div>
                                    <div class="col-md-9 col-sm-9 col-xs-9">
                                        <select id="textPermission" class="form-control max-wide">
                                            <option value="">=== Select Permission ===</option>
                                            <option value="Viewer">Viewer</option>
                                            <option value="Worker">Worker</option>
                                            <option value="Admin">Admin</option>
                                            </select>
                                    </div>
                                </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
        </div>
        <%--Browse New/Edit--%>


        <div class="modal fade" id="modalBrowseSearch" role="dialog" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-md" id="modalSize">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                            <div class="col-md-9 col-lg-9 col-sm-12">
                                <h4 id="Titlebrowse" class="modal-title">Text</h4>
                            </div>
                            <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                <div id="search_box">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                        <table id="TbListBrowse" class="table table-striped table-bordered table-responsive">
                            <thead>
                                <tr class="header" id="TBheaderBrowse">
                                </tr>
                            </thead>
                            <tbody id='TBbodyBrowse'></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%--modalBrowseSearch--%>


        <script>

            $(document).ready(function () {
                var TablePermission = $('#TablePermission').DataTable({
                    searching: false,
                    lengthChange: false,
                    "ordering": false,
                });
               var UserPosition =  CheckPermission('ITTAG', 'Maintain Permission');
                console.log(UserPosition)
                SetPage(UserPosition)

                LoadData('','','','');

                $('#smartwizard').smartWizard({
                    theme: 'arrows',
                    keyNavigation: false,
                    showStepURLhash: false,
                    selected: 0, //ใส่ 0 จะเริ่มที่ Step แรกสุด
                    transitionEffect: 'slide',
                    toolbarSettings: { toolbarPosition: 'none', showNextButton: 'false', showPreviousButton: 'false' }
                });
                
                $("#btnModalNew").on("click", function () {
                    $(".checkboxes").prop("checked", false);
                    $('#smartwizard').smartWizard("reset"); 
                    $("#modal-title").text('New Permission');
                    $(".textEmpnum").val("");
                    $(".textName").val("");
                    $(".textPortal").val("ITTAG");
                    $("#Permission").val("");
                    $("#Browsefooter").empty();

                    var button = ` <div style="text-align: right">
                              <button id="nextPage2" class="btn btn-warning" type="button" data-toggle="modal" >Next</button>
                               </div>`
                    $("#Browsefooter").append(button);
                    $("#modalPermission").modal("show");
                });

                $("#btnSearchReport").on("click", function () {
                    var Portal = $("#SearchPortal").val();
                    var Empnum = $("#SearchEmpnum").val();
                    var Page = $("#SearchPage").val();
                    var Permission = $("#SearchPermission").val();
                   LoadData(Portal,Empnum,Page,Permission)
                });
                $("#btnSearchReport_Clear").on("click", function () {
                    $("#SearchPortal").val("");
                    $("#SearchEmpnum").val("");
                    $("#SearchPage").val("");
                    $("#SearchPermission").val("");
                   LoadData('','','','');
                });

                $(".textPortal").on("change", function () {
                    var textPortal = $("textPortal").val();
                    if (textPortal != "") {
                             $("#nextPage2").attr("disabled", false);
                    }
                });

                $(document).on("click", "#nextPage2", function () {
                    var Page = "";
                    var Portal = $(".textPortal").val();
                    $("#List_Step2_New").empty();
                    $("#Browsefooter").empty();
                    if (Portal == "ITTAG") {
                        Page += `<tr>
                            <td class="center"><input class="form-check-input center checkboxes" type="checkbox" style="margin-left:1em"></td>
                            <td>Maintain ITTAG</td>
                              <td>
                                <select id="" class="form-control max-wide">
                                <option value="">=== Select Permission ===</option>
                                <option value="Viewer">Viewer</option>
                                <option value="Worker">Worker</option>
                                <option value="Admin">Admin</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                            <td class="center"><input class="form-check-input center checkboxes" type="checkbox" style="margin-left:1em"></td>
                            <td>Maintain Tag Group</td>
                              <td>
                                <select id="" class="form-control max-wide">
                                <option value="">=== Select Permission ===</option>
                                <option value="Viewer">Viewer</option>
                                <option value="Worker">Worker</option>
                                <option value="Admin">Admin</option>
                                </select>
                              </td>
                            </tr>
                            <td class="center"><input class="form-check-input center checkboxes" type="checkbox" style="margin-left:1em"></td>
                            <td>Generate ITTAG</td>
                              <td>
                                <select id="" class="form-control max-wide">
                                <option value="">=== Select Permission ===</option>
                                <option value="Viewer">Viewer</option>
                                <option value="Worker">Worker</option>
                                <option value="Admin">Admin</option>
                                </select>
                              </td>
                            </tr>
                            <td class="center"><input class="form-check-input center checkboxes" type="checkbox" style="margin-left:1em"></td>
                            <td>Maintain IT Charge</td>
                              <td>
                                <select id="" class="form-control max-wide">
                                <option value="">=== Select Permission ===</option>
                                <option value="Viewer">Viewer</option>
                                <option value="Worker">Worker</option>
                                <option value="Admin">Admin</option>
                                </select>
                              </td>
                            </tr>
                            <td class="center"><input class="form-check-input center checkboxes" type="checkbox" style="margin-left:1em"></td>
                            <td>Maintain SW Group (JD)</td>
                              <td>
                                <select id="" class="form-control max-wide">
                                <option value="">=== Select Permission ===</option>
                                <option value="Viewer">Viewer</option>
                                <option value="Worker">Worker</option>
                                <option value="Admin">Admin</option>
                                </select>
                              </td>
                            </tr>
                            <td class="center"><input class="form-check-input center checkboxes" type="checkbox" style="margin-left:1em"></td>
                            <td>Maintain Equipment Owner</td>
                              <td>
                                <select id="" class="form-control max-wide">
                                <option value="">=== Select Permission ===</option>
                                <option value="Viewer">Viewer</option>
                                <option value="Worker">Worker</option>
                                <option value="Admin">Admin</option>
                                </select>
                              </td>
                            </tr>
                            <td class="center"><input class="form-check-input center checkboxes" type="checkbox" style="margin-left:1em"></td>
                            <td>Tranfer Owner</td>
                              <td>
                                <select id="" class="form-control max-wide">
                                <option value="">=== Select Permission ===</option>
                                <option value="Viewer">Viewer</option>
                                <option value="Worker">Worker</option>
                                <option value="Admin">Admin</option>
                                </select>
                              </td>
                            </tr>
                            <td class="center"><input class="form-check-input center checkboxes" type="checkbox" style="margin-left:1em"></td>
                            <td>Monitoring</td>
                              <td>
                                <select id="" class="form-control max-wide">
                                <option value="">=== Select Permission ===</option>
                                <option value="Viewer">Viewer</option>
                                <option value="Worker">Worker</option>
                                <option value="Admin">Admin</option>
                                </select>
                              </td>
                            </tr>
                            <td class="center"><input class="form-check-input center checkboxes" type="checkbox" style="margin-left:1em"></td>
                            <td>Maintain Permission</td>
                              <td>
                                <select id="" class="form-control max-wide">
                                <option value="">=== Select Permission ===</option>
                                <option value="Viewer">Viewer</option>
                                <option value="Worker">Worker</option>
                                <option value="Admin">Admin</option>
                                </select>
                              </td>
                            </tr>
                            <td class="center"><input class="form-check-input center checkboxes" type="checkbox" style="margin-left:1em"></td>
                            <td>Report</td>
                              <td>
                                <select id="" class="form-control max-wide">
                                <option value="">=== Select Permission ===</option>
                                <option value="Viewer">Viewer</option>
                                <option value="Worker">Worker</option>
                                <option value="Admin">Admin</option>
                                </select>
                              </td>
                            </tr>`
                    }
                    var button = `<div style="text-align: right;margin-top:1em;">
                               <button id="btnSavePermission_New" class="btn btn-success" type="button" data-toggle="modal" disabled>Save </button>
                             </div>`
                    $("#Browsefooter").append(button);
                    $("#List_Step2_New").append(Page);
                    $('#smartwizard').data('smartWizard')._showStep(1);
                });
                //End JD_New Step2

                $(document).on("click", "#btnSavePermission_New", function () {
                    var Portal = $(".textPortal").val();
                    var Emp_num = $(".textEmpnum").val();
                    var Checked = true;
                    console.log('Save')

                    $("#List_Step2_New tr").each(function () {
                        let checkbox = $(this).find("td:nth-child(1)").find("input[type=checkbox]");
                        let Page = $(this).find("td:nth-child(2)").text();
                        let Permission = $(this).find("td:nth-child(3)").find("select").val();
                        if (checkbox.is(':checked')) {
                            if (Permission == "") {
                                Checked = false;
                                swal('Error', 'กรุณากรอกข้อมูลให้ครบถ้วน', 'error');
                                console.log('false')
                            }
                        }
                    });

                    if (Checked) {
                        $("#List_Step2_New tr").each(function () {
                            let checkbox = $(this).find("td:nth-child(1)").find("input[type=checkbox]");
                            let Page = $(this).find("td:nth-child(2)").text();
                            let Permission = $(this).find("td:nth-child(3)").find("select").val();
                            
                            if (checkbox.is(':checked')) {
                                if (Permission != '' && Emp_num != '' && Portal != '') {
                                SP_IT_TAG_Permission(0, Portal, Page, Emp_num, Permission);
                                    console.log('true')
                                }
                            }
                        });
                    }
                    console.log(Checked);

                });
                $(document).on("click", "#SaveEditPermission", function () {
                    var ID =  $("#PermissionID").val();
                    var Portal = $(".textPortal").val();
                    var Emp_num = $(".textEmpnum").val();
                    var Page = $("#textPage").val();
                    var Permission = $("#textPermission").val();
                    SP_IT_TAG_Permission(ID, Portal, Page, Emp_num, Permission);
                    $("#ModalPermission").modal("hide");
                });

                //End JD_New Step3
                //function SETTabel_Step3(Page,count) {
                //    console.log(Page);
                //    var fregment = `<tr>
                //                    <th>`+Page+`</th>
                //                    <th><input type='radio' name='PageCheck`+count+`' value='Viewer' /></th>
                //                    <th><input type='radio' name='PageCheck`+count+`' value='Worker' /></th>
                //                    <th><input type='radio' name='PageCheck`+count+`' value='Admin' /></th>
                //                   </tr>`;
                //    $("#List_Step3_New").append(fregment);

                //}

                //$("#btnSavePermission_New").on("click", function () {
                //    var ID = $("#PermissionID").val();
                //    var Emp_num = $("#textEmpnum").val();
                //    var Page = ''
                //    var Permission = ''
                //    var Checked = true;
                //    $('#List_JD_Step2_New > tr').each(function (index, value) {
                //     if ($(this).find("td:nth-child(3)").find("input[type=text]").val() == '') {
                //            swal('Error',  'กรุณากรอก Starte Dateที่ '+$(this).find("td:nth-child(1)").text() , 'error');
                //            Checked = false;
                //        }



                //    });
                //});


                $(document).on("click", ".btnModalEdit", function () {
                    var ID = $(this).attr('data-id');
                    var Portal =  $(this).closest("tr").find("td:nth-child(1)").text();
                    var Emp_num =  $(this).closest("tr").find("td:nth-child(2)").text();
                    var Name =  $(this).closest("tr").find("td:nth-child(3)").text();
                    var Page =  $(this).closest("tr").find("td:nth-child(4)").text();
                    var Permission = $(this).closest("tr").find("td:nth-child(5)").text();
                    
                    $("#PermissionID").val(ID);
                    $(".textEmpnum").val(Emp_num);
                    $(".textName").val(Name);
                    $(".textPortal").val(Portal);
                    $("#textPage").val(Page);
                    $("#textPermission").val(Permission);
                    $("#TitleModalEditPermission").text("Edit Permission");
                    $("#ModalPermission").modal("show");
                });





                $(document).on("click", ".Browse_modal", function () {
                    var Type = $(this).attr("data-type");
                    $("#Titlebrowse").text(Type);
                    $("#search_box").empty();
                    $("#search_box").append('<input type="text" id="search_' + Type + '" placeholder="Search.." class="form-control max-wide" autocomplete="off">');
                    if (Type == 'GetUsername') {
                        PermissionGetUsername('');
                    }//End BrowseTagGroup
                    else if (Type == 'EmpNum') {
                        Get_User('');
                    }//End BrowsEmpNum
                    $("#modalBrowseSearch").modal("show");
                });


                $(document).on("change", "#search_GetUsername", function () {
                    var search = $(this).val().trim();
                    PermissionGetUsername(search);
                });


                //$(document).on("click", "#PermissionSave", function () {
                //    var username = $("#Emp_num").val();
                //    if (username != "" ) {
                //        SP_IT_TAG_Permission(0, Emp_num, Permission); 
                //    } else { swal('Error', 'Please check data', 'error'); }
                //});

                $(document).on("click", ".PermissionDelete", function () {
                    var ID = $(this).attr("data-id");
                    swal({
                        title: 'ยืนยันลบข้อมูล',
                        text: "",
                        icon: 'warning',
                        buttons: {
                            cancel: true,
                            confirm: true,
                        },
                    }).then(function (confirm) {
                        if (confirm) {
                            SP_IT_TAG_Permission(ID, '', '', '', '');
                        }
                    })

                });

                //-------select username------
                $(document).on("click", ".clickselectusername", function () {
                    var Emp_num = $(this).closest("tr").find("td:nth-child(1)").text();
                    var Name = $(this).closest("tr").find("td:nth-child(2)").text();
                    $("#search_GetUsername").val("");
                    $(".textEmpnum").val(Emp_num);
                    $(".textName").val(Name);
                    $("#modalBrowseSearch").modal("hide");
                });
                
                $(document).on("click", ".clickselecttext_User_Search", function () {
                    var Emp_num = $(this).closest("tr").find("td:nth-child(1)").text();
                    $("#SearchEmpnum").val(Emp_num);
                    $("#modalBrowseSearch").modal("hide");
                });


                $(document).on("click", "#checkAll", function () {
                    if (this.checked) {
                        $(".checkboxes").prop("checked", true);
                    } else {
                        $(".checkboxes").prop("checked", false);
                    }
                });
                //End Checkbox all
                $(document).on("change", ".checkboxes", function () {
                    if ($(this).is(':checked')) {
                        $("#btnSavePermission_New").prop("disabled", false);
                    }
                });

                $(document).on("click", ".btnDeletePermission", function () {
                    var ID = $(this).attr("data-id");
                    var Portal = $("#SearchPortal").val();
                    var Empnum = $("#SearchEmpnum").val();
                    var Page = $("#SearchPage").val();
                    var Permission = $("#SearchPermission").val();
                    //confirm
                    swal({
                        title: 'Confirm  Delete?',
                        text: "ยืนยันการลบข้อมูล",
                        icon: 'info',
                        buttons: {
                            cancel: true,
                            confirm: true,
                        },
                    }).then(function (confirm) {
                        if (confirm) {
                            SP_IT_TAG_Permission(ID, 'Delete', '', '', '' )
                            swal('Complete', 'ลบข้อมูลสำเร็จ', 'success');
                            LoadData(Portal, Empnum, Page, Permission);
                        }
                    })
                });

                $(document).on("change", "#search_EmpNum", function () {
                    $("#TBheaderBrowse").empty();
                    $("#TBbodyBrowse").empty();
                    var search = $(this).val();
                    //console.log(search);
                    Get_User(search);
                    $("#modalBrowseSearch").modal("show");
                });

                function SP_IT_TAG_Permission(ID, Portal, Page, Emp_num, Permission) {
                     var searchPortal = $("#SearchPortal").val();
                    var searchEmpnum = $("#SearchEmpnum").val();
                    var searchPage = $("#SearchPage").val();
                    var searchPermission = $("#SearchPermission").val();
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/SP_IT_TAG_Permission")%>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: ID, Portal: Portal, Page: Page, Emp_num: Emp_num, Permission: Permission }),
                        success: function (response) {
                        swal('Complete', ' ', 'success');
                        $("#modalPermission").modal("hide");
                        LoadData(searchPortal,searchEmpnum,searchPage,searchPermission);
                    }
                });//End ajax
            }
            function LoadData(Portal,Empnum,Page,Permission) {
                TablePermission.clear().draw();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GetVW_IT_TAG_Permission")%>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({Portal:Portal,Empnum:Empnum,Page:Page,Permission:Permission}),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    //[ID], [Emp_num], [name], [dept], [Uf_Level], [Portal], [Page], [Permission]
                                    var ID = val[0];
                                    var Emp_num = val[1];
                                    var name = val[2];
                                    var dept = val[3];
                                    var Uf_Level = val[4];
                                    var Portal = val[5];
                                    var Page = val[6];
                                    var Permission = val[7];
                                    var btn_Edit =  '<button class="btn btn-warning btnModalEdit" data-id="' + ID + '" type="button">Edit</button>'
                                    var btn_Delete =  '<button class="btn btn-danger btnDeletePermission" data-id="' + ID + '" type="button">Delete</button>'
                                    if (UserPosition == "Admin" || UserPosition == "Worker" ) {
                                        TablePermission.row.add([Portal, Emp_num, name, Page, Permission
                                            , btn_Edit, btn_Delete]).draw().node();
                                        //, '<button class="btn btn-danger PermissionDelete" data-id="' + ID + '" type="button">Delete</button>'

                                    } else if (UserPosition == "Viewer") {
                                        TablePermission.row.add([Portal, Emp_num, name, Page, Permission, '','']).draw().node();

                                    }
                                    
                                });
                            }
                        }
                    });
                }

            });
            //End Ready

            function PermissionGetUsername(search) {
                $("#TBbodyBrowse").empty();
                $("#TBheaderBrowse").empty();
                $("#Titlebrowse").text('Search Employee');
                var fragment = "";
                var fragmentHeader = "";
                fragmentHeader = ` <th style="width: 20%">EmpNum</th>
                                <th>Name</th>
                                <th>Costcenter</th>
                                <th>Level</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/PermissionGetUsername") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Emp_Num = val[0];
                                var name = val[1];
                                var dept = val[2];
                                var Uf_Level = val[3];
                                var Uf_UserAD = val[4];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectusername" href="javascript:void(0)" >' + Emp_Num + '</a></td>';
                                fragment += '<td><a class="clickselectusername" href="javascript:void(0)" >' + name + '</a></td>';
                                fragment += '<td><a class="clickselectusername" href="javascript:void(0)" >' + dept + '</a></td>';
                                fragment += '<td><a class="clickselectusername" href="javascript:void(0)" >' + Uf_Level + '</a></td>';
                                fragment += '</tr>';
                            });

                        } else { }
                        $("#modalBrowse").modal("show");
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }
            
             function Get_User(search) {
                $("#TBbodyBrowse").empty();
                $("#TBheaderBrowse").empty();
                $("#Titlebrowse").text('Search Employee');
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `<th>EmpNum</th>
                                     <th>Emp Name</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Get_User_PE") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[Site_Ref],[Emp_Num],[sname],[name],[dept],[Uf_Level],[Uf_Location],[Uf_PositionID],[Uf_Jobtitle],[Uf_JobTitleEN],[BUGroup],[BUGroupDesc]
                                var Site_Ref = val[0];
                                var Emp_Num = val[1];
                                var sname = val[2];
                                var name = val[3];
                                var dept = val[4];
                                var Uf_Level = val[5];
                                var Uf_Location = val[6];
                                var Uf_PositionID = val[7];
                                var Uf_Jobtitle = val[8];
                                var Uf_JobTitleEN = val[9];
                                var BUGroup = val[10];
                                var BUGroupDesc = val[11];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_User_Search" href="javascript:void(0)" data-site_ref="' + Site_Ref + ' "data-dept="' + dept + ' "data-Uf_level="' + Uf_Level + '" data-Uf_Location="' + Uf_Location + '"data-uf_positionid="' + Uf_PositionID + '"data-uf_jobtitle="' + Uf_Jobtitle + '" data-uf_JobTitleen="' + Uf_JobTitleEN + '" data-bugroup="' + BUGroup + '" data-bugoupDesc="' + BUGroupDesc + '" >' + Emp_Num + '</a></td>';
                                fragment += '<td><a class="clickselecttext_User_Search" href="javascript:void(0)" data-site_ref="' + Site_Ref + ' "data-dept="' + dept + ' "data-Uf_level="' + Uf_Level + '" data-Uf_Location="' + Uf_Location + '"data-uf_positionid="' + Uf_PositionID + '"data-uf_jobtitle="' + Uf_Jobtitle + '" data-uf_JobTitleen="' + Uf_JobTitleEN + '" data-bugroup="' + BUGroup + '" data-bugoupDesc="' + BUGroupDesc + '" >'  + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }

        </script>
</asp:Content>
