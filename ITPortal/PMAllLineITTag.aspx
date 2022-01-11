<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PMAllLineITTag.aspx.cs" Inherits="ITPortal.PMAllLineITTag" %>

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
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
                <h2>Maintain IT Tag</h2>
            </div>
            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
            </div>
        </div>
    </div>


    <div class="panel-group">
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="col-md-12">
                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label3" class="col-md-3 col-xs-12 " runat="server" Font-Bold="True" Text="Asset of Company"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control max-wide" id="SiteRef">
                                </select>
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Tag Group Name"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="txtITTagGroupName" class="form-control" style="min-width: 100%" autocomplete="off" disabled />
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
                            <asp:Label ID="Label11" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Tag Code"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <%--<div class="input-group">--%>
                                 <input type="text" id="textITTAG" class="form-control" style="min-width: 100%" autocomplete="off"  />
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label13" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Main Type"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <%--<div class="input-group">--%>
                                <select class="form-control max-wide" id="textMaintype">
                                    <option value="">=======Please Select Maintypes=======</option>
                                    <option value="Software">Software</option>
                                    <option value="Hardware">Hardware</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label1" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Status"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <%--<div class="input-group">--%>
                                <select class="form-control max-wide" id="textStatus">
                                    <option value="">=======Please Select Status=======</option>
                                    <option value="Active">Active</option>
                                    <option value="InActive">InActive</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label122" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Type Name"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                 <input type="text" id="textTypeName" class="form-control" style="min-width: 100%" autocomplete="off"   />
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
        <!--panel-default-->
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-hover" id="tableCustomerReport">
                                <thead>
                                    <tr>
                                        <th>Asset of Company</th>
                                        <th>Tag Code</th>
                                        <th>Main Type</th>
                                        <th>Type Name</th>
                                        <th>Start Contact</th>
                                        <th>Expire Contact</th>
                                        <th>Tag Group Name</th>
                                        <th>Usage</th>
                                        <th>Total</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody id="ListCustomerReport">
                                  
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

    <div class="modal fade" id="ModalSearch" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">Search</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <input type="text" class="form-control" id="ListSearch_myInput" placeholder="Search Customer" autocomplete="off" onkeypress="detect_enter_keyboard(event)" style="max-width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="TableListCustomer" class="table table-bordered table-responsive">
                        <thead id="Thead1" runat="server">
                            <tr>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id='TBodySearch'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%--///////////////Search Modal/////////////////--%>

    <div class="modal fade" id="ModalDetail" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title" id="modalHeaderText">Detail</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--Start modal body--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">SiteRef :</label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input id="txtSiteRef" type="text" class="form-control max-wide" disabled>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Tag Code :</label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input id="txtTagCode" type="text" class="form-control max-wide" disabled>
                            </div>
                            <%--   <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Name :</label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input id="2" type="text" class="form-control max-wide" disabled>
                            </div>--%>
                        </div>
                    </div>
                    <%--Line 1--%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Emp Name :</label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input id="txtEmpName" type="text" class="form-control max-wide" disabled>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Band :</label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input id="txtBand" type="text" class="form-control max-wide" disabled>
                            </div>
                        </div>
                    </div>
                    <%--Line 2--%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Model :</label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input id="txtModel" type="text" class="form-control max-wide" disabled>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">ราคา :</label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input id="txtPrice" type="text" class="form-control max-wide" disabled>
                            </div>
                        </div>
                    </div>
                    <%--Line 3--%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">S/N :</label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input id="txtSN" type="text" class="form-control max-wide" disabled>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">CPU :</label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input id="txtCPU" type="text" class="form-control max-wide" disabled>
                            </div>
                        </div>
                    </div>
                    <%--Line 4--%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">RAM :</label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input id="txtRAM" type="text" class="form-control max-wide" disabled>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">HDD :</label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input id="txtHDD" type="text" class="form-control max-wide" disabled>
                            </div>
                        </div>
                    </div>
                    <%--Line 5--%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">WINDOWS :</label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input id="txtWINDOWS" type="text" class="form-control max-wide" disabled>
                            </div>
                        </div>
                    </div>
                    <%--Line 6--%>

                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="form-group">
                                <div class="col-md-3 col-xs-0">
                                    <label class="control-label" style="font-size: 13px">Detail :</label>
                                </div>
                                <div class="col-md-9 col-xs-12">
                                    <textarea class="form-control max-wide" id="txtDetail" rows="3" disabled></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--Line 7--%>
                </div>
                <%--End modal body--%>
                <div class="modal-footer" id="Browsefooter">
                </div>
            </div>
        </div>
    </div>
    <%--End ModalSearchEmp--%>

    <div class="modal fade" id="ModalSearchEmp" role="dialog">
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
    <%--End ModalDetail--%>
    <div class="modal fade" id="ModalSearchITTagGroup" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">Search ITTag Group</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div id="search_box_ITTAGGroup">
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <table class="table table-bordered table-responsive">
                        <thead runat="server">
                            <tr>
                                <th>TagGroup</th>
                                <th>TagGroup Name</th>
                            </tr>
                        </thead>
                        <tbody id='TBodySearchITTagGroup'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%--End BrowseITTAG--%>
    
    <div class="modal fade" id="ModalNoPermission" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                 <h1>ไม่มีสิทธิใช้งาน</h1>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <%--End BrowseITTAG--%>


    <script>
        $(document).ready(function () {
            var tableCustomerReport = $('#tableCustomerReport').DataTable({
                searching: true,
                responsive: true,
                "order": []
            });
            
            var UserPosition =  CheckPermission('ITTAG', 'Maintain ITTAG');
            console.log(UserPosition)
            if (UserPosition != "") {
                GetIT_TAG('', '', '', '', '', '');
                GetSiteRef();
            } else { swal({
                    title: "Error",
                    text: "No Permission!",
                    icon: "error",
                    //button: "!",
                }).then(() => {
                    window.location.href = "./Default.aspx"
                });
                $("button[type^=button]").each(function (index) {
                    $(this).hide();
                });
                $("#IMGUpload").modal("show");
                console.log('noPermission');
                swal({
                    title: "Error",
                    text: "No Permission!",
                    icon: "error",
                    //button: "!",
                }).then(() => {
                    window.location.href = "./Default.aspx"
                });
                $("button[type^=button]").each(function (index) {
                    $(this).hide();
                });
                $("#IMGUpload").modal("show");
                console.log('noPermission');
            }

            $(document).on("click", "#btnSearchReport_Clear", function () {
                
                 $("#txtITTagGroupName").val('');
                  $("#textStatus").val('');
                  $("#textMaintype").val('');
                  $("#textITTAG").val('');
                  $("#textTypeName").val('');
                GetIT_TAG('', '' , '', '','','');
            });

            $(document).on("click", "#btnSearchReport", function () {
                var siteref = $("#SiteRef").val();
                var txtITTagGroupName = $("#txtITTagGroupName").val();
                var textStatus = $("#textStatus").val();
                var txtMaintype = $("#textMaintype").val();
                var textITTAG = $("#textITTAG").val();
                var textTypeName = $("#textTypeName").val();
                GetIT_TAG(siteref, txtITTagGroupName , textStatus,txtMaintype ,textITTAG,textTypeName);
            });
            $("#buttonSearchItTagGroup").on('click', function () {
                var search = "";
                var button = '<input type="text" id="ITTagSearchGroup" placeholder="Search.." class="form-control max-wide" autocomplete="off">';
                $("#search_box_ITTAGGroup").empty();
                $("#search_box_ITTAGGroup").append(button);
                GetBrowseIT_TAGGroup(search);
            });
            $("#buttonSearchEmp").on('click', function () {
                var search = "";
                var button = '<input type="text" id="EmployeeSearch" placeholder="Search.." class="form-control max-wide" autocomplete="off">';
                $("#search_box_Emp").empty();
                $("#search_box_Emp").append(button);
                GetHR_Employee(search);
                $("#ModalSearchEmp").modal("show");
            });

            $(document).on("click", ".selectEmp", function () {
                var Emp_Num = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#txtEmpnum").val(Emp_Num);
                $("#ModalSearchEmp").modal("hide");
            });

            $(document).on("keyup", "#EmployeeSearch", function () {
                var search = $("#EmployeeSearch").val();
                GetHR_Employee(search)
            });
            $(document).on("change", "#ITTagSearchGroup", function () {
                var search = $("#ITTagSearchGroup").val();
                GetBrowseIT_TAGGroup(search)
            });

            //$(document).on("click", ".btnItemDetail", function () {
            //    var tr = $(this).closest("tr");
            //    var site_ref = $(this).closest("tr").find("td:nth-child(1)").text();
            //    //var name =  $(this).closest("tr").find("td:nth-child(2)").text();
            //    var IT_TAG_CODE = $(this).closest("tr").find("td:nth-child(2)").text();
            //    var Fullname = $(this).closest("tr").find("td:nth-child(3)").text();
            //    var IT_TAG_BAND = $(this).closest("tr").find("td:nth-child(4)").text();
            //    var IT_TAG_MODEL = $(this).closest("tr").find("td:nth-child(5)").text();
            //    var IT_TAG_DATE = $(this).closest("tr").find("td:nth-child(6)").text();
            //    var IT_TAG_DETAIL = $(this).attr("data-IT_TAG_DETAIL");
            //    var IT_TAG_PRICE = $(this).attr("data-IT_TAG_PRICE");
            //    var IT_TAG_SN = $(this).attr("data-IT_TAG_SN");
            //    var CPU = $(this).attr("data-CPU");
            //    var RAM = $(this).attr("data-RAM");
            //    var HDD = $(this).attr("data-HDD");
            //    var WINDOWS = $(this).attr("data-WINDOWS");
            //    $("#txtSiteRef").val(site_ref);
            //    //$("#2").val(name);
            //    $("#txtTagCode").val(IT_TAG_CODE);
            //    $("#txtEmpName").val(Fullname);
            //    $("#txtBand").val(IT_TAG_BAND);
            //    $("#txtModel").val(IT_TAG_MODEL);
            //    $("#txtDetail").val(IT_TAG_DETAIL);
            //    $("#txtPrice").val(IT_TAG_PRICE);
            //    $("#txtSN").val(IT_TAG_SN);
            //    $("#txtCPU").val(CPU);
            //    $("#txtRAM").val(RAM);
            //    $("#txtHDD").val(HDD);
            //    $("#txtWINDOWS").val(WINDOWS);
            //    $("#ModalDetail").modal("show");
            //});

            $(document).on('click', '.btnAddNewChild', function () {
                var type = $(this).attr("data-type");
                console.log(type);
                showbtnAdd(type);
            });
            $(document).on("click", ".selectITTagGroup", function () {
                var IT_TAG = $(this).closest("tr").find("td:nth-child(2)").text();
                $("#txtITTagGroupName").val(IT_TAG);
                $("#ModalSearchITTagGroup").modal("hide");
            });
            function GetIT_TAG(siteref, TagGroupName, TAG_Status, Maintype,ITTAG,TypeName) {
                $("#IMGUpload").modal("show");
                tableCustomerReport.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GetIT_TAG_New") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({  Asset_of_Company:siteref,  TagGroupName:TagGroupName,  TAG_Status:TAG_Status,  Maintype:Maintype,ITTAG:ITTAG , TypeName: TypeName}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                               // [IT_Tag_Code], [Tag_Group], [MainType], [TypeName], [TagGroup]
                               //, [TagGroupName], [Tag_Group_Status], [Used], [Volume], [TAG_Status], [Asset_of_Company]
                                var IT_Tag_Code = val[0];
                                var Tag_Group = val[1];
                                var MainType = val[2];
                                var TypeName = val[3];
                                var TagGroup = val[4];
                                var TagGroupName = val[5];
                                var Tag_Group_Status = val[6];
                                var Used = val[7];
                                var Volume = val[8];
                                var TAG_Status = val[9];
                                var Asset_of_Company = val[10];
                                var Start_Contract_date = val[11];
                                var Expire_Contract_date = val[12];
                                tableCustomerReport.row.add([
                                    Asset_of_Company,
                                    '<td><a href="./ITTAG_MaintainITTAG.aspx?ITTAG='+IT_Tag_Code+'">'+IT_Tag_Code+'</a></td>',
                                    MainType,
                                    TypeName,
                                    Start_Contract_date.substr(0,10) ,
                                    Expire_Contract_date.substr(0,10) ,
                                    TagGroupName ,
                                    Used ,
                                    Volume ,
                                    TAG_Status ,
                                ]).draw(false);
                            });
                        }
                        $("#IMGUpload").modal("hide");
                    }
                });
            }

        });

        function GetBrowseIT_TAGGroup(search) {
            $("#TBodySearchITTagGroup").empty();
            var fragment = "";
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/GetIT_TAG_Group_New") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ search: search,  }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var Taggroup = val[0];
                            var TaggroupName = val[1];
                            fragment += '<tr>';
                            fragment += '<td><a href="javascript:void(0)" class="selectITTagGroup">' + Taggroup + '</a></td>';
                            fragment += '<td><a href="javascript:void(0)" class="selectITTagGroup">' + TaggroupName + '</a></td>';
                            fragment += '</tr>';
                        });
                    }
                    $("#TBodySearchITTagGroup").append(fragment);
                }
            });
            $("#ModalSearchITTagGroup").modal("show");
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
        
        function GetSiteRef() {
            var siteRef = '<option value="">=======Please Select a company=======</option>';
            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("default.aspx/GetSite_HRPortal")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var ID = val[0];
                            var company = val[1];
                            siteRef += '<option value="' + ID + '">' + company + '</option>';
                        });
                        $("#SiteRef").append(siteRef);
                    }
                }
            });
        }
    </script>

</asp:Content>
