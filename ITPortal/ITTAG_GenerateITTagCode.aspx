<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ITTAG_GenerateITTagCode.aspx.cs" Inherits="ITPortal.GenerateITTagCode" %>

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

        .red {
            color: red;
            font-size: 18px;
        }

        input[type=checkbox] {
            /* Double-sized Checkboxes */
            -ms-transform: scale(2); /* IE */
            -moz-transform: scale(2); /* FF */
            -webkit-transform: scale(2); /* Safari and Chrome */
            -o-transform: scale(2); /* Opera */
            transform: scale(2);
            padding: 10px;
        }

        /* Might want to wrap a span around your checkbox text */
        .checkboxtext {
            /* Checkbox text */
            font-size: 110%;
            display: inline;
        }
    </style>

    <div class="page-header">
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
            <h2>Generate IT TAG Code</h2>
            </div>

            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                <%--<button id="btnModalNew" class="btn btn-info" type="button" data-toggle="modal">New </button>--%>
                <%--<button id="btnModalNew" class="btn btn-success PositionCheck" type="button" data-toggle="modal" style="float: right">New </button>--%>
            </div>
        </div>
    </div>
    <div class="panel-group">
        <div class="panel-body">
            <div class="row">
                <div id="smartwizard">
                    <ul>
                        <li class="check" data-step="Step1"><a href="#step-1">Select Type</a></li>
                        <li class="check" data-step="Step2"><a href="#step-2">Fill Data</a></li>
                        <li class="check" data-step="Step3"><a href="#step-3">Fill Key</a></li>
                        <li class="check" data-step="Step4"><a href="#step-4">Complete</a></li>
                    </ul>
                    <div class="row">
                        <div id="step-1" class="">
                            <div class="panel-group">
                                <div class="panel panel-default" style="margin-top: 1em;">
                                    <div class="panel-heading">
                                        <h4>Select Type</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <div class="row" style="margin-bottom: 2rem;">
                                                <div class="col-md-12">
                                                    <div class="col-md-2">
                                                        <label class="control-label">TAG Group :</label>
                                                    </div>
                                                    <div class="col-md-10">
                                                        <div class="input-group">
                                                            <input type="text" id="text_TagGroup" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                            <div class="input-group-btn">
                                                                <button class="btn btn-default Browse_modal" type="button" data-type="TagGroup">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-bottom: 2rem;">
                                                <div class="col-md-12">
                                                    <div class="col-md-2">
                                                        <label class="control-label">TAG Group Name :</label>
                                                    </div>
                                                    <div class="col-md-10">
                                                        <input type="text" id="text_TagGroupName" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-bottom: 2rem;">
                                                <div class="col-md-12">
                                                    <div class="col-md-2">
                                                        <label class="control-label">Main Type :</label>
                                                    </div>
                                                    <div class="col-md-10">
                                                        <input type="text" id="text_Maintype" class="text_Maintype form-control max-wide" autocomplete="off" readonly="readonly">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="text-align: right">
                                            <button id="nextPage2" class="btn btn-warning Pos_Worker" type="button"
                                                data-toggle="modal" disabled>
                                                Next</button>
                                        </div>
                                    </div>
                                    <%--End panel-body--%>
                                </div>
                            </div>
                        </div>
                        <%--======End Step 1======--%>
                        <div id="step-2" class="">
                            <div class="panel-group">
                                <div class="panel panel-default" style="margin-top: 1em;">
                                    <div class="panel-heading">
                                        <h4>Fill Data (<span id="Headerfilldata" style="color: red"></span>)</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-md-12 col-sm-12">
                                            <div class="col-md-12" style="margin-bottom: 1em;">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Owner<span class="red">*</span> :</label>
                                                </div>
                                                <div class="col-md-9 date" data-provide="datepicker">
                                                    <select class="form-control max-wide" id="text_Owner">
                                                        <option value="">=== Please Select Owner ===</option>
                                                        <option value="System Administrative">System Administrative</option>
                                                        <option value="Technical Support">Technical Support</option>
                                                        <option value="HelpDesk Support">HelpDesk Support</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12" style="margin-bottom: 1em;">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Purchase Type<span class="red">*</span> :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <select class="form-control max-wide  max-wide" id="stcPurchaseType">
                                                        <option value="">=== Select Purchase Type ===</option>
                                                        <option value="Rent">Rent(เช่า)</option>
                                                        <option value="Purchase">Purchase(ซื้อ)</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12 " style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">Detail<span class="red">*</span> :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <textarea class="form-control max-wide" id="text_Detail" rows="3" cols="10"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12" style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">Brand<span class="red">*</span> :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="text_Brand" class="form-control " style="min-width: 100%" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12" style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">Model<span class="red">*</span> : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="text_Model" class="form-control " style="min-width: 100%" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="col-md-12" style="margin-bottom: 1em;">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Start Contract Date<span class="red">*</span> :</label>
                                                </div>
                                                <div class="col-md-9  date" data-provide="datepicker">
                                                    <div class="input-group">
                                                        <input id="text_Start_Contract_date" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12" style="margin-bottom: 1em;">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Expire Contract date<span class="red">*</span> :</label>
                                                </div>
                                                <div class="col-md-9 date" data-provide="datepicker">
                                                    <div class="input-group">
                                                        <input id="text_Expire_Contract_date" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12 TypeSW" style="margin-bottom: 1em;">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px;">License Volume<span class="red">*</span> :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="number" id="text_LicenseVolume" class="form-control max-wide" autocomplete="off" />
                                                </div>
                                            </div>

                                            <%--Start of HardWare--%>
                                            <div class="col-md-12 col-sm-12 TypeHW" style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">Processor<span class="red">*</span> :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="text_Processor" class="form-control " style="min-width: 100%" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12 TypeHW" style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">CPU Clock<span class="red">*</span> :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="text_CPU" class="form-control " style="min-width: 100%" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12 TypeHW" style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">RAM<span class="red">*</span> :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="text_RAM" class="form-control " style="min-width: 100%" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12 TypeHW" style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">HDD<span class="red">*</span> :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="text_HDD" class="form-control " style="min-width: 100%" autocomplete="off" />
                                                </div>
                                            </div>
                                            <%--End of Hardwhere--%>
                                            <div class="col-md-12 col-sm-12  TypeHW" style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">Tag Volume<span class="red">*</span> :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="number" id="text_TagVolumn" class="form-control " style="min-width: 100%" autocomplete="off" />
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-sm-12 " style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">Status<span class="red">*</span> :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <select class="form-control max-wide" id="text_Status">
                                                        <option value="Active">Active</option>
                                                        <option value="InActive">InActive</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-sm-12 " style="margin-bottom: 1em;">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">PO Number :</label> 
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <input type="text" id="text_PO_Number" class="form-control max-wide" autocomplete="off" >
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-default Browse_modal" type="button" data-type="PONumber">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12" style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">Unit Price :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="text_Price" class="form-control " pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" style="min-width: 100%" autocomplete="off"  />
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12 " style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">Vendor :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                    <input id="text_Vendor" type="text" class="form-control max-wide" autocomplete="off"  style="display:none" disabled>
                                                    <input id="text_Vendor_Name" type="text" class="form-control max-wide" autocomplete="off"  disabled>
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-default Browse_modal" type="button" data-type="Vender">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12 " style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3 ">
                                                    <label class="control-label" style="font-size: 13px">Asset of Company :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <%--<input id="text_AssetCompany" type="text" class="form-control max-wide" autocomplete="off"   >--%>
                                                    <select class="form-control max-wide" id="text_AssetCompany">
                                                        <%--<option value="">=======Please Select a company=======</option>
                                                        <option value="ERP_HA">HEATAWAY COMPANY LIMITED</option>
                                                        <option value="ERP_ID">PT. INDONESIA PATKOL SERVICE</option>
                                                        <option value="ERP_MM">PATKOL MYANMAR COMPANY LIMITED</option>
                                                        <option value="ERP_MY">PATKOL MALAYSIA SDN. BHD.</option>
                                                        <option value="ERP_PH">PATKOL PHILIPPINES CORPORATION</option>
                                                        <option value="ERP_PK">PATKOL PUBLIC COMPANY LIMITED</option>
                                                        <option value="ERP_PKM">PATKOL MANUFACTURING COMPANY LIMITED</option>
                                                        <option value="ERP_PKT">PATKOL TRADING COMPANY LIMITED</option>
                                                        <option value="ERP_SPN">S PANEL COMPANY LIMITED</option>
                                                        <option value="ERP_TG">TYGIENIC COMPANY LIMITED</option>--%>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12 " style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">Asset No. :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="text_AssetNo" class="form-control " style="min-width: 100%" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12 " style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3 ">
                                                    <label class="control-label" style="font-size: 13px">Asset of Date :</label>
                                                </div>
                                                <div class="col-md-9  date" data-provide="datepicker">
                                                    <div class="input-group">
                                                        <input id="text_AssetDate" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off" >
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>


                                            <%--End fill--%>
                                            <div style="text-align: right;">
                                                <button id="nextPage3" class="btn btn-warning" type="button" data-toggle="modal">
                                                    Next</button>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--======End Step 2======--%>
                        <div id="step-3" class="">
                            <div class="panel-group">
                                <div class="panel panel-default" style="margin-top: 1em;">
                                    <div class="panel-heading">
                                        <h4>Fill Key</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div style="max-width: 100%;">
                                            <div class="col-md-12 col-sm-12" id="divfillkey">
                                            </div>
                                        </div>
                                        <div style="text-align: right; margin: 1rem;">
                                            <button id="nextPage4" class="btn btn-warning" type="button"
                                                data-toggle="modal">
                                                Next</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--======End Step 3======--%>
                        <div id="step-4" class="">
                            <div class="panel-group">
                                <div class="panel panel-default" style="margin-top: 1em;">
                                    <div class="panel-heading">
                                        <h4>Complete</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div style="max-width: 100%;">
                                            <div class="col-md-12 col-sm-12" id="divCompletely">
                                                <div class="row">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover table-bordered" id="table_Completely">
                                                            <thead>
                                                                <tr>
                                                                    <th>Tag Code</th>
                                                                    <th>Main type</th>
                                                                    <th>Group</th>
                                                                    <th>Start Contract</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="Tbody_Completely">
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="text-align: right; margin: 1rem;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--======End Step 4======--%>
                    </div>

                </div>
            </div>
        </div>
    </div>




    <div class="modal fade" id="modalBrowseSearch" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-xs" id="modalSize">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4><span  id="Titlebrowse" class="modal-title"></span>  <img src = "images/PATKOL2.gif" id="Logo_BrowseSearch" style="width:30px;height:30px;display:none" /></h4>
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
                    <h4 id="text_po_is_empty" style="text-align: center; display: none">Please input in Textbox for searching PO Number</h4>
                    <table id="TbListBrowse" class="table table-striped table-bordered table-responsive">
                        <thead>
                            <tr class="header" id="TBheaderBrowse">
                                <%-- <th>Column</th>
                                <th>Name</th>
                                <th></th>--%>
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
            SetDatePicker();
            GetSiteRef();
            var UserPosition =  CheckPermission('ITTAG', 'Generate ITTAG');
            console.log(UserPosition) 
            SetPage(UserPosition)

            if (UserPosition != "") {
               
            } else {
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

            //GetLocation();
            $('#smartwizard').smartWizard({
                theme: 'arrows',
                keyNavigation: false,
                showStepURLhash: false,
                selected: 0, //ใส่ 0 จะเริ่มที่ Step แรกสุด
                transitionEffect: 'slide',
                toolbarSettings: { toolbarPosition: 'none', showNextButton: 'false', showPreviousButton: 'false' }
            });

            $(document).on("click", "#text_Maintype", function () {
                CheckinputStep1();
            });

            $(document).on("click", "#nextPage2", function () {
                var text_Maintype = $("#text_Maintype").val();
                var text_TagGroupName = $("#text_TagGroupName").val();
                var text_TagGroup = $("#text_TagGroup").val();
                var sometext = text_Maintype + ' : ' + text_TagGroupName + ' : ' + text_TagGroup;
                ShowfillData(text_Maintype);
                $("#Headerfilldata").text(sometext);
                $('#smartwizard').data('smartWizard').next(1);
            });
            //Check inputStep1

            $(document).on("click", "#nextPage3", function () {
                var stcPurchaseType = $("#stcPurchaseType").val();
                var Maintype = $("#text_Maintype").val();
               //for check sw
                var LicenseVolume = $("#text_LicenseVolume").val();
                var Start_Contract_date = $("#text_Start_Contract_date").val();
                var Owner = $("#text_Owner").val();
                if (Maintype == "Software") {
                    if (Start_Contract_date != "" && LicenseVolume != "" && Owner != "") {
                        $('#smartwizard').data('smartWizard')._showStep(2);
                        fillKey(stcPurchaseType);
                    } else {
                        swal('กรุณากรอกข้อมูลให้ครบถ้วน', ' ', 'error');
                    }
                } else if (Maintype == "Hardware") {
                    InsertHardware();
                }
            });

            $(document).on("click", "#nextPage4", function () {
                var stcPurchaseType = $("#stcPurchaseType").val();
                var text_Maintype = $("#text_Maintype").val();
                var Volume = $("#text_LicenseVolume").val();
                //Sweert alert
                swal({
                    title: 'ยืนยันการสร้าง',
                    text: "ตรวจสอบความถูกต้องของข้อมูล ก่อนยืนยันการสร้าง",
                    icon: 'info',
                    buttons: {
                        cancel: true,
                        confirm: true,
                    },
                }).then(function (confirm) {
                    if (confirm) {
                        swal(
                            'Complete',
                            'สร้าง IT TAG สำเร็จ',
                            'success'
                        );
                        //Check PurcheaseType
                        if (stcPurchaseType == "Purchase") {
                            $('.div_ALLLicense').each(function () {
                                var ProductKey = $(this).find('.fillProductKey').val();
                                var SN = $(this).find('.fillSN').val();
                                console.log('Key: ' + ProductKey);
                                console.log('SN: ' + SN);
                                InsertSoftware(ProductKey, SN, 1);
                                //Insert
                            })
                        } else if (stcPurchaseType == "Rent") {
                            $('.div_ALLLicense').each(function () {
                                var ProductKey = $(this).find('.fillProductKey').val();
                                var SN = $(this).find('.fillSN').val();
                                console.log('Key: ' + ProductKey);
                                console.log('SN: ' + SN);
                                InsertSoftware(ProductKey, SN, Volume);
                                //Insert
                            })
                        }
                        $('#smartwizard').data('smartWizard')._showStep(3);
                    }
                })

            });

            $(document).on("click", ".Browse_modal", function () {
                var fragment = '';
                var fragmentHeader = '';
                var Type = $(this).attr("data-type");

                $("#Titlebrowse").text(Type);
                $("#TBbodyBrowse").empty();
                $("#TBheaderBrowse").empty();
                $("#search_box").empty();
                $("#search_box").append('<input type="text" id="search_' + Type + '" placeholder="Search.." class="form-control max-wide" autocomplete="off">');
                $("#text_po_is_empty").hide();

                if (Type == 'TagGroup') {
                    $("#modalSize").attr("class", "modal-dialog modal-xs");
                    fragmentHeader = `<th>Tag Group</th>
                                     <th>Tag Group Name</th>
                                    <th>Main Type</th>`;
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/Browse_Generate_IT_TAG_Group") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({search: ''  }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var ID = val[0];
                                    var Owner = val[1];
                                    var MainType = val[2];
                                    var TypeName = val[3];
                                    var TagGroup = val[4];
                                    var TagGroupName = val[5];
                                    var Status = val[6];
                                    var ReportSeq = val[7];
                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselecttext_TagGroup" href="javascript:void(0)">' + TagGroup + '</a></td>';
                                    fragment += '<td><a class="clickselecttext_TagGroup" href="javascript:void(0)">' + TagGroupName + '</a></td>';
                                    fragment += '<td><a class="clickselecttext_TagGroup" href="javascript:void(0)">' + MainType + '</a></td>';
                                    fragment += '</tr>';
                                });
                            }
                        }
                    });
                }//End TagGroup
                else if (Type == 'PONumber') {
                    $("#Logo_BrowseSearch").css("display","");
                    $("#IMGUpload").modal("show");
                    ModalPoNumber('');
                }//End PO_Number
                else if (Type == 'Vender') {
                    $("#Logo_BrowseSearch").css("display","");
                    $("#IMGUpload").modal("show");
                    ModalVender('');
                }//End PO_Number

                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("click", ".clickselecttext_PO", function () {
                var tr = $(this).closest("tr");
                var po_num = tr.find("td:nth-child(1)").text();
                var po_line = tr.find("td:nth-child(2)").text();
                var item_cost_conv = tr.find("td:nth-child(3)").text();
                var vend_num = tr.find("td:nth-child(4)").text();
                var vend_name = tr.find("td:nth-child(5)").text();
                var site_ref = tr.find("td:nth-child(6)").text();
                var Uf_AssetNumber = tr.find("td:nth-child(7)").text();
                var AssetDate = tr.find("td:nth-child(8)").text();
                $("#text_PO_Number").val(po_num);
                $("#text_Price").val(item_cost_conv);
                $("#text_Vendor").val(vend_num);
                $("#text_Vendor_Name").val(vend_name);
                $("#text_AssetCompany").val(site_ref);
                $("#text_AssetNo").val(Uf_AssetNumber);
                $("#text_AssetDate").val(AssetDate.substr(0, 10));
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", ".clickselecttext_Vender", function () {
                var tr = $(this).closest("tr");
                var ven_num = tr.find("td:nth-child(1)").text();
                var ven_name = tr.find("td:nth-child(2)").text();
                $("#text_Vendor").val(ven_num);
                $("#text_Vendor_Name").val(ven_name);
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("change", "#search_TagGroup", function () {
                var fragment = '';
                var search = $("#search_TagGroup").val();
                $("#TBbodyBrowse").empty();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Browse_Generate_IT_TAG_Group") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Owner = val[1];
                                var MainType = val[2];
                                var TypeName = val[3];
                                var TagGroup = val[4];
                                var TagGroupName = val[5];
                                var Status = val[6];
                                var ReportSeq = val[7];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_TagGroup" href="javascript:void(0)">' + TagGroup + '</a></td>';
                                fragment += '<td><a class="clickselecttext_TagGroup" href="javascript:void(0)">' + TagGroupName + '</a></td>';
                                fragment += '<td><a class="clickselecttext_TagGroup" href="javascript:void(0)">' + MainType + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });

            });
            $(document).on("change", "#search_PONumber", function () {
                $("#Logo_BrowseSearch").show();
                var fragment = '';
                var search = $("#search_PONumber").val();
                $("#TBbodyBrowse").empty();
                $("#TBheaderBrowse").empty();
                $("#IMGUpload").modal("show");
                ModalPoNumber(search) 

            });

            $(document).on("change", "#search_Vender", function () {
                $("#Logo_BrowseSearch").show();
                var fragment = '';
                var search = $("#search_Vender").val();
                $("#TBbodyBrowse").empty();
                $("#TBheaderBrowse").empty();
                $("#IMGUpload").modal("show");
                ModalVender(search) 
            });

            $(document).on("click", ".clickselecttext_TagGroup", function () {
                var text_TagGroup = $(this).closest("tr").find("td:nth-child(1)").text();
                var TagGroupName = $(this).closest("tr").find("td:nth-child(2)").text();
                var Maintype = $(this).closest("tr").find("td:nth-child(3)").text();
                $("#text_TagGroup").val(text_TagGroup);
                $("#text_TagGroupName").val(TagGroupName);
                $("#text_Maintype").val(Maintype);
                CheckinputStep1();
                $("#modalBrowseSearch").modal("hide");
            });

            //$(document).on("focus", "#text_Price", function () {
            //    $("#text_Price").val(removeCurrency($("#text_Price").val()));
            //});
            //$(document).on("focusout", "#text_Price", function () {
            //    $("#text_Price").val(Currency($("#text_Price").val()));
            //});


        });

        function CheckinputStep1() {
            var text_Maintype = $("#text_Maintype").val();
            var text_TagGroup = $("#text_TagGroup").val();
            if (text_Maintype != '' && text_TagGroup != '') {
                document.getElementById("nextPage2").disabled = false;
                console.log('can do')
            } else {
                document.getElementById("nextPage2").disabled = true;
                console.log('can not')
            }
        }
        function ShowfillData(Maintype) {
            if (Maintype == 'Hardware') {
                $('.TypeHW').show();
                $('.TypeSW').hide();
            } else if (Maintype == 'Software') {
                $('.TypeSW').show();
                $('.TypeHW').hide();
            }
        }
        function SetDatePicker() {
            $('#text_Start_Contract_date').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
            $('#text_Expire_Contract_date').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
            $('#text_AssetDate').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
        }
        function InsertSoftware(ProductKey, SN, Volumn) {
            var IT_Tag_Code = 0;
            var Tag_Group = $("#text_TagGroup").val();
            var Purchase_Type = $("#stcPurchaseType").val();
            var Start_Contract_date = $("#text_Start_Contract_date").val();
            var Expire_Contract_date = $("#text_Expire_Contract_date").val();
            var Detail = $("#text_Detail").val();
            var Brand = $("#text_Brand").val();
            var Model = $("#text_Model").val();
            var Volume = parseInt(Volumn);
            var Status = $("#text_Status").val();
            var SN = SN;
            var Product_Key = ProductKey;
            var PONumber = $("#text_PO_Number").val();
            var UnitPrice = $("#text_Price").val() =="" ? 0: $("#text_Price").val();
            var Vendor = $("#text_Vendor").val();
            var Asset_of_Company = $("#text_AssetCompany").val();
            var Asset_No = $("#text_AssetNo").val();
            var Asset_Date = $("#text_AssetDate").val();
            var Processor = $("#text_Processor").val()
            var CPU_Clock = $("#text_CPU").val();
            var RAM = $("#text_RAM").val();
            var HDD = $("#text_HDD").val();
            var Owner = $("#text_Owner").val();
            //Call => Function Insert
            if (Tag_Group != "" && Start_Contract_date != "" && Start_Contract_date != "" && Volume != "" && Brand != "" && Model != "" && Status != ""  && Owner!="" ) {
                InsertITTAG(IT_Tag_Code, Tag_Group, Purchase_Type, Start_Contract_date, Expire_Contract_date, Detail, Brand, Model, Volume, Status,
                    SN, Product_Key, PONumber, UnitPrice, Vendor, Asset_of_Company, Asset_No, Asset_Date, Processor, CPU_Clock, RAM, HDD,Owner);
            } else {
                swal('Error', 'กรุณากรอกข้อมูลให้ครับถ้วน', 'error');
            }
        }
        function InsertHardware() {
            var IT_Tag_Code = 0;
            var Tag_Group = $("#text_TagGroup").val();
            var Purchase_Type = $("#stcPurchaseType").val();
            var Start_Contract_date = $("#text_Start_Contract_date").val();
            var Expire_Contract_date = $("#text_Expire_Contract_date").val();
            var Detail = $("#text_Detail").val();
            var Brand = $("#text_Brand").val();
            var Model = $("#text_Model").val();
            var Volume = parseInt($("#text_TagVolumn").val());
            var Status = $("#text_Status").val();
            var SN = '';
            var Product_Key = '';
            var PONumber = $("#text_PO_Number").val();
            var UnitPrice = $("#text_Price").val() == "" ? 0: $("#text_Price").val();
            var Vendor = $("#text_Vendor").val();
            var Asset_of_Company = $("#text_AssetCompany").val();
            var Asset_No = $("#text_AssetNo").val();
            var Asset_Date = $("#text_AssetDate").val();
            var Processor = $("#text_Processor").val()
            var CPU_Clock = $("#text_CPU").val();
            var RAM = $("#text_RAM").val();
            var HDD = $("#text_HDD").val();
            var Owner = $("#text_Owner").val();
            //Call => Function Insert
            if (Tag_Group != "" && Start_Contract_date != "" && Brand != "" && Model != "" && Volume != "" && Status != ""  && Owner!=""   ) {
                swal({
                    title: 'ยืนยันการสร้าง',
                    text: "ตรวจสอบความถูกต้องของข้อมูล ก่อนยืนยันการสร้าง",
                    icon: 'info',
                    buttons: {
                        cancel: true,
                        confirm: true,
                    },
                }).then(function (confirm) {
                    if (confirm) {
                        for (i = 0; i < Volume; i++) {
                            InsertITTAG(IT_Tag_Code, Tag_Group, Purchase_Type, Start_Contract_date, Expire_Contract_date, Detail, Brand, Model, '1', Status,
                                SN, Product_Key, PONumber, UnitPrice, Vendor, Asset_of_Company, Asset_No, Asset_Date, Processor, CPU_Clock, RAM, HDD,Owner);
                        }
                        swal(
                            'Complete',
                            'สร้าง IT TAG สำเร็จ',
                            'success'
                        );
                $('#smartwizard').data('smartWizard')._showStep(3);
                    }
                })
            } else {
                swal('Error', 'กรุณากรอกข้อมูลให้ครับถ้วน', 'error');
            }

        }

        function InsertITTAG(IT_Tag_Code, Tag_Group, Purchase_Type, Start_Contract_date, Expire_Contract_date, Detail, Brand, Model, Volume, Status,
            SN, Product_Key, PONumber, UnitPrice, Vendor, Asset_of_Company, Asset_No, Asset_Date, Processor, CPU_Clock, RAM, HDD,Owner) {
            console.log(IT_Tag_Code);
            console.log(Tag_Group);
            console.log(Purchase_Type);
            console.log(Start_Contract_date);
            console.log(Expire_Contract_date);
            console.log(Detail);
            console.log(Brand);
            console.log(Model);
            console.log(Volume);
            console.log(Status);
            console.log(SN);
            console.log(Product_Key);
            console.log(PONumber);
            console.log(UnitPrice);
            console.log(Vendor);
            console.log(Asset_of_Company);
            console.log(Asset_No);
            console.log(Asset_Date);
            console.log(Processor);
            console.log(CPU_Clock);
            console.log(RAM);
            console.log(HDD);
            console.log(Owner);
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/SP_IT_TAG_Master") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({
                    IT_Tag_Code: IT_Tag_Code, Tag_Group: Tag_Group, Purchase_Type: Purchase_Type, Start_Contract_date: Start_Contract_date,
                    Expire_Contract_date: Expire_Contract_date, Detail: Detail, Brand: Brand, Model: Model, Volume: Volume, Status: Status,
                    SN: SN, Product_Key: Product_Key, PONumber: PONumber, UnitPrice: UnitPrice, Vendor: Vendor, Asset_of_Company: Asset_of_Company,
                    Asset_No: Asset_No, Asset_Date: Asset_Date, Processor: Processor, CPU_Clock: CPU_Clock, RAM: RAM, HDD: HDD, Owner: Owner,
                    Inactive_Reason: '', Detail_Reason: '', Inactive_Date: '', Stauts: "Insert"
                }),
                success: function (response) {
                    var ITTAGreturn = response.d;
                    showCompletely(ITTAGreturn);
                    //alert(ITTAGreturn);
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
                        $("#text_AssetCompany").append(siteRef);
                    }
                }
            });
        }
<%--        function GetLocation() {
            var fragment = '<option value="">=======Please Select a Location=======</option>';
            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("default.aspx/GetLocation")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var location = val[0];
                            var desc = val[1];
                            fragment += '<option value="' + location + '">' + location + '</option>';
                            //console.log(response);
                        });
                    $("#text_AssetLocation").append(fragment);
                    }
                }
            });
            
        }--%>

        function ModalPoNumber(search) {
            var fragmentHeader = '';
            var fragment = '';
            $("#modalSize").attr('class', 'modal-dialog modal-lg');
            fragmentHeader = `<th>PO Num</th>
                                     <th>PO Line</th>
                                    <th>Unit Price</th>
                                    <th>Vendor num</th>
                                    <th>Vendor</th>
                                    <th>Asset Company</th>
                                    <th>Asset No.</th>
                                    <th>Asset Date.</th>`;
            if (search != "") {
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/VW_PO_AllSite") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var site_ref = val[0];
                                var po_num = val[1];
                                var po_line = val[2];
                                var item = val[3];
                                var Uf_ItemLongDesc = val[4];
                                var Uf_ExpenseDesc = val[5];
                                var Uf_AssetNumber = val[6];
                                var vend_num = val[7];
                                var vend_name = val[8];
                                var item_cost_conv = val[9];
                                var AssetDate = val[10];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_PO" href="javascript:void(0)">' + po_num + '</a></td>';
                                fragment += '<td><a class="clickselecttext_PO" href="javascript:void(0)">' + po_line + '</a></td>';
                                fragment += '<td><a class="clickselecttext_PO" href="javascript:void(0)">' + item_cost_conv + '</a></td>';
                                fragment += '<td><a class="clickselecttext_PO" href="javascript:void(0)">' + vend_num + '</a></td>';
                                fragment += '<td><a class="clickselecttext_PO" href="javascript:void(0)">' + vend_name + '</a></td>';
                                fragment += '<td><a class="clickselecttext_PO" href="javascript:void(0)">' + site_ref + '</a></td>';
                                fragment += '<td><a class="clickselecttext_PO" href="javascript:void(0)">' + Uf_AssetNumber + '</a></td>';
                                fragment += '<td><a class="clickselecttext_PO" href="javascript:void(0)">' + AssetDate + '</a></td>';
                                fragment += '</tr>';
                            });
                        }else {
                                fragment += '<tr>';
                                fragment += '<td>Not Data</td>';
                                fragment += '<td>Not Data</td>';
                                fragment += '<td>Not Data</td>';
                                fragment += '<td>Not Data</td>';
                                fragment += '<td>Not Data</td>';
                                fragment += '<td>Not Data</td>';
                                fragment += '<td>Not Data</td>';
                                fragment += '<td>Not Data</td>';
                                fragment += '</tr>';

                            }
                    }
                });
                    $("#TBheaderBrowse").append(fragmentHeader);
                    $("#text_po_is_empty").hide();
                } else {
                    $("#text_po_is_empty").show();
                }
            $("#TBbodyBrowse").append(fragment);
            $("#Logo_BrowseSearch").css("display","none");
            $("#IMGUpload").modal("hide");
        }

        function ModalVender(search) {
            var fragmentHeader = '';
            var fragment = '';
            $("#modalSize").attr('class', 'modal-dialog modal-lg');
            fragmentHeader = ` <th>Vendor num</th>
                                <th>Vendor</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/VW_Vendor_All") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var vend_num = val[1];
                                var name = val[2];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_Vender" href="javascript:void(0)">' + vend_num + '</a></td>';
                                fragment += '<td><a class="clickselecttext_Vender" href="javascript:void(0)">' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
            
            
            $("#TBheaderBrowse").append(fragmentHeader);
            $("#TBbodyBrowse").append(fragment);
            $("#Logo_BrowseSearch").css("display","none");
            $("#IMGUpload").modal("hide");
        }

        function fillKey(stcPurchaseType) {
            $("#divfillkey").empty();
            var text_LicenseVolume = $("#text_LicenseVolume").val();
            var fragment = "";
            var num = 1;
            if (stcPurchaseType == "Purchase") {
                for (i = 0; i < text_LicenseVolume; i++) {
                    fragment += `      <div class="col-md-12 col-sm-12 div_ALLLicense" style="margin-bottom: 1em;">
                                                      
                                                    <div class="col-md-6 col-sm-12" style="padding: 0;">
                                                        <div class="col-md-6">
                                                            <label class="control-label" style="font-size: 13px;">Product Key `+ num + `:</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <input type="text" class="fillProductKey form-control " style="min-width: 100%" autocomplete="off" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="col-md-6">
                                                            <label class="control-label" style="font-size: 13px">S/N `+ num + `:</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <input type="text" class="fillSN form-control " style="min-width: 100%" autocomplete="off" />
                                                        </div>
                                                    </div>
                                                </div>`;
                    num++;
                }
            } else if (stcPurchaseType == "Rent") {
                fragment += `      <div class="col-md-12 col-sm-12 div_ALLLicense" style="margin-bottom: 1em;">
                                                      
                                                    <div class="col-md-6 col-sm-12" style="padding: 0;">
                                                        <div class="col-md-6">
                                                            <label class="control-label" style="font-size: 13px;">Product Key `+ num + `:</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <input type="text" class="fillProductKey form-control " style="min-width: 100%" autocomplete="off" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="col-md-6">
                                                            <label class="control-label" style="font-size: 13px">S/N `+ num + `:</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <input type="text" class="fillSN form-control " style="min-width: 100%" autocomplete="off" />
                                                        </div>
                                                    </div>
                                                </div>`;
            }


            $("#divfillkey").append(fragment);
        }


        function showCompletely(ITTAGreturn) {
            var fragment = "";
            var Maintype = $("#text_Maintype").val();
            var group = $("#text_TagGroupName").val();
            var StartDate = $("#text_Start_Contract_date").val();
            fragment += '<tr>'
            fragment += '<td><a href="./ITTAG_MaintainITTAG.aspx?ITTAG=' + ITTAGreturn + '" target="_blank">' + ITTAGreturn + '</a></td>';
            fragment += '<td>' + Maintype + '</td>';
            fragment += '<td>' + group + '</td>';
            fragment += '<td>' + StartDate + '</td>';
            fragment += '</tr>'


            $("#Tbody_Completely").append(fragment);
        }


        function SetinputCurrency() {
            $("input[data-type='currency']").on({
                keyup: function () {
                    formatCurrency($(this));
                },
                blur: function () {
                    formatCurrency($(this), "blur");
                }
            });
        }

        function Currency(input) {
            var check = input.indexOf(".");
            if (check != -1) {
                var value = input.replace(/(\d)(?=(\d{3})+(?!\d)+.+$)/g, '$1,');
            } else {
                var value = input.replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
            }
            return value;
        }

        function removeCurrency(text) {
            return text.replace(/,/g, '');
        }
        function splitCurrency(input) {
            var value = input.split('.');
            var decimal = value[1] ?  (Value[1]).substr(0,2) : 0 ;
            return Currency(value[0] + '.'+ decimal);
        }

    </script>

</asp:Content>
