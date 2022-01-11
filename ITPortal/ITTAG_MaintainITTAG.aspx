<%@ Page Title="Maintain IT TAG" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ITTAG_MaintainITTAG.aspx.cs" Inherits="ITPortal.ITTAG_MaintainITTAG" %>

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
            /*background-color: #f1f1f1;*/
        }

        .red {
            color: red;
            /*font-size: 18px;*/
        }

        .datepicker-container {
            z-index: 1061 !important;
        }

        .over-volumn {
            color: #b71c1c;
            /*font-size: 18px;*/
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
                <h2>Maintain IT TAG</h2>
            </div>

            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                <button id="btnSave_ITTAG" data-type="Accessories" data-nametype="Accessories" class="btn btn-success Pos_Worker" type="button">Save</button>
            </div>
        </div>
    </div>

    <div class="panel-group">
        <div class="panel panel-primary nav-tab " style="margin-top: 2em;">
            <div class="panel-heading">
                <h3 style="margin-left: 5px;">IT TAG : <span id="TitleITTAG"></span></h3>
            </div>
            <div class="panel-body ">
                <ul class="nav nav-tabs">
                    <li class="nav-item active">
                        <a href="#TABGeneral" class="nav-link" role="tab" data-toggle="tab">General</a>
                    </li>
                    <li class="nav-item">
                        <a href="#TABPO" class="nav-link" data-toggle="tab" role="tab">PO</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" role="tabpanel" id="TABGeneral">
                        <div class="panel-group">
                            <div class="panel  panel-default">
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="row form-group">
                                            <div class="col-md-12" style="margin-bottom: 1em;">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Owner :</label>
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
                                                    <label class="control-label" style="font-size: 13px">Purchase Type :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <select class="form-control max-wide  max-wide" id="stcPurchaseType" disabled>
                                                        <option value="">=== Select Purchase Type ===</option>
                                                        <option value="Rent">Rent(เช่า)</option>
                                                        <option value="Purchase">Purchase(ซื้อ)</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12 " style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">Detail :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <textarea class="form-control max-wide" id="text_Detail" rows="3" cols="10"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12" style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">Brand :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="text_Brand" class="form-control " style="min-width: 100%" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12" style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">Model : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="text_Model" class="form-control " style="min-width: 100%" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="col-md-12" style="margin-bottom: 1em;">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Start Contract Date :</label>
                                                </div>
                                                <div class="col-md-9  date" data-provide="datepicker">
                                                    <div class="input-group">
                                                        <input id="text_Start_date" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off" disabled>
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12" style="margin-bottom: 1em;">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Expire Contract date :</label>
                                                </div>
                                                <div class="col-md-9 date" data-provide="datepicker">
                                                    <div class="input-group">
                                                        <input id="text_End_date" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>

                                            <%--Start of HardWare--%>
                                            <div class="col-md-12 col-sm-12 TypeHW" style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">Processor :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="text_Processor" class="form-control " style="min-width: 100%" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12 TypeHW" style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">CPU Clock :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="text_CPU" class="form-control " style="min-width: 100%" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12 TypeHW" style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">RAM :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="text_RAM" class="form-control " style="min-width: 100%" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12 TypeHW" style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">HDD :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="text_HDD" class="form-control " style="min-width: 100%" autocomplete="off" />
                                                </div>
                                            </div>
                                            <%--End of Hardwhere--%>

                                            <div class="col-md-12 col-sm-12" style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">Volume :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="text_Volumn" class="form-control " style="min-width: 100%" autocomplete="off" disabled />
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-sm-12 " style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">Status :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <select class="form-control max-wide" id="text_Status">
                                                        <option value="Active">Active</option>
                                                        <option value="InActive">InActive</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div id="div_Status_InActive">
                                            <div class="col-md-12 col-sm-12 " style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">InActive Reason :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <select class="form-control max-wide" id="text_Inactive_Reason">
                                                        <option value="">=== Plase Select InActive Reason ===</option>
                                                        <option value="ตัดทรัพย์สิน">ตัดทรัพย์สิน / Write Off </option>
                                                        <option value="ขายทรัพย์สิน">ขายทรัพย์สิน / Sell Fixed Assets</option>
                                                        <option value="บริจาคทรัพย์สิน">บริจาคทรัพย์สิน / Donate Fixed Assets</option>
                                                        <option value="หมดสัญญาเช่า">หมดสัญญาเช่า / End of Contract</option>
                                                        <option value="ทรัพย์สินสูญหาย">ทรัพย์สินสูญหาย / Lost Fixed Assets</option>
                                                        <option value="ทรัพย์สินชำรุด">ทรัพย์สินชำรุด / Damaged Fixed Assets</option>
                                                        <option value="อุปกรณ์ไม่พร้อมใช้งาน">อุปกรณ์ไม่พร้อมใช้งาน / The device is not available</option>
                                                    </select>
                                                </div>
                                            </div>
                                                <div class="col-md-12 col-sm-12 " style="margin-bottom: 1em;">
                                                    <div class="col-md-3 col-sm-3">
                                                        <label class="control-label" style="font-size: 13px">Detail Reason :</label>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <input type="text" id="text_Inactive_Detail" class="form-control " style="min-width: 100%" autocomplete="off" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12 col-sm-12 " style="margin-bottom: 1em;">
                                                    <div class="col-md-3 col-sm-3">
                                                        <label class="control-label" style="font-size: 13px">InActive Date :</label>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <input type="text" id="text_Inactive_Date" class="form-control " style="min-width: 100%" autocomplete="off" />
                                                    </div>
                                                </div>
                                            </div>
                                                <div class="col-md-12 col-sm-12 " style="margin-bottom: 1em;">
                                                    <div class="col-md-3 col-sm-3">
                                                        <label class="control-label" style="font-size: 13px">S/N :</label>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <input type="text" id="text_SN" class="form-control " style="min-width: 100%" autocomplete="off" />
                                                    </div>
                                                </div>
                                            <div class="col-md-12 col-sm-12 " style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">Product Key :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="text_Product_Key" class="form-control " style="min-width: 100%" autocomplete="off" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--================End Tab 1====================-->
                    <div class="tab-pane fade" role="tabpanel" id="TABPO">
                        <div class="panel-group">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="row form-group">
                                            <div class="col-md-12 col-sm-12 " style="margin-bottom: 1em;">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">PO Number :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <input type="text" id="text_PO_Number" class="form-control max-wide" autocomplete="off" disabled>
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
                                                    <input type="text" id="text_Price" class="form-control " pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type='currency' style="min-width: 100%" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12 " style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3">
                                                    <label class="control-label" style="font-size: 13px">Vendor :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <input id="text_Vendor" type="text" class="form-control max-wide" autocomplete="off" style="display: none" disabled>
                                                        <input id="text_Vendor_Name" type="text" class="form-control max-wide" autocomplete="off" disabled>
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-default Browse_modal" type="button" data-type="Vender_PO">
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
                                                    <%--<input id="text_AssetCompany" type="text" class="form-control max-wide" autocomplete="off"  >--%>
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
                                                    <input type="text" id="text_AssetNo" class="form-control " style="min-width: 100%" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12 " style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3 ">
                                                    <label class="control-label" style="font-size: 13px">Asset of Date :</label>
                                                </div>
                                                <div class="col-md-9  date" data-provide="datepicker">
                                                    <div class="input-group">
                                                        <input id="text_AssetDate" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--================End Tab 2====================-->
                </div>
            </div>
        </div>
    </div>


    <!---------End Group---------->
    <div class="panel-group">
        <div class="panel nav-tab panel-default" style="margin-top: 2em;">
            <div class="panel-heading" id="divTab">
                <ul class="nav nav-tabs">
                    <li class="nav-item active">
                        <a href="#TAB1" class="nav-link disabled-tab" role="tab" data-toggle="tab">ผู้ครอบครอง</a>
                    </li>
                    <li class="nav-item">
                        <a href="#TAB2" class="nav-link disabled-tab" data-toggle="tab" role="tab">ข้อมูลซ่อมบำรุง</a>
                    </li>
                    <li class="nav-item">
                        <a href="#TAB3" class="nav-link disabled-tab" data-toggle="tab" role="tab">Accessories.</a>
                    </li>
                    <li class="nav-item">
                        <a href="#TAB4" class="nav-link disabled-tab" data-toggle="tab" role="tab">Peripheral.</a>
                    </li>
                </ul>

                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane active" role="tabpanel" id="TAB1">
                            <div class="panel-group">
                                <div class="panel  panel-primary">
                                    <div class="panel-heading">
                                        <h4 style="font-weight: bold;">ข้อมูลครอบครอง</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-bordered" id="table_PE">
                                                        <thead>
                                                            <tr>
                                                                <th>Emp Num</th>
                                                                <th>Name</th>
                                                                <th>Cost Center</th>
                                                                <th>Start date</th>
                                                                <th>Borrow Due date</th>
                                                                <th>Return date</th>
                                                                <th>Status</th>
                                                                <th>Tag code</th>
                                                                <th>Tag Group Name</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="List_owner">
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--================End Tab Car_owner ข้อมูลผู้ครอบครอง=====================-->
                        <div class="tab-pane fade" role="tabpanel" id="TAB2">
                            <div class="panel-group">
                                <div class="panel  panel-primary">
                                    <div class="panel-heading">
                                        <h4 style="font-weight: bold;">ข้อมูลซ่อมบำรุง</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-md-12">
                                            <div class="row form-group">
                                                <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                                </div>
                                                <div class="col-md-8 col-xs-8" style="text-align: right">
                                                    <button class="btn btn-success btnModal_MA Pos_Worker" data-type="Car_MA" data-nametype="ข้อมูลซ่อมบำรุง" data-action="New" type="button">New</button>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-bordered" id="table_MA">
                                                        <thead>
                                                            <tr>
                                                                <th>Vendor Name</th>
                                                                <th>Case Number</th>
                                                                <th>Repair date</th>
                                                                <th>Commit date</th>
                                                                <th>Price</th>
                                                                <th>Detail</th>
                                                                <th>Return date</th>
                                                                <th>Status</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="List_MA">
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--================End Tab Car_Tax =====================-->

                        <div class="tab-pane fade" role="tabpanel" id="TAB3">
                            <div class="panel-group">
                                <div class="panel  panel-primary">
                                    <div class="panel-heading">
                                        <h4 style="font-weight: bold;">Accessories.</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-md-12">

                                            <div class="row form-group">
                                                <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                                </div>
                                                <div class="col-md-8 col-xs-8" style="text-align: right">
                                                    <button class="btn btn-success btnModal_Acc Pos_Worker" data-nametype="Accessories" data-action="New" type="button">New</button>
                                                </div>
                                            </div>
                                            <div class="row  form-group">
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-bordered" id="table_Accessories">
                                                        <thead>
                                                            <tr>
                                                                <th>Name</th>
                                                                <th>Date</th>
                                                                <th>Detail</th>
                                                                <th>Price</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="List_Accessories">
                                                            <tr>
                                                                <td>Ram16GB</td>
                                                                <td>06/03/2021</td>
                                                                <td>Ram 16 GB DDR3</td>
                                                                <td>2,000.00</td>
                                                                <td>
                                                                    <button type="button" class="btn btn-warning btnModal_Acc" data-acc_id="01" data-nametype="Accessories" data-action="Edit">Edit</button></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" role="tabpanel" id="TAB4">
                            <div class="panel-group">
                                <div class="panel  panel-primary">
                                    <div class="panel-heading">
                                        <h4 style="font-weight: bold;">Peripheral.(<span id="Title_Peripheral"></span>)</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-md-12">

                                            <div class="row form-group">
                                                <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                                </div>
                                                <div class="col-md-8 col-xs-8" style="text-align: right">
                                                    <button class="btn btn-success btnModal_Peripheral Pos_Worker" data-nametype="Peripheral" data-action="New" type="button">New</button>
                                                </div>
                                            </div>
                                            <div class="row  form-group">
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-bordered" id="table_Peripheral">
                                                        <thead>
                                                            <tr>
                                                                <th>Main Type</th>
                                                                <th>Tag Code</th>
                                                                <th>Tag Group Name</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="List_Peripheral">
                                                        </tbody>
                                                    </table>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--End Tab PE,MA,ACc--%>

    <div class="modal fade" id="ModalMA" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-lg" style="width: 90%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title" id="ModalTitleMA"></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">

                            <button type="button" class="btn btn-warning" id="btnSaveMA">Save</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 38em; max-width: 100%;">
                    <div class="panel-group">
                        <div class="col-md-7">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 style="font-weight: bold;">ข้อมูลบำรุงรักษา</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="row ">
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Vendor ID : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <input type="text" id="MA_ID" style="display: none" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                        <input type="text" id="MA_Vendor_Num" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-default Browse_modal" type="button" data-type="Vender">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Vendor : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="MA_Vender" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                </div>
                                            </div>
                                            <div class="col-md-12 form-group" style="display: none">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Vendor Site : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="MA_Vender_site_ref" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                </div>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">PO/Case Number : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input id="MA_PoNumber" type="text" class="form-control max-wide" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Repair date : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <input id="MA_RepairDate" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Commit date : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <input id="MA_CommitDate" class="form-control notText max-wide checkStatus" placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Price : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input id="MA_Price" data-type='currency' type="text" class="form-control max-wide" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Detail : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input id="MA_Detail" type="text" class="form-control max-wide" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Return date : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <input id="MA_ReturnDate" class="form-control notText max-wide checkStatus" placeholder="dd/mm/yyyy" type="text" autocomplete="off" disabled>
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Status : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <select class="form-control max-wide" id="MA_Status">
                                                        <option value="">=== กรุณาเลือก Stauts ===</option>
                                                        <option value="Repairing">Repairing</option>
                                                        <option value="Returned">Returned</option>
                                                    </select>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-md-12 ">
                                            <div class="col-md-4 col-xs-4" style="text-align: left;">
                                                <h4 style="font-weight: bold;">แนบเอกสาร</h4>
                                            </div>
                                            <div class="col-md-8 col-xs-8" style="text-align: right">
                                                <input type="file" id="addAttachMA" accept="application/pdf,image/jpg, image/jpeg,image/png" class="form-control max-wide EmpImg inputFile att-margin" style="display: none;">
                                                <button type="button" class="btn btn-info" style="width: 50px;" onclick="document.getElementById('addAttachMA').click();"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="row form-group">
                                            <table class="table  table-striped">
                                                <thead>
                                                </thead>
                                                <tbody id="ListAttachMA">
                                                </tbody>
                                                <tbody id="ListAttachMA_OLD">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--Modal Body --%>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <%--End Modal MA--%>

    <div class="modal fade" id="ModalAcc" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-lg" style="margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-7 col-lg-7 col-sm-12">
                            <h4 class="modal-title" id="ModalTitleAcc"></h4>
                        </div>
                        <div class="col-md-5 col-lg-5 col-sm-12" style="text-align: right;">

                            <button type="button" class="btn btn-warning" id="btnSaveAcc">Save</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 30em; max-width: 100%;">
                    <div class="panel-group">
                        <div class="col-md-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 style="font-weight: bold;">Accessories</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Name : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input id="Acc_ID" type="text" class="form-control max-wide" autocomplete="off" disabled style="display: none">
                                                    <input id="Acc_Name" type="text" class="form-control max-wide" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Date : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <input id="Acc_Date" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Price : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input id="Acc_Price" data-type='currency' type="text" class="form-control max-wide" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Detail : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input id="Acc_Detail" type="text" class="form-control max-wide" autocomplete="off">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--Modal Body --%>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <%--End Modal Acc--%>
    <div class="modal fade" id="ModalPeripheral" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-lg" style="margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-7 col-lg-7 col-sm-12">
                            <h4 class="modal-title" id="ModalTitlePeripheral"></h4>
                        </div>
                        <div class="col-md-5 col-lg-5 col-sm-12" style="text-align: right;">

                            <button type="button" class="btn btn-warning" id="btnSavePeripheral">Save</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 30em; max-width: 100%;">
                    <div class="panel-group">
                        <div class="col-md-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 style="font-weight: bold;">Peripheral</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="row">

                                            <input type="text" id="PP_ID" class="form-control max-wide" autocomplete="off" readonly="readonly" style="display: none">
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Peripheral ITTAG  : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <input type="text" id="PP_IT_TAG_Code_Sub" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-default Browse_modal" type="button" data-type="PP_ITTAG">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--Modal Body --%>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <%--End Modal Acc--%>


    <div class="modal fade" id="modalBrowseSearch" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg" id="modalSize">
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

            var UserPosition = CheckPermission('ITTAG', 'Maintain ITTAG');
            console.log(UserPosition)

            var ITTAG = getAllUrlParams("ITTAG");
            GetSiteRef();
            if (UserPosition != "") {
                GetTableAcc(ITTAG)
                SetinputCurrency();
                SetDatePicker();
                GET_TB_IT_TAG_MA(ITTAG);
                VW_IT_TAG_Peripheral(ITTAG);
                VW_IT_TAG_PE_ALL(ITTAG);
                GETITTAG(ITTAG);
                SetPage(UserPosition);
                ShowInActive_Reason();
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



            //var text_TagGroupName = $("#text_TagGroupName").val();
            //var text_TagGroup = $("#text_TagGroup").val();
            //var sometext = text_Maintype + ' : ' + text_TagGroupName + ' : ' + text_TagGroup;
            //ShowfillData(text_Maintype);
            //$("#Headerfilldata").text(sometext);


            var table_PE = $("#table_PE").DataTable({
                searching: false,
                lengthChange: false
            });
            var table_MA = $('#table_MA').DataTable({
                searching: false,
                lengthChange: false
            });
            var table_Accessories = $('#table_Accessories').DataTable({
                searching: false,
                lengthChange: false
            });



            $(document).on("click", ".btnModal_MA", function () {
                //var MA_ID = $(this).attr('data-id');
                //$("#MA_ID").val(MA_ID);
                var action = $(this).attr("data-action");
                var nametype = $(this).attr("data-nametype");
                $("#ModalTitleMA").text(action + ": " + nametype);
                $("#ListAttachMA").empty();
                if (action == "New") {
                    $("#MA_ReturnDate").prop("disabled", true);
                    $("#MA_ID").val(0);
                    $("#MA_Vendor_Num").val('');
                    $("#MA_Vender_site_ref").val('');
                    $("#MA_Vender").val('');
                    $("#MA_PoNumber").val('');
                    $("#MA_RepairDate").val('');
                    $("#MA_CommitDate").val('');
                    $("#MA_Price").val('0');
                    $("#MA_Detail").val('');
                    $("#MA_ReturnDate").val('');
                    $("#MA_Status").val('Repairing');
                } else if (action == "Edit") {
                    $("#MA_ReturnDate").prop("disabled", false);
                    SetDatePicker();//Call อีกครั้งเพื่อให้function Datetime โชว์ด้านบน
                    var MA_ID = $(this).attr("data-ma_id");
                    var Vendor_Num = $(this).attr("data-vendor_num");
                    var po_case_number = $(this).attr("data-po_case_number");
                    var Vender_site_ref = $(this).attr("data-vender_site_ref");
                    var t1 = $(this).closest("tr").find("td:nth-child(1)").text();
                    var t2 = $(this).closest("tr").find("td:nth-child(2)").text();
                    var t3 = $(this).closest("tr").find("td:nth-child(3)").text();
                    var t4 = $(this).closest("tr").find("td:nth-child(4)").text();
                    var t5 = $(this).closest("tr").find("td:nth-child(5)").text();
                    var t6 = $(this).closest("tr").find("td:nth-child(6)").text();
                    var t7 = $(this).closest("tr").find("td:nth-child(7)").text();
                    var t8 = $(this).closest("tr").find("td:nth-child(8)").text();
                    //console.log(t1);
                    $("#MA_ID").val(MA_ID);
                    $("#MA_Vendor_Num").val(Vendor_Num);
                    $("#MA_Vender").val(t1);
                    $("#MA_Vender_site_ref").val(Vender_site_ref);
                    $("#MA_PoNumber").val(po_case_number);
                    $("#MA_RepairDate").val(t3);
                    $("#MA_CommitDate").val(t4);
                    $("#MA_Price").val(t5);
                    $("#MA_Detail").val(t6);
                    $("#MA_ReturnDate").val(t7);
                    $("#MA_Status").val(t8);
                }

                GETITTAG_MA_IMAGE(MA_ID)
                $("#ModalMA").modal("show");
            });
            $(document).on("click", ".btnModal_Acc", function () {
                //var MA_ID = $(this).attr('data-id');
                //$("#MA_ID").val(MA_ID);
                //GETPATAG_MA_IMAGE(MA_ID)
                var action = $(this).attr("data-action");
                var nametype = $(this).attr("data-nametype");
                $("#ModalTitleAcc").text(action + ": " + nametype);
                $("#ListAttachAcc").empty();
                if (action == "New") {
                    console.log("New Acc")
                    $("#Acc_ID").val(0);
                    $("#Acc_Name").val('');
                    $("#Acc_Date").val('');
                    $("#Acc_Detail").val('');
                    $("#Acc_Price").val('');

                } else if (action == "Edit") {
                    var t1 = $(this).closest("tr").find("td:nth-child(1)").text();
                    var t2 = $(this).closest("tr").find("td:nth-child(2)").text();
                    var t3 = $(this).closest("tr").find("td:nth-child(3)").text();
                    var t4 = $(this).closest("tr").find("td:nth-child(4)").text();
                    var Acc_ID = $(this).attr("data-Acc_ID");
                    //console.log(Acc_ID);
                    removeCurrency(t4);
                    $("#Acc_Name").val(t1);
                    $("#Acc_Date").val(t2);
                    $("#Acc_Detail").val(t3);
                    $("#Acc_Price").val(t4);
                    $("#Acc_ID").val(Acc_ID);

                }
                $("#ModalAcc").modal("show");
            });

            $(document).on("click", ".btnModal_Peripheral", function () {

                var action = $(this).attr("data-action");
                var nametype = $(this).attr("data-nametype");
                $("#ModalTitlePeripheral").text(action + ": " + nametype + "(" + ITTAG + ")");
                $("#ListAttachPeripheral").empty();
                if (action == "New") {
                    $("#PP_IT_TAG_Code_Sub").val('');
                    $("#PP_ID").val(0);

                }
                //else if (action == "Edit") {
                //    var t1 = $(this).closest("tr").find("td:nth-child(1)").text();
                //    var PP_ID = $(this).attr("data-pp_id");
                //    $("#PP_IT_TAG_Code_Sub").val(t1);
                //    $("#PP_ID").val(PP_ID);
                //}
                $("#ModalPeripheral").modal("show");
            });
            $(document).on("click", ".btnDelete_Peripheral", function () {
                var ID = $(this).attr("data-pp_id");
                var t1 = $(this).closest("tr").find("td:nth-child(1)").text();
                swal({
                    title: 'ยืนยันการลบข้อมูล ?',
                    text: " ",
                    icon: 'warning',
                    buttons: {
                        cancel: true,
                        confirm: true,
                    },
                }).then(function (confirm) {
                    if (confirm) {
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_IT_TAG_Peripheral") %>",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                data: JSON.stringify({ ID: ID, IT_TAG_Code_Main: ITTAG, IT_TAG_Code_Sub: t1 }),
                                success: function (response) {
                                    swal(
                                        'Complete',
                                        'ลบ Peripheral(' + t1 + ') สำเร็จ',
                                        'success'
                                    );
                                    VW_IT_TAG_Peripheral(ITTAG);
                                }
                            });
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
                $("#text_po_is_empty").hide();
                $("#search_box").append('<input type="text" id="search_' + Type + '" placeholder="Search.." class="form-control max-wide" autocomplete="off">');
                if (Type == 'Vender') {
                    VW_Vendor_All('');
                }//End BrowseTagGroup
                else if (Type == 'Vender_PO') {
                    VW_Vendor_All_PO('');
                }//End BrowseTagGroup
                else if (Type == 'PONumber') {
                    ModalPoNumber('');
                }//End PO_Number
                else if (Type == 'PP_ITTAG') {
                    Peripheral_Code_Sub('');
                }//End Peripheral
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("change", ".checkStatus", function () {
                var CommitDate = $("#MA_CommitDate").val();
                var ReturnDate = $("#MA_ReturnDate").val();
                if (CommitDate != "") {
                    $("#MA_Status").val("Repairing")
                }
                if (ReturnDate != "") {
                    $("#MA_Status").val("Returned")
                }
            });

            $(document).on("change", "#text_Status", function () {
                ShowInActive_Reason();
            });

            $(document).on("change", "#search_PP_ITTAG", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                Peripheral_Code_Sub(search);
            });

            $(document).on("change", "#search_PONumber", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                console.log(search);
                ModalPoNumber(search);
                $("#modalBrowseSearch").modal("show");
            });
            $(document).on("change", "#search_Vender", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                console.log(search);
                VW_Vendor_All(search);
                $("#modalBrowseSearch").modal("show");
            });
            $(document).on("change", "#search_Vender_PO", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                console.log(search);
                VW_Vendor_All_PO(search);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("click", "#btnSave_ITTAG", function () {
                var IT_Tag_Code = ITTAG;
                var Tag_Group = '';
                var Purchase_Type = $("#stcPurchaseType").val();
                var Start_Contract_date = $("#text_Start_date").val();
                var Expire_Contract_date = $("#text_End_date").val();
                var Detail = $("#text_Detail").val();
                var Brand = $("#text_Brand").val();
                var Model = $("#text_Model").val();
                var Volume = parseInt($("#text_Volumn").val());
                var Status = $("#text_Status").val();
                var Inactive_Reason = $("#text_Inactive_Reason").val();
                var Detail_Reason = $("#text_Inactive_Detail").val();
                var Inactive_Date = $("#text_Inactive_Date").val();


                var SN = $("#text_SN").val();
                var Product_Key = $("#text_Product_Key").val();
                var PONumber = $("#text_PO_Number").val();
                var UnitPrice = $("#text_Price").val() ? $("#text_Price").val() : 0;

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
                InsertITTAG(IT_Tag_Code, Tag_Group, Purchase_Type, Start_Contract_date, Expire_Contract_date, Detail, Brand, Model, Volume, Status,
                    SN, Product_Key, PONumber, removeCurrency(UnitPrice), Vendor, Asset_of_Company, Asset_No, Asset_Date, Processor, CPU_Clock, RAM, HDD,
                    Inactive_Reason,Detail_Reason,Inactive_Date, Owner);
            });

            $("#btnSaveMA").on("click", function () {
                var ID = $("#MA_ID").val();
                var IT_TAG_Code = ITTAG;
                var Vendor_Num = $("#MA_Vendor_Num").val();
                var Vendor_Site_ref = $("#MA_Vender_site_ref").val();
                var PO_Case_Number = $("#MA_PoNumber").val();
                var Repair_Date = $("#MA_RepairDate").val();
                var Commit_Date = $("#MA_CommitDate").val();
                var Return_Date = $("#MA_ReturnDate").val();
                var Price = $("#MA_Price").val();
                var Detail = $("#MA_Detail").val();
                var Status = $("#MA_Status").val();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_IT_TAG_MA") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        ID: ID, IT_TAG_Code: IT_TAG_Code, Vendor_Num: Vendor_Num, Vendor_Site_ref: Vendor_Site_ref, PO_Case_Number: PO_Case_Number, Repair_Date: Repair_Date
                        , Commit_Date: Commit_Date, Return_Date: Return_Date, Price: removeCurrency(Price), Detail: Detail, Status: Status
                    }),
                    success: function (response) {
                        var ID = response.d;
                        swal(
                            'Complete',
                            'บันทึก MA สำเร็จ',
                            'success'
                        );
                        saveAttachMA(ITTAG, ID);
                        GET_TB_IT_TAG_MA(ITTAG)
                        $("#ModalAcc").modal("hide");
                    }
                });

                $("#ModalMA").modal("hide");
            });

            $("#btnSaveAcc").on("click", function () {
                var ID = $("#Acc_ID").val();
                var Name = $("#Acc_Name").val();
                var Detail = $("#Acc_Detail").val();
                var Price = $("#Acc_Price").val();
                var Date = $("#Acc_Date").val();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_IT_TAG_Accessory") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, Name: Name, Detail: Detail, Price: removeCurrency(Price), Date: Date, IT_TAG_Code: ITTAG }),
                    success: function (response) {
                        saveAttachAcc('IT001', 001);
                        swal(
                            'Complete',
                            'บันทึก Accessories สำเร็จ',
                            'success'
                        );
                        GetTableAcc(ITTAG);
                        $("#ModalAcc").modal("hide");
                    }
                });

            });
            $("#btnSavePeripheral").on("click", function () {
                var ID = $("#PP_ID").val();
                var IT_TAG_Code_Sub = $("#PP_IT_TAG_Code_Sub").val();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_IT_TAG_Peripheral") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, IT_TAG_Code_Main: ITTAG, IT_TAG_Code_Sub: IT_TAG_Code_Sub }),
                    success: function (response) {
                        swal(
                            'Complete',
                            'บันทึก Peripheral สำเร็จ',
                            'success'
                        );
                        VW_IT_TAG_Peripheral(ITTAG);
                        $("#ModalPeripheral").modal("hide");
                    }
                });

            });

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


            //=============== Attach file==================
            var filenum_MA = 1;
            $(document).on("change", "#addAttachMA", function () {
                var fragment = '';
                var clone = $("#addAttachMA").clone();
                var filename = clone[0].files[0]["name"];
                clone.attr("id", "XXXXXXX" + filenum_MA);
                //console.log(filename);
                fragment += '<tr>';
                fragment += '<td>' + filename + '</td> ';
                fragment += '<td id="fileMA' + filenum_MA + '"></td> ';
                fragment += '<td><button type="button" class="btn btn-danger att-margin" onclick="deleteRow(this)" ><i class="glyphicon glyphicon-trash" aria-hidden="true" style="color:white"></i></button></td>';
                fragment += '</tr>';
                $('#ListAttachMA').append(fragment);
                $("#fileMA" + filenum_MA).append(clone);
                filenum_MA++;
            });

            var filenum_Acc = 1;
            $(document).on("change", "#addAttachAcc", function () {
                var fragment = '';
                var clone = $("#addAttachAcc").clone();
                var filename = clone[0].files[0]["name"];
                clone.attr("id", "XXXXXXX" + filenum_Acc);
                //console.log(filename);
                fragment += '<tr>';
                fragment += '<td>' + filename + '</td> ';
                fragment += '<td id="fileAcc' + filenum_Acc + '"></td> ';
                fragment += '<td><button type="button" class="btn btn-danger att-margin" onclick="deleteRow(this)" ><i class="glyphicon glyphicon-trash" aria-hidden="true" style="color:white"></i></button></td>';
                fragment += '</tr>';
                $('#ListAttachAcc').append(fragment);
                $("#fileAcc" + filenum_Acc).append(clone);
                filenum_Acc++;
            });
            function saveAttachMA(ITTAG, MA_ID) {
                var arrName = [];
                var num = "(copy)";
                //var ITTAG = ITTAG;
                var floderName = ITTAG + '\\MA\\' + MA_ID; // Set id/floder
                $("#ListAttachMA tr").each(function () {
                    if ($(this).find("td:nth-child(2)").find("input[type=file]").val() != "") {
                        var image = $(this).find("td:nth-child(2)").find("input[type=file]")[0].files[0];
                        var imgName = $(this).find("td:nth-child(2)").find("input[type=file]")[0].files[0]["name"];
                        var PATH = "..\\ITTAG_Attach\\" + ITTAG + "\\MA\\" + MA_ID + "\\" + imgName;
                        if (arrName.includes(imgName)) {
                            arrName.push(imgName);
                            imgName = imgName + num;
                        } else {
                            arrName.push(imgName);
                        }
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_IT_TAG_MA_IMG")%>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ ID: 0, MA_ID: MA_ID, Path: PATH, Detail: '' }),
                            success: function (response) {
                                insertFileITTAG(image, imgName, floderName);
                            }
                        });
                    }
                });
            }
            function saveAttachAcc(ITTAG, Acc_ID) {
                var arrName = [];
                var num = "(copy)";
                //console.log(ITTAG);
                var floderName = ITTAG + '/Acc'; // Set id/floder
                $("#ListAttachAcc tr").each(function () {
                    if ($(this).find("td:nth-child(2)").find("input[type=file]").val() != "") {
                        var image = $(this).find("td:nth-child(2)").find("input[type=file]")[0].files[0];
                        var imgName = $(this).find("td:nth-child(2)").find("input[type=file]")[0].files[0]["name"];
                        var PATH = "../ITTAG_Attach/" + ITTAG + "/" + imgName;
                        if (arrName.includes(imgName)) {
                            arrName.push(imgName);
                            imgName = imgName + num;
                        } else {
                            arrName.push(imgName);
                        }
                        <%--$.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_MA_IMG")%>",
                             contentType: "application/json; charset=utf-8",
                             dataType: "json",
                             data: JSON.stringify({ ID: 0, Acc_ID: Acc_ID, Path: PATH }),
                             success: function (response) {
                             }
                        });--%>
                        insertFileITTAG(image, imgName, floderName);
                    }
                });
            }

            function insertFileITTAG(data, name, floderName) {
                var formData = new FormData();
                formData.append('file', data);
                formData.append('name', name);
                formData.append('folderName', floderName);
                //formData.append('TYPE', TYPE);
                $.ajax({
                    type: 'post',
                    url: './UpLoadFileITTAG.ashx',
                    //ต้องสร้างใหม่เป็นของ PATAG
                    data: formData,
                    async: false,
                    success: function (status) {
                        //alert("Upload Complete");
                    },
                    processData: false,
                    contentType: false,
                    error: function () {
                        alert("Whoops something went wrong!");
                    }
                });
            }

            $(document).on("click", ".btnDeleteMA_Image", function () {
                var ID = parseInt($(this).attr("data-id"));
                var thisTR = $(this).closest("tr");
                if (ID != 0) {
                    var TotalPath = $(this).attr("data-Path");
                }
                console.log(ID);
                console.log(TotalPath);
                swal({
                    title: 'ยืนยันการลบไฟล์แนบ?',
                    text: " ",
                    icon: 'warning',
                    buttons: {
                        cancel: true,
                        confirm: true,
                    },
                }).then(function (confirm) {
                    if (confirm) {
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_IT_TAG_MA_IMG")%>",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                data: JSON.stringify({ ID: ID, MA_ID: 0, Path: TotalPath, Detail: '' }),
                                success: function (response) {
                                    swal("Complete", "ลบไฟล์แนบเสร็จสิ้น", "success");
                                    UpLoadFileDelete(TotalPath);
                                }
                            });
                            thisTR.remove();
                        }
                    })

            });

            function UpLoadFileDelete(path) {
                var formData = new FormData();
                formData.append('folderName', path);
                $.ajax({
                    type: 'post',
                    url: './UpLoadfileDelete.ashx',
                    //ต้องสร้างใหม่เป็นของ PATAG
                    data: formData,
                    async: false,
                    success: function (status) {
                        //alert("Upload Complete");
                    },
                    processData: false,
                    contentType: false,
                    error: function () {
                    }
                });
            }
            //=============== Attach file==================
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

            function SetDatePicker() {
                $('#MA_RepairDate').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
                $('#MA_CommitDate').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
                $('#MA_ReturnDate').datepicker({
                    format: 'dd/mm/yyyy', autoHide: true,
                    beforeShow: function (textbox, instance) {
                        var txtBoxOffset = $(this).offset();
                        var top = txtBoxOffset.top;
                        var left = txtBoxOffset.left;
                        var textBoxWidth = $(this).outerWidth();
                        console.log('top: ' + top + 'left: ' + left);
                        setTimeout(function () {
                            instance.dpDiv.css({
                                top: top - 100, //you can adjust this value accordingly
                                left: left + textBoxWidth//show at the end of textBox
                            });
                        }, 0);

                    },
                });
                $('#Acc_Date').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
                $('#text_Inactive_Date').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
            }

            function ShowInActive_Reason() {
                var Status = $("#text_Status").val();
                if (Status == "InActive") {
                    $("#div_Status_InActive").show();
                    console.log("show");
                } else {
                    $("#div_Status_InActive").hide();
                    console.log("hide");
                }
                
            }

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
            $(document).on("click", ".clickselecttext_PP_ITTAG", function () {
                var tr = $(this).closest("tr");
                var IT_Tag_Code = tr.find("td:nth-child(1)").text();
                $("#PP_IT_TAG_Code_Sub").val(IT_Tag_Code);
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", ".clickselecttext_Vendor", function () {
                var tr = $(this).closest("tr");
                var site_ref = tr.find("td:nth-child(1)").text();
                var Vender_num = tr.find("td:nth-child(2)").text();
                var name = tr.find("td:nth-child(3)").text();;
                $("#MA_Vender_site_ref").val(site_ref);
                $("#MA_Vender").val(name);
                $("#MA_Vendor_Num").val(Vender_num);
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", ".clickselecttext_Vendor_PO", function () {
                var tr = $(this).closest("tr");
                //var site_ref = tr.find("td:nth-child(1)").text();
                var Vender_num = tr.find("td:nth-child(1)").text();
                var name = tr.find("td:nth-child(2)").text();
                $("#text_Vendor_Name").val(name);
                $("#text_Vendor").val(Vender_num);
                $("#modalBrowseSearch").modal("hide");
            });

            function InsertITTAG(IT_Tag_Code, Tag_Group, Purchase_Type, Start_Contract_date, Expire_Contract_date, Detail, Brand, Model, Volume, Status,
                SN, Product_Key, PONumber, UnitPrice, Vendor, Asset_of_Company, Asset_No, Asset_Date, Processor, CPU_Clock, RAM, HDD,
                Inactive_Reason,Detail_Reason,Inactive_Date,Owner) {
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
                console.log(Inactive_Reason);
                console.log(Detail_Reason);
                console.log(Inactive_Date);
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
                         Inactive_Reason: Inactive_Reason, Detail_Reason: Detail_Reason, Inactive_Date: Inactive_Date, Stauts: "Update"
                    }),
                    success: function (response) {
                        swal("สำเร็จ", "IT TAG หมายเลข " + IT_Tag_Code + " ได้ถูกบันทึก", "success")
                    }
                });
            }
            function ModalPoNumber(search) {
                $("#Titlebrowse").text('Search PO Number');
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
                    $("#IMGUpload").modal("show");
                    $.ajax({
                        type: "POST",
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
                            } else {
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
                $("#IMGUpload").modal("hide");

            }
            function Peripheral_Code_Sub(search) {
                $("#Titlebrowse").text('Search Peripheral');
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-lg');
                fragmentHeader = `<th>Tag Code</th>
                                     <th>Tag Group Name</th>
                                     <th>Type Name</th>
                                    <th>Used</th>
                                    <th>Volume</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GetIT_TAG_New_SearchBrowse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[IT_Tag_Code],[Tag_Group],[MainType],[TypeName],[TagGroup],[TagGroupName],[Tag_Group_Status],[Used],[Volume],[TAG_Status],[Asset_of_Company],[Start_Contract_date],[Expire_Contract_date]
                                var IT_Tag_Code = val[0];
                                var Tag_Group = val[1];
                                var MainType = val[2];
                                var TypeName = val[3];
                                var TagGroup = val[4];
                                var TagGroupName = val[5];
                                var Tag_Group_Status = val[6];
                                var Used = val[7];
                                var Volume = val[8];
                                fragment += '<tr>';

                                if (parseInt(Used) >= parseInt(Volume)) {
                                    fragment += '<td><span class="over-volumn">' + IT_Tag_Code + '</span></td>';
                                    fragment += '<td><span class="over-volumn">' + TagGroupName + '</span></td>';
                                    fragment += '<td><span class="over-volumn">' + TypeName + '</span></td>';
                                    fragment += '<td><span class="over-volumn">' + Used + '</span></td>';
                                    fragment += '<td><span class="over-volumn">' + Volume + '</span></td>';
                                }
                                else {
                                    fragment += '<td><a class="clickselecttext_PP_ITTAG" href="javascript:void(0)">' + IT_Tag_Code + '</a></td>';
                                    fragment += '<td><a class="clickselecttext_PP_ITTAG" href="javascript:void(0)">' + TagGroupName + '</a></td>';
                                    fragment += '<td><a class="clickselecttext_PP_ITTAG" href="javascript:void(0)">' + TypeName + '</a></td>';
                                    fragment += '<td><a class="clickselecttext_PP_ITTAG" href="javascript:void(0)">' + Used + '</a></td>';
                                    fragment += '<td><a class="clickselecttext_PP_ITTAG" href="javascript:void(0)">' + Volume + '</a></td>';
                                }
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }

            function VW_IT_TAG_PE_ALL(ITTAG) {
                var fragment = '';
                $("#List_owner").empty();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/VW_IT_TAG_PE_ALL") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ EmpNum: '', IT_TAG_Code: ITTAG }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //,[FullName],[CostCenter],[CostCenterDesc],[Level],[JobTitle_ID],[JobTitle_Name],[Language],[BUGroup],[BUGroupDesc]
                                var ID = val[0];
                                var IT_TAG_Code = val[1];
                                var StartDate = val[2];
                                var BorrowDueDate = val[3];
                                var ReturnDate = val[4];
                                var ProjectNo = val[5];
                                var Detail = val[6];
                                var Status = val[7];
                                var JD_Code = val[8];
                                var PE_Type = val[9];
                                var Emp_num = val[10];
                                var MainType = val[11];
                                var TypeName = val[12];
                                var TagGroup = val[13];
                                var TagGroupName = val[14];
                                var FullName = val[15];
                                var CostCenter = val[16];
                                var CostCenterDesc = val[17];
                                var Level = val[18];
                                var JobTitle_ID = val[19];
                                var JobTitle_Name = val[20];
                                var BUGroup = val[21];
                                var BUGroupDesc = val[22];

                                fragment += '<tr>';
                                fragment += '<td> <a href="ITTAG_MaintainPE.aspx?EmpNum=' + Emp_num + '" target="_bank">' + Emp_num + '</a></td>';
                                fragment += '<td>' + FullName + '</td>';
                                fragment += '<td>' + CostCenter + '</td>';
                                fragment += '<td>' + StartDate.substr(0, 10) + '</td>';
                                fragment += '<td>' + BorrowDueDate.substr(0, 10) + '</td>';
                                fragment += '<td>' + ReturnDate.substr(0, 10) + '</td>';
                                fragment += '<td>' + Status + '</td>';
                                fragment += '<td>' + IT_TAG_Code + '</td>';
                                fragment += '<td>' + TagGroupName + '</td>';
                                fragment += '</tr>';

                            });
                        }

                        $("#List_owner").append(fragment);
                    }
                });
            }
            //End VW_IT_TAG_PE_ALL



            function VW_Vendor_All(search) {
                $("#Titlebrowse").text('Search Vendor');
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `<th>Vemdor Site</th>
                                    <th>Vendor ID</th>
                                    <th>Vender Name</th>`;
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
                                var site_ref = val[0];
                                var vend_num = val[1];
                                var name = val[2];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_Vendor" href="javascript:void(0)">' + site_ref + '</a></td>';
                                fragment += '<td><a class="clickselecttext_Vendor" href="javascript:void(0)">' + vend_num + '</a></td>';
                                fragment += '<td><a class="clickselecttext_Vendor" href="javascript:void(0)">' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }

            function VW_Vendor_All_PO(search) {
                $("#Titlebrowse").text('Search Vendor');
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = ` <th>Vendor ID</th>
                                    <th>Vender Name</th>`;
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
                                var site_ref = val[0];
                                var vend_num = val[1];
                                var name = val[2];
                                fragment += '<tr>';
                                //fragment += '<td><a class="clickselecttext_Vendor_PO" href="javascript:void(0)">' + site_ref + '</a></td>';
                                fragment += '<td><a class="clickselecttext_Vendor_PO" href="javascript:void(0)">' + vend_num + '</a></td>';
                                fragment += '<td><a class="clickselecttext_Vendor_PO" href="javascript:void(0)">' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }



            function GETITTAG(ITTAG) {
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/VW_IT_TAG_Master") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ITTAG: ITTAG }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //console.log(response.d);
                                var IT_Tag_Code = val[0];
                                var Tag_Group = val[1];
                                var Purchase_Type = val[2];
                                var Start_Contract_date = val[3];
                                var Expire_Contract_date = val[4];
                                var Detail = val[5];
                                var Brand = val[6];
                                var Model = val[7];
                                var Volume = val[8];
                                var TAG_Status = val[9];
                                var SN = val[10];
                                var Product_Key = val[11];
                                var PONumber = val[12];
                                var UnitPrice = val[13];
                                var Vendor = val[14];
                                var Asset_of_Company = val[15];
                                var Asset_No = val[16];
                                var Asset_Date = val[17];
                                var Processor = val[18];
                                var CPU_Clock = val[19];
                                var RAM = val[20];
                                var HDD = val[21];
                                var Group_ID = val[22];
                                var Owner = val[23];
                                var MainType = val[24];
                                var TypeName = val[25];
                                var TagGroup = val[26];
                                var TagGroupName = val[27];
                                var Tag_Group_Status = val[28];
                                var ReportSeq = val[29];
                                var Vendor_Name = val[30];
                                var Inactive_Reason = val[31];
                                var Detail_Reason = val[32];
                                var Inactive_Date = val[33];
                                var Title = ITTAG + " | Type:" + MainType + " | Group:" + TagGroupName + "(" + TagGroup + ")";
                                $("#stcPurchaseType").val(Purchase_Type);
                                $("#text_Detail").val(Detail);
                                $("#text_Brand").val(Brand);
                                $("#text_Model").val(Model);
                                $("#text_Volumn").val(Volume);
                                $("#text_Start_date").val(Start_Contract_date.substr(0, 10));
                                $("#text_End_date").val(Expire_Contract_date.substr(0, 10));
                                $("#text_Processor").val(Processor);
                                $("#text_CPU").val(CPU_Clock);
                                $("#text_RAM").val(RAM);
                                $("#text_HDD").val(HDD);
                                $("#text_Owner").val(Owner);
                                $("#text_Status").val(TAG_Status);
                                $("#text_Inactive_Reason").val(Inactive_Reason);
                                $("#text_Inactive_Detail").val(Detail_Reason);
                                $("#text_Inactive_Date").val(Inactive_Date.substr(0,10));
                                $("#text_Product_Key").val(Product_Key);
                                $("#text_SN").val(SN);
                                $("#text_PO_Number").val(PONumber);
                                $("#text_Price").val(UnitPrice);
                                $("#text_Vendor").val(Vendor);
                                $("#text_Vendor_Name").val(Vendor_Name);
                                $("#text_AssetCompany").val(Asset_of_Company);
                                $("#text_AssetNo").val(Asset_No);
                                $("#text_AssetDate").val(Asset_Date.substr(0, 10));

                                $("#TitleITTAG").text(Title);
                                if (MainType == 'Hardware') {
                                    $('.TypeHW').show();
                                    $('.TypeSW').hide();
                                } else if (MainType == 'Software') {
                                    if (Purchase_Type == "Rent") {
                                        $("#text_Volumn").prop("disabled", false);
                                    }
                                    $('.TypeSW').show();
                                    $('.TypeHW').hide();
                                }
                            });
                        }
                    }
                });
            }
            function GetTableAcc(ITTAG) {
                $("#List_Accessories").empty();
                var fragment = '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/TB_IT_TAG_Accessory") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ITTAG: ITTAG }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //console.log(response.d);
                                var ID = val[0];
                                var Name = val[1];
                                var Detail = val[2];
                                var Price = val[3];
                                var Date = val[4];
                                var Create_Date = val[5];
                                var Create_By = val[6];
                                var Update_Date = val[7];
                                var Update_By = val[8];
                                var IT_TAG_Code = val[9];
                                fragment += '<tr>';
                                fragment += '<td>' + Name + '</td>';
                                fragment += '<td>' + Date.substr(0, 10) + '</td>';
                                fragment += '<td>' + Detail + '</td>';
                                fragment += '<td>' + Price + '</td>';
                                fragment += '<td><button type="button" class="btn btn-warning btnModal_Acc" data-acc_id="' + ID + '" data-nametype="Accessories" data-action="Edit" >Edit</button></td>';
                                fragment += '</tr>';
                            });
                        }

                        $("#List_Accessories").append(fragment);

                    }
                });
            }
            function GET_TB_IT_TAG_MA(ITTAG) {
                $("#List_MA").empty();
                var fragment = '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GET_TB_IT_TAG_MA") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ITTAG: ITTAG }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //console.log(response.d);
                                var ID = val[0];
                                var IT_TAG_Code = val[1];
                                var Vendor_Num = val[2];
                                var PO_Case_Number = val[3];
                                var Repair_Date = val[4];
                                var Commit_Date = val[5];
                                var Return_Date = val[6];
                                var Price = val[7];
                                var Detail = val[8];
                                var Status = val[9];
                                var Vender_site_ref = val[10];
                                var site_ref = val[11];
                                var Vendor_Name = val[12];
                                fragment += '<tr>';
                                fragment += '<td>' + Vendor_Name + '</td>';
                                fragment += '<td>' + PO_Case_Number + '</td>';
                                fragment += '<td>' + Repair_Date.substr(0, 10) + '</td>';
                                fragment += '<td>' + Commit_Date.substr(0, 10) + '</td>';
                                fragment += '<td>' + Price + '</td>';
                                fragment += '<td>' + Detail + '</td>';
                                fragment += '<td>' + Return_Date.substr(0, 10) + '</td>';
                                fragment += '<td>' + Status + '</td>';
                                fragment += '<td><button type="button" class="btn btn-warning btnModal_MA" data-type="Car_MA" data-ma_id="' + ID + '"  data-vendor_num="' + Vendor_Num + '" data-PO_Case_Number="' + PO_Case_Number + '" data-vender_site_ref="' + Vender_site_ref + '" data-action="Edit" data-nametype="ข้อมูลซ่อมบำรุง" >Edit</button></td>';
                                fragment += '</tr>';
                            });
                        }

                        $("#List_MA").append(fragment);

                    }
                });
            }
            function GETITTAG_MA_IMAGE(MA_ID) {
                $("#ListAttachMA_OLD").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GET_TB_IT_TAG_MA_Img") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ MA_ID: MA_ID }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var fragment = '';
                            $.each(response.d, function (index, val) {
                                //ID],[MA_ID],[Path],[CreateDate],[CreateBy] 
                                var ID = val[0];
                                var MA_ID = val[1];
                                var Path = val[2];
                                var showName = Path.substring(32);
                                console.log(Path);
                                fragment += '<tr>';
                                fragment += '<td><a href="http://portalapp01/' + Path.substr(3) + '" target="_blank">' + showName + '</a></td>';
                                fragment += '<td></td>';
                                //fragment += '<td><button type="button" class="btn btn-danger btnDeleteTAX_Image" data-id="'+ID+'" onclick="deleteRow(this)"><i class="glyphicon glyphicon-trash" aria-hidden="true" style="color:white"></i></button></td>';
                                fragment += '<td><button type="button" class="btn btn-danger btnDeleteMA_Image" data-id="' + ID + '" data-Path="' + Path + '" ><i class="glyphicon glyphicon-trash" aria-hidden="true" style="color:white"></i></button></td>';
                                fragment += '</tr>';

                            });
                            $('#ListAttachMA_OLD').append(fragment);
                        }
                    }
                });
            }
            function VW_IT_TAG_Peripheral(ITTAG) {
                $("#List_Peripheral").empty();
                $("#Title_Peripheral").text(ITTAG);
                var fragment = '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/VW_IT_TAG_Peripheral") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ITTAG: ITTAG }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[ID],[IT_TAG_Code_Main],[IT_TAG_Code_Sub],[TagGroup],[TagGroupName],[TypeName],[MainType],[Owner],[Detail]
                                //console.log(response.d);
                                var ID = val[0];
                                var IT_TAG_Code_Main = val[1];
                                var IT_TAG_Code_Sub = val[2];
                                var TagGroup = val[3];
                                var TagGroupName = val[4];
                                var TypeName = val[5];
                                var MainType = val[6];
                                var Owner = val[7];
                                var Detail = val[8];
                                fragment += '<tr>';
                                fragment += '<td>' + MainType + '</td>';
                                fragment += '<td ><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code_Sub + '" target="_bank">' + IT_TAG_Code_Sub + '</a></td>';
                                fragment += '<td>' + TagGroupName + '</td>';
                                fragment += '<td><button type="button" class="btn btn-danger btnDelete_Peripheral Pos_Admin" data-type="Delete" data-PP_id="' + ID + '"  data-IT_TAG_Code_Main="' + IT_TAG_Code_Main + '" data-action="Delete" data-nametype="Peripheral" >Delete</button></td>';
                                fragment += '</tr>';
                            });
                        }

                        $("#List_Peripheral").append(fragment);

                    }
                });
            }

        });
        function deleteRow(btn) {
            var row = btn.parentNode.parentNode;
            row.parentNode.removeChild(row);
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
            return ("" + text).replace(/,/g, '');
        }

        function splitCurrency(input) {
            var value = input.split('.');
            var decimal = value[1] ? (Value[1]).substr(0, 2) : 0;
            return Currency(value[0] + '.' + decimal);
        }
    </script>
</asp:Content>
