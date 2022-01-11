<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ITTAG_MaintainPE.aspx.cs" Inherits="ITPortal.ITTAG_MaintainPE" %>

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
        .over-volumn {
            color: #b71c1c;
            /*font-size: 18px;*/
        }

        .datepicker-container {
            z-index: 1061 !important;
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
    </style>

    <div class="page-header">
        <div class="row">
            <div class="col-md-4" style="text-align: left;">
                <h2>Maintain Equipment Owner</h2>
            </div>
            <div class="col-md-8" style="text-align: right">
            </div>
            <div class="col-md-12" style="margin-top: 2rem;">

                <%--Employee--%>
                <div id="hideToggle">
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="row" style="margin-bottom: 1rem; margin-top: 1rem;">
                                    <div class="col-md-6  col-xs-12">
                                        <div class="col-md-3 col-sm-3 col-xs-12">
                                            <label class="control-label" style="font-size: 12px">Emp Num </label>
                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <div class="input-group">
                                                <input id="textEmpNum" type="text" class="form-control max-wide" disabled>
                                                <div class="input-group-btn">
                                                    <button class="btn btn-default Browse_modal" data-type="EmpNum" type="button">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <%--Hide BU/JOB_ID--%>
                                            <input id="textEmpBU" type="text" class="form-control" style="display: none" disabled>
                                            <input id="textJobTitle_ID" type="text" class="form-control" style="display: none" disabled>
                                        </div>
                                    </div>

                                </div>
                                <div class="row" style="margin-bottom: 1rem">
                                    <div class="col-md-6  col-xs-12 ">
                                        <div class="col-md-3 col-sm-3 col-xs-12">
                                            <label class="control-label" style="font-size: 12px;">Name </label>
                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <p id="textEmpName"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-6  col-xs-12 ">
                                        <div class="col-md-3 col-sm-4 col-xs-12">
                                            <label class="control-label" style="font-size: 12px">Level</label>
                                        </div>
                                        <div class="col-md-9 col-xs-12">
                                            <p id="textEmpLevel"></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 1rem">
                                    <div class="col-md-6 col-xs-12">
                                        <div class="col-md-3 col-xs-12">
                                            <label class="control-label" style="font-size: 12px">CostCenter</label>
                                        </div>
                                        <div class="col-md-9  col-xs-12">
                                            <%--<input id="EmpDepartment" type="text" class="form-control max-wide" disabled>--%>
                                            <p id="textEmpCostCenter"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <div class="col-md-3 col-xs-12">
                                            <label class="control-label" style="font-size: 12px">BU</label>
                                        </div>
                                        <div class="col-md-9  col-xs-12">
                                            <p id="textEmpBU_desc"></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 1rem">
                                    <div class="col-md-6 col-xs-12">
                                        <div class="col-md-3 col-xs-12">
                                            <label class="control-label" style="font-size: 12px">MainCompany</label>
                                        </div>
                                        <div class="col-md-9  col-xs-12">
                                            <%--<input id="EmpDepartment" type="text" class="form-control max-wide" disabled>--%>
                                            <p id="textEmpMainCompany"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <div class="col-md-3 col-xs-12">
                                            <label class="control-label" style="font-size: 12px">Location</label>
                                        </div>
                                        <div class="col-md-9  col-xs-12">
                                            <%--<input id="EmpDepartment" type="text" class="form-control max-wide" disabled>--%>
                                            <p id="textEmpLocation"></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 1rem">
                                    <div class="col-md-6 col-xs-12 ">
                                        <div class="col-md-3 col-xs-12">
                                            <label class="control-label" style="font-size: 12px">JobTitle TH </label>
                                        </div>
                                        <div class="col-md-9  col-xs-12">
                                            <p id="textEmpJobTitleTH"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-4 col-xs-12">
                                        <div class="col-md-3  col-xs-12">
                                            <label class="control-label" style="font-size: 12px">JobTitle EN </label>
                                        </div>
                                        <div class="col-md-9 col-xs-12">
                                            <p id="textEmpJobTitleEN"></p>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Toggle-->
            </div>
            <%--End Emp Detail--%>
        </div>
    </div>

    <div class="panel-body ">
        <ul class="nav nav-tabs">
            <li class="nav-item active">
                <a href="#TAB-HW" class="nav-link" role="tab" data-toggle="tab">Hardware</a>
            </li>
            <li class="nav-item">
                <a href="#TAB-JD" class="nav-link" data-toggle="tab" role="tab">Software Group(JD)</a>
            </li>
            <li class="nav-item">
                <a href="#TAB-SW" class="nav-link" data-toggle="tab" role="tab">Software</a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" role="tabpanel" id="TAB-HW">
                <div class="panel-group">
                    <div class="panel ">
                        <div class="panel-body">
                            <div class="col-md-12">
                                <div class="row" style="text-align: right;">
                                    <button class="btn btn-success Pos_Worker" id="btnModalNewHW" data-action="New" type="button">New</button>
                                </div>
                                <div class="row">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-bordered" id="table_HW">
                                            <thead>
                                                <tr>
                                                    <th>Tag Code</th>
                                                    <th>Tag Group Name</th>
                                                    <th>Start date</th>
                                                    <th>Borrow Due date</th>
                                                    <th>Return date</th>
                                                    <th>Project</th>
                                                    <th>Detail</th>
                                                    <th>Status</th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="List_HW">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--================End Tab HW====================-->
            <div class="tab-pane fade" role="tabpanel" id="TAB-SW">
                <div class="panel-group">
                    <div class="panel ">
                        <div class="panel-body">
                            <div class="col-md-12">
                                <div class="row" style="text-align: right;">
                                    <button class="btn btn-success Pos_Worker" id="btnModalNewSW" data-action="New" type="button">New</button>
                                </div>
                                <div class="row">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-bordered" id="table_SW">
                                            <thead>
                                                <tr>
                                                    <th>Tag Code</th>
                                                    <th>Tag Group Name</th>
                                                    <th>Start date</th>
                                                    <th>Return date</th>
                                                    <th>Detail</th>
                                                    <th>Status</th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="List_SW">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--================End Tab SE====================-->
            <div class="tab-pane fade" role="tabpanel" id="TAB-JD">
                <div class="panel-group">
                    <div class="panel ">
                        <div class="panel-body">
                            <div class="col-md-12">
                                <div class="row" style="text-align: right;">
                                    <button class="btn btn-success Pos_Worker" id="btnModalNewJD" data-action="New" type="button">New</button>
                                </div>
                                <div class="row">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-bordered" id="table_JD" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>JD code</th>
                                                    <th>Tag Code</th>
                                                    <th  width="30%">Tag Group Name</th>
                                                    <th>Start date</th>
                                                    <th>Return date</th>
                                                    <th  width="30%">Detail</th>
                                                    <th>Status</th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="List_JD">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--================End Tab JD====================-->
        </div>
    </div>
    <%--End TB JD--%>
    <div class="modal fade" id="ModalHW" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-lg" style="width: 50%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-3 col-sm-12">
                        </div>
                        <div class="col-md-9 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-warning" id="btnSaveHW">Save</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="max-height: 35em; max-width: 100%;">
                    <div class="panel-group">
                        <div class="col-md-">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 style="font-weight: bold;"><span id="TitleHW">:</span></h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Tag Code :</label>
                                            </div>
                                            <div class="col-md-9">
                                                <div class="input-group">
                                                    <input type="text" id="HW_ID" class="form-control max-wide" style="display:none" autocomplete="off" readonly="readonly">
                                                    <input type="text" id="HW_Action" class="form-control max-wide" style="display:none" autocomplete="off" readonly="readonly">
                                                    <input type="text" id="HW_TagCode" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-default Browse_modal" type="button" data-type="HW_TagCode">
                                                            <i class="glyphicon glyphicon-search"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Tag Group Name :</label>
                                            </div>
                                            <div class="col-md-9">
                                                <input id="HW_TagGroupName" type="text" class="form-control max-wide" autocomplete="off" disabled>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Start Date : </label>
                                            </div>
                                            <div class="col-md-9  date" data-provide="datepicker">
                                                <div class="input-group">
                                                    <input id="HW_StartDate" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Brrow Due Date : </label>
                                            </div>
                                            <div class="col-md-9  date" data-provide="datepicker">
                                                <div class="input-group">
                                                    <input id="HW_BrrowDate" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Return Date : </label>
                                            </div>
                                            <div class="col-md-9  date" data-provide="datepicker">
                                                <div class="input-group">
                                                    <input id="HW_ReturnDate" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off" disabled>
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Project : </label>
                                            </div>
                                            <div class="col-md-9">
                                                <div class="input-group">
                                                    <input type="text" id="HW_Project" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-default Browse_modal" type="button" data-type="Po_Number">
                                                            <i class="glyphicon glyphicon-search"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Detail : </label>
                                            </div>
                                            <div class="col-md-9">
                                                <input type="text" id="HW_Detail" class="form-control max-wide" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group" id="divHW_Status">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Status :</label>
                                            </div>
                                            <div class="col-md-9">
                                                <input type="text" id="HW_Status" class="form-control max-wide" autocomplete="off" disabled>
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
    <%--Modal HW --%>



    <div class="modal fade" id="ModalSW" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-lg" style="width: 50%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-3 col-sm-12">
                        </div>
                        <div class="col-md-9 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-warning" id="btnSaveSW">Save</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="max-height: 35em; max-width: 100%;">
                    <div class="panel-group">
                        <div class="col-md-">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 style="font-weight: bold;"><span id="TitleSW">:</span></h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Tag Code :</label>
                                            </div>
                                            <div class="col-md-9">
                                                <div class="input-group">
                                                    <input type="text" id="SW_ID" class="form-control max-wide" style="display: none" autocomplete="off" readonly="readonly">
                                                    <input type="text" id="SW_Action" class="form-control max-wide" style="display: none" autocomplete="off" readonly="readonly">
                                                    <input type="text" id="SW_TagCode" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-default Browse_modal" type="button" data-type="SW_TagCode">
                                                            <i class="glyphicon glyphicon-search"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Tag Group Name :</label>
                                            </div>
                                            <div class="col-md-9">
                                                <input id="SW_TagGroupName" type="text" class="form-control max-wide" autocomplete="off" disabled>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Start Date : </label>
                                            </div>
                                            <div class="col-md-9  date" data-provide="datepicker">
                                                <div class="input-group">
                                                    <input id="SW_StartDate" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Return Date : </label>
                                            </div>
                                            <div class="col-md-9  date" data-provide="datepicker">
                                                <div class="input-group">
                                                    <input id="SW_ReturnDate" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off" disabled>
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Detail : </label>
                                            </div>
                                            <div class="col-md-9">
                                                <input type="text" id="SW_Detail" class="form-control max-wide" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group" id="divSW_Status">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Status :</label>
                                            </div>
                                            <div class="col-md-9">
                                                <input type="text" id="SW_Status" class="form-control max-wide" autocomplete="off" disabled>
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
    <%--Modal HW --%>
    <div class="modal fade" id="ModalJD" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-md" style="margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-3 col-sm-12">
                        </div>
                        <div class="col-md-9 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-warning" id="btnSaveJD">Save</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="max-height: 35em; max-width: 100%;">
                    <div class="panel-group">
                        <div class="col-md-">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 style="font-weight: bold;"><span id="TitleJD">:</span></h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-12">
                                                <label class="control-label" style="font-size: 10px; color: red;">Step1*</label>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Software Group :</label>
                                            </div>
                                            <div class="col-md-9">
                                                <div class="input-group">
                                                    <input type="text" id="JD_ID" style="display:none"  class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                    <input type="text" id="JD_Action" style="display:none" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                    <input type="text" id="JD_SWGroup" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-default Browse_modal" type="button" data-type="JD_SWGroup">
                                                            <i class="glyphicon glyphicon-search"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="JDStep2_Edit">
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-12">
                                                    <label class="control-label" style="font-size: 10px; color: red;">Step2*</label>
                                                </div>
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Tag Code :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <input type="text" id="JD_TagCode" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-default Browse_modal" type="button" data-type="JD_TagCode">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Tag Group Name :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input id="JD_TagGroupName" type="text" class="form-control max-wide" autocomplete="off" disabled>
                                                </div>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Start Date : </label>
                                                </div>
                                                <div class="col-md-9  date" data-provide="datepicker">
                                                    <div class="input-group">
                                                        <input id="JD_StartDate" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Return Date : </label>
                                                </div>
                                                <div class="col-md-9  date" data-provide="datepicker">
                                                    <div class="input-group">
                                                        <input id="JD_ReturnDate" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Detail : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="JD_Detail" class="form-control max-wide" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="col-md-12 form-group" id="divJD_Status">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Status :</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" id="JD_Status" class="form-control max-wide" autocomplete="off" disabled>
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
    <%--Modal HW --%>



    <div class="modal fade" id="ModalJD_New" role="dialog" data-backdrop="static" data-keyboard="false"style="align-content: center">
        <div class="modal-dialog modal-lg" style="width:75em;height:50em">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <h4 class="modal-title" id="TitleJD_New"></h4>
                        </div>
                        <div class="col-md-6" style="text-align: right">
                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                Close
                            </button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style=" text-align: center;">
                    <div class="row">
                        <div class="col-md-12" style="text-align: center;max-height:500px ">
                            <div class="panel-group">
                                <div class="panel-body">
                                    <div class="row"  >
                                        <div id="smartwizard">
                                            <ul>
                                                <li class="check" data-step="Step1">
                                                    <a href="#step-1">Select Software Group JD</a>
                                                </li>
                                                <li class="check" data-step="Step2">
                                                    <a href="#step-2">Select Column</a>
                                                </li>
                                                <li class="check" data-step="Step3">
                                                    <a href="#step-3">fill Data</a>
                                                </li>
                                            </ul>
                                            <div>
                                                <div id="step-1" class="">
                                                    <div class="panel-group">
                                                        <div class="panel panel-default" style="margin-top: 1em">
                                                            <div class="panel-heading">
                                                                <h4>Select Software Group JD</h4>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div class="row">
                                                                    <div class="col-md-12 form-group">
                                                                        <div class="col-md-12">
                                                                            <label class="control-label"style="font-size: 10px; color: red"> Step1*</label>
                                                                        </div>
                                                                        <div class="col-md-3">
                                                                            <label class="control-label" style="font-size: 13px">Software Group:</label>
                                                                        </div>
                                                                        <div class="col-md-9">
                                                                            <div class="input-group">
                                                                                <input type="text" id="JD_ID_New" style="display:none"  class="form-control max-wide" autocomplete="off" readonly="readonly" />
                                                                                <input type="text" id="JD_Action_New"  style="display:none"  class="form-control max-wide" autocomplete="off" readonly="readonly" />
                                                                                <input type="text" id="JD_SWGroup_New" class="form-control max-wide" autocomplete="off" readonly="readonly" />
                                                                                <div class="input-group-btn">
                                                                                    <button class="btn btn-default Browse_modal" type="button" data-type="JD_SWGroup_New"><i class="glyphicon glyphicon-search"></i></button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div style="text-align: right">
                                                                    <button id="nextPage2" class="btn btn-warning" type="button" data-toggle="modal" disabled>Next</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--======End Step 1======--%>
                                                <div id="step-2"style="overflow-y: auto; overflow-x: auto; max-height:400px "> 
                                                    <div class="panel-group">
                                                        <%--<div class="panel panel-default" style="margin-top: 1em">--%>
                                                 <%--           <div class="panel-heading">
                                                                <h4>Column</h4>
                                                            </div>--%>
                                                            <%--<div class="panel-body">--%>
                                                                    <div class="col-md-12 col-sm-12" style="max-width: 100%;margin-top:1em;">
                                                                        <div class="row">
                                                                                <div class="table-responsive" ">
                                                                                    <table class="table table-hover table-bordered" id="table_JD_Step2_New">
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <th><input class="form-check-input center checkboxes" id="checkAll" type="checkbox" style="margin-left:1em"></th>
                                                                                                <th>TAG Code</th>
                                                                                                <th>TAG Group Name</th>
                                                                                                <th>Start Contract</th>
                                                                                                <th>Expire Contract</th>
                                                                                                <th>Usage</th>
                                                                                                <th>Total</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody id="List_JD_Step2_New">
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                <div style="text-align: right;margin-top:1em;">
                                                                    <button id="nextPage3" class="btn btn-warning" type="button" data-toggle="modal" disabled>Next </button>
                                                                </div>
                                                            <%--</div>--%>
                                                        <%--</div>--%>
                                                    </div>
                                                </div>
                                                <%--======End Step 2======--%>
                                                <div id="step-3" style="overflow-y: auto; overflow-x: auto; "> 
                                                    <div class="panel-group">
                                                        <%--<div class="panel panel-default" style="margin-top: 1em">--%>
                                                 <%--           <div class="panel-heading">
                                                                <h4>Column</h4>
                                                            </div>--%>
                                                            <%--<div class="panel-body">--%>
                                                                    <div class="col-md-12 col-sm-12" style="max-width: 100%;margin-top:1em;">
                                                                        <div class="row">
                                                                                <div class="table-responsive" style="overflow-y: auto; overflow-x: auto;">
                                                                                    <table class="table table-hover table-bordered" id="table_JD_Step3_New">
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <th>TAG Code</th>
                                                                                                <th>TAG Group Name</th>
                                                                                                <th>Start Contract</th>
                                                                                                <th>Return Contract</th>
                                                                                                <th>Detail</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody id="List_JD_Step3_New">
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                <div style="text-align: right">
                                                                    <button id="btnSaveJD_New" class="btn btn-warning" type="button" data-toggle="modal">Save </button>
                                                                </div>
                                                            <%--</div>--%>
                                                        <%--</div>--%>
                                                    </div>
                                                </div>
                                                <%--======End Step 3======--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--Modal New JD--%>






    <div class="modal fade" id="modalBrowseSearch" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-xs" id="modalSize">
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
            

            //////////////// Step 0 ////////////////////
            var table_HW = $("#table_HW").DataTable({
                searching: false,
                lengthChange: false,
                "ordering": false,
            });
            var table_SW = $('#table_SW').DataTable({
                searching: false,
                lengthChange: false,
                "ordering": false,
            });
            var table_JD = $('#table_JD').DataTable({
                searching: false,
                lengthChange: false,
                "ordering": false,
            });
            //Set Datateble

            var GETParams_EmpNum = getAllUrlParams("EmpNum");
            //setProfile();
            
            var UserPosition = CheckPermission('ITTAG', 'Maintain Equipment Owner');
            console.log(UserPosition)
            SetPage(UserPosition)
            if (UserPosition != "") {
                SetDatePicker();
                if (GETParams_EmpNum) {
                    console.log(GETParams_EmpNum);
                    VW_IT_TAG_PE_ALL(GETParams_EmpNum);
                    Profile_GETParams_EmpNum(GETParams_EmpNum);
                } else {
                    searchStartPage();
                }

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

          
            //////////////// Step 0 ////////////////////

            

            var table_JD_Step2_New = $("#table_JD_Step2_New").DataTable({
                searching: true,
                lengthChange: false,
                "columnDefs": [{
                    "targets": [0, 1, 2, 3, 4],
                    "orderable": false
                }],
                "bInfo": false,
                "paging":   false,
                "ordering": false,
                "info":     false
                //"scrollY": "200px",
                //"paging": false
            });
            var table_JD_Step3_New = $('#table_JD_Step3_New').DataTable({
                searching: false,
                lengthChange: false,
                "columnDefs": [{
                    "targets": [0, 1, 2, 3, 4],
                    "orderable": false
                }],
                "bInfo": false,
                "paging":   false,
                "ordering": false,
                "info":     false
            });

            $('#smartwizard').smartWizard({
                theme: 'arrows',
                keyNavigation: false,
                showStepURLhash: false,
                selected: 0, //ใส่ 0 จะเริ่มที่ Step แรกสุด
                transitionEffect: 'slide',
                toolbarSettings: { toolbarPosition: 'none', showNextButton: 'false', showPreviousButton: 'false' }
            });

            $(document).on("click", "#checkAll", function () {

                if (this.checked) {
                    $(".checkboxes").prop("checked", true);
                } else {
                    $(".checkboxes").prop("checked", false);
                }
            });
            //End Checkbox all

            function VW_IT_TAG_PE_ALL(EmpNum) {
                table_HW.clear().draw();
                table_SW.clear().draw();
                table_JD.clear().draw();
                //var EmpNum = $("#textEmpNum").val();
                console.log(EmpNum);
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/VW_IT_TAG_PE_ALL") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ EmpNum: EmpNum, IT_TAG_Code:''}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                // [ID], [IT_TAG_Code], [StartDate], [BorrowDueDate], [ReturnDate], [ProjectNo], [Detail]
                                //, [Status], [JD_Code], [PE_Type], [Emp_num], [MainType], [TypeName], [TagGroup], [TagGroupName]
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
                                var btn_EditHW = '<td><button class="btn btn-info btnModalEditHW" data-id="' + ID + '" type="button">Edit</button></td>';
                                var btnModalEditJD =  '<td><button class="btn btn-info btnModalEditJD" data-id="' + ID + '" type="button">Edit</button></td>';
                                var btnModalEditSW =  '<td><button class="btn btn-info btnModalEditSW" data-id="' + ID + '" type="button">Edit</button></td>';
                                var btnDelete =  '<td><button class="btn btn-danger btnDeletePE"  data-id="' + ID + '" type="button">Delete</button></td>';
                                if (PE_Type == "Hardware") {
                                    if (Status == "Transfer") {
                                        table_HW.row.add(['<td><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code + '" target="_bank">' + IT_TAG_Code + '</a><td>',
                                          TagGroupName, StartDate.substr(0, 10), BorrowDueDate.substr(0, 10), ReturnDate.substr(0, 10), ProjectNo, Detail, Status,
                                         ' ',
                                        ' ', ]).draw().node();
                                    }
                                    else {
                                        if (UserPosition == "Admin") {
                                             table_HW.row.add(['<td><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code + '" target="_bank">' + IT_TAG_Code + '</a><td>',
                                          TagGroupName, StartDate.substr(0, 10), BorrowDueDate.substr(0, 10), ReturnDate.substr(0, 10), ProjectNo, Detail, Status
                                         ,btn_EditHW
                                        ,btnDelete, ]).draw().node();
                                        }
                                       else if (UserPosition == "Worker") {
                                             table_HW.row.add(['<td><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code + '" target="_bank">' + IT_TAG_Code + '</a><td>',
                                          TagGroupName, StartDate.substr(0, 10), BorrowDueDate.substr(0, 10), ReturnDate.substr(0, 10), ProjectNo, Detail, Status
                                         ,btn_EditHW
                                        ,'', ]).draw().node();
                                        }
                                       else if (UserPosition == "Viewer") {
                                             table_HW.row.add(['<td><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code + '" target="_bank">' + IT_TAG_Code + '</a><td>',
                                          TagGroupName, StartDate.substr(0, 10), BorrowDueDate.substr(0, 10), ReturnDate.substr(0, 10), ProjectNo, Detail, Status
                                         ,''
                                        ,'', ]).draw().node();
                                        }
                                    }
                                     
                                }
                                else if (PE_Type == "Software_JD") {
                                    if (Status == "Transfer") {
                                        table_JD.row.add([JD_Code, '<td><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code + '" target="_bank">' + IT_TAG_Code + '</a></td>',
                                        TagGroupName,StartDate.substr(0, 10),ReturnDate.substr(0, 10), Detail, Status,
                                         '',
                                          '', ]).draw().node();
                                    }
                                    else {
                                          if (UserPosition == "Admin") {
                                             table_JD.row.add([JD_Code, '<td><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code + '" target="_bank">' + IT_TAG_Code + '</a></td>',
                                        TagGroupName,StartDate.substr(0, 10),ReturnDate.substr(0, 10), Detail, Status,
                                         btnModalEditJD,
                                          btnDelete, ]).draw().node();
                                        }
                                       else if (UserPosition == "Worker") {
                                          table_JD.row.add([JD_Code, '<td><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code + '" target="_bank">' + IT_TAG_Code + '</a></td>',
                                              TagGroupName, StartDate.substr(0, 10), ReturnDate.substr(0, 10), Detail, Status,
                                              btnModalEditJD,
                                          '', ]).draw().node();
                                        }
                                       else if (UserPosition == "Viewer") {
                                             table_JD.row.add([JD_Code, '<td><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code + '" target="_bank">' + IT_TAG_Code + '</a></td>',
                                        TagGroupName,StartDate.substr(0, 10),ReturnDate.substr(0, 10), Detail, Status,
                                         '',
                                          '', ]).draw().node();
                                        }
                                       

                                    }
                                    
                                }
                                else if (PE_Type == "Software") {
                                    if (Status == "Transfer") {
                                        table_SW.row.add(['<td><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code + '" target="_bank">' + IT_TAG_Code + '</a><td>',
                                         TagGroupName, StartDate.substr(0, 10),ReturnDate.substr(0, 10),Detail,Status,
                                         ' ',
                                          ' ', ]).draw().node();
                                    }
                                    else {
                                        if (UserPosition == "Admin") {
                                              table_SW.row.add(['<td><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code + '" target="_bank">' + IT_TAG_Code + '</a><td>',
                                         TagGroupName, StartDate.substr(0, 10),ReturnDate.substr(0, 10),Detail,Status,
                                         btnModalEditSW,
                                          btnDelete, ]).draw().node();
                                        }
                                       else if (UserPosition == "Worker") {
                                           table_SW.row.add(['<td><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code + '" target="_bank">' + IT_TAG_Code + '</a><td>',
                                         TagGroupName, StartDate.substr(0, 10),ReturnDate.substr(0, 10),Detail,Status,
                                         btnModalEditSW,
                                          '', ]).draw().node();
                                        }
                                       else if (UserPosition == "Viewer") {
                                          table_SW.row.add(['<td><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code + '" target="_bank">' + IT_TAG_Code + '</a><td>',
                                         TagGroupName, StartDate.substr(0, 10),ReturnDate.substr(0, 10),Detail,Status,
                                         '',
                                          '', ]).draw().node();
                                        }
                                       
                                    }
                                    
                                }
                                console.log(PE_Type)
                            });
                        }
                    }
                });
                //End VW_IT_TAG_PE_ALL

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/VW_IT_TAG_PE_Peripheral") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ EmpNum: EmpNum }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var IT_TAG_Code_Main = val[1];
                                var Emp_num = val[2];
                                var IT_TAG_Code_Sub = val[3];
                                var MainType = val[4];
                                var TypeName = val[5];
                                var TagGroup = val[6];
                                var TagGroupName = val[7];
                                var StartDate_MainTag = val[8];
                                var ReturnDate_MainTag = val[9];
                                if (MainType == "Hardware") {
                                    table_HW.row.add(['<td ><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code_Sub + '" style="color:#E65100" target="_bank">' + IT_TAG_Code_Sub + '</a></td>',
                                        TagGroupName, StartDate_MainTag.substr(0,10), ReturnDate_MainTag.substr(0,10), '', '', '<td ><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code_Main + '" style="color:#4CAF50" target="_bank">' + IT_TAG_Code_Main + '</a></td>',
                                        '<td >Peripheral</td>','','']).draw().node();
                                }
                                else if (MainType == "Software") {
                                    table_SW.row.add(['<td ><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code_Sub + '" style="color:#E65100" target="_bank">' + IT_TAG_Code_Sub + '</a></td>',
                                        TagGroupName, StartDate_MainTag.substr(0,10), ReturnDate_MainTag.substr(0,10),  '<td ><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code_Main + '" style="color:#4CAF50" target="_bank">' + IT_TAG_Code_Main + '</a></td>',
                                        '<td >Peripheral</td>','','']).draw().node();
                                }
                                console.log("Peripheral :" + MainType)
                            });
                        }
                    }
                });
            }
            
            $(document).on("click", ".Browse_modal", function () {
                var fragment = '';
                var fragmentHeader = '';
                var Type = $(this).attr("data-type");
                $("#Titlebrowse").text(Type);
                $("#TBbodyBrowse").empty();
                $("#TBheaderBrowse").empty();
                $("#search_box").empty();
                $("#search_box").append('<input type="text" id="search_' + Type + '" placeholder="Search.." class="form-control max-wide" autocomplete="off">');

                if (Type == 'EmpNum') {
                    Get_User_PE('');
                }//End BrowseTagGroup
                else if (Type == 'HW_TagCode') {
                    Get_HW_TagCode('');
                }//End BrowseHW_TagCode
                else if (Type == 'SW_TagCode') {
                    Get_SW_TagCode('');
                }//End BrowseHW_TagCode
                else if (Type == 'JD_SWGroup_New') {
                    Get_JD_SWGroup('', 'New');
                }//End JD_New_Step1
                else if (Type == 'JD_SWGroup') {
                    Get_JD_SWGroup('', 'Edit');
                }//End JD_Edit_Step1 
                else if (Type == 'JD_TagCode') {
                    var JDCode = $("#JD_SWGroup").val();
                    Get_JD_TagCode('', 'Edit', JDCode);
                }//End JD_Edit_Step1
                else if (Type == 'Po_Number') {
                    GET_Po_Number('');
                }//End 


                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });


            $(document).on("click", "#btnModalNewHW", function () {
                $('#HW_ReturnDate').prop("disabled", true);
                var title = 'Add Hardware';
                $("#HW_ID").val(0);
                $("#HW_TagCode").val('');
                $("#HW_TagGroupName").val('');
                $("#HW_StartDate").val('');
                $("#HW_BrrowDate").val('');
                $("#HW_ReturnDate").val('');
                $("#HW_Project").val('');
                $("#HW_Detail").val('');
                $("#HW_Status").val('');
                $("#HW_Action").val('Insert');
                $("#divHW_Status").hide();
                $("#TitleHW").text(title);
                $("#ModalHW").modal("show");
            });

            $(document).on("click", ".btnModalEditHW", function () {
                $('#HW_ReturnDate').prop("disabled", false);
                var t1 = $(this).closest("tr").find("td:nth-child(1)").text();
                var t2 = $(this).closest("tr").find("td:nth-child(2)").text();
                var t3 = $(this).closest("tr").find("td:nth-child(3)").text();
                var t4 = $(this).closest("tr").find("td:nth-child(4)").text();
                var t5 = $(this).closest("tr").find("td:nth-child(5)").text();
                var t6 = $(this).closest("tr").find("td:nth-child(6)").text();
                var t7 = $(this).closest("tr").find("td:nth-child(7)").text();
                var t8 = $(this).closest("tr").find("td:nth-child(8)").text();
                var ID = $(this).attr("data-id");
                var title = 'HardWare :' + t1 + ' (Edit)';
                $("#HW_ID").val(ID);
                $("#HW_TagCode").val(t1);
                $("#HW_TagGroupName").val(t2);
                $("#HW_StartDate").val(t3);
                $("#HW_BrrowDate").val(t4);
                $("#HW_ReturnDate").val(t5);
                $("#HW_Project").val(t6);
                $("#HW_Detail").val(t7);
                $("#HW_Status").val(t8);
                $("#HW_Action").val('Update');
                $("#divHW_Status").show();
                $("#TitleHW").text(title);
                $("#ModalHW").modal("show");
            });
            $(document).on("click", "#btnModalNewSW", function () {
                $('#SW_ReturnDate').prop("disabled", true);
                var title = 'Add Solfware';
                $("#SW_ID").val(0);
                $("#SW_TagCode").val('');
                $("#SW_TagGroupName").val('');
                $("#SW_StartDate").val('');
                $("#SW_ReturnDate").val('');
                $("#SW_Status").val('');
                $("#SW_Detail").val('');
                $("#SW_Action").val('Insert');
                $("#divSW_Status").hide();
                $("#TitleSW").text(title);
                $("#ModalSW").modal("show");
            });
            $(document).on("click", ".btnModalEditSW", function () {
                $('#SW_ReturnDate').prop("disabled", false);
                var t1 = $(this).closest("tr").find("td:nth-child(1)").text();
                var t2 = $(this).closest("tr").find("td:nth-child(2)").text();
                var t3 = $(this).closest("tr").find("td:nth-child(3)").text();
                var t4 = $(this).closest("tr").find("td:nth-child(4)").text();
                var t5 = $(this).closest("tr").find("td:nth-child(5)").text();
                var t6 = $(this).closest("tr").find("td:nth-child(6)").text();
                var ID = $(this).attr("data-id");
                var title = 'Software :' + t1 + ' (Edit)';
                $("#SW_ID").val(ID);
                $("#SW_TagCode").val(t1);
                $("#SW_TagGroupName").val(t2);
                $("#SW_StartDate").val(t3);
                $("#SW_ReturnDate").val(t4);
                $("#SW_Detail").val(t5);
                $("#SW_Status").val(t6);
                $("#SW_Action").val('Update');
                $("#divSW_Status").show();
                $("#TitleSW").text(title);
                $("#ModalSW").modal("show");
            });
            $(document).on("click", "#btnModalNewJD", function () {
                $('#smartwizard').smartWizard("reset"); 
                $("#JD_ID_New").val(0);
                $("#JD_SWGroup_New").val('');
                //$("#JD_TagCode").val('');
                //$("#JD_TagGroupName").val('');
                //$("#JD_StartDate").val('');
                //$("#JD_ReturnDate").val('');
                //$("#JD_Detail").val('');
                //$("#JD_Status").val('');
                $("#JD_Action_New").val('Insert');
                //$("#divJD_Status").hide();
                $("#TitleJD_New").text('Add Software Group(JD)');
                $("#ModalJD_New").modal("show");
                //$("#JDStep2_Edit").hide();
            });
            $(document).on("click", ".btnModalEditJD", function () {
                var t1 = $(this).closest("tr").find("td:nth-child(1)").text();
                var t2 = $(this).closest("tr").find("td:nth-child(2)").text();
                var t3 = $(this).closest("tr").find("td:nth-child(3)").text();
                var t4 = $(this).closest("tr").find("td:nth-child(4)").text();
                var t5 = $(this).closest("tr").find("td:nth-child(5)").text();
                var t6 = $(this).closest("tr").find("td:nth-child(6)").text();
                var t7 = $(this).closest("tr").find("td:nth-child(7)").text();
                var id = $(this).attr("data-id");
                $("#JD_ID").val(id);
                $("#JD_SWGroup").val(t1);
                $("#JD_TagCode").val(t2);
                $("#JD_TagGroupName").val(t3);
                $("#JD_StartDate").val(t4);
                $("#JD_ReturnDate").val(t5);
                $("#JD_Detail").val(t6);
                $("#JD_Status").val(t7);
                $("#JD_Action").val('Update');
                $("#divJD_Status").show();
                $("#TitleJD").text('Edit Software Group(JD)');
                $("#ModalJD").modal("show");

                $("#JDStep2_Edit").show();
            });

            $(document).on("click", "#btnSaveHW", function () {
                var ID = $("#HW_ID").val();
                var IT_TAG_Code = $("#HW_TagCode").val();
                var StartDate = $("#HW_StartDate").val();
                var BorrowDueDate = $("#HW_BrrowDate").val();
                var ReturnDate = $("#HW_ReturnDate").val();
                var ProjectNo = $("#HW_Project").val();
                var Detail = $("#HW_Detail").val();
                var Status = $("#HW_Status").val();
                var Emp_num = $("#textEmpNum").val();
                var Action = $("#HW_Action").val();
                var PE_Type = 'Hardware';
                var JD_Code = '';
                if (IT_TAG_Code != "" && StartDate != "") {
                    SavePE(ID, IT_TAG_Code, StartDate, BorrowDueDate, ReturnDate, ProjectNo, Detail, Status, JD_Code, PE_Type, Emp_num, Action)
                    $("#ModalHW").modal("hide");
                } else {
                    swal('กรุณากรอกข้อมูลให้ครบถ้วน', '', 'error');
                }
            });
            $(document).on("click", "#btnSaveSW", function () {
                var ID = $("#SW_ID").val();
                var IT_TAG_Code = $("#SW_TagCode").val();
                var StartDate = $("#SW_StartDate").val();
                var BorrowDueDate = '';
                var ReturnDate = $("#SW_ReturnDate").val();
                var ProjectNo = '';
                var Detail = $("#SW_Detail").val();
                var Status = $("#SW_Status").val();
                var Emp_num = $("#textEmpNum").val();
                var Action = $("#SW_Action").val();
                var PE_Type = 'Software';
                var JD_Code = '';
                if (IT_TAG_Code != "" && StartDate != "") {
                SavePE(ID, IT_TAG_Code, StartDate, BorrowDueDate, ReturnDate, ProjectNo, Detail, Status, JD_Code, PE_Type, Emp_num, Action)
                $("#ModalSW").modal("hide");
                } else {
                    swal('กรุณากรอกข้อมูลให้ครบถ้วน', '', 'error');
                }
            });

            $(document).on("click", "#btnSaveJD_New", function () {
                var ID = $("#JD_ID_New").val();
                var JD_Code = $("#JD_SWGroup_New").val();
                var Emp_num = $("#textEmpNum").val();
                var Action = $("#JD_Action_New").val();
                var PE_Type = 'Software_JD';
                var Checked = true;
                $('#List_JD_Step3_New > tr').each(function (index, value) {
                    if ($(this).find("td:nth-child(3)").find("input[type=text]").val() == '') {
                        swal('Error',  'กรุณากรอก Starte Dateที่ '+$(this).find("td:nth-child(1)").text() , 'error');
                        Checked = false;
                    }
                });

                if (Checked) {
                    $("#List_JD_Step3_New tr").each(function () {
                        var IT_TAG_Code = $(this).find("td:nth-child(1)").text();
                        var StartDate = $(this).find("td:nth-child(3)").find("input[type=text]").val();
                        var ReturnDate = $(this).find("td:nth-child(4)").find("input[type=text]").val();
                        var Detail = $(this).find("td:nth-child(5)").find("input[type=text]").val();

                        SavePE(ID, IT_TAG_Code, StartDate, '', ReturnDate, '', Detail, '', JD_Code, PE_Type, Emp_num, Action)
                        $("#ModalJD_New").modal("hide");
                    });
                }
                
            });
            $(document).on("click", "#btnSaveJD", function () {
                var JD_Code = $("#JD_SWGroup").val();
                var ID = $("#JD_ID").val();
                var IT_TAG_Code = $("#JD_TagCode").val();
                var StartDate = $("#JD_StartDate").val();
                var BorrowDueDate = '';
                var ReturnDate = $("#JD_ReturnDate").val();
                var ProjectNo = '';
                var Detail = $("#JD_Detail").val();
                var Status = $("#JD_Status").val();
                var Emp_num = $("#textEmpNum").val();
                var Action = $("#JD_Action").val();
                var PE_Type = 'Software_JD';
                
                if (IT_TAG_Code != "" && StartDate != "") {
                    SavePE(ID, IT_TAG_Code, StartDate, '', ReturnDate, '', Detail, Status, JD_Code, PE_Type, Emp_num, Action)
                    $("#ModalJD").modal("hide");
                } else {
                    swal('กรุณากรอกข้อมูลให้ครบถ้วน', '', 'error');
                }
            });
            $(document).on("click", ".btnDeletePE", function () {
                 var Emp_num = $("#textEmpNum").val();
                 var ID = $(this).attr("data-id");
                //confirm
                swal({
                    title: 'Confrim Delete?',
                    text: "ยืนยันการลบข้อมูล",
                    icon: 'info',
                    buttons: {
                        cancel: true,
                        confirm: true,
                    },
                }).then(function (confirm) {
                    if (confirm) {
                        console.log(ID);
                        SavePE(ID, '', '', '', '', '', '', '', '', '', Emp_num, 'Delete')
                        $("#ModalJD").modal("hide");
                        swal('Complete', 'ลบข้อมูลสำเร็จ', 'success');
                    }
                })
            });
            // Save/Edit & Delete HW/SW/JD
            
            $(document).on("click", "#nextPage2", function () {
                var JDCode = $("#JD_SWGroup_New").val();
                Get_JD_TagCode('', 'New', JDCode);
                $('#smartwizard').data('smartWizard')._showStep(1);
            });
           //End JD_New Step2

            $(document).on("click", "#nextPage3", function () {
                
                table_JD_Step3_New.clear().draw();
                $("#List_JD_Step2_New tr").each(function () {
                    var checkbox = $(this).find("td:nth-child(1)").find("input[type=checkbox]");
                    var IT_TAG_Code = $(this).find("td:nth-child(2)").text();
                    var IT_TAG_GroupName = $(this).find("td:nth-child(3)").text();
                    //var Detail = $(this).find("td:nth-child(6)").find("input[type=text]").val();
                    if (checkbox.is(':checked')) {
                        SETTabel_JD_Step3(IT_TAG_Code, IT_TAG_GroupName);
                    }
                });
                SetDatePicker();
                $('#smartwizard').data('smartWizard')._showStep(2);
            });
            
        //End JD_New Step3

            $(document).on("change", "#search_EmpNum", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                //console.log(search);
                Get_User_PE(search);
                $("#modalBrowseSearch").modal("show");
            });
            $(document).on("change", "#search_JD_SWGroup", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                console.log(search);
                Get_JD_SWGroup(search);
                $("#modalBrowseSearch").modal("show");
            });
            $(document).on("change", "#search_HW_TagCode", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                Get_HW_TagCode(search);
                $("#modalBrowseSearch").modal("show");
            });
            $(document).on("change", "#search_SW_TagCode", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                Get_SW_TagCode(search);
                $("#modalBrowseSearch").modal("show");
            });
            $(document).on("change", "#search_Po_Number", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                GET_Po_Number(search);
                $("#modalBrowseSearch").modal("show");
            });
            
            //End search 
            
            
             $(document).on("change", ".checkboxes", function () {
                 if ($(this).is(':checked')) {
                   $("#nextPage3").prop("disabled", false);
                } 
            });//step2
            //Check Button JD_New

            function searchStartPage() {
                $("#Titlebrowse").text('Emp Num');
                $("#TBbodyBrowse").empty();
                $("#TBheaderBrowse").empty();
                $("#search_box").empty();
                $("#search_box").append('<input type="text" id="search_EmpNum" placeholder="Search.." class="form-control max-wide" autocomplete="off">');
                Get_User_PE('');
                $("#modalBrowseSearch").modal("show");
            }


            function SavePE(ID, IT_TAG_Code, StartDate, BorrowDueDate, ReturnDate, ProjectNo, Detail, Status, JD_Code, PE_Type, Emp_num, Action) {
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_IT_TAG_PE") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        ID: ID, IT_TAG_Code: IT_TAG_Code, StartDate: StartDate, BorrowDueDate: BorrowDueDate, ReturnDate: ReturnDate
                        , ProjectNo: ProjectNo, Detail: Detail, Status: Status, JD_Code: JD_Code, PE_Type: PE_Type, Emp_num: Emp_num
                        , Action: Action
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var ID = response.d;
                            
                        }
                        if (Action != "Delete") {
                                swal('Complete', 'บันทึก ' + PE_Type + ' สำเร็จ', 'success');
                            } else {
                                swal('Complete', 'ลบข้อมูลเสร็จสิ้น', 'success');
                        }
                        VW_IT_TAG_PE_ALL(Emp_num);
                    }
                });
            }


            function Get_User_PE(search) {
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
                                fragment += '<td><a class="clickselecttext_User_PE" href="javascript:void(0)" data-site_ref="' + Site_Ref + ' "data-dept="' + dept + ' "data-Uf_level="' + Uf_Level + '" data-Uf_Location="' + Uf_Location + '"data-uf_positionid="' + Uf_PositionID + '"data-uf_jobtitle="' + Uf_Jobtitle + '" data-uf_JobTitleen="' + Uf_JobTitleEN + '" data-bugroup="' + BUGroup + '" data-bugoupDesc="' + BUGroupDesc + '" >' + Emp_Num + '</a></td>';
                                fragment += '<td><a class="clickselecttext_User_PE" href="javascript:void(0)" data-site_ref="' + Site_Ref + ' "data-dept="' + dept + ' "data-Uf_level="' + Uf_Level + '" data-Uf_Location="' + Uf_Location + '"data-uf_positionid="' + Uf_PositionID + '"data-uf_jobtitle="' + Uf_Jobtitle + '" data-uf_JobTitleen="' + Uf_JobTitleEN + '" data-bugroup="' + BUGroup + '" data-bugoupDesc="' + BUGroupDesc + '" >'  + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }
            function GET_Po_Number(search) {
                $("#Titlebrowse").text('Search PoNumber');
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `<th>Po Number</th>
                                     <th>Desc</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/VW_Proj_projum_projdesc_AllSite") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[proj_num],[proj_desc]
                                var proj_num = val[0];
                                var proj_desc = val[1];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_PO_Number" href="javascript:void(0)">' + proj_num + '</a></td>';
                                fragment += '<td><a class="clickselecttext_PO_Number" href="javascript:void(0)">' + proj_desc + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }
            function Get_HW_TagCode(search) {
                $("#Titlebrowse").text('Add Hardware Tag Code');
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `<th>TAG Code</th>
                                     <th>Tag Group Name</th>
                                    <th>Usage</th>
                                    <th>Total</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GET_PE_VW_IT_TAG_PE_Browse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search, type: 'Hardware' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var IT_Tag_Code = val[0];
                                var Tag_Group = val[1];
                                var MainType = val[2];
                                var TypeName = val[3];
                                var TagGroup = val[4];
                                var TagGroupName = val[5];
                                var Used = val[6];
                                var Volume = val[7];
                                fragment += '<tr>';
                                if ( parseInt(Used) >= parseInt(Volume) ) {
                                fragment += '<td><span class="over-volumn">' + IT_Tag_Code + '</span></td>';
                                fragment += '<td><span class="over-volumn">' + TagGroupName + '</span></td>';
                                fragment += '<td><span class="over-volumn">' + Used + '</span></td>';
                                fragment += '<td><span class="over-volumn">' + Volume + '</span></td>';
                                 } else {
                                fragment += '<td><a class="clickselecttext_HW_TagCode" href="javascript:void(0)">' + IT_Tag_Code + '</a></td>';
                                fragment += '<td><a class="clickselecttext_HW_TagCode" href="javascript:void(0)">' + TagGroupName + '</a></td>';
                                fragment += '<td><a class="clickselecttext_HW_TagCode" href="javascript:void(0)">' + Used + '</a></td>';
                                fragment += '<td><a class="clickselecttext_HW_TagCode" href="javascript:void(0)">' + Volume + '</a></td>';

                                }
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }
            function Get_SW_TagCode(search) {
                $("#Titlebrowse").text('Add Software Tag Code');
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `<th>TAG Code</th>
                                     <th>Tag Group Name</th>
                                    <th>Usage</th>
                                    <th>Total</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GET_PE_VW_IT_TAG_PE_Browse") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search, type: 'Software' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var IT_Tag_Code = val[0];
                                var Tag_Group = val[1];
                                var MainType = val[2];
                                var TypeName = val[3];
                                var TagGroup = val[4];
                                var TagGroupName = val[5];
                                var Used = val[6] ;
                                var Volume = val[7];
                                fragment += '<tr>';
                                if ( parseInt(Used) >= parseInt(Volume) ) {
                                    console.log(Used + ' index ' + index);
                                    console.log(Volume  + ' index ' + index);
                                    fragment += '<td><span class="over-volumn">' + IT_Tag_Code + '</span></td>';
                                    fragment += '<td><span class="over-volumn">' + TagGroupName + '</span></td>';
                                    fragment += '<td><span class="over-volumn">' + Used +'</span></td>';
                                    fragment += '<td><span class="over-volumn">' + Volume + '</span></td>';
                                 } else {
                                    fragment += '<td><a class="clickselecttext_SW_TagCode" href="javascript:void(0)">' + IT_Tag_Code + '</a></td>';
                                    fragment += '<td><a class="clickselecttext_SW_TagCode" href="javascript:void(0)">' + TagGroupName + '</a></td>';
                                    fragment += '<td><a class="clickselecttext_SW_TagCode" href="javascript:void(0)">'+ Used +'</a></td>';
                                    fragment += '<td><a class="clickselecttext_SW_TagCode" href="javascript:void(0)">' + Volume + '</a></td>';
                                }
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }
            function Get_JD_SWGroup(search, type) {
                $("#Titlebrowse").text('Add Software Group(JD)');
                var fragmentHeader = '';
                var fragment = '';
                var BU_Group = $("#textEmpBU").val();
                var Level = $("#textEmpLevel").text();
                var Job_Title = $("#textJobTitle_ID").val();
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `<th>JD Code</th>
                                     <th>Job Desc</th>
                                      <th>Software Group</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/PE_Get_JD_SWGroup") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ BU_Group: BU_Group, Level: Level, Job_Title: Job_Title, search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[JD_Code], [Main_Company], [BU_Group], [Level], [Job_Title], [Job_Desc], [Software_Group], [Status]
                                var JD_Code = val[0];
                                var Main_Company = val[1];
                                var BU_Group = val[2];
                                var Level = val[3];
                                var Job_Title = val[4];
                                var Job_Desc = val[5];
                                var Software_Group = val[6];
                                var Status = val[7];
                                if (type == 'New') {
                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselecttext_JD_SWGroup_New" href="javascript:void(0)">' + JD_Code + '</a></td>';
                                    fragment += '<td><a class="clickselecttext_JD_SWGroup_New" href="javascript:void(0)">' + Job_Desc + '</a></td>';
                                    fragment += '<td><a class="clickselecttext_JD_SWGroup_New" href="javascript:void(0)">' + Software_Group + '</a></td>';
                                    fragment += '</tr>';
                                }
                                else if (type == 'Edit') {
                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselecttext_JD_SWGroup_Edit" href="javascript:void(0)">' + JD_Code + '</a></td>';
                                    fragment += '<td><a class="clickselecttext_JD_SWGroup_Edit" href="javascript:void(0)">' + Job_Desc + '</a></td>';
                                    fragment += '<td><a class="clickselecttext_JD_SWGroup_Edit" href="javascript:void(0)">' + Software_Group + '</a></td>';
                                    fragment += '</tr>';
                                }
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }
            function SETTabel_JD_Step3(IT_TAG_Code, IT_TAG_GroupName){
                table_JD_Step3_New.row.add([IT_TAG_Code, IT_TAG_GroupName
                    , '<td><input type="text" class="form-control max-wide JD_New_StartDate" autocomplete="off"></td>'
                    , '<td><input type="text" class="form-control max-wide JD_New_ReturnDate" autocomplete="off" disabled></td>'
                    , '<td><input type="text" class="form-control max-wide JD_New_Detail" autocomplete="off"></td>']).draw().node();

                
            }

            function Get_JD_TagCode(search, type, JDCode) {
                var fragmentHeader = '';
                var fragment = '';

                $("#TBbodyBrowse").empty();
                $("#TBheaderBrowse").empty();
                table_JD_Step2_New.clear().draw();
                $("#modalSize").attr('class', 'modal-dialog modal-lg');
                fragmentHeader = `
                                <th>TAG Code</th>
                                     <th>Tag Group</th>
                                     <th>Start Contract</th>
                                     <th>Expire Contract</th>
                                     <th>Used</th>
                                     <th>Volume</th>
                                    `;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/VW_IT_TAG_PE_Software_JD") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ JDCode: JDCode, search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[IT_Tag_Code], [JD_Code], [Tag_Group], [Start_Contract_date], [Expire_Contract_date]
                                //, [MainType], [TypeName], [TagGroup], [TagGroupName], [Tag_Group_Status], [Used], [Volume]
                                var IT_Tag_Code = val[0];
                                var JD_Code = val[1];
                                var Tag_Group = val[2];
                                var Start_Contract_date = val[3];
                                var Expire_Contract_date = val[4];
                                var MainType = val[5];
                                var TypeName = val[6];
                                var TagGroup = val[7];
                                var TagGroupName = val[8];
                                var Tag_Group_Status = val[9];
                                var Used = val[10];
                                var Volume = val[11];

                                if (type == 'New') {
                                    if (parseInt(Used) >= parseInt(Volume)) {
                                        table_JD_Step2_New.row.add(['<td class="center"><input class="form-check-input"  type="checkbox"  style="margin-left:1em" disabled></td> '
                                            , IT_Tag_Code, TagGroupName, Start_Contract_date.substr(0, 10), Expire_Contract_date.substr(0, 10)
                                            , '<td ><span class="over-volumn">' + Used + '</span></td>', '<td ><span class="over-volumn">' + Volume + '</span></td>'
                                            , '<td><input type="text" class="form-control max-wide JD_New_Detail" autocomplete="off"></td>']).draw().node();
                                    }
                                    else {
                                        table_JD_Step2_New.row.add(['<td class="center"><input class="form-check-input checkboxes"  type="checkbox"  style="margin-left:1em"></td>'
                                                , IT_Tag_Code, TagGroupName, Start_Contract_date.substr(0, 10), Expire_Contract_date.substr(0, 10), Used, Volume
                                                , '<td><input type="text" class="form-control max-wide JD_New_Detail" autocomplete="off"></td>']).draw().node();
                                
                                    }
                                }
                                else if (type == 'Edit') {
                                    fragment += '<tr>';
                                    if (parseInt(Used) >= parseInt(Volume)) {
                                        fragment += '<td><span class="over-volumn">' + IT_Tag_Code + '</span></td>';
                                        fragment += '<td><span class="over-volumn">' + TagGroupName + '</span></td>';
                                        fragment += '<td><span class="over-volumn">' + Start_Contract_date.substr(0, 10) + '</span></td>';
                                        fragment += '<td><span class="over-volumn">' + Expire_Contract_date.substr(0, 10) + '</span></td>';
                                        fragment += '<td><span class="over-volumn">' + Used + '</span></td>';
                                        fragment += '<td><span class="over-volumn">' + Volume + '</span></td>';
                                    }
                                    else {
                                        fragment += '<td><a class="clickselecttext_JD_Code" href="javascript:void(0)">' + IT_Tag_Code + '</a></td>';
                                        fragment += '<td><a class="clickselecttext_JD_Code" href="javascript:void(0)">' + TagGroupName + '</a></td>';
                                        fragment += '<td><a class="clickselecttext_JD_Code" href="javascript:void(0)">' + Start_Contract_date.substr(0, 10) + '</a></td>';
                                        fragment += '<td><a class="clickselecttext_JD_Code" href="javascript:void(0)">' + Expire_Contract_date.substr(0, 10) + '</a></td>';
                                        fragment += '<td><a class="clickselecttext_JD_Code" href="javascript:void(0)">' + Used + '</a></td>';
                                        fragment += '<td><a class="clickselecttext_JD_Code" href="javascript:void(0)">' + Volume + '</a></td>';
                                    }
                                    fragment += '</tr>';
                                }
                            });
                        }
                    }
                });


                if (type == 'Edit') {
                    $("#TBheaderBrowse").append(fragmentHeader);
                    $("#TBbodyBrowse").append(fragment);
                }
            }

            //END Function BrowseSearch
            

        $(document).on("click", ".clickselecttext_User_PE", function () {
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
            $("#textEmpNum").val(EmpNum);
            $("#textEmpName").text(name);
            $("#textEmpLevel").text(uf_level);
            $("#textEmpCostCenter").text(dept);
            $("#textEmpMainCompany").text(site_ref);
            $("#textEmpLocation").text(uf_location);
            $("#textEmpJobTitleTH").text(uf_jobtitle);
            $("#textEmpJobTitleEN").text(uf_jobtitleen);
            $("#textEmpBU_desc").text(bugoupdesc);
            $("#textEmpBU").val(bugroup);
            $("#textJobTitle_ID").val(uf_positionid);
            VW_IT_TAG_PE_ALL(EmpNum);
            $("#modalBrowseSearch").modal("hide");
        });
        //END Function BrowseClick

        });
        


        $(document).on("click", ".clickselecttext_HW_TagCode", function () {
            var tr = $(this).closest("tr");
            var IT_Tag_Code = tr.find("td:nth-child(1)").text();
            var TagGroupName = tr.find("td:nth-child(2)").text();
            $("#HW_TagCode").val(IT_Tag_Code);
            $("#HW_TagGroupName").val(TagGroupName);
            $("#modalBrowseSearch").modal("hide");
        });
        $(document).on("click", ".clickselecttext_SW_TagCode", function () {
            var tr = $(this).closest("tr");
            var IT_Tag_Code = tr.find("td:nth-child(1)").text();
            var TagGroupName = tr.find("td:nth-child(2)").text();
            $("#SW_TagCode").val(IT_Tag_Code);
            $("#SW_TagGroupName").val(TagGroupName);
            $("#modalBrowseSearch").modal("hide");
        });
        $(document).on("click", ".clickselecttext_Level", function () {
            var tr = $(this).closest("tr");
            var Level = tr.find("td:nth-child(1)").text();
            $("#Master_Level").val(Level);
            $("#modalBrowseSearch").modal("hide");
        });
        $(document).on("click", ".clickselecttext_JD_SWGroup_New", function () {
            var tr = $(this).closest("tr");
            var JD_Code = tr.find("td:nth-child(1)").text();
            $("#JD_SWGroup_New").val(JD_Code);
             $("#nextPage2").prop("disabled", false);
            $("#modalBrowseSearch").modal("hide");
        });
        $(document).on("click", ".clickselecttext_JD_SWGroup_Edit", function () {
            var tr = $(this).closest("tr");
            var JD_Code = tr.find("td:nth-child(1)").text();
            $("#JD_SWGroup").val(JD_Code);
            $("#modalBrowseSearch").modal("hide");
        });
        $(document).on("click", ".clickselecttext_JD_Code", function () {
            var tr = $(this).closest("tr");
            var ITTAGCode = tr.find("td:nth-child(1)").text();
            var TagGroup = tr.find("td:nth-child(2)").text();
            $("#JD_TagCode").val(ITTAGCode);
            $("#JD_TagGroupName").val(TagGroup);
            $("#modalBrowseSearch").modal("hide");
        });
        $(document).on("click", ".clickselecttext_PO_Number", function () {
            var tr = $(this).closest("tr");
            var PO_Number = tr.find("td:nth-child(1)").text();
            $("#HW_Project").val(PO_Number);
            $("#modalBrowseSearch").modal("hide");
        });


        function Profile_GETParams_EmpNum(EmpNum){
            $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Get_User_PE") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: EmpNum }),
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
                                $("#textEmpNum").val(Emp_Num);
                                $("#textEmpName").text(name);
                                $("#textEmpLevel").text(Uf_Level);
                                $("#textEmpCostCenter").text(dept);
                                $("#textEmpMainCompany").text(Site_Ref);
                                $("#textEmpLocation").text(Uf_Location);
                                $("#textEmpJobTitleTH").text(Uf_Jobtitle);
                                $("#textEmpJobTitleEN").text(Uf_JobTitleEN);
                                $("#textEmpBU_desc").text(BUGroupDesc);
                                $("#textEmpBU").val(BUGroup);
                                $("#textJobTitle_ID").val(Uf_PositionID);
                            });
                        }
                    }
                });
        }




        function setProfile() {
            //เปลี่ยนเป็น Onchange 
            $("#textEmpNum").val('62116 ');
            $("#textEmpName").text('นาย ชนณ์ประคัลภ์ ภาณุเศรษฐ์กุล');
            $("#textEmpLevel").text('G5');
            $("#textEmpCostCenter").text('5IT732');
            $("#textEmpMainCompany").text('บริษัท พัฒน์กล จำกัด (มหาชน)');
            $("#textEmpLocation").text('SL');
            //Jobเก็บเป็นID แต่ใช้ String มาโชว์
            $("#textEmpJobTitleTH").text('หัวหน้างานพัฒนาซอฟต์แวร์');
            $("#textEmpJobTitleEN").text('Software Development Supervisor ');
            $("#textEmpBU").val('AG');
            $("#textEmpBU_desc").text('Administrative Group (AG)');
            $("#textJobTitle_ID").val('D100010');
        }


        function SetDatePicker() {
            $('#HW_StartDate').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
            $('#HW_BrrowDate').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
            $('#HW_ReturnDate').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
            $('#Acc_Date').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
            $('#SW_StartDate').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
            $('#SW_ReturnDate').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
            $('#JD_StartDate').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
            $('#JD_ReturnDate').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
            $('.JD_New_StartDate').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
            $('.JD_New_ReturnDate').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
        }


        //function togglePannel() {
        //        if (checkCss == "none") {
        //            $("#hideToggle").css("display", "block");
        //            $("#btnToggle").html("Hide");
        //        }
        //        else if (checkCss == "block") {
        //            $("#hideToggle").css("display", "none");
        //            $("#btnToggle").html("Details");
        //        } 
        //}

    </script>
</asp:Content>
