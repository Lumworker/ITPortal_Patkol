<%@ Page Title="Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ITTAG_report.aspx.cs" Inherits="ITPortal.ITTAG_report" %>

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

        .margin-top {
            margin-top: 2em
        }

        .margin-bottom {
            margin-bottom: 2em
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

        .center {
            text-align: center;
        }

        .att-margin {
            margin-top: 2.5rem;
        }

        .JD-Job_End {
            background-color: #5cb85c;
            color: white;
        }

        .JD-Job_Start {
            background-color: #f0ad4e;
            color: white;
        }

        .sizeAlert {
            font-size: 18px;
        }

        .btn-Excel-dowlaod {
            background-color: #1F7244;
            color: ghostwhite;
            border: none;
        }

            .btn-Excel-dowlaod:hover {
                background-color: #006400;
                color: ghostwhite;
            }

        .btn-PDF-dowlaod {
            background-color: #a30000;
            color: ghostwhite;
            border: none;
        }

            .btn-PDF-dowlaod:hover {
                background-color: #b71c1c;
                color: ghostwhite;
            }
    </style>

    <div style="overflow: hidden; width: 0; height: 0;">
        <asp:TextBox runat="server" ID="snsIT_TAG_Code_Start" />
        <asp:TextBox runat="server" ID="snsIT_TAG_Code_End" />
        <%--End C# Print ITTag--%>
        <asp:TextBox runat="server" ID="snssReturnDate" />
        <asp:TextBox runat="server" ID="snseReturnDate" />
        <asp:TextBox runat="server" ID="snsCompany" />
        <asp:TextBox runat="server" ID="snsTagGroup" />
        <asp:TextBox runat="server" ID="snsRate" />
        <asp:TextBox runat="server" ID="snsCurrency" />
        <%--End C# Print ITTag--%>
        <asp:TextBox runat="server" ID="snsOwner" />
        <asp:TextBox runat="server" ID="snsAssetCompany" />
        <asp:TextBox runat="server" ID="snsMainType" />
        <asp:TextBox runat="server" ID="snsTypeName" />
        <asp:TextBox runat="server" ID="snsTagGroup_SD" />
        <asp:TextBox runat="server" ID="snsPurchaseType" />
        <asp:TextBox runat="server" ID="snsVendorPurchase" />
        <asp:TextBox runat="server" ID="snssStartContractDate" />
        <asp:TextBox runat="server" ID="snseStartContractDate" />
        <asp:TextBox runat="server" ID="snssExpireContractDate" />
        <asp:TextBox runat="server" ID="snseExpireContractDate" />
        <asp:TextBox runat="server" ID="snssBorrowDueDate" />
        <asp:TextBox runat="server" ID="snsStatusTag" />
        <asp:TextBox runat="server" ID="snseBorrowDueDate" />
        <asp:TextBox runat="server" ID="snsStatususage" />
        <asp:TextBox runat="server" ID="snsEmp" />
        <asp:TextBox runat="server" ID="snsBusinessGroup" />
        <asp:TextBox runat="server" ID="snsEmpDept" />
        <asp:TextBox runat="server" ID="snsEmpLevel" />
        <asp:TextBox runat="server" ID="snsEmpLocation" />
        <asp:TextBox runat="server" ID="snsEmpJobTitle" />
        <%--End C# Summary And Detail--%>
        <asp:TextBox runat="server" ID="snsMA_Owner" />
        <asp:TextBox runat="server" ID="snsMA_AssetCompany" />
        <asp:TextBox runat="server" ID="snsMA_MainType" />
        <asp:TextBox runat="server" ID="snsMA_TypeName" />
        <asp:TextBox runat="server" ID="snsMA_TagGroup" />
        <asp:TextBox runat="server" ID="snsMA_PurchaseType" />
        <asp:TextBox runat="server" ID="snsMA_VendorMA" />
        <asp:TextBox runat="server" ID="snsMA_StatusTag" />
        <asp:TextBox runat="server" ID="snsMA_sRepairDate" />
        <asp:TextBox runat="server" ID="snsMA_eRepairDate" />
        <asp:TextBox runat="server" ID="snsMA_sCommitDate" />
        <asp:TextBox runat="server" ID="snsMA_eCommitDate" />
        <asp:TextBox runat="server" ID="snsMA_sReturnDate" />
        <asp:TextBox runat="server" ID="snsMA_eReturnDate" />
        <asp:TextBox runat="server" ID="snsMA_StatusRepair" />
        <%--End C# Report MA--%>
        <asp:TextBox runat="server" ID="snsHis_Owner" />
        <asp:TextBox runat="server" ID="snsHis_MainType" />
        <asp:TextBox runat="server" ID="snsHis_PurchaseType" />
        <asp:TextBox runat="server" ID="snsHis_StatusTag" />
        <asp:TextBox runat="server" ID="snsHis_sStartDate" />
        <asp:TextBox runat="server" ID="snsHis_eStartDate" />
        <asp:TextBox runat="server" ID="snsHis_sReturnDate" />
        <asp:TextBox runat="server" ID="snsHis_eReturnDate" />
        <asp:TextBox runat="server" ID="snsHis_TypeName" />
        <asp:TextBox runat="server" ID="snsHis_TagGroup" />
        <asp:TextBox runat="server" ID="snsHis_AssetCompany" />
        <%--End C# History--%>
    </div>
    <div class="page-header">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                    <h2>ITTAG Report</h2>
                </div>
                <div class="col-md-8 col-xs-8" style="text-align: right">
                </div>
            </div>
        </div>

    </div>
    <!----End Header---->
    <div class="panel-group">
        <div class="panel nav-tab" style="margin-top: 2em;">
            <div class="panel-heading" id="divTab">
                <ul class="nav nav-tabs">
                    <li class="nav-item active">
                        <a href="#TAB1" class="nav-link" role="tab" data-toggle="tab">Summary And Detail</a>
                    </li>
                    <li class="nav-item ">
                        <a href="#TAB2" class="nav-link" data-toggle="tab" role="tab">IT Charge</a>
                    </li>
                    <li class="nav-item">
                        <a href="#TAB3" class="nav-link" data-toggle="tab" role="tab">Print IT Tag Code </a>
                    </li>
                    <li class="nav-item ">
                        <a href="#TAB4" class="nav-link" data-toggle="tab" role="tab">Report Maintennace</a>
                    </li>
                    <li class="nav-item ">
                        <a href="#TAB5" class="nav-link" data-toggle="tab" role="tab">History</a>
                    </li>
                </ul>

                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane active" role="tabpanel" id="TAB1">
                            <div class="col-md-12">
                                <div class="row form-group">
                                    <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                    </div>
                                    <div class="col-md-8 col-xs-8" style="text-align: right">
                                    </div>
                                </div>
                                <%--End div Button--%>
                                <div class="col-12">
                                    <div class="row">
                                        <div id="SD_smartwizard">
                                            <ul>
                                                <li class="check" data-step="Step1"><a href="#SD_step-1">Fill Data</a></li>
                                                <li class="check" data-step="Step2"><a href="#SD_step-2">Type Name</a></li>
                                                <li class="check" data-step="Step3"><a href="#SD_step-3">Tag Group Name</a></li>
                                                <li class="check" data-step="Step4"><a href="#SD_step-4">Asset of Company</a></li>
                                                <li class="check" data-step="Step5"><a href="#SD_step-5">Employee</a></li>
                                                <li class="check" data-step="Step6"><a href="#SD_step-6">Main Company</a></li>
                                                <li class="check" data-step="Step7"><a href="#SD_step-7">BU Group</a></li>
                                                <li class="check" data-step="Step8"><a href="#SD_step-8">รูปแบบรายงาน</a></li>
                                            </ul>
                                            <div class="row">
                                                <div id="SD_step-1" class="">
                                                    <div class="panel-group">
                                                        <div class="panel panel-default" style="margin-top: 1em;">
                                                            <div class="panel-heading">
                                                                <h4>Fill Data</h4>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div class="form-group">
                                                                    <div class="col-md-12 col-sm-12">
                                                                        <div class="col-md-12">
                                                                            <div class="form-group col-md-6 ">
                                                                                <span class="col-md-4 col-xs-12" style="font-weight: bold;">Owner</span>
                                                                                <div class="col-md-8 date" data-provide="datepicker">
                                                                                    <select class="form-control max-wide" id="textSD_Owner">
                                                                                        <option value="">=== Please Select Owner ===</option>
                                                                                        <option value="System Administrative">System Administrative</option>
                                                                                        <option value="Technical Support">Technical Support</option>
                                                                                        <option value="HelpDesk Support">HelpDesk Support</option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group col-md-6 ">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <div class="form-group col-md-6 ">
                                                                                <span class="col-md-4 col-xs-12" style="font-weight: bold;">Main Type</span>
                                                                                <div class="col-md-8 date" data-provide="datepicker">
                                                                                    <select class="form-control max-wide" id="textSD_MainType">
                                                                                        <option value="">=== Please Select MainType ===</option>
                                                                                        <option value="Hardware">Hardware</option>
                                                                                        <option value="Software">Software</option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group col-md-6 ">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <div class="form-group col-md-6 ">
                                                                                <span class="col-md-4 col-xs-12" style="font-weight: bold;">Purchase Type</span>
                                                                                <div class="col-md-8 date" data-provide="datepicker">
                                                                                    <select class="form-control max-wide  max-wide" id="textSD_PurchaseType">
                                                                                        <option value="">=== Plase Select Purchase Type ===</option>
                                                                                        <option value="Rent">Rent(เช่า)</option>
                                                                                        <option value="Purchase">Purchase(ซื้อ)</option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group col-md-6 ">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <div class="form-group col-md-6 col-xs-12">
                                                                                <span class="col-md-4 col-xs-12" style="font-weight: bold;">Start Contract Date</span>
                                                                                <div class="col-md-8 col-xs-12">
                                                                                    <div class="input-group">
                                                                                        <input id="textSD_Date_Start" class="form-control notText max-wide " placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group col-md-6 col-xs-12">
                                                                                <span class="col-md-1 col-xs-12" style="font-weight: bold;">- </span>
                                                                                <div class="col-md-8 col-xs-12">
                                                                                    <div class="input-group">
                                                                                        <input id="textSD_Date_End" class="form-control notText max-wide " placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <div class="form-group col-md-6 col-xs-12">
                                                                                <span class="col-md-4 col-xs-12" style="font-weight: bold;">Expire Contract Date</span>
                                                                                <div class="col-md-8 col-xs-12">
                                                                                    <div class="input-group">
                                                                                        <input id="textSD_Expire_Date_Start" class="form-control notText max-wide " placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group col-md-6 col-xs-12">
                                                                                <span class="col-md-1 col-xs-12" style="font-weight: bold;">- </span>
                                                                                <div class="col-md-8 col-xs-12">
                                                                                    <div class="input-group">
                                                                                        <input id="textSD_Expire_Date_End" class="form-control notText max-wide " placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <div class="form-group col-md-6 ">
                                                                                <span class="col-md-4 col-xs-12" style="font-weight: bold;">Vendor</span>
                                                                                <div class="col-md-8">
                                                                                    <div class="input-group">
                                                                                        <input id="textSD_Vendor" type="text" class="form-control max-wide" autocomplete="off" style="display: none" disabled>
                                                                                        <input id="textSD_Vendor_Name" type="text" class="form-control max-wide" autocomplete="off" disabled>
                                                                                        <div class="input-group-btn">
                                                                                            <button class="btn btn-default Browse_modal" type="button" data-type="SD_Vender">
                                                                                                <i class="glyphicon glyphicon-search"></i>
                                                                                            </button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group col-md-6 ">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <div class="form-group col-md-6 ">
                                                                                <span class="col-md-4 col-xs-12" style="font-weight: bold;">Status Tag</span>
                                                                                <div class="col-md-8 date" data-provide="datepicker">
                                                                                    <select class="form-control max-wide" id="textSD_Status">
                                                                                        <option value="">=== Plase Select Status ===</option>
                                                                                        <option value="Active">Active</option>
                                                                                        <option value="InActive">InActive</option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group col-md-6 ">
                                                                            </div>
                                                                        </div>

                                                                        <div style="text-align: right">
                                                                            <button id="SD_nextPage2" class="btn btn-warning " type="button" data-toggle="modal">Next</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <%--End panel-body--%>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--======End Step 1.1======--%>
                                                <div id="SD_step-2" class="">
                                                    <div class="panel-group">
                                                        <div class="panel panel-default" style="margin-top: 1em;">
                                                            <div class="panel-heading">
                                                                <h4>Select Type Name</h4>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div style="max-width: 100%;">
                                                                    <div class="col-md-12 col-sm-12">
                                                                        <div class="row">
                                                                            <div class="table-responsive">
                                                                                <table class="table table-hover table-bordered" id="SD_Table_TypeName">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th class="center" style="width: 10%;">
                                                                                                <input class="form-check-input " id="fillterCheck_SD_Table_TypeName" type="checkbox" value="" style="margin-left: 23px;">
                                                                                            </th>
                                                                                            <th>Type Name</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody id="SD_List_TypeName">
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div style="text-align: right">
                                                                        <button id="SD_nextPage3" class="btn btn-warning Pos_Worker" type="button" data-toggle="modal">Next</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--======End Step 1.2 ======--%>
                                                <div id="SD_step-3" class="">
                                                    <div class="panel-group">
                                                        <div class="panel panel-default" style="margin-top: 1em;">
                                                            <div class="panel-heading">
                                                                <h4>Select Tag Group Name</h4>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div style="max-width: 100%;">
                                                                    <div class="col-md-12 col-sm-12">
                                                                        <div class="row">
                                                                            <div class="table-responsive">
                                                                                <table class="table table-hover table-bordered" id="SD_Table_TagGroupName">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th class="center" style="width: 10%;">
                                                                                                <input class="form-check-input " id="fillterCheck_SD_Table_TagGroupName" type="checkbox" value="" style="margin-left: 23px;">
                                                                                            </th>
                                                                                            <th>Tag Group Name</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody id="SD_List_TagGroupName">
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div style="text-align: right">
                                                                        <button id="SD_nextPage4" class="btn btn-warning " type="button" data-toggle="modal">Next</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--======End Step 1.3 ======--%>

                                                <div id="SD_step-4" class="">
                                                    <div class="panel-group">
                                                        <div class="panel panel-default" style="margin-top: 1em;">
                                                            <div class="panel-heading">
                                                                <h4>Select Asset of Company</h4>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div style="max-width: 100%;">
                                                                    <div class="col-md-12 col-sm-12">
                                                                        <div class="row">
                                                                            <div class="table-responsive">
                                                                                <table class="table table-hover table-bordered" id="SD_Table_Asset_Company">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th class="center" style="width: 10%;">
                                                                                                <input class="form-check-input " id="fillterCheck_SD_Table_Asset_Company" type="checkbox" value="" style="margin-left: 23px;">
                                                                                            </th>
                                                                                            <th>Site Name</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody id="SD_list_site_ref">
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div style="text-align: right">
                                                                        <button id="SD_nextPage5" class="btn btn-warning " type="button" data-toggle="modal">Next</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--======End Step 1.4 ======--%>
                                                <div id="SD_step-5" class="">
                                                    <div class="panel-group">
                                                        <div class="panel panel-default" style="margin-top: 1em;">
                                                            <div class="panel-heading">
                                                                <h4>Select Employee</h4>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div style="max-width: 100%;">
                                                                    <div class="col-md-12 col-sm-12">

                                                                        <div class="row" style="margin-top: 1em;">
                                                                            <div class="col-md-12">
                                                                                <div class="form-group col-md-6 ">
                                                                                    <span class="col-md-4 col-xs-12" style="font-weight: bold;">Name</span>
                                                                                    <div class="col-md-8">
                                                                                        <div class="input-group">
                                                                                            <input id="textSD_EmpNum" style="display: none" type="text" class="form-control max-wide" autocomplete="off" disabled>
                                                                                            <input id="textSD_EmpName" type="text" class="form-control max-wide" autocomplete="off" disabled>
                                                                                            <div class="input-group-btn">
                                                                                                <button class="btn btn-default Browse_modal" type="button" data-type="SD_EmpNum">
                                                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                                                </button>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group col-md-6 ">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-12">
                                                                                <div class="form-group col-md-6 ">
                                                                                    <span class="col-md-4 col-xs-12" style="font-weight: bold;">Cost Center</span>
                                                                                    <div class="col-md-8">
                                                                                        <div class="input-group">
                                                                                            <input id="textSD_Costcenter" type="text" class="form-control max-wide" autocomplete="off" disabled>
                                                                                            <div class="input-group-btn">
                                                                                                <button class="btn btn-default Browse_modal" type="button" data-type="SD_costCenter">
                                                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                                                </button>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group col-md-6 ">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-12">
                                                                                <div class="form-group col-md-6 ">
                                                                                    <span class="col-md-4 col-xs-12" style="font-weight: bold;">Level</span>
                                                                                    <div class="col-md-8">
                                                                                        <div class="input-group">
                                                                                            <input id="textSD_Level" type="text" class="form-control max-wide" autocomplete="off" disabled>
                                                                                            <div class="input-group-btn">
                                                                                                <button class="btn btn-default Browse_modal" type="button" data-type="SD_Level">
                                                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                                                </button>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group col-md-6 ">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-12">
                                                                                <div class="form-group col-md-6 ">
                                                                                    <span class="col-md-4 col-xs-12" style="font-weight: bold;">Location</span>
                                                                                    <div class="col-md-8">
                                                                                        <div class="input-group">
                                                                                            <input type="text" id="textSD_Location" class="form-control" style="min-width: 100%; display: none;" autocomplete="off" disabled />
                                                                                            <input type="text" id="textSD_Location_Description" class="form-control" style="min-width: 100%" autocomplete="off" disabled />
                                                                                            <div class="input-group-btn">
                                                                                                <button class="btn btn-default Browse_modal" data-type="SD_Location" type="button">
                                                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                                                </button>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group col-md-6 ">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-12">
                                                                                <div class="form-group col-md-6 ">
                                                                                    <span class="col-md-4 col-xs-12" style="font-weight: bold;">Jobtitle</span>
                                                                                    <div class="col-md-8">
                                                                                        <div class="input-group">
                                                                                            <input id="textSD_JobTitle" style="display: none;" type="text" class="form-control max-wide" autocomplete="off" disabled>
                                                                                            <input id="textSD_JobTitle_Name" type="text" class="form-control max-wide" autocomplete="off" disabled>
                                                                                            <div class="input-group-btn">
                                                                                                <button class="btn btn-default Browse_modal" type="button" data-type="SD_JobsTitle">
                                                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                                                </button>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group col-md-6 ">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-12">
                                                                                <div class="form-group col-md-6 col-xs-12">
                                                                                    <span class="col-md-4 col-xs-12" style="font-weight: bold;">Borrow Due Date</span>
                                                                                    <div class="col-md-8 col-xs-12">
                                                                                        <div class="input-group">
                                                                                            <input id="textSD_Borrow_Date_Start" class="form-control notText max-wide " placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group col-md-6 col-xs-12">
                                                                                    <span class="col-md-1 col-xs-12" style="font-weight: bold;">- </span>
                                                                                    <div class="col-md-8 col-xs-12">
                                                                                        <div class="input-group">
                                                                                            <input id="textSD_Borrow_Date_End" class="form-control notText max-wide " placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-12">
                                                                                <div class="form-group col-md-6 ">
                                                                                    <span class="col-md-4 col-xs-12" style="font-weight: bold;">Status</span>
                                                                                    <div class="col-md-8 date" data-provide="datepicker">
                                                                                        <select class="form-control max-wide" id="textSD_Emp_Status">
                                                                                            <option value="">=== Please Select Owner ===</option>
                                                                                            <option value="Used">Used</option>
                                                                                            <option value="Borrowed">Borrowed</option>
                                                                                            <option value="Stocked">Stocked</option>
                                                                                        </select>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="form-group col-md-6 ">
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                    <div style="text-align: right">
                                                                        <button id="SD_nextPage6" class="btn btn-warning " type="button" data-toggle="modal">Next</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--======End Step 1.5 ======--%>
                                                <div id="SD_step-6" class="">
                                                    <div class="panel-group">
                                                        <div class="panel panel-default" style="margin-top: 1em;">
                                                            <div class="panel-heading">
                                                                <h4>Main Company (Employee)</h4>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div style="max-width: 100%;">
                                                                    <div class="col-md-12 col-sm-12">
                                                                        <div class="row">
                                                                            <div class="table-responsive">
                                                                                <table class="table table-hover table-bordered" id="SD_Table_Main_Company">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th class="center" style="width: 10%;">
                                                                                                <input class="form-check-input " id="fillterCheck_SD_Table_Main_Company" type="checkbox" value="" style="margin-left: 23px;">
                                                                                            </th>
                                                                                            <th>Company</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody id="SD_list_Main_Company">
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div style="text-align: right">
                                                                        <button id="SD_nextPage7" class="btn btn-warning " type="button" data-toggle="modal">Next</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--======End Step 1.6 ======--%>
                                                <div id="SD_step-7" class="">
                                                    <div class="panel-group">
                                                        <div class="panel panel-default" style="margin-top: 1em;">
                                                            <div class="panel-heading">
                                                                <h4>BU Group (Employee)</h4>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div style="max-width: 100%;">
                                                                    <div class="col-md-12 col-sm-12">
                                                                        <div class="row">
                                                                            <div class="table-responsive">
                                                                                <table class="table table-hover table-bordered" id="SD_Table_BUGroup">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th class="center" style="width: 10%;">
                                                                                                <input class="form-check-input " id="fillterCheck_SD_Table_BUGroup" type="checkbox" value="" style="margin-left: 23px;">
                                                                                            </th>
                                                                                            <th>BU Group</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody id="SD_list_BUGroup">
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div style="text-align: right">
                                                                        <button id="SD_nextPage8" class="btn btn-warning " type="button" data-toggle="modal">Next</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--======End Step 1.7 ======--%>
                                                <div id="SD_step-8" class="">
                                                    <div class="panel-group">
                                                        <div class="panel panel-default" style="margin-top: 1em;">
                                                            <div class="panel-heading">
                                                                <div class="row form-group">
                                                                    <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                                                        <h4>Export Summary And Detail</h4>
                                                                    </div>
                                                                    <div class="col-md-8 col-xs-8" style="text-align: right">
                                                                        <button type="button" id="btnSearchSD_Clear" class="btn btn-warning" style="float: right;">Clear</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div style="max-width: 100%;">
                                                                    <div class="col-md-12 col-sm-12">
                                                                        <div class="row" id="" style="margin-top: 1em;">
                                                                            <div class="col-md-6 col-xs-6" style="text-align: left;">
                                                                                <div style="text-align: right;">
                                                                                    <asp:Button runat="server" class="btn btn-block btn-Excel-dowlaod"
                                                                                        Style="min-width: 100%; height: 80px; font-size: 24px; font-weight: bold;"
                                                                                        Text="Export Summary" ID="Button1" OnClick="Export_ITTAG_Summary_Excel"
                                                                                        UseSubmitBehavior="false" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6 col-xs-6" style="text-align: right;">
                                                                                <asp:Button runat="server" class="btn btn-block btn-Excel-dowlaod"
                                                                                    Style="min-width: 100%; height: 80px; font-size: 24px; font-weight: bold;"
                                                                                    Text="Export Detail" ID="Button4" OnClick="Export_ITTAG_Detail_Excel"
                                                                                    UseSubmitBehavior="false" />

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--======End Step 1.8 ======--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--================End Tab 1====================-->
                        <div class="tab-pane fade" role="tabpanel" id="TAB2">
                            <div class="col-md-12">
                                <div class="row form-group">
                                    <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                    </div>
                                    <div class="col-md-8 col-xs-8" style="text-align: right">
                                    </div>
                                </div>
                                <div class="row">
                                    <div id="Charge_smartwizard">
                                        <ul>
                                            <li class="check" data-step="Step1"><a href="#Charge_step-1">Fill Data</a></li>
                                            <li class="check" data-step="Step2"><a href="#Charge_step-2">Select Group</a></li>
                                            <li class="check" data-step="Step3"><a href="#Charge_step-3">Export</a></li>
                                        </ul>
                                        <div class="row">
                                            <div id="Charge_step-1" class="">
                                                <div class="panel-group">
                                                    <div class="panel panel-default" style="margin-top: 1em;">
                                                        <div class="panel-heading">
                                                            <h4>IT Charge</h4>
                                                        </div>
                                                        <div class="panel-body">
                                                            <div class="form-group">
                                                                <div class="col-md-12 col-sm-12">
                                                                    <div class="col-12">
                                                                        <div class="row" style="margin-top: 1em;">
                                                                            <div class="col-md-12">
                                                                                <div class="form-group col-md-6 col-xs-12">
                                                                                    <span class="col-md-4 col-xs-12" style="font-weight: bold;">Start Date</span>
                                                                                    <div class="col-md-8 col-xs-12">
                                                                                        <div class="input-group">
                                                                                            <input id="textCharge_StartDate" class="form-control notText max-wide " placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group col-md-6 col-xs-12">
                                                                                    <span class="col-md-4 col-xs-12" style="font-weight: bold;">End Date</span>
                                                                                    <div class="col-md-8 col-xs-12">
                                                                                        <div class="input-group">
                                                                                            <input id="textCharge_EndDate" class="form-control notText max-wide " placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class=" row " style="margin-top: 1em;">
                                                                            <div class="col-md-12">
                                                                                <div class="form-group col-md-6 col-xs-12">
                                                                                    <span class="col-md-4 col-xs-12" style="font-weight: bold;">Charge of Company</span>
                                                                                    <div class="col-md-8 col-xs-12">
                                                                                        <select class="form-control max-wide " id="textCharge_SiteRef">
                                                                                        </select>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="form-group col-md-6 col-xs-12">
                                                                                    <span class="col-md-4 col-xs-12" style="font-weight: bold;">Rate Charge</span>
                                                                                    <div class="col-md-8 col-xs-12">
                                                                                        <input id="textCharge_Rate" type="text" class="form-control max-wide " placeholder="Rate Charge">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row" style="margin-top: 1em;">
                                                                            <div class="col-md-12">
                                                                                <div class="form-group col-md-6 col-xs-12">
                                                                                    <span class="col-md-4 col-xs-12" style="font-weight: bold;">Currency</span>
                                                                                    <div class="col-md-8 col-xs-12">

                                                                                        <input id="textCharge_Currency" type="text" class="form-control max-wide " placeholder="THB,USD or other currency">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group col-md-6 col-xs-12" style="display: none">
                                                                                    <span class="col-md-4 col-xs-12" style="font-weight: bold;">Tag Group</span>
                                                                                    <div class="col-md-8 col-xs-12">
                                                                                        <div class="input-group">
                                                                                            <input id="textCharge_TAGGroup" type="text" class="form-control max-wide " disabled>
                                                                                            <div class="input-group-btn">
                                                                                                <button class="btn btn-default Browse_modal" data-type="Charge_TAGGroup" type="button">
                                                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                                                </button>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div style="text-align: right">
                                                                        <button id="Charge_nextPage2" class="btn btn-warning Pos_Worker" type="button" data-toggle="modal">Next</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%--End panel-body--%>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--======End Step 2.1======--%>
                                            <div id="Charge_step-2" class="">
                                                <div class="panel-group">
                                                    <div class="panel panel-default" style="margin-top: 1em;">
                                                        <div class="panel-heading">
                                                            <h4>Select Group</h4>
                                                        </div>
                                                        <div class="panel-body">
                                                            <div style="max-width: 100%;">
                                                                <div class="col-md-12 col-sm-12">
                                                                    <div class="row">
                                                                        <div class="table-responsive">
                                                                            <table class="table table-hover table-bordered" id="Charge_Table_Fillter">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th class="center" style="width: 10%;">
                                                                                            <input class="form-check-input fillterCheck" id="Charge_checkAll" type="checkbox" value="" style="margin-left: 23px;">
                                                                                        </th>
                                                                                        <th>Tag Group</th>
                                                                                        <th>Tag Group Name</th>
                                                                                        <th>Type Name</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody id="Charge_List_Fillter">
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div style="text-align: right">
                                                                    <button id="btnSearchCharge" class="btn btn-warning Pos_Worker" type="button" data-toggle="modal">Next</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--======End Step 2.2 ======--%>
                                            <div id="Charge_step-3" class="">
                                                <div class="panel-group">
                                                    <div class="panel panel-default" style="margin-top: 1em;">
                                                        <div class="panel-heading">
                                                            <div class="row form-group">
                                                                <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                                                    <h4>Export Charge</h4>
                                                                </div>
                                                                <div class="col-md-8 col-xs-8" style="text-align: right">
                                                                    <button type="button" id="btnSearchCharge_Clear" class="btn btn-warning" style="float: right;">Clear</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="panel-body">

                                                            <div style="max-width: 100%;">
                                                                <div class="col-md-12 col-sm-12">
                                                                    <div class="row" id="divExportReport" style="display: none; margin-top: 1em;">
                                                                        <div class="col-md-6 col-xs-6" style="text-align: left;">
                                                                            <div style="text-align: right;">
                                                                                <asp:Button runat="server" class="btn btn-block btn-Excel-dowlaod" Style="min-width: 100%; height: 80px; font-size: 24px; font-weight: bold;" Text="Export Excel" ID="btnExport_Charge_Excel" OnClick="Export_Charge_Excel" UseSubmitBehavior="false" disabled="true" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6 col-xs-6" style="text-align: right;">

                                                                            <div style="text-align: right;">
                                                                                <asp:Button runat="server" class="btn btn-block btn-PDF-dowlaod" Style="min-width: 100%; height: 80px; font-size: 24px; font-weight: bold;" Text="Export PDF" ID="btnExport_Charge_PDF" OnClick="Export_Charge_PDF" UseSubmitBehavior="false" disabled="true" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--======End Step 2.3 ======--%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!--================End Tab 2====================-->
                        <div class="tab-pane fade" role="tabpanel" id="TAB3">
                            <div class="col-md-12">
                                <div class="row form-group">
                                    <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                    </div>
                                    <div class="col-md-8 col-xs-8" style="text-align: right">
                                    </div>
                                </div>
                                <div class="row">
                                    <div id="smartwizard">
                                        <ul>
                                            <li class="check" data-step="Step1"><a href="#step-1">IT TAG(Start)</a></li>
                                            <li class="check" data-step="Step2"><a href="#step-3">Print</a></li>
                                        </ul>
                                        <div class="row">
                                            <div id="step-1" class="">
                                                <div class="panel-group">
                                                    <div class="panel panel-default" style="margin-top: 1em;">
                                                        <div class="panel-heading">
                                                            <h4>Select ITTAG</h4>
                                                        </div>
                                                        <div class="panel-body">
                                                            <div class="form-group">
                                                                <div class="col-md-12 col-sm-12">
                                                                    <div class="row" style="margin-bottom: 2rem;">
                                                                        <div class="col-md-12">
                                                                            <div class="col-md-2">
                                                                                <label class="control-label">Start IT TAG :</label>
                                                                            </div>
                                                                            <div class="col-md-10">
                                                                                <div class="input-group">
                                                                                    <input type="text" class="form-control max-wide" id="Start_IT_Tag_Code" autocomplete="off" readonly="readonly">
                                                                                    <div class="input-group-btn">
                                                                                        <button class="btn btn-default Browse_modal" type="button" data-type="Start_ITTAG">
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
                                                                                <label class="control-label">End IT TAG :</label>
                                                                            </div>
                                                                            <div class="col-md-10">
                                                                                <div class="input-group">
                                                                                    <input type="text" class="form-control max-wide" id="End_IT_Tag_Code" autocomplete="off" readonly="readonly">
                                                                                    <input type="text" class="form-control max-wide" id="Taggroup" style="display: none" autocomplete="off" readonly="readonly">
                                                                                    <div class="input-group-btn">
                                                                                        <button class="btn btn-default Browse_modal" type="button" data-type="End_ITTAG">
                                                                                            <i class="glyphicon glyphicon-search"></i>
                                                                                        </button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div style="text-align: right">
                                                                        <button id="nextPage2" class="btn btn-warning Pos_Worker" type="button" data-toggle="modal" disabled>Next</button>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <%--End panel-body--%>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--======End Step 3.1======--%>
                                            <div id="step-3" class="">
                                                <div class="panel-group">
                                                    <div class="panel panel-default" style="margin-top: 1em;">
                                                        <div class="panel-heading">
                                                            <h4>PRINT ITTTAG (<span id="title_print" class="red"></span>)</h4>
                                                        </div>
                                                        <div class="panel-body">
                                                            <div style="max-width: 100%;">
                                                                <div class="col-md-12 col-sm-12">
                                                                    <div class="row">

                                                                        <div style="text-align: right;">
                                                                            <asp:Button runat="server" class="btn btn-block btn-success" Style="min-width: 100%; height: 80px; font-size: 24px; font-weight: bold;" Text="Print" OnClick="print_ITTAG" UseSubmitBehavior="false" />
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--======End Step 3.2 ======--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--================End Tab 4 ====================-->
                        <div class="tab-pane fade" role="tabpanel" id="TAB4">
                            <div class="col-md-12">
                                <div class="row form-group">
                                    <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                    </div>
                                    <div class="col-md-8 col-xs-8" style="text-align: right">
                                    </div>
                                </div>
                                <div id="MA_smartwizard">
                                    <ul>
                                        <li class="check" data-step="Step1"><a href="#step-1_Maintain">Fill Data</a></li>
                                        <li class="check" data-step="Step2"><a href="#step-2_Maintain">Type Name</a></li>
                                        <li class="check" data-step="Step3"><a href="#step-3_Maintain">Tag Group Name</a></li>
                                        <li class="check" data-step="Step4"><a href="#step-4_Maintain">Asset of Company</a></li>
                                        <li class="check" data-step="Step5"><a href="#step-5_Maintain">Export</a></li>
                                    </ul>
                                    <div class="row">
                                        <div id="step-1_Maintain" class="">
                                                <div class="panel-group">
                                                    <div class="panel panel-default" style="margin-top: 1em;">
                                                        <div class="panel-heading">
                                                            <h4>Fill Data</h4>
                                                        </div>
                                                        <div class="panel-body">
                                                            <div class="form-group">
                                                                <div class="col-md-12 col-sm-12">
                                                                    <div class="col-md-12">
                                                                        <div class="form-group col-md-6 ">
                                                                            <span class="col-md-4 col-xs-12" style="font-weight: bold;">Owner</span>
                                                                            <div class="col-md-8 date">
                                                                                <select class="form-control max-wide" id="textMA_Owner">
                                                                                    <option value="">=== Please Select Owner ===</option>
                                                                                    <option value="System Administrative">System Administrative</option>
                                                                                    <option value="Technical Support">Technical Support</option>
                                                                                    <option value="HelpDesk Support">HelpDesk Support</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group col-md-6 ">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <div class="form-group col-md-6 ">
                                                                            <span class="col-md-4 col-xs-12" style="font-weight: bold;">Main Type</span>
                                                                            <div class="col-md-8 date">
                                                                                <select class="form-control max-wide" id="textMA_MainType">
                                                                                    <option value="">=== Please Select Main Type ===</option>
                                                                                    <option value="Hardware">Hardware</option>
                                                                                    <option value="Software">Software</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group col-md-6 ">
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-12">
                                                                        <div class="form-group col-md-6 ">
                                                                            <span class="col-md-4 col-xs-12" style="font-weight: bold;">Purchase Type</span>
                                                                            <div class="col-md-8 date" data-provide="datepicker">
                                                                                <select class="form-control max-wide  max-wide" id="textMA_PurchaseType">
                                                                                    <option value="">=== Plase Select Purchase Type ===</option>
                                                                                    <option value="Rent">Rent(เช่า)</option>
                                                                                    <option value="Purchase">Purchase(ซื้อ)</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group col-md-6 ">
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-12">
                                                                        <div class="form-group col-md-6 ">
                                                                            <span class="col-md-4 col-xs-12" style="font-weight: bold;">Status Tag</span>
                                                                            <div class="col-md-8 date" data-provide="datepicker">
                                                                                <select class="form-control max-wide" id="textMA_Status">
                                                                                    <option value="">=== Please Select Status ===</option>
                                                                                    <option value="Active">Active</option>
                                                                                    <option value="InActive">InActive</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group col-md-6 ">
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-12">
                                                                        <div class="form-group col-md-6 col-xs-12">
                                                                            <span class="col-md-4 col-xs-12" style="font-weight: bold;">Repair date</span>
                                                                            <div class="col-md-8 col-xs-12">
                                                                                <div class="input-group">
                                                                                    <input id="textMA_sRepairDate" class="form-control notText max-wide " placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group col-md-6 col-xs-12">
                                                                            <span class="col-md-1 col-xs-12" style="font-weight: bold;">- </span>
                                                                            <div class="col-md-8 col-xs-12">
                                                                                <div class="input-group">
                                                                                    <input id="textMA_eRepairDate" class="form-control notText max-wide " placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-12">
                                                                        <div class="form-group col-md-6 col-xs-12">
                                                                            <span class="col-md-4 col-xs-12" style="font-weight: bold;">Commit Date</span>
                                                                            <div class="col-md-8 col-xs-12">
                                                                                <div class="input-group">
                                                                                    <input id="textMA_sCommitDate" class="form-control notText max-wide " placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group col-md-6 col-xs-12">
                                                                            <span class="col-md-1 col-xs-12" style="font-weight: bold;">- </span>
                                                                            <div class="col-md-8 col-xs-12">
                                                                                <div class="input-group">
                                                                                    <input id="textMA_eCommitDate" class="form-control notText max-wide " placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-12">
                                                                        <div class="form-group col-md-6 col-xs-12">
                                                                            <span class="col-md-4 col-xs-12" style="font-weight: bold;">Return Date</span>
                                                                            <div class="col-md-8 col-xs-12">
                                                                                <div class="input-group">
                                                                                    <input id="textMA_sReturnDate" class="form-control notText max-wide " placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group col-md-6 col-xs-12">
                                                                            <span class="col-md-1 col-xs-12" style="font-weight: bold;">- </span>
                                                                            <div class="col-md-8 col-xs-12">
                                                                                <div class="input-group">
                                                                                    <input id="textMA_eReturnDate" class="form-control notText max-wide " placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-12">
                                                                        <div class="form-group col-md-6 ">
                                                                            <span class="col-md-4 col-xs-12" style="font-weight: bold;">Status Repair</span>
                                                                            <div class="col-md-8 date" data-provide="datepicker">
                                                                                <select class="form-control max-wide" id="textMA_StatusRepair">
                                                                                    <option value="">=== Plase Select Status Repair ===</option>
                                                                                    <option value="Repairing">Repairing</option>
                                                                                    <option value="Returned">Returned</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group col-md-6 ">
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-12">
                                                                        <div class="form-group col-md-6 ">
                                                                            <span class="col-md-4 col-xs-12" style="font-weight: bold;">Vendor</span>
                                                                            <div class="col-md-8">
                                                                                <div class="input-group">
                                                                                    <input id="textMA_Vendor" type="text" class="form-control max-wide" autocomplete="off" style="display: none" disabled>
                                                                                    <input id="textMA_Vendor_Name" type="text" class="form-control max-wide" autocomplete="off" disabled>
                                                                                    <div class="input-group-btn">
                                                                                        <button class="btn btn-default Browse_modal" type="button" data-type="MA_Vender">
                                                                                            <i class="glyphicon glyphicon-search"></i>
                                                                                        </button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group col-md-6 ">
                                                                        </div>
                                                                    </div>

                                                                    
                                                                    <div style="text-align: right">
                                                                        <button id="MA_nextPage2" class="btn btn-warning Pos_Worker" type="button" data-toggle="modal">Next</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%--End panel-body--%>
                                                    </div>
                                                </div>
                                        </div>
                                        <%--======End Step 4.1======--%>
                                        <div id="step-2_Maintain" class="">
                                            <div class="panel-group">
                                                <div class="panel panel-default" style="margin-top: 1em;">
                                                    <div class="panel-heading">
                                                        <h4>Selecy Type Name</h4>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div style="max-width: 100%;">
                                                            <div class="col-md-12 col-sm-12">
                                                                <div class="row">
                                                                    <div class="table-responsive">
                                                                        <table class="table table-hover table-bordered" id="MA_Table_TypeName">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th class="center" style="width: 10%;">
                                                                                        <input class="form-check-input " id="fillterCheck_MA_Table_TypeName" type="checkbox" value="" style="margin-left: 23px;">
                                                                                    </th>
                                                                                    <th>Type Name</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody id="MA_List_TypeName">
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="text-align: right">
                                                                <button id="MA_nextPage3" class="btn btn-warning Pos_Worker" type="button" data-toggle="modal">Next</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--======End Step 4.2 ======--%>
                                        <div id="step-3_Maintain" class="">
                                            <div class="panel-group">
                                                <div class="panel panel-default" style="margin-top: 1em;">
                                                    <div class="panel-heading">
                                                        <h4>Group Name</h4>
                                                    </div>

                                                    <div class="panel-body">
                                                        <div style="max-width: 100%;">
                                                            <div class="col-md-12 col-sm-12">
                                                                <div class="row">
                                                                    <div class="table-responsive">
                                                                        <table class="table table-hover table-bordered" id="MA_Table_TagGroupName">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th class="center" style="width: 10%;">
                                                                                        <input class="form-check-input " id="fillterCheck_MA_Table_TagGroupName" type="checkbox" value="" style="margin-left: 23px;">
                                                                                    </th>
                                                                                    <th>Tag Group Name</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody id="MA_List_TagGroupName">
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="text-align: right">
                                                                <button id="MA_nextPage4" class="btn btn-warning Pos_Worker" type="button" data-toggle="modal">Next</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--======End Step 4.3 ======--%>
                                        <div id="step-4_Maintain" class="">
                                            <div class="panel-group">
                                                <div class="panel panel-default" style="margin-top: 1em;">
                                                    <div class="panel-heading">
                                                        <h4>Asset of Company</h4>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div style="max-width: 100%;">
                                                            <div class="col-md-12 col-sm-12">
                                                                <div class="row">
                                                                    <div class="table-responsive">
                                                                        <table class="table table-hover table-bordered" id="MA_Table_Asset_Company">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th class="center" style="width: 10%;">
                                                                                        <input class="form-check-input " id="fillterCheck_MA_Table_Asset_Company" type="checkbox" value="" style="margin-left: 23px;">
                                                                                    </th>
                                                                                    <th>Site Name</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody id="MA_list_site_ref">
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="text-align: right">
                                                                <button id="MA_nextPage5" class="btn btn-warning " type="button" data-toggle="modal">Next</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--======End Step 4.4 ======--%>
                                        <div id="step-5_Maintain" class="">
                                            <div class="panel-group">
                                                <div class="panel panel-default" style="margin-top: 1em;">
                                                    <div class="panel-heading">
                                                        <div class="row form-group">
                                                            <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                                                <h4>Export Maintennace</h4>
                                                            </div>
                                                            <div class="col-md-8 col-xs-8" style="text-align: right">
                                                                <button type="button" id="btnSearchMA_Clear" class="btn btn-warning" style="float: right;">Clear</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div style="max-width: 100%;">
                                                            <div class="col-md-12 col-sm-12">
                                                                <div class="row" id="" style="margin-top: 1em;">
                                                                    <div class="col-md-3" >
                                                                    </div>
                                                                    <div class="col-md-6" >
                                                                        <asp:Button runat="server" class="btn btn-block btn-Excel-dowlaod"
                                                                            Style="min-width: 100%; height: 80px; font-size: 24px; font-weight: bold;"
                                                                            Text="Export Maintennace" ID="Export_ITMaintenance" OnClick="Export_ITMaintenance_Click"
                                                                            UseSubmitBehavior="false" />
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--======End Step 4.5 ======--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--================End Tab 4 ====================-->
                        <div class="tab-pane fade" role="tabpanel" id="TAB5">
                            <div class="col-md-12">
                                <div class="row form-group">
                                    <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                    </div>
                                    <div class="col-md-8 col-xs-8" style="text-align: right">
                                    </div>
                                </div>
                                <%--End div Button--%>
                                <div class="col-12">
                                    <div class="row">
                                        <div id="His_smartwizard">
                                            <ul>
                                                <li class="check" data-step="Step1"><a href="#His_step-1">Fill Data</a></li>
                                                <li class="check" data-step="Step2"><a href="#His_step-2">Type Name</a></li>
                                                <li class="check" data-step="Step3"><a href="#His_step-3">Tag Group Name</a></li>
                                                <li class="check" data-step="Step4"><a href="#His_step-4">Asset of Company</a></li>
                                                <li class="check" data-step="Step5"><a href="#His_step-5">Export</a></li>
                                            </ul>
                                            <div class="row">
                                                <div id="His_step-1" class="">
                                                    <div class="panel-group">
                                                        <div class="panel panel-default" style="margin-top: 1em;">
                                                            <div class="panel-heading">
                                                                <h4>Fill Data</h4>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div class="form-group">
                                                                    <div class="col-md-12 col-sm-12">
                                                                        <div class="col-md-12">
                                                                            <div class="form-group col-md-6 ">
                                                                                <span class="col-md-4 col-xs-12" style="font-weight: bold;">Owner</span>
                                                                                <div class="col-md-8 date" data-provide="datepicker">
                                                                                    <select class="form-control max-wide" id="textHis_Owner">
                                                                                        <option value="">=== Please Select Owner ===</option>
                                                                                        <option value="System Administrative">System Administrative</option>
                                                                                        <option value="Technical Support">Technical Support</option>
                                                                                        <option value="HelpDesk Support">HelpDesk Support</option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group col-md-6 ">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <div class="form-group col-md-6 ">
                                                                                <span class="col-md-4 col-xs-12" style="font-weight: bold;">Main Type</span>
                                                                                <div class="col-md-8 date" data-provide="datepicker">
                                                                                    <select class="form-control max-wide" id="textHis_MainType">
                                                                                        <option value="">=== Please Select MainType ===</option>
                                                                                        <option value="Hardware">Hardware</option>
                                                                                        <option value="Software">Software</option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group col-md-6 ">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <div class="form-group col-md-6 ">
                                                                                <span class="col-md-4 col-xs-12" style="font-weight: bold;">Purchase Type</span>
                                                                                <div class="col-md-8 date" data-provide="datepicker">
                                                                                    <select class="form-control max-wide  max-wide" id="textHis_PurchaseType">
                                                                                        <option value="">=== Plase Select Purchase Type ===</option>
                                                                                        <option value="Rent">Rent(เช่า)</option>
                                                                                        <option value="Purchase">Purchase(ซื้อ)</option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group col-md-6 ">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <div class="form-group col-md-6 ">
                                                                                <span class="col-md-4 col-xs-12" style="font-weight: bold;">Status Tag</span>
                                                                                <div class="col-md-8 date" data-provide="datepicker">
                                                                                    <select class="form-control max-wide" id="textHis_Status">
                                                                                    <option value="">=== Please Select Status ===</option>
                                                                                    <option value="Active">Active</option>
                                                                                    <option value="InActive">InActive</option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group col-md-6 ">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <div class="form-group col-md-6 col-xs-12">
                                                                                <span class="col-md-4 col-xs-12" style="font-weight: bold;">Start Date</span>
                                                                                <div class="col-md-8 col-xs-12">
                                                                                    <div class="input-group">
                                                                                        <input id="textHis_sStartDate" class="form-control notText max-wide " placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group col-md-6 col-xs-12">
                                                                                <span class="col-md-1 col-xs-12" style="font-weight: bold;">- </span>
                                                                                <div class="col-md-8 col-xs-12">
                                                                                    <div class="input-group">
                                                                                        <input id="textHis_eStartDate" class="form-control notText max-wide " placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <div class="form-group col-md-6 col-xs-12">
                                                                                <span class="col-md-4 col-xs-12" style="font-weight: bold;">Return Date</span>
                                                                                <div class="col-md-8 col-xs-12">
                                                                                    <div class="input-group">
                                                                                        <input id="textHis_sReturnDate" class="form-control notText max-wide " placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group col-md-6 col-xs-12">
                                                                                <span class="col-md-1 col-xs-12" style="font-weight: bold;">- </span>
                                                                                <div class="col-md-8 col-xs-12">
                                                                                    <div class="input-group">
                                                                                        <input id="textHis_eReturnDate" class="form-control notText max-wide " placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div style="text-align: right">
                                                                            <button id="His_nextPage2" class="btn btn-warning " type="button" data-toggle="modal">Next</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <%--End panel-body--%>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--======End Step 5.1======--%>
                                                <div id="His_step-2" class="">
                                                    <div class="panel-group">
                                                        <div class="panel panel-default" style="margin-top: 1em;">
                                                            <div class="panel-heading">
                                                                <h4>Select Type Name</h4>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div style="max-width: 100%;">
                                                                    <div class="col-md-12 col-sm-12">
                                                                        <div class="row">
                                                                            <div class="table-responsive">
                                                                                <table class="table table-hover table-bordered" id="His_Table_TypeName">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th class="center" style="width: 10%;">
                                                                                                <input class="form-check-input " id="fillterCheck_His_Table_TypeName" type="checkbox" value="" style="margin-left: 23px;">
                                                                                            </th>
                                                                                            <th>Type Name</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody id="His_List_TypeName">
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div style="text-align: right">
                                                                        <button id="His_nextPage3" class="btn btn-warning Pos_Worker" type="button" data-toggle="modal">Next</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--======End Step 5.2 ======--%>
                                                <div id="His_step-3" class="">
                                                    <div class="panel-group">
                                                        <div class="panel panel-default" style="margin-top: 1em;">
                                                            <div class="panel-heading">
                                                                <h4>Select Tag Group Name</h4>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div style="max-width: 100%;">
                                                                    <div class="col-md-12 col-sm-12">
                                                                        <div class="row">
                                                                            <div class="table-responsive">
                                                                                <table class="table table-hover table-bordered" id="His_Table_TagGroupName">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th class="center" style="width: 10%;">
                                                                                                <input class="form-check-input " id="fillterCheck_His_Table_TagGroupName" type="checkbox" value="" style="margin-left: 23px;">
                                                                                            </th>
                                                                                            <th>Tag Group Name</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody id="His_List_TagGroupName">
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div style="text-align: right">
                                                                        <button id="His_nextPage4" class="btn btn-warning " type="button" data-toggle="modal">Next</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--======End Step 5.3 ======--%>
                                                <div id="His_step-4" class="">
                                                    <div class="panel-group">
                                                        <div class="panel panel-default" style="margin-top: 1em;">
                                                            <div class="panel-heading">
                                                                <h4>Select Asset of Company</h4>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div style="max-width: 100%;">
                                                                    <div class="col-md-12 col-sm-12">
                                                                        <div class="row">
                                                                            <div class="table-responsive">
                                                                                <table class="table table-hover table-bordered" id="His_Table_Asset_Company">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th class="center" style="width: 10%;">
                                                                                                <input class="form-check-input " id="fillterCheck_His_Table_Asset_Company" type="checkbox" value="" style="margin-left: 23px;">
                                                                                            </th>
                                                                                            <th>Site Name</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody id="His_list_site_ref">
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div style="text-align: right">
                                                                        <button id="His_nextPage5" class="btn btn-warning " type="button" data-toggle="modal">Next</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--======End Step 5.4 ======--%>
                                                <div id="His_step-5" class="">
                                                    <div class="panel-group">
                                                        <div class="panel panel-default" style="margin-top: 1em;">
                                                            <div class="panel-heading">
                                                                <div class="row form-group">
                                                                    <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                                                        <h4>Export Summary And Detail</h4>
                                                                    </div>
                                                                    <div class="col-md-8 col-xs-8" style="text-align: right">
                                                                        <button type="button" id="btnSearchHis_Clear" class="btn btn-warning" style="float: right;">Clear</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div style="max-width: 100%;">
                                                                    <div class="col-md-12 col-sm-12">
                                                                        <div class="row" id="" style="margin-top: 1em;">
                                                                            <div class="col-md-3" style="text-align: left;">
                                                                            </div>
                                                                            <div class="col-md-6" style="text-align: left;">
                                                                                <div>
                                                                                    <asp:Button runat="server" class="btn btn-block btn-Excel-dowlaod"
                                                                                        Style="min-width: 100%; height: 80px; font-size: 24px; font-weight: bold;"
                                                                                        Text="Export History" ID="Export_History" OnClick="Export_History_Click"
                                                                                        UseSubmitBehavior="false" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-3" style="text-align: left;">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--======End Step 5.5 ======--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--================End Tab 5====================-->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalBrowseSearch" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-xs">
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


            var Charge_Table_Fillter = $("#Charge_Table_Fillter").DataTable({
                searching: true,
                "ordering": false,
                "autoWidth": false
            });
            var SD_Table_TypeName = $("#SD_Table_TypeName").DataTable({
                searching: true,
                "ordering": false,
                "autoWidth": false
            });
            var SD_Table_TagGroupName = $("#SD_Table_TagGroupName").DataTable({
                searching: true,
                "ordering": false,
                "autoWidth": false
            });
            var SD_Table_Asset_Company = $("#SD_Table_Asset_Company").DataTable({
                searching: true,
                "ordering": false,
                "autoWidth": false
            });
            var SD_Table_Main_Company = $("#SD_Table_Main_Company").DataTable({
                searching: true,
                "ordering": false,
                "autoWidth": false
            });
            var SD_Table_BUGroup = $("#SD_Table_BUGroup").DataTable({
                searching: true,
                "ordering": false,
                "autoWidth": false
            });
            var MA_Table_TypeName = $("#MA_Table_TypeName").DataTable({
                searching: true,
                "ordering": false,
                "autoWidth": false
            });
            var MA_Table_TagGroupName = $("#MA_Table_TagGroupName").DataTable({
                searching: true,
                "ordering": false,
                "autoWidth": false
            });
            var MA_Table_Asset_Company = $("#MA_Table_Asset_Company").DataTable({
                searching: true,
                "ordering": false,
            });
            var His_Table_TypeName = $("#His_Table_TypeName").DataTable({
                searching: true,
                "ordering": false,
                "autoWidth": false
            });
            var His_Table_TagGroupName = $("#His_Table_TagGroupName").DataTable({
                searching: true,
                "ordering": false,
                "autoWidth": false
            });
            var His_Table_Asset_Company = $("#His_Table_Asset_Company").DataTable({
                searching: true,
                "ordering": false,
                "autoWidth": false
            });
            //Set Data Table

            $('#SD_smartwizard').smartWizard({
                theme: 'arrows',
                keyNavigation: false,
                showStepURLhash: false,
                selected: 0, //ใส่ 0 จะเริ่มที่ Step แรกสุด
                transitionEffect: 'slide',
                toolbarSettings: { toolbarPosition: 'none', showNextButton: 'false', showPreviousButton: 'false' }
            });

            $('#smartwizard').smartWizard({
                theme: 'arrows',
                keyNavigation: false,
                showStepURLhash: false,
                selected: 0, //ใส่ 0 จะเริ่มที่ Step แรกสุด
                transitionEffect: 'slide',
                toolbarSettings: { toolbarPosition: 'none', showNextButton: 'false', showPreviousButton: 'false' }
            });

            $('#MA_smartwizard').smartWizard({
                theme: 'arrows',
                keyNavigation: false,
                showStepURLhash: false,
                selected: 0, //ใส่ 0 จะเริ่มที่ Step แรกสุด
                transitionEffect: 'slide',
                toolbarSettings: { toolbarPosition: 'none', showNextButton: 'false', showPreviousButton: 'false' }
            });

            $('#Charge_smartwizard').smartWizard({
                theme: 'arrows',
                keyNavigation: false,
                showStepURLhash: false,
                selected: 0, //ใส่ 0 จะเริ่มที่ Step แรกสุด
                transitionEffect: 'slide',
                toolbarSettings: { toolbarPosition: 'none', showNextButton: 'false', showPreviousButton: 'false' }
            });

            $('#His_smartwizard').smartWizard({
                theme: 'arrows',
                keyNavigation: false,
                showStepURLhash: false,
                selected: 0, //ใส่ 0 จะเริ่มที่ Step แรกสุด
                transitionEffect: 'slide',
                toolbarSettings: { toolbarPosition: 'none', showNextButton: 'false', showPreviousButton: 'false' }
            });
            //Set Wizard

            var UserPosition = CheckPermission('ITTAG', 'Report');
            console.log(UserPosition)
            if (UserPosition != "") {
                SetPage(UserPosition)
                SetDatePicker();
                Charge_GetSiteRef();
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

            /////// PRINT ITTAG////////////////////////////////////////////////////////////////////////////////////////////////////////

            $(document).on("click", "#nextPage2", function () {
                console.log('Page2');
                var Start_IT_Tag_Code = $("#Start_IT_Tag_Code").val();
                var End_IT_Tag_Code = $("#End_IT_Tag_Code").val();
                var text = Start_IT_Tag_Code + ' To ' + End_IT_Tag_Code;
                //EXEC [dbo].[SP_IT_TAG_Export_PrintITTAG] 'FW2105001','FW2105005'
                $("#title_print").text(text);
                $("#MainContent_snsIT_TAG_Code_Start").val(Start_IT_Tag_Code);
                $("#MainContent_snsIT_TAG_Code_End").val(End_IT_Tag_Code);
                $('#smartwizard').smartWizard("next");
            });

            $(document).on("click", "#Charge_nextPage2", function () {
                var StartDate = $("#textCharge_StartDate").val();
                var EndtDate = $("#textCharge_EndDate").val();
                var Rate = $("#textCharge_Rate").val();
                var Currency = $("#textCharge_Currency").val();
                if (StartDate != "" && EndtDate != "" && Rate != "" && Currency != "") {
                    console.log('Page2');
                    GetFillter_Charge_IT_TAGGroup('');
                $('#Charge_smartwizard').data('smartWizard')._showStep(1);
                } else {
                    swal('Check Input', 'Place Check StartDate,EndDate,RateCharge,Currency', 'error');
                }
            });

            $(document).on("click", ".clickselecttext_ITTAG_Start", function () {
                var IT_Tag_Code = $(this).closest("tr").find("td:nth-child(1)").text();
                var taggroup = $(this).attr("data-taggroup");
                $("#Start_IT_Tag_Code").val(IT_Tag_Code);
                $("#Taggroup").val(taggroup);
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", ".clickselecttext_ITTAG_End", function () {
                var IT_Tag_Code = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#End_IT_Tag_Code").val(IT_Tag_Code);
                $("#modalBrowseSearch").modal("hide");
                $("#nextPage2").prop("disabled", false);
            });

            $(document).on("click", "#SD_nextPage2", function () {
                GetFillter_SD_Table_TypeName();
                $('#SD_smartwizard').data('smartWizard')._showStep(1);
            });

            $(document).on("click", "#SD_nextPage3", function () {
                GetFillter_SD_Table_TagGroupName();
                $('#SD_smartwizard').data('smartWizard')._showStep(2);
            });

            $(document).on("click", "#SD_nextPage4", function () {
                GetFillter_SD_Table_Asset_Company();
                $('#SD_smartwizard').data('smartWizard')._showStep(3);
            });

            $(document).on("click", "#SD_nextPage5", function () {
                $('#SD_smartwizard').data('smartWizard')._showStep(4);
            });

            $(document).on("click", "#SD_nextPage6", function () {
                GetFillter_SD_Table_Main_Company();
                $('#SD_smartwizard').data('smartWizard')._showStep(5);
            });

            $(document).on("click", "#SD_nextPage7", function () {
                GetFillter_SD_Table_BUGroup();
                $('#SD_smartwizard').data('smartWizard')._showStep(6);
            });

            $(document).on("click", "#SD_nextPage8", function () {
                SetValueReport_SD();
                $('#SD_smartwizard').data('smartWizard')._showStep(7);
            });

            $(document).on("click", "#MA_nextPage2", function () {
                GetFillter_MA_Table_TypeName();
                $('#MA_smartwizard').data('smartWizard')._showStep(1);
            });

            $(document).on("click", "#MA_nextPage3", function () {
                GetFillter_MA_Table_TagGroupName();
                $('#MA_smartwizard').data('smartWizard')._showStep(2);
            });

            $(document).on("click", "#MA_nextPage4", function () {
                GetFillter_MA_Table_Asset_Company();
                $('#MA_smartwizard').data('smartWizard')._showStep(3);
            });

            $(document).on("click", "#MA_nextPage5", function () {
                SetValueReport_MA();
                $('#MA_smartwizard').data('smartWizard')._showStep(4);
            });

            $(document).on("click", "#His_nextPage2", function () {
                GetFillter_His_Table_TypeName();
                $('#His_smartwizard').data('smartWizard')._showStep(1);
            });

            $(document).on("click", "#His_nextPage3", function () {
                GetFillter_His_Table_TagGroupName();
                $('#His_smartwizard').data('smartWizard')._showStep(2);
            });

            $(document).on("click", "#His_nextPage4", function () {
                GetFillter_His_Table_Asset_Company();
                $('#His_smartwizard').data('smartWizard')._showStep(3);
            });

            $(document).on("click", "#His_nextPage5", function () {
                SetValueReport_His();
                $('#His_smartwizard').data('smartWizard')._showStep(4);
            });

            //Set Step Click


            $(document).on("click", ".Browse_modal", function () {
                var Type = $(this).attr("data-type");
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                $("#search_box").empty();
                $("#search_box").append('<input type="text" id="Search_' + Type + '" placehStarter="Search.." class="form-control max-wide" autocomplete="off">');
                console.log(Type)
                if (Type == 'Start_ITTAG') {
                    GetBrowseITTAG(Type, '');
                }//End Start Tag
                else if (Type == 'End_ITTAG') {
                    GetBrowseITTAG(Type, '');
                }//End End Tag
                else if (Type == 'SD_Vender') {
                    SD_ModalVender('');
                }//End 
                else if (Type == 'SD_EmpNum') {
                    SD_Get_User_PE('');
                }//End 
                else if (Type == 'SD_costCenter') {
                    SD_Get_costCenter('');
                }//End 
                else if (Type == 'SD_Level') {
                    SD_Get_HomeSearchLevel('');
                }//End 
                else if (Type == 'SD_Location') {
                    SD_Get_Location('');
                }//End 
                else if (Type == 'SD_JobsTitle') {
                    SD_Get_JobsTitle('');
                }//End 
                else if (Type == 'MA_Vender') {
                    MA_ModalVender('');
                }//End 
            });
            //End Browse


            $(document).on("click", "#Charge_checkAll", function () {
                var rows = Charge_Table_Fillter.rows({ 'search': 'applied' }).nodes();
                $('input[type="checkbox"]', rows).prop('checked', this.checked);
            });


            $(document).on("click", ".clickselecttext_Vender", function () {
                var tr = $(this).closest("tr");
                var ven_num = tr.find("td:nth-child(1)").text();
                var ven_name = tr.find("td:nth-child(2)").text();
                $("#textSD_Vendor").val(ven_num);
                $("#textSD_Vendor_Name").val(ven_name);
                $("#modalBrowseSearch").modal("hide");
            });


            $(document).on("click", ".clickselecttext_MA_Vender", function () {
                var tr = $(this).closest("tr");
                var ven_num = tr.find("td:nth-child(1)").text();
                var ven_name = tr.find("td:nth-child(2)").text();
                $("#textMA_Vendor").val(ven_num);
                $("#textMA_Vendor_Name").val(ven_name);
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", ".clickselecttextSD_User_PE", function () {
                var tr = $(this).closest("tr");
                var EmpNum = tr.find("td:nth-child(1)").text();
                var name = tr.find("td:nth-child(2)").text();
                var site_ref = $(this).attr("data-site_ref");
                var dept = $(this).attr("data-dept");
                var uf_level = $(this).attr("data-uf_level");
                var uf_location = $(this).attr("data-uf_location");
                var uf_positionid = $(this).attr("data-uf_positionid");
                var uf_jobtitle = $(this).attr("data-uf_jobtitle");
                var uf_jobtitleen = $(this).attr("data-uf_jobtitleen");
                var bugroup = $(this).attr("data-bugroup");
                var bugoupdesc = $(this).attr("data-bugoupdesc");
                $("#textSD_EmpNum").val(EmpNum);
                $("#textSD_EmpName").val(name);
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", "#fillterCheck_SD_Table_TypeName", function () {
                var rows = SD_Table_TypeName.rows({ 'search': 'applied' }).nodes();
                $('input[type="checkbox"]', rows).prop('checked', this.checked);
            });

            $(document).on("click", "#fillterCheck_SD_Table_TagGroupName", function () {
                var rows = SD_Table_TagGroupName.rows({ 'search': 'applied' }).nodes();
                $('input[type="checkbox"]', rows).prop('checked', this.checked);
            });

            $(document).on("click", "#fillterCheck_SD_Table_Asset_Company", function () {
                var rows = SD_Table_Asset_Company.rows({ 'search': 'applied' }).nodes();
                $('input[type="checkbox"]', rows).prop('checked', this.checked);
            });

            $(document).on("click", "#fillterCheck_SD_Table_Main_Company", function () {
                var rows = SD_Table_Main_Company.rows({ 'search': 'applied' }).nodes();
                $('input[type="checkbox"]', rows).prop('checked', this.checked);
            });

            $(document).on("click", "#fillterCheck_SD_Table_BUGroup", function () {
                var rows = SD_Table_BUGroup.rows({ 'search': 'applied' }).nodes();
                $('input[type="checkbox"]', rows).prop('checked', this.checked);
            });

            $(document).on("click", "#fillterCheck_MA_Table_TypeName", function () {
                var rows = MA_Table_TypeName.rows({ 'search': 'applied' }).nodes();
                $('input[type="checkbox"]', rows).prop('checked', this.checked);
            });

            $(document).on("click", "#fillterCheck_MA_Table_TagGroupName", function () {
                var rows = MA_Table_TagGroupName.rows({ 'search': 'applied' }).nodes();
                $('input[type="checkbox"]', rows).prop('checked', this.checked);
            });

            $(document).on("click", "#fillterCheck_MA_Table_Asset_Company", function () {
                var rows = MA_Table_Asset_Company.rows({ 'search': 'applied' }).nodes();
                $('input[type="checkbox"]', rows).prop('checked', this.checked);
            });

            $(document).on("click", "#fillterCheck_His_Table_TypeName", function () {
                var rows = His_Table_TypeName.rows({ 'search': 'applied' }).nodes();
                $('input[type="checkbox"]', rows).prop('checked', this.checked);
            });

            $(document).on("click", "#fillterCheck_His_Table_TagGroupName", function () {
                var rows = His_Table_TagGroupName.rows({ 'search': 'applied' }).nodes();
                $('input[type="checkbox"]', rows).prop('checked', this.checked);
            });

            $(document).on("click", "#fillterCheck_His_Table_Asset_Company", function () {
                var rows = His_Table_Asset_Company.rows({ 'search': 'applied' }).nodes();
                $('input[type="checkbox"]', rows).prop('checked', this.checked);
            });

            //Click Checkbox all

            $(document).on("click", ".clickselectSD_Costcenter", function () {
                var CostcenterDesc = $(this).closest("tr").find("td:nth-child(2)").text();
                var costCenter = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#textSD_Costcenter").val(costCenter);
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", ".clickselecttextSD_HomeSearchLevel", function () {
                var Level = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#textSD_Level").val(Level);
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", ".clickselecttextSD_Location", function () {
                var Location = $(this).closest("tr").find("td:nth-child(1)").text();
                var LocationDescription = $(this).closest("tr").find("td:nth-child(2)").text();
                $("#textSD_Location").val(Location);
                $("#textSD_Location_Description").val(LocationDescription);
                $("#modalBrowseSearch").modal("hide");
            });
            $(document).on("click", ".clickselecttextSD_Jobs_Title", function () {
                var tr = $(this).closest("tr");
                var job_id = tr.find("td:nth-child(1)").text();
                var JobTitle = tr.find("td:nth-child(2)").text();
                $("#textSD_JobTitle_Name").val(JobTitle);
                $("#textSD_JobTitle").val(job_id);
                $("#modalBrowseSearch").modal("hide");
            });

            //Click Select            

            $(document).on("change", "#textCharge_StartDate,#textCharge_EndDate", function () {
                var StartDate = $("#textCharge_StartDate").val();
                var EndtDate = $("#textCharge_EndDate").val();
                if (StartDate != "" && EndtDate != "") {
                    $("#MainContent_btnExport_Charge_Excel").prop("disabled", false);
                    $("#MainContent_btnExport_Charge_PDF").prop("disabled", false);
                }
            });
            $(document).on("change", "#Search_Start_ITTAG", function () {
                var search = $(this).val();
                GetBrowseITTAG('Start_ITTAG', search);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("change", "#Search_End_ITTAG", function () {
                var search = $(this).val();
                GetBrowseITTAG('End_ITTAG', search);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("change", "#Search_Charge_TAGGroup", function () {
                var search = $(this).val();
                GetBrowseCharge_IT_TAGGroup(search);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("change", "#Search_SD_EmpNum", function () {
                var search = $(this).val();
                SD_Get_User_PE(search);
            });

            $(document).on("change", "#Search_SD_costCenter", function () {
                var search = $(this).val();
                SD_Get_costCenter(search);
            });

            $(document).on("change", "#Search_SD_Level", function () {
                var search = $(this).val();
                SD_Get_HomeSearchLevel(search);
            });

            $(document).on("change", "#Search_SD_Vender", function () {
                var search = $(this).val();
                SD_ModalVender(search)
            });

            $(document).on("change", "#Search_MA_Vender", function () {
                var search = $(this).val();
                MA_ModalVender(search)
            });

            $(document).on("change", "#Search_SD_Location", function () {
                var search = $(this).val();
                SD_Get_Location(search)
            });

            $(document).on("change", "#Search_SD_JobsTitle", function () {
                var search = $(this).val();
                SD_Get_JobsTitle(search)
            });
            // Change Search

            $(document).on("click", "#btnSearchCharge", function () {
                var rows = Charge_Table_Fillter.$("tr");
                var i = 0;
                var textTagGroup = "";
                rows.each(function () {
                    var check_to_checked = $(this).find("input[type=checkbox]").prop("checked");
                    if (check_to_checked) {
                        var checked = $(this).find("input[type=checkbox]").prop("checked");
                        var TagGroup = $(this).find("td:nth-child(2)").text();
                        if (checked) {
                            if (i == 0) {
                                textTagGroup += TagGroup;
                            } else {
                                textTagGroup += "," + TagGroup;
                            }
                            i++
                        }

                        $("#textCharge_TAGGroup").val(textTagGroup);
                    }
                });

                var StartDate = $("#textCharge_StartDate").val();
                var EndtDate = $("#textCharge_EndDate").val();
                var SiteRef = $("#textCharge_SiteRef").val();
                var TAGGroup = $("#textCharge_TAGGroup").val();
                var Rate = $("#textCharge_Rate").val();
                var Currency = $("#textCharge_Currency").val();
                if (StartDate != "" && EndtDate != "" && Rate != "" && Currency != "") {
                    $("#divExportReport").css("display", "block");
                    $("#MainContent_snssReturnDate").val(StartDate);
                    $("#MainContent_snseReturnDate").val(EndtDate);
                    $("#MainContent_snsCompany").val(SiteRef);
                    $("#MainContent_snsTagGroup").val(TAGGroup);
                    $("#MainContent_snsRate").val(Rate);
                    $("#MainContent_snsCurrency").val(Currency);
                    $('#Charge_smartwizard').smartWizard("next");
                }
                else {
                    swal('Error', 'กรุณากรอกข้อมูล Start Date End Date และ Rate ให้ครบถ้วน', 'error');
                }
            });

            $(document).on("click", "#btnSearchSD_Clear", function () {
                $("#textSD_Owner").val('');
                $("#textSD_MainType").val('');
                $("#textSD_PurchaseType").val('');
                $("#textSD_Date_Start").val('');
                $("#textSD_Date_End").val('');
                $("#textSD_Expire_Date_Start").val('');
                $("#textSD_Expire_Date_End").val('');
                $("#textSD_Vendor_Name").val('');
                $("#textSD_Status").val('');

                $("#divExportReport").css("display", "none");
                $('#SD_smartwizard').smartWizard("reset");
            });

            $(document).on("click", "#btnSearchCharge_Clear", function () {
                $("#textCharge_StartDate").val('');
                $("#textCharge_EndDate").val('');
                $("#textCharge_SiteRef").val('');
                $("#textCharge_TAGGroup").val('');
                $("#textCharge_Rate").val('');

                $("#divExportReport").css("display", "none");
                $('#Charge_smartwizard').smartWizard("reset");
            });

            $(document).on("click", "#btnSearchMA_Clear", function () {
                $("#textMA_Owner").val('');
                $("#textMA_MainType").val('');
                $("#textMA_PurchaseType").val('');
                $("#textMA_Status").val('');
                $("#textMA_sRepairDate").val('');
                $("#textMA_eRepairDate").val('');
                $("#textMA_sCommitDate").val('');
                $("#textMA_eCommitDate").val('');
                $("#textMA_sReturnDate").val('');
                $("#textMA_eReturnDate").val('');
                $("#textMA_StatusRepair").val('');
                $("#textMA_Vendor_Name").val('');
                $('#MA_smartwizard').smartWizard("reset");
            });

            $(document).on("click", "#btnSearchHis_Clear", function () {
                $("#textHis_Owner").val('');
                $("#textHis_MainType").val('');
                $("#textHis_PurchaseType").val('');
                $("#textHis_Status").val('');
                $("#textHis_sStartDate").val('');
                $("#textHis_eStartDate").val('');
                $("#textHis_sReturnDate").val('');
                $("#textHis_eReturnDate").val('');
                $('#His_smartwizard').smartWizard("reset");
            });
            //Print ITTAG



            function GetFillter_Charge_IT_TAGGroup(search) {
                Charge_Table_Fillter.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GetFillterCharge_IT_TAG_Group_New") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search, }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Taggroup = val[0];
                                var TaggroupName = val[1];
                                var Typename = val[2];
                                Charge_Table_Fillter.row.add(['<input class="form-check-input fillterCheck" style="margin-left: 2.5em;" type="checkbox" value="">', Taggroup, TaggroupName, Typename]).draw().node();
                            });
                        }
                    }
                });
            }

            function SD_ModalVender(search) {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var fragmentHeader = '';
                var fragment = '';
                $("#Titlebrowse").text("Search Vendor");
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
                $("#modalBrowseSearch").modal("show");
            }

            function MA_ModalVender(search) {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var fragmentHeader = '';
                var fragment = '';
                $("#Titlebrowse").text("Search Vendor");
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
                                fragment += '<td><a class="clickselecttext_MA_Vender" href="javascript:void(0)">' + vend_num + '</a></td>';
                                fragment += '<td><a class="clickselecttext_MA_Vender" href="javascript:void(0)">' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            }

            function SD_Get_User_PE(search) {
                $("#Titlebrowse").text('Search Employee');
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
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
                                fragment += '<td><a class="clickselecttextSD_User_PE" href="javascript:void(0)" data-site_ref="' + Site_Ref + ' "data-dept="' + dept + ' "data-Uf_level="' + Uf_Level + '" data-Uf_Location="' + Uf_Location + '"data-uf_positionid="' + Uf_PositionID + '"data-uf_jobtitle="' + Uf_Jobtitle + '" data-uf_JobTitleen="' + Uf_JobTitleEN + '" data-bugroup="' + BUGroup + '" data-bugoupDesc="' + BUGroupDesc + '" >' + Emp_Num + '</a></td>';
                                fragment += '<td><a class="clickselecttextSD_User_PE" href="javascript:void(0)" data-site_ref="' + Site_Ref + ' "data-dept="' + dept + ' "data-Uf_level="' + Uf_Level + '" data-Uf_Location="' + Uf_Location + '"data-uf_positionid="' + Uf_PositionID + '"data-uf_jobtitle="' + Uf_Jobtitle + '" data-uf_JobTitleen="' + Uf_JobTitleEN + '" data-bugroup="' + BUGroup + '" data-bugoupDesc="' + BUGroupDesc + '" >' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            }

            function SD_Get_costCenter(search) {
                $("#Titlebrowse").text('Search CostCenter');
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `<th>CostCenter</th>
                                     <th>Desc</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/VW_HR_List_Company") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var name = val[1];
                                var id = val[0];
                                var group = val[4];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectSD_Costcenter" href="javascript:void(0)" >' + id + '</a></td>';
                                fragment += '<td><a class="clickselectSD_Costcenter" href="javascript:void(0)" >' + name + '</a></td>';
                                //fragment += '<td><a class="clickselectdepartment" href="javascript:void(0)" >' + group + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            }
            function SD_Get_HomeSearchLevel(search) {
                $("#Titlebrowse").text('Search Level');
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-xs');
                fragmentHeader = `<th>Level</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Get_Level") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Level = val[0];
                                //var Site_Name_EN = val[1];
                                //var Site_Name_TH = val[2];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttextSD_HomeSearchLevel" href="javascript:void(0)">' + Level + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            }
            function SD_Get_Location(search) {
                $("#Titlebrowse").text('Search Location');
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `<th>Location</th>
                                  <th>Description</th>
                                `;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/VW_Location") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Location = val[0];
                                var Description = val[1];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttextSD_Location" href="javascript:void(0)">' + Location + '</a></td>';
                                fragment += '<td><a class="clickselecttextSD_Location" href="javascript:void(0)">' + Description + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            }

            function SD_Get_JobsTitle(search) {
                $("#Titlebrowse").text('Search Jobs Title');
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var fragmentHeader = '';
                var fragment = '';
                var site = $("#Master_Maincom_ID").val()
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `<th>Job ID</th>
                                     <th>JobTitle</th>
                                    <th>jobTitleEn</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SD_Get_Jobs_Title") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search, site: site }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var job_id = val[0];
                                var stat = val[1];
                                var uf_jobTitleEn = val[2];
                                var Uf_JobTitle = val[3];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttextSD_Jobs_Title" href="javascript:void(0)">' + job_id + '</a></td>';
                                fragment += '<td><a class="clickselecttextSD_Jobs_Title" href="javascript:void(0)">' + Uf_JobTitle + '</a></td>';
                                fragment += '<td><a class="clickselecttextSD_Jobs_Title" href="javascript:void(0)">' + uf_jobTitleEn + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            }
            //End Get Function

            function GetFillter_SD_Table_TypeName() {
                SD_Table_TypeName.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Report_search_TypeName") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var TypeName = val[0];
                                SD_Table_TypeName.row.add([
                                    '<input class="form-check-input fillterCheck " data-value="' + TypeName + '" type="checkbox" value="" style="margin-left: 4rem;">'
                                    , TypeName
                                ]).draw().node();

                            });
                        }

                    }
                });
            }

            function GetFillter_SD_Table_TagGroupName() {
                SD_Table_TagGroupName.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Report_search_TagGroupName") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var TagGroup = val[0];
                                var TagGroupName = val[1];
                                SD_Table_TagGroupName.row.add([
                                    '<input class="form-check-input fillterCheck " data-value="' + TagGroup + '" type="checkbox" value="" style="margin-left: 4rem;">'
                                    , TagGroupName
                                ]).draw().node();

                            });
                        }

                    }
                });
            }

            function GetFillter_SD_Table_Asset_Company() {
                SD_Table_Asset_Company.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Report_search_site_ref") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[Site_Ref],[Site_Name_EN],[Site_Name_TH] 
                                var Site_Ref = val[0];
                                var Site_Name_EN = val[1];
                                var Site_Name_TH = val[2];
                                SD_Table_Asset_Company.row.add([
                                    '<input class="form-check-input fillterCheck " data-value="' + Site_Ref + '" type="checkbox" value="" style="margin-left: 4rem;">'
                                    , Site_Name_EN
                                ]).draw().node();

                            });
                        }

                    }
                });
            }

            function GetFillter_MA_Table_TypeName() {
                MA_Table_TypeName.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Report_search_TypeName") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var TypeName = val[0];
                                MA_Table_TypeName.row.add([
                                    '<input class="form-check-input fillterCheck " data-value="' + TypeName + '" type="checkbox" value="" style="margin-left: 4rem;">'
                                    , TypeName
                                ]).draw().node();

                            });
                        }

                    }
                });
            }

            function GetFillter_MA_Table_TagGroupName() {
                MA_Table_TagGroupName.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Report_search_TagGroupName") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var TagGroup = val[0];
                                var TagGroupName = val[1];
                                MA_Table_TagGroupName.row.add([
                                    '<input class="form-check-input fillterCheck " data-value="' + TagGroup + '" type="checkbox" value="" style="margin-left: 4rem;">'
                                    , TagGroupName
                                ]).draw().node();

                            });
                        }

                    }
                });
            }

            function GetFillter_His_Table_TagGroupName() {
                His_Table_TagGroupName.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Report_search_TagGroupName") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var TagGroup = val[0];
                                var TagGroupName = val[1];
                                His_Table_TagGroupName.row.add([
                                    '<input class="form-check-input fillterCheck " data-value="' + TagGroup + '" type="checkbox" value="" style="margin-left: 4rem;">'
                                    , TagGroupName
                                ]).draw().node();

                            });
                        }

                    }
                });
            }

            function GetFillter_His_Table_TypeName() {
                His_Table_TypeName.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Report_search_TypeName") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var TypeName = val[0];
                                His_Table_TypeName.row.add([
                                    '<input class="form-check-input fillterCheck " data-value="' + TypeName + '" type="checkbox" value="" style="margin-left: 4rem;">'
                                    , TypeName
                                ]).draw().node();

                            });
                        }

                    }
                });
            }

            function GetFillter_MA_Table_Asset_Company() {
                MA_Table_Asset_Company.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Report_search_site_ref") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[Site_Ref],[Site_Name_EN],[Site_Name_TH] 
                                var Site_Ref = val[0];
                                var Site_Name_EN = val[1];
                                var Site_Name_TH = val[2];
                                MA_Table_Asset_Company.row.add([
                                    '<input class="form-check-input fillterCheck " data-value="' + Site_Ref + '" type="checkbox" value="" style="margin-left: 4rem;">'
                                    , Site_Name_EN
                                ]).draw().node();

                            });
                        }

                    }
                });
            }

            function GetFillter_His_Table_Asset_Company() {
                His_Table_Asset_Company.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Report_search_site_ref") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[Site_Ref],[Site_Name_EN],[Site_Name_TH] 
                                var Site_Ref = val[0];
                                var Site_Name_EN = val[1];
                                var Site_Name_TH = val[2];
                                His_Table_Asset_Company.row.add([
                                    '<input class="form-check-input fillterCheck " data-value="' + Site_Ref + '" type="checkbox" value="" style="margin-left: 4rem;">'
                                    , Site_Name_EN
                                ]).draw().node();

                            });
                        }

                    }
                });
            }

            function GetFillter_SD_Table_Main_Company() {
                SD_Table_Main_Company.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Report_search_site_ref") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var site_ref = val[0];
                                var site_Name_EN = val[1];
                                var site_Name_TH = val[2];
                                SD_Table_Main_Company.row.add([
                                    '<input class="form-check-input fillterCheck " data-value="' + site_ref + '" type="checkbox" value="" style="margin-left: 4rem;">'
                                    , site_Name_EN
                                ]).draw().node();

                            });
                        }

                    }
                });
            }

            function GetFillter_SD_Table_BUGroup() {
                SD_Table_BUGroup.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SD_search_BUGroup") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Uf_Group = val[0];
                                var GroupDesc = val[1];
                                SD_Table_BUGroup.row.add([
                                    '<input class="form-check-input fillterCheck " data-value="' + Uf_Group + '" type="checkbox" value="" style="margin-left: 4rem;">'
                                    , GroupDesc
                                ]).draw().node();

                            });
                        }

                    }
                });
            }
            //End Get Tablefillter

            function SetValueReport_SD() {
                var Owner = $("#textSD_Owner").val();
                var MainType = $("#textSD_MainType").val();
                var PurchaseType = $("#textSD_PurchaseType").val();
                var VendorPurchase = $("#textSD_Vendor").val();
                var sStartContractDate = $("#textSD_Date_Start").val();
                var eStartContractDate = $("#textSD_Date_End").val();
                var sExpireContractDate = $("#textSD_Expire_Date_Start").val();
                var eExpireContractDate = $("#textSD_Expire_Date_End").val();
                var StatusTag = $("#textSD_Status").val();
                //Step1
                var rows_TypeName = SD_Table_TypeName.$("tr");
                var TypeName = GetValue_fillter(rows_TypeName);
                //console.log("TypeName :" +TypeName );
                //Step2
                var rows_TagGroup = SD_Table_TagGroupName.$("tr");
                var TagGroup = GetValue_fillter(rows_TagGroup);
                //console.log("TagGroup :" +TagGroup );
                //Step3
                var rows_AssetCompany = SD_Table_Asset_Company.$("tr");
                var AssetCompany = GetValue_fillter(rows_AssetCompany);
                //console.log("AssetCompany :" +AssetCompany );
                //Step4
                var Emp = $("#textSD_EmpNum").val();
                var EmpDept = $("#textSD_Costcenter").val();
                var EmpLevel = $("#textSD_Level").val();
                var EmpLocation = $("#textSD_Location").val();
                var EmpJobTitle = $("#textSD_JobTitle").val();
                var sBorrowDueDate = $("#textSD_Borrow_Date_Start").val();
                var eBorrowDueDate = $("#textSD_Borrow_Date_End").val();
                var Statususage = $("#textSD_Emp_Status").val();
                //Step5
                var rows_Company = SD_Table_Main_Company.$("tr");
                var Company = GetValue_fillter(rows_Company);
                //console.log("Company :" +Company );
                //Step6
                var rows_BusinessGroup = SD_Table_BUGroup.$("tr");
                var BusinessGroup = GetValue_fillter(rows_BusinessGroup);
                //console.log("BusinessGroup :" +BusinessGroup );
                //Step7

                $("#MainContent_snsOwner").val(Owner);
                $("#MainContent_snsMainType").val(MainType);
                $("#MainContent_snsPurchaseType").val(PurchaseType);
                $("#MainContent_snsVendorPurchase").val(VendorPurchase);
                $("#MainContent_snssStartContractDate").val(sStartContractDate);
                $("#MainContent_snseStartContractDate").val(eStartContractDate);
                $("#MainContent_snssExpireContractDate").val(sExpireContractDate);
                $("#MainContent_snseExpireContractDate").val(eExpireContractDate);
                $("#MainContent_snsStatusTag").val(StatusTag);
                $("#MainContent_snsTypeName").val(TypeName);
                $("#MainContent_snsTagGroup_SD").val(TagGroup);
                $("#MainContent_snsAssetCompany").val(AssetCompany);
                $("#MainContent_snsEmp").val(Emp);
                $("#MainContent_snsEmpDept").val(EmpDept);
                $("#MainContent_snsEmpLevel").val(EmpLevel);
                $("#MainContent_snsEmpLocation").val(EmpLocation);
                $("#MainContent_snsEmpJobTitle").val(EmpJobTitle);
                $("#MainContent_snssBorrowDueDate").val(sBorrowDueDate);
                $("#MainContent_snseBorrowDueDate").val(eBorrowDueDate);
                $("#MainContent_snsStatususage").val(Statususage);
                $("#MainContent_snsCompany").val(Company);
                $("#MainContent_snsBusinessGroup").val(BusinessGroup);
            }
            //End Set Value Report Summary Detail C#

            

            function SetValueReport_MA() {
                var Owner = $("#textMA_Owner").val();
                var MainType = $("#textMA_MainType").val();
                var PurchaseType = $("#textMA_PurchaseType").val();
                var StatusTag = $("#textMA_Status").val();
                var sRepairDate = $("#textMA_sRepairDate").val();
                var eRepairDate = $("#textMA_eRepairDate").val();
                var sCommitDate = $("#textMA_sCommitDate").val();
                var eCommitDate = $("#textMA_eCommitDate").val();
                var sReturnDate = $("#textMA_sReturnDate").val();
                var eReturnDate = $("#textMA_eReturnDate").val();
                var StatusRepair = $("#textMA_StatusRepair").val();
                var VendorMA = $("#textMA_Vendor").val();
                //console.log("Step1////////////////////////// :" );
                //console.log("Owner :" +Owner );
                //console.log("MainType :" +MainType );
                //console.log("PurchaseType :" +PurchaseType );
                //console.log("StatusTag :" +StatusTag );
                //console.log("sRepairDate :" +sRepairDate );
                //console.log("eRepairDate :" +eRepairDate );
                //console.log("sCommitDate :" +sCommitDate );
                //console.log("eCommitDate :" +eCommitDate );
                //console.log("sReturnDate :" +sReturnDate );
                //console.log("eReturnDate :" +eReturnDate );
                //console.log("StatusRepair :" +StatusRepair );
                //console.log("VendorMA :" +VendorMA );
                //Step1
                var rows_TypeName = MA_Table_TypeName.$("tr");
                var TypeName = GetValue_fillter(rows_TypeName);
                //console.log("Step2////////////////////////// :" );
                //console.log("TypeName :" +TypeName );
                //Step2
                var rows_TagGroup = MA_Table_TagGroupName.$("tr");
                var TagGroup = GetValue_fillter(rows_TagGroup);
                //console.log("Step3////////////////////////// :" );
                //console.log("TagGroup :" +TagGroup );
                //Step3
                var rows_AssetCompany = MA_Table_Asset_Company.$("tr");
                var AssetCompany = GetValue_fillter(rows_AssetCompany);
                 //console.log("Step4////////////////////////// :" );
                 //console.log("AssetCompany :" +AssetCompany );
                //Step4
                
                   $("#MainContent_snsMA_Owner").val(Owner);
                   $("#MainContent_snsMA_AssetCompany").val(AssetCompany);
                   $("#MainContent_snsMA_MainType").val(MainType);
                   $("#MainContent_snsMA_TypeName").val(TypeName);
                   $("#MainContent_snsMA_TagGroup").val(TagGroup);
                   $("#MainContent_snsMA_PurchaseType").val(PurchaseType);
                   $("#MainContent_snsMA_VendorMA").val(VendorMA);
                   $("#MainContent_snsMA_StatusTag").val(StatusTag);
                   $("#MainContent_snsMA_sRepairDate").val(sRepairDate);
                   $("#MainContent_snsMA_eRepairDate").val(eRepairDate);
                   $("#MainContent_snsMA_sCommitDate").val(sCommitDate);
                   $("#MainContent_snsMA_eCommitDate").val(eCommitDate);
                   $("#MainContent_snsMA_sReturnDate").val(sReturnDate);
                   $("#MainContent_snsMA_eReturnDate").val(eReturnDate);
                   $("#MainContent_snsMA_StatusRepair").val(StatusRepair);
            }
            //End Set Value Report Maintainnace C#

            function SetValueReport_His() {
                var Owner = $("#textHis_Owner").val();
                var MainType = $("#textHis_MainType").val();
                var PurchaseType = $("#textHis_PurchaseType").val();
                var StatusTag = $("#textHis_Status").val();
                var sStartDate = $("#textHis_sStartDate").val();
                var eStartDate = $("#textHis_eStartDate").val();
                var sReturnDate = $("#textHis_sReturnDate").val();
                var eReturnDate = $("#textHis_eReturnDate").val();
                console.log("Step1////////////////////////// :" );
                console.log("Owner :" +Owner );
                console.log("MainType :" +MainType );
                console.log("PurchaseType :" +PurchaseType );
                console.log("StatusTag :" +StatusTag );
                console.log("sStartDate :" +sStartDate );
                console.log("eStartDate :" +eStartDate );
                console.log("sReturnDate :" +sReturnDate );
                console.log("eReturnDate :" +eReturnDate );
                //Step1
                var rows_TypeName = His_Table_TypeName.$("tr");
                var TypeName = GetValue_fillter(rows_TypeName);
                console.log("Step2////////////////////////// :" );
                console.log("TypeName :" +TypeName );
                //Step2
                var rows_TagGroup = His_Table_TagGroupName.$("tr");
                var TagGroup = GetValue_fillter(rows_TagGroup);
                console.log("Step3////////////////////////// :" );
                console.log("TagGroup :" +TagGroup );
                //Step3
                var rows_AssetCompany = His_Table_Asset_Company.$("tr");
                var AssetCompany = GetValue_fillter(rows_AssetCompany);
                 console.log("Step4////////////////////////// :" );
                 console.log("AssetCompany :" +AssetCompany );
                //Step4
                

                $("#MainContent_snsHis_Owner").val(Owner);
                $("#MainContent_snsHis_MainType").val(MainType);
                $("#MainContent_snsHis_PurchaseType").val(PurchaseType);
                $("#MainContent_snsHis_StatusTag").val(StatusTag);
                $("#MainContent_snsHis_sStartDate").val(sStartDate);
                $("#MainContent_snsHis_eStartDate").val(eStartDate);
                $("#MainContent_snsHis_sReturnDate").val(sReturnDate);
                $("#MainContent_snsHis_eReturnDate").val(eReturnDate);
                $("#MainContent_snsHis_TypeName").val(TypeName);
                $("#MainContent_snsHis_TagGroup").val(TagGroup);
                $("#MainContent_snsHis_AssetCompany").val(AssetCompany);
                //$("#MainContent_snsHis_Emp").val(Emp);
                //$("#MainContent_snsHis_EmpDept").val(EmpDept);
                //$("#MainContent_snsHis_EmpLevel").val(EmpLevel);
                //$("#MainContent_snsHis_EmpLocation").val(EmpLocation);
                //$("#MainContent_snsHis_EmpJobTitle").val(EmpJobTitle);
                //$("#MainContent_snsHis_sBorrowDueDate").val(sBorrowDueDate);
                //$("#MainContent_snsHis_eBorrowDueDate").val(eBorrowDueDate);
                //$("#MainContent_snsHis_Statususage").val(Statususage);
                //$("#MainContent_snsHis_Company").val(Company);
                //$("#MainContent_snsHis_BusinessGroup").val(BusinessGroup);
            }
            //End Set Value Report Summary Detail C#


        });
        function GetValue_fillter(rows) {
            var i = 0;
            var text = "";
            var value = "";
            rows.each(function () {
                var check_to_checked = $(this).find("input[type=checkbox]").prop("checked");
                if (check_to_checked) {
                    var checked = $(this).find("input[type=checkbox]").prop("checked");
                    value = $(this).find("td:nth-child(1)").find("input[type=checkbox]").attr("data-value");
                    //Set Get Value 
                    if (checked) {
                        if (i == 0) {
                            text += value;
                        } else {
                            text += "," + value;
                        }
                        i++
                    }
                }
            });
            return text;

        }
        //End Document Ready

        function SetDatePicker() {
            $('#textCharge_StartDate').datepicker({ format: 'yyyy-mm-dd', autoHide: true });
            $('#textCharge_EndDate').datepicker({ format: 'yyyy-mm-dd', autoHide: true });
            $('#textSD_Date_Start').datepicker({ format: 'yyyy-mm-dd', autoHide: true });
            $('#textSD_Date_End').datepicker({ format: 'yyyy-mm-dd', autoHide: true });
            $('#textSD_Expire_Date_Start').datepicker({ format: 'yyyy-mm-dd', autoHide: true });
            $('#textSD_Expire_Date_End').datepicker({ format: 'yyyy-mm-dd', autoHide: true });
            $('#textSD_Borrow_Date_Start').datepicker({ format: 'yyyy-mm-dd', autoHide: true });
            $('#textSD_Borrow_Date_End').datepicker({ format: 'yyyy-mm-dd', autoHide: true });
            $('#textMA_sRepairDate').datepicker({ format: 'yyyy-mm-dd', autoHide: true });
            $('#textMA_eRepairDate').datepicker({ format: 'yyyy-mm-dd', autoHide: true });
            $('#textMA_sCommitDate').datepicker({ format: 'yyyy-mm-dd', autoHide: true });
            $('#textMA_eCommitDate').datepicker({ format: 'yyyy-mm-dd', autoHide: true });
            $('#textMA_sReturnDate').datepicker({ format: 'yyyy-mm-dd', autoHide: true });
            $('#textMA_eReturnDate').datepicker({ format: 'yyyy-mm-dd', autoHide: true });
            $('#textHis_sStartDate').datepicker({ format: 'yyyy-mm-dd', autoHide: true });
            $('#textHis_eStartDate').datepicker({ format: 'yyyy-mm-dd', autoHide: true });
            $('#textHis_sReturnDate').datepicker({ format: 'yyyy-mm-dd', autoHide: true });
            $('#textHis_eReturnDate').datepicker({ format: 'yyyy-mm-dd', autoHide: true });
        }

        function Charge_GetSiteRef() {
            var siteRef = '<option value="">=== Please Select a company ===</option>';
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
                        $("#textCharge_SiteRef").append(siteRef);
                    }
                }
            });
        }

        // Charge ///


        function GetBrowseITTAG(Type, search) {
            $("#Titlebrowse").text("Select Start ITTAG");
            $("#TBheaderBrowse").empty();
            $("#TBbodyBrowse").empty();
            fragment = "";
            fragmentHeader = `<th class="center">ITTAG</th>`;
            if (Type == 'Start_ITTAG') {

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Get_Print_VW_IT_TAG_Master") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Taggroup: '', search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var IT_Tag_Code = val[0];
                                var Tag_Group = val[1];
                                var Purchase_Type = val[2];
                                var Start_Contract_date = val[3];
                                var Expire_Contract_date = val[4];
                                var Detail = val[5];
                                var Brand = val[6];
                                var Model = val[7];
                                var Volume = val[8];
                                var Status = val[9];
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
                                fragment += '<tr>';
                                fragment += '<td class="center"><a class="clickselecttext_ITTAG_Start" data-taggroup="' + TagGroup + '"  href="javascript:void(0)">' + IT_Tag_Code + '</a></td>';

                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            }
            if (Type == 'End_ITTAG') {
                $("#Titlebrowse").text("Select End ITTAG");
                var Taggroup = $("#Taggroup").val();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Get_Print_VW_IT_TAG_Master") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Taggroup: Taggroup, search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var IT_Tag_Code = val[0];
                                var Tag_Group = val[1];
                                var Purchase_Type = val[2];
                                var Start_Contract_date = val[3];
                                var Expire_Contract_date = val[4];
                                var Detail = val[5];
                                var Brand = val[6];
                                var Model = val[7];
                                var Volume = val[8];
                                var Status = val[9];
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
                                fragment += '<tr>';
                                fragment += '<td class="center"><a class="clickselecttext_ITTAG_End"  href="javascript:void(0)">' + IT_Tag_Code + '</a></td>';

                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            }
        }
        //////// PRINT ITTAG ////////////////////////////////////////////////////////////////////////////////////////////////////////

    </script>
</asp:Content>
