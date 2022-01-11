<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ITTAG_MaintainJD.aspx.cs" Inherits="ITPortal.ITTAG_MaintainJD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .max-wide {
            max-width: 100%;
        }

        .datepicker {
            background: #333;
            border: 1px solid #555;
            color: #EEE;
            z-index: 9999 !important;
        }

        .img-preview {
            margin: auto;
            max-width: 100%;
            height: 180px;
        }

        .nav-tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
        }

        #ui-datepicker-div {
            z-index: 1600 !important;
        }
    </style>
    <div class="page-header">
        <div class="row">
            <div class="col-md-8 col-xs-8" style="text-align: left; font-size: 30px;">
                <span>Maintain Software Group(JD)  </span>
            </div>

            <div class="col-md-4 col-xs-4" style="text-align: right">
                <button id="btnNewJD_Master" class="btn btn-success Pos_Worker" type="button">New</button>
            </div>
        </div>
    </div>
    <!----End Header---->
    <div class="panel-group">
        
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="col-md-12" style="margin-top:1em;">
                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label1" class="col-md-3 col-xs-12 " runat="server" Font-Bold="True" Text="Main Company"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control max-wide" id="textHomeSearch_SiteRef">
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
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label4" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="BU Group"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                <input type="text" id="textHomeSearch_BUGroup" class="form-control" style="min-width: 100%" autocomplete="off"  disabled/>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" data-type="HomeSearch_BUGroup">
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
                            <asp:Label ID="Label3" class="col-md-3 col-xs-12 " runat="server" Font-Bold="True" Text="JD Code"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="textSearch_JD_Code" class="form-control" style="min-width: 100%" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label34" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Level"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="textSearch_Level_TagGroup" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" data-type="HomeSearch_Level">
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
                            <asp:Label ID="Label38" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Job Title"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="textSearch_Job_Title" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" data-type="HomeSearch_JobTitle">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label13" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Status"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control max-wide" id="textSearch_Status">
                                    <option value="">=======Please Select Maintypes=======</option>
                                    <option value="Active">Active</option>
                                    <option value="InActive">InActive</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                    <div class="row">
                        
                        <div class="form-group col-md-6 col-sm-6 col-xs-12" style="display:none">
                            <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Type Name"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                <input type="text" id="textSearch_Type_Name" class="form-control" style="min-width: 100%" autocomplete="off"  disabled/>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" data-type="HomeSearch_Type_Name">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12"  style="display:none">
                            <asp:Label ID="Label11" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="   TAG Group Name"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="textSearch_TagGroup" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" data-type="HomeSearch_TagGroupSearch">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                    <div class="row">
                       
                        
                    </div>
                    <!--END Row-->
                </div>

                <div class="col-md-12">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <div class="col-md-8 col-xs-12">
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <button type="button" id="btnClaerSearch" class="btn btn-warning btn-block" style="float: right;">Clear</button>
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <button type="button" id="btnSearchJD" class="btn btn-info btn-block" style="float: right;">Search</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--panel-body-->
        </div>
        <div class="panel panel-default" style="margin-top:1em">
            <%--<div class="panel-heading">
                <h3 style="margin-left: 5px;">Software Group(JD)</h3>
            </div>--%>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <table id="TableJD_Master" class="table table-hover table-bordered" style="width: 100%">
                                    <thead>
                                        <tr>
                                            <th>JD code</th>
                                            <th>Main Company</th>
                                            <th>BU Group</th>
                                            <th>Level</th>
                                            <th>Job title</th>
                                            <th>Job desc</th>
                                            <th>Software Group</th>
                                            <th>Status</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody id='TBbodyJD_Master'>
                                        <tr>
                                            <td>AG0001</td>
                                            <td>ERP_PK</td>
                                            <td>AG</td>
                                            <td>G8</td>
                                            <td>D100010 (ตาม HR Position)</td>
                                            <td>Programmer</td>
                                            <td>Programmer 1</td>
                                            <td>Active</td>
                                            <td><button class="btn btn-info btnShowJD_Detail" type="button">Detail</button></td>
                                            <td><button class="btn btn-warning btnEditJDMaster" type="button">Edit</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--- End Col-md-12 --->
                        </div>
                    </div>
                </div>
                <!--- End Col-md-12 --->
            </div>
        </div>
    </div>
    <%--End JD Master--%>
    
    <div class="modal fade" id="ModalJD_Master" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-lg" style="width: 50%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-3 col-sm-12">
                        </div>
                        <div class="col-md-9 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-warning" id="btnSaveJD_Master">Save</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 35em; max-width: 100%;">

                    <div class="panel-group">
                        <div class="col-md-">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 style="font-weight: bold;"><span id="TitleJD_Master"> :</span></h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">JD Code :</label>
                                            </div>
                                            <div class="col-md-9">
                                                <input id="Master_JDCode" type="text" class="form-control max-wide" autocomplete="off" disabled>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Maincompany :</label>
                                            </div>
                                            <div class="col-md-9">
                                                 <div class="input-group">
                                                        <input type="text" id="Master_Maincom_ID" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                        <input type="text" id="Master_Maincom"  style="display:none" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-default Browse_modal" type="button" id="btnBrowse_MainCompany" data-type="Maincompany">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">BU Group : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <input type="text" id="Master_BUGroup_ID"  class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                        <input type="text" id="Master_BUGroup" style="display:none" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-default Browse_modal" type="button"  id="btnBrowse_BUGroup" data-type="BUGroup">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                       <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Level : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <input type="text" id="Master_Level" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-default Browse_modal" type="button" data-type="Level">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                       <div class="col-md-12 form-group">
                                                <div class="col-md-3">
                                                    <label class="control-label" style="font-size: 13px">Job Title : </label>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <input type="text" id="Master_JobTitle_ID" style="display:none" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                        <input type="text" id="Master_JobTitle" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-default Browse_modal" type="button" data-type="JobTitle">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Job desc :</label>
                                            </div>
                                            <div class="col-md-9">
                                                <input id="Master_JobDesc" type="text" class="form-control max-wide" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Software Group :</label>
                                            </div>
                                            <div class="col-md-9">
                                                <input id="Master_SWGroup" type="text" class="form-control max-wide" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">Status :</label>
                                            </div>
                                            <div class="col-md-9">
                                                 <input type="text" id="Master_Action" style="display:none" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                <select class="form-control max-wide  max-wide" id="Master_Status">
                                                    <option value="">=== Select Status ===</option>
                                                    <option value="Active">Active</option>
                                                    <option value="InActive">InActive</option>
                                                </select>
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
    <%--Modal JD --%>
    <div class="modal fade" id="ModalJD_Detail" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-sm" style="width: 70%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 40em; max-width: 100%;">

                    <div class="panel-group">
                        <div class="col-md-12 ">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-md-4 col-xs-4" style="text-align: left;">
                                                <h4 style="font-weight: bold;" >Detail :<span id="ModalDetail_JD_id"></span> </h4>
                                            </div>
                                            <div class="col-md-8 col-xs-8" style="text-align: right">
                                                <button id="btnNewJD_Detail" class="btn btn-success Pos_Worker" type="button"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-body">

                                    <div class="row">
                                        <div class="col-md-12  form-group">
                                            <input type="text" class="form-control max-wide" id="JD_Detail_Code" autocomplete="off" style="display: none">
                                            <div class="table-responsive">
                                                <table class="table table-hover table-bordered" id="TableJD_Detail">
                                                    <thead>
                                                        <tr>
                                                            <th>Tag Group Name</th>
                                                            <th></th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="ListJD_DEtail">
                                                      
                                                    </tbody>
                                                    <tbody id="ListChargeNew">
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
                <%--Modal Body --%>
                <div class="modal-footer">
                    <%--<button type="button" class="btn btn-success" id="btnSaveChargeDetail">Save</button>--%>
                </div>
            </div>
        </div>
    </div>
    <%--Modal JDDEtail--%>

    <div class="modal fade" id="ModalJD_Detail_Edit" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-sm" style="width: 50%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12">
                        <div class="col-md-5 ">
                          
                        </div>
                        <div class="col-md-7" style="text-align: right;">
                              <button type="button" class="btn btn-warning" id="btnSaveJD_Detail">Save</button>
                              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">

                    <div class="panel-group">
                        <div class="col-md-">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 style="font-weight: bold;" id="TitleModdalJD_Detail_Edit"></h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12 form-group">
                                            
                                                <input id="textDetail_ID" type="text" style="display:none" class="form-control max-wide" autocomplete="off" disabled>
                                                <input id="textDetail_Action" type="text" style="display:none" class="form-control max-wide" autocomplete="off" disabled>
                                            <div class="col-md-2">
                                                <label class="control-label" style="font-size: 13px">JD Code :</label>
                                            </div>
                                            <div class="col-md-10">
                                                <input id="textDetail_JDCode" type="text" class="form-control max-wide" autocomplete="off" disabled>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-2">
                                                <label class="control-label" style="font-size: 13px">Tag Group :</label>
                                            </div>
                                            <div class="col-md-10">
                                                  <div class="input-group">
                                                        <input type="text" id="textDetail_TagGroup" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-default Browse_modal" type="button" data-type="TagGroup">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-2">
                                                <label class="control-label" style="font-size: 13px">Tag Group Name :</label>
                                            </div>
                                            <div class="col-md-10">
                                                <input id="textDetail_TagGroupName" type="text" class="form-control max-wide" autocomplete="off" disabled>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-2">
                                                <label class="control-label" style="font-size: 13px">Main Type :</label>
                                            </div>
                                            <div class="col-md-10">
                                                <input id="textDetail_MainType" type="text" class="form-control max-wide" autocomplete="off" disabled>
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
    <%--Modal JD Detail--%>

    
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
           

            var TableJD_Master = $('#TableJD_Master').DataTable({
                searching: true,
                lengthChange: false
            });
            var TableJD_Detail = $('#TableJD_Detail').DataTable({
                searching: true,
                lengthChange: false
            });

              var UserPosition = CheckPermission('ITTAG', 'Maintain SW Group (JD)');
            console.log(UserPosition)
            SetPage(UserPosition)
            if (UserPosition != "") {
                GET_TableJD_Master('','','','','','','','');
                 GetSiteRef();
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

            $(document).on("click", "#btnSearchJD", function () {
                var SiteRef = $("#textHomeSearch_SiteRef").val();
                var BUGroup = $("#textHomeSearch_BUGroup").val();
                var JD_Code = $("#textSearch_JD_Code").val();
                var Level = $("#textSearch_Level_TagGroup").val();
                var Type_Name = $("#textSearch_Type_Name").val();
                var Job_Title = $("#textSearch_Job_Title").val();
                var TagGroup = $("#textSearch_TagGroup").val();
                var Status = $("#textSearch_Status").val();
                GET_TableJD_Master(SiteRef,BUGroup,JD_Code,Level,Type_Name,Job_Title,TagGroup,Status);
            });
            $(document).on("click", "#btnClaerSearch", function () {
                $("#textHomeSearch_SiteRef").val('');
                $("#textHomeSearch_BUGroup").val('');
                $("#textHomeSearch_JD_Code").val('');
                $("#textSearch_Level_TagGroup").val('');
                $("#textSearch_Type_Name").val('');
                $("#textSearch_Job_Title").val('');
                $("#textSearch_TagGroup").val('');
                $("#textSearch_Status").val('');
                GET_TableJD_Master('','','','','','','','');
            });


            $(document).on("click", "#btnNewJD_Master", function () {
                $('#btnBrowse_MainCompany').prop('disabled', false);
                $('#btnBrowse_BUGroup').prop('disabled', false);
                var title = 'New';
                 $("#Master_JDCode").val(0);
                $("#Master_Maincom").val('');
                $("#Master_BUGroup").val('');
                $("#Master_Maincom_ID").val('');
                $("#Master_BUGroup_ID").val('');
                $("#Master_Level").val('');
                $("#Master_JobTitle").val('');
                $("#Master_JobDesc").val('');
                $("#Master_SWGroup").val('');
                $("#Master_Status").val('Active');
                $("#Master_Action").val("Insert");
                $("#TitleJD_Master").text(title);
                $("#ModalJD_Master").modal("show");
            });
            $(document).on("click", ".btnEditJDMaster", function () {
                $('#btnBrowse_MainCompany').prop('disabled', true);
                $('#btnBrowse_BUGroup').prop('disabled', true);
                var t1 = $(this).closest("tr").find("td:nth-child(1)").text();
                var t2 = $(this).closest("tr").find("td:nth-child(2)").text();
                var t3 = $(this).closest("tr").find("td:nth-child(3)").text();
                var t4 = $(this).closest("tr").find("td:nth-child(4)").text();
                var t5 = $(this).closest("tr").find("td:nth-child(5)").text();
                var t6 = $(this).closest("tr").find("td:nth-child(6)").text();
                var t7 = $(this).closest("tr").find("td:nth-child(7)").text();
                var t8 = $(this).closest("tr").find("td:nth-child(8)").text();
                var Uf_JobTitle = $(this).attr("data-Uf_JobTitle");
                var title = 'Edit :'+ t1;
                $("#Master_JDCode").val(t1);
                $("#Master_Maincom_ID").val(t2);
                $("#Master_BUGroup_ID").val(t3);
                $("#Master_Level").val(t4);
                $("#Master_JobTitle_ID").val(t5);
                $("#Master_JobTitle").val(Uf_JobTitle);
                $("#Master_JobDesc").val(t6);
                $("#Master_SWGroup").val(t7);
                $("#Master_Status").val(t8);
                $("#Master_Action").val("Update");
                $("#TitleJD_Master").text(title);
                $("#ModalJD_Master").modal("show");
            });
            //Master
            $(document).on("click", ".btnShowJD_Detail", function () {
                var JDCode = $(this).closest("tr").find("td:nth-child(1)").text();
                GET_TableJD_Detail(JDCode)
                $("#ModalDetail_JD_id").text(JDCode);
                $("#ModalJD_Detail").modal("show");
            });
            //JD Detail
            $(document).on("click", "#btnNewJD_Detail", function () {
                $("#textDetail_Action").val("Insert");
                $("#textDetail_ID").val(0);
                var JD_id = $("#ModalDetail_JD_id").text();
                $("#textDetail_JDCode").val(JD_id);
                $("#textDetail_TagGroup").val('');
                $("#textDetail_TagGroupName").val('');
                $("#textDetail_MainType").val('');
                $("#TitleModdalJD_Detail_Edit").text('New');
                $("#ModalJD_Detail_Edit").modal("show");
            });

            $(document).on("click", ".btnEditJD_Detail", function () {
                var JD_id = $("#ModalDetail_JD_id").text();
                var id = $(this).attr("data-id");
                $("#textDetail_ID").val(id);
                $("#textDetail_Action").val("Update");
                var t1 = $(this).closest("tr").find("td:nth-child(1)").text();
                var MainType = $(this).attr("data-maintype");
                var TagGroup = $(this).attr("data-tag_group");
                var taggroupname = $(this).attr("data-taggroupname");
                $("#textDetail_JDCode").val(JD_id);
                $("#textDetail_TagGroup").val(TagGroup);
                $("#textDetail_TagGroupName").val(taggroupname);
                $("#textDetail_MainType").val(MainType);
                $("#TitleModdalJD_Detail_Edit").text('Edit');
                $("#ModalJD_Detail_Edit").modal("show");
            });



            $("#btnSaveJD_Master").on("click", function () {
                var JD_Code = $("#Master_JDCode").val();
                var Main_Company = $("#Master_Maincom_ID").val()
                var BU_Group = $("#Master_BUGroup_ID").val();
                var Level = $("#Master_Level").val();
                var Job_Title = $("#Master_JobTitle_ID").val();
                var Job_Desc = $("#Master_JobDesc").val();
                var Software_Group = $("#Master_SWGroup").val();
                var Status = $("#Master_Status").val();
                var Action = $("#Master_Action").val();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_IT_TAG_Software_JD") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        JD_Code: JD_Code, Main_Company: Main_Company, BU_Group: BU_Group
                        , Level: Level, Job_Title: Job_Title, Job_Desc: Job_Desc, Software_Group: Software_Group, Status: Status,Action:Action
                    }),
                    success: function (response) {
                        var ID = response.d;
                        swal(
                            'Complete',
                            'บันทึก Software Group (JD) สำเร็จ',
                            'success'
                        );
                        GET_TableJD_Master();
                    }
                });

                $("#ModalJD_Master").modal("hide");
            });
            //Btn SaveMaster
            $("#btnSaveJD_Detail").on("click", function () {
                var ID = $("#textDetail_ID").val();
                var JD_Code = $("#textDetail_JDCode").val();
                var Tag_Group = $("#textDetail_TagGroup").val()
                //var TagGroupName = $("#textDetail_TagGroupName").val();
                //var MainType = $("#textDetail_MainType").val();
                var Action = $("#textDetail_Action").val();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_IT_TAG_Software_JD_Detail") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        ID: ID, JD_Code: JD_Code, Tag_Group: Tag_Group ,Action:Action
                    }),
                    success: function (response) {
                        var ID = response.d;
                        swal(
                            'Complete',
                            'บันทึก Software Group (JD) สำเร็จ',
                            'success'
                        );
                        GET_TableJD_Detail(JD_Code);
                    }
                });

                $("#ModalJD_Detail_Edit").modal("hide");
            });
            //Btn SaveDetail
             $(document).on("click", ".btnDelete_Detail", function () {
                var ID = $(this).attr("data-id");
                 var JD_Code = $(this).attr("data-JD_Code");

                 swal({
                     title: 'ยืนยันการลบ',
                     text: " ",
                     icon: 'info',
                     buttons: {
                         cancel: true,
                         confirm: true,
                     },
                 }).then(function (confirm) {
                     if (confirm) {
                         $.ajax({
                             type: "post",
                             async: false,
                             url: "<%= ResolveUrl("Default.aspx/SP_IT_TAG_Software_JD_Detail") %>",
                                 contentType: "application/json; charset=utf-8",
                                 dataType: "json",
                                 data: JSON.stringify({
                                     ID: ID, JD_Code: '', Tag_Group: '', Action: 'Delete'
                                 }),
                                 success: function (response) {
                                     var ID = response.d;
                                     swal(
                                         'Complete',
                                         'บันทึก Software Group (JD) สำเร็จ',
                                         'success'
                                     );
                                     GET_TableJD_Detail(JD_Code);
                                 }
                             });
                         }
                     })
            });
            //Btn SaveDetail

            $(document).on("click", ".Browse_modal", function () {
                var Type = $(this).attr("data-type");
                $("#Titlebrowse").text(Type);
                $("#TBbodyBrowse").empty();
                $("#TBheaderBrowse").empty();
                $("#search_box").empty();
                $("#search_box").append('<input type="text" id="search_' + Type + '" placeholder="Search.." class="form-control max-wide" autocomplete="off">');
                if (Type == 'JobTitle') {
                    Get_Jobs_Title('');
                    $("#modalBrowseSearch").modal("show");
                }//End JobTitle
                else if (Type == 'HomeSearch_JobTitle') {
                    Get_HomeSearchJobs_Title('');
                    $("#modalBrowseSearch").modal("show");
                }//End JobTitle
                else if (Type == 'Maincompany') {
                    Get_Maincompany('');
                    $("#modalBrowseSearch").modal("show");
                }//End Maincompany
                else if (Type == 'BUGroup') {
                    var Master_Maincom_ID = $("#Master_Maincom_ID").val();
                    if (Master_Maincom_ID != "") {
                        Get_BUGroup('');
                        $("#modalBrowseSearch").modal("show");
                    } else {
                        swal('Error', 'กรุณาเลือก Maincompany ก่อน', 'error');
                    }

                }//End BUGroup
                else if (Type == 'HomeSearch_BUGroup') {
                    Get_HomeSearchBUGroup('');
                    $("#modalBrowseSearch").modal("show");
                }//End Home_Search_BUGroup
                else if (Type == 'Level') {
                    Get_Level('');
                    $("#modalBrowseSearch").modal("show");
                }//End Level
                else if (Type == 'HomeSearch_Level') {
                    Get_HomeSearchLevel('');
                    $("#modalBrowseSearch").modal("show");
                }//End Level
                else if (Type == 'TagGroup') {
                    Get_TagGroup('');
                    $("#modalBrowseSearch").modal("show");
                }//End TagGroupDetail
                else if (Type == 'HomeSearch_TagGroupSearch') {
                    Get_TagGroup_Search('');
                    $("#modalBrowseSearch").modal("show");
                }//End TagGroupSearch
                else if (Type == 'HomeSearch_Type_Name') {
                    Get_Homesearch_TypeName('');
                    $("#modalBrowseSearch").modal("show");
                }//End TagGroupSearch

            });
            //End ModalBrowseSearch
            
            $(document).on("change", "#search_JobTitle", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                console.log(search);
                Get_Jobs_Title(search);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("change", "#search_Maincompany", function () {
                $("#Titlebrowse").text('Search MainCompany');
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                console.log(search);
                Get_Maincompany(search);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("change", "#search_BUGroup", function () {
                $("#Titlebrowse").text('Search BU Group');
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                console.log(search);
                Get_BUGroup(search);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("change", "#search_Level", function () {
                $("#Titlebrowse").text('Search Level');
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                console.log(search);
                Get_Level(search);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("change", "#search_TagGroup", function () {
                $("#Titlebrowse").text('Search Tag Group');
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                console.log(search);
                Get_TagGroup(search);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("change", "#search_HomeSearch_Type_Name", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                console.log(search);
                Get_Homesearch_TypeName(search);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("change", "#search_HomeSearch_JobTitle", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                console.log(search);
                Get_HomeSearchJobs_Title(search);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("change", "#search_HomeSearch_TagGroupSearch", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                console.log(search);
                Get_TagGroup_Search(search);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("change", "#search_HomeSearch_BUGroup", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                console.log(search);
                Get_HomeSearchBUGroup(search);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("change", "#search_HomeSearch_Level", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                console.log(search);
                Get_HomeSearchLevel(search);
                $("#modalBrowseSearch").modal("show");
            });

            //Search Modal Onchange

            function Get_Jobs_Title(search) {
                $("#Titlebrowse").text('Search Jobs Title');
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
                    url: "<%= ResolveUrl("Default.aspx/Get_Jobs_Title") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search ,site:site }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var site_ref = val[0];
                                var job_id = val[1];
                                var stat = val[2];
                                var uf_jobTitleEn = val[3];
                                var Uf_JobTitle = val[4];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_Jobs_Title" href="javascript:void(0)">' + job_id + '</a></td>';
                                fragment += '<td><a class="clickselecttext_Jobs_Title" href="javascript:void(0)">' + Uf_JobTitle + '</a></td>';
                                fragment += '<td><a class="clickselecttext_Jobs_Title" href="javascript:void(0)">' + uf_jobTitleEn + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }
            function Get_HomeSearchJobs_Title(search) {
                $("#Titlebrowse").text('Search Jobs Title');
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
                    url: "<%= ResolveUrl("Default.aspx/Get_JD_BrowseJobs_Title") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search ,site:'' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var job_id = val[0];
                                var stat = val[1];
                                var uf_jobTitleEn = val[2];
                                var Uf_JobTitle = val[3];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_HomeSearchJobs_Title" href="javascript:void(0)">' + job_id + '</a></td>';
                                fragment += '<td><a class="clickselecttext_HomeSearchJobs_Title" href="javascript:void(0)">' + Uf_JobTitle + '</a></td>';
                                fragment += '<td><a class="clickselecttext_HomeSearchJobs_Title" href="javascript:void(0)">' + uf_jobTitleEn + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }

            function Get_Maincompany(search) {
                $("#Titlebrowse").text('Search MainCompany');
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `<th>Site Ref</th>
                                     <th>Site Name</th>
                                    <th>Site Name EN</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Get_Site_Ref") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var site_ref = val[0];
                                var Site_Name_EN = val[1];
                                var Site_Name_TH = val[2];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_Maincompany" href="javascript:void(0)">' + site_ref + '</a></td>';
                                fragment += '<td><a class="clickselecttext_Maincompany" href="javascript:void(0)">' + Site_Name_TH + '</a></td>';
                                fragment += '<td><a class="clickselecttext_Maincompany" href="javascript:void(0)">' + Site_Name_EN + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }
            function Get_BUGroup(search) {
                $("#Titlebrowse").text('Search BU Group');
                var site_ref = $("#Master_Maincom_ID").val();
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `<th>SiteRef</th>
                                  <th>Group</th>
                                  <th>Desc</th>
                                `;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Get_BUGroup") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search ,site_ref:site_ref}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var site_ref = val[0];
                                var Uf_Group = val[1];
                                var GroupDesc = val[2];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_BUGroup" href="javascript:void(0)">' + site_ref + '</a></td>';
                                fragment += '<td><a class="clickselecttext_BUGroup" href="javascript:void(0)">' + Uf_Group + '</a></td>';
                                fragment += '<td><a class="clickselecttext_BUGroup" href="javascript:void(0)">' + GroupDesc + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }
            function Get_HomeSearchBUGroup(search) {
                $("#Titlebrowse").text('Search BU Group');
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `
                                  <th>Group</th>
                                  <th>Desc</th>
                                `;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Get_JD_BrowseSearchBUGroup") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Uf_Group = val[0];
                                var GroupDesc = val[1];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_HomeSearchBUGroup" href="javascript:void(0)">' + Uf_Group + '</a></td>';
                                fragment += '<td><a class="clickselecttext_HomeSearchBUGroup" href="javascript:void(0)">' + GroupDesc + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }
            function Get_Level(search) {
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
                                fragment += '<td><a class="clickselecttext_Level" href="javascript:void(0)">' + Level + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }
            function Get_HomeSearchLevel(search) {
                $("#Titlebrowse").text('Search Level');
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
                                fragment += '<td><a class="clickselecttext_HomeSearchLevel" href="javascript:void(0)">' + Level + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }
            function Get_TagGroup(search) {
                $("#Titlebrowse").text('Search Tag Group');
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `<th>Tag Group</th>
                                  <th>Tag Group name</th>
                                  <th>Main Type</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/JD_Search_TAG_Group") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                // [ID],[Owner],[MainType],[TypeName],[TagGroup],[TagGroupName],[Status],[ReportSeq] 
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
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }
            function Get_TagGroup_Search(search) {
                $("#Titlebrowse").text('Search Tag Group');
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `<th>Tag Group</th>
                                  <th>Tag Group name</th>
                                  <th>Main Type</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/JD_Search_TAG_Group") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                // [ID],[Owner],[MainType],[TypeName],[TagGroup],[TagGroupName],[Status],[ReportSeq] 
                                var ID = val[0];
                                var Owner = val[1];
                                var MainType = val[2];
                                var TypeName = val[3];
                                var TagGroup = val[4];
                                var TagGroupName = val[5];
                                var Status = val[6];
                                var ReportSeq = val[7];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_TagGroup_Search" href="javascript:void(0)">' + TagGroup + '</a></td>';
                                fragment += '<td><a class="clickselecttext_TagGroup_Search" href="javascript:void(0)">' + TagGroupName + '</a></td>';
                                fragment += '<td><a class="clickselecttext_TagGroup_Search" href="javascript:void(0)">' + MainType + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }
            function Get_Homesearch_TypeName(search) {
                $("#Titlebrowse").text('Search Type Name');
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `<th>Type Name</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/JD_Homesearch_TypeName") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var TypeName = val[0];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_HomeSearchTypeName" href="javascript:void(0)">' + TypeName + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }

            //END Function BrowseSearch
            $(document).on("click", ".clickselecttext_Jobs_Title", function () {
                var tr = $(this).closest("tr");
                var job_id = tr.find("td:nth-child(1)").text();
                var JobTitle = tr.find("td:nth-child(2)").text();
                $("#Master_JobTitle_ID").val(job_id);
                $("#Master_JobTitle").val(JobTitle);
                $("#modalBrowseSearch").modal("hide");
            });
            $(document).on("click", ".clickselecttext_HomeSearchJobs_Title", function () {
                var tr = $(this).closest("tr");
                var job_id = tr.find("td:nth-child(1)").text();
                $("#textSearch_Job_Title").val(job_id);
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", ".clickselecttext_Maincompany", function () {
                var tr = $(this).closest("tr");
                var site_ref = tr.find("td:nth-child(1)").text();
                var SiteName = tr.find("td:nth-child(2)").text();
                $("#Master_Maincom").val(SiteName);
                $("#Master_Maincom_ID").val(site_ref);
                $("#modalBrowseSearch").modal("hide");
            });
            $(document).on("click", ".clickselecttext_BUGroup", function () {
                var tr = $(this).closest("tr");
                var Uf_Group = tr.find("td:nth-child(2)").text();
                var Desc = tr.find("td:nth-child(3)").text();
                $("#Master_BUGroup_ID").val(Uf_Group);
                $("#Master_BUGroup").val(Desc);
                $("#modalBrowseSearch").modal("hide");
            });
            $(document).on("click", ".clickselecttext_HomeSearchBUGroup", function () {
                var tr = $(this).closest("tr");
                var Uf_Group = tr.find("td:nth-child(1)").text();
                var Desc = tr.find("td:nth-child(2)").text();
                $("#textHomeSearch_BUGroup").val(Uf_Group);
                $("#modalBrowseSearch").modal("hide");
            });
            $(document).on("click", ".clickselecttext_Level", function () {
                var tr = $(this).closest("tr");
                var Level = tr.find("td:nth-child(1)").text();
                $("#Master_Level").val(Level);
                $("#modalBrowseSearch").modal("hide");
            });
            $(document).on("click", ".clickselecttext_HomeSearchLevel", function () {
                var tr = $(this).closest("tr");
                var Level = tr.find("td:nth-child(1)").text();
                $("#textSearch_Level_TagGroup").val(Level);
                $("#modalBrowseSearch").modal("hide");
            });
            $(document).on("click", ".clickselecttext_TagGroup", function () {
                var tr = $(this).closest("tr");
                var TagGroup = tr.find("td:nth-child(1)").text();
                var TagGroupName = tr.find("td:nth-child(2)").text();
                var MainType = tr.find("td:nth-child(3)").text();
                $("#textDetail_TagGroup").val(TagGroup);
                $("#textDetail_TagGroupName").val(TagGroupName);
                $("#textDetail_MainType").val(MainType);
                $("#modalBrowseSearch").modal("hide");
            });
            $(document).on("click", ".clickselecttext_TagGroup_Search", function () {
                var tr = $(this).closest("tr");
                //var TagGroup = tr.find("td:nth-child(1)").text();
                var TagGroupName = tr.find("td:nth-child(1)").text();
                //var MainType = tr.find("td:nth-child(3)").text();
                //$("#textDetail_TagGroup").val(TagGroup);
                $("#textSearch_TagGroup").val(TagGroupName);
                //$("#textDetail_MainType").val(MainType);
                $("#modalBrowseSearch").modal("hide");
            });
            $(document).on("click", ".clickselecttext_HomeSearchTypeName", function () {
                var tr = $(this).closest("tr");
                var TypeName = tr.find("td:nth-child(1)").text();
                $("#textSearch_Type_Name").val(TypeName);
                $("#modalBrowseSearch").modal("hide");
            });
             //END Function BrowseClick
            
            function GET_TableJD_Master(SiteRef,BUGroup,JD_Code,Level,Type_Name,Job_Title,TagGroup,Status) {
                $("#IMGUpload").modal("show");
                TableJD_Master.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GET_JD_Master") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ SiteRef: SiteRef, BUGroup: BUGroup, JD_Code: JD_Code, Level: Level, Type_Name: Type_Name, Job_Title: Job_Title, TagGroup: TagGroup, Status: Status }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                ////[JD_Code],[Main_Company],[BU_Group],[Level],[Job_Title],[Uf_JobTitle],[Job_Desc],[Software_Group],[Status]
                                var JD_Code = val[0];
                                var Main_Company = val[1];
                                var BU_Group = val[2];
                                var Level = val[3];
                                var Job_Title = val[4];
                                var Uf_JobTitle = val[5];
                                var Job_Desc = val[6];
                                var Software_Group = val[7];
                                var Status = val[8];
                                if (UserPosition == "Admin" || UserPosition == "Worker") {
                                    TableJD_Master.row.add([
                                        JD_Code,
                                        Main_Company,
                                        BU_Group,
                                        Level,
                                        Job_Title,
                                        Job_Desc,
                                        Software_Group,
                                        Status,
                                        '<td><button class="btn btn-info  btnShowJD_Detail " data-JD_Code="' + JD_Code + '"   type="button" >Detail </button></td> ',
                                        '<td><button class="btn btn-warning  btnEditJDMaster Pos_Worker" data-JD_Code="' + JD_Code + '" data-Uf_JobTitle="' + Uf_JobTitle + '" type="button" >Edit</button></td> ',
                                    ]).draw(false);
                                }
                                else if (UserPosition == "Viewer") {
                                    TableJD_Master.row.add([
                                        JD_Code,
                                        Main_Company,
                                        BU_Group,
                                        Level,
                                        Job_Title,
                                        Job_Desc,
                                        Software_Group,
                                        Status,
                                        '<td><button class="btn btn-info  btnShowJD_Detail " data-JD_Code="' + JD_Code + '"   type="button" >Detail </button></td> ',
                                        '',
                                    ]).draw(false);
                                }
                                
                            });
                        }
                        
                $("#IMGUpload").modal("hide");
                    }

                });
            }
            function GET_TableJD_Detail(JDCode) {
                TableJD_Detail.clear().draw();
                var search = $("#search_")
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GET_JD_Detail") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({JDCode:JDCode,search:''}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[ID],[JD_Code],[Tag_Group],[MainType],[TagGroupName],[TypeName] 
                                var ID = val[0];
                                var JD_Code = val[1];
                                var Tag_Group = val[2];
                                var MainType = val[3];
                                var TagGroupName = val[4];
                                var TypeName = val[5];
                                 if (UserPosition == "Admin" ) {
                                    TableJD_Detail.row.add([
                                    TagGroupName,
                                    '<td><button class="btn btn-info btnEditJD_Detail" data-id="'+ID+'" data-JD_Code="'+JD_Code+'" data-tag_group="'+Tag_Group+'" data-MainType="'+MainType+'" data-TagGroupName="'+TagGroupName+'" data-TypeName="'+TypeName+'" data-TagGroup="OF" data-MainType="Solftware" type="button">Edit</button></td> ',
                                    '<td><button class="btn btn-danger  btnDelete_Detail" data-id="'+ID+'"  data-JD_Code="'+JD_Code+'" data-tag_group="'+Tag_Group+'" type="button" >Delete</button></td> ',
                                ]).draw(false);
                                }else if ( UserPosition == "Worker") {
                                    TableJD_Detail.row.add([
                                    TagGroupName,
                                    '<td><button class="btn btn-info btnEditJD_Detail" data-id="'+ID+'" data-JD_Code="'+JD_Code+'" data-tag_group="'+Tag_Group+'" data-MainType="'+MainType+'" data-TagGroupName="'+TagGroupName+'" data-TypeName="'+TypeName+'" data-TagGroup="OF" data-MainType="Solftware" type="button">Edit</button></td> ',
                                    ' ',
                                ]).draw(false);
                                }
                                else if (UserPosition == "Viewer") {
                                    TableJD_Detail.row.add([
                                    TagGroupName,
                                    ' ',
                                    ' ',
                                ]).draw(false);
                                }

                               
                            });
                        }
                        
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
                        $("#textHomeSearch_SiteRef").append(siteRef);
                    }
                }
            });
        }

        });
    </script>

</asp:Content>
