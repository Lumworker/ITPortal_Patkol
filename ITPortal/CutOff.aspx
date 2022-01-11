<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CutOff.aspx.cs" Inherits="ITPortal.CutOff" %>
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
        /* leave this part out */
        body {
            /*text-align: center;*/
            padding-top: 30px;
        }
        /* leave this part out */
    </style>

    <div id="header">
        <div class="row" style="margin-top:3rem">
            <div class="col-md-4 col-sm-4 col-xs-12">
                <h2 style="text-align: left;">Cut Off</h2>
            </div>
            <div class="col-md-8 col-sm-8 col-xs-12" style="margin-top: 1rem;">
                <h3 id="erp_text" style="float:right;">ERP_ID</h3>
                <button class="btn btn-default" style="margin-top: 1rem;margin-right:1rem;float:right;" id="btnSearch" type="button" >
                    <i class="glyphicon glyphicon-search"></i>
                </button>
            </div>
        
        </div>
    </div>

    <div id="body">
        <div class="panel-group">
            <div class="panel-body">
                <div class="row">
                    <div id="smartwizard">
                        <ul>
                            <li class="check" data-step="Step1"><a href="#step-1">Effect Date</a></li>
                            <li class="check" data-step="Step2"><a href="#step-2">Export</a></li>
                        </ul>
                        <div>
                            <%--   ======Step 1======--%>
                            <div id="step-1" class="">
                                <div class="panel-group">
                                    <div class="panel panel-default" style="margin-top: 1em;">
                                        <div class="panel-heading">
                                            <h4>Select Effect Date</h4>
                                        </div>
                                        <div class="panel-body">

                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="col-md-2 col-xs-12">
                                                            <label class="control-label">Start Date :</label>
                                                        </div>
                                                        <div class="col-md-10 col-xs-12">
                                                            <div class='input-group date' data-provide="datepicker">
                                                                <input type='text' class="form-control max-wide" id="StartDate" autocomplete="off" readonly="readonly" data-provide="datepicker" />
                                                                <span class="input-group-addon">
                                                                    <i class="glyphicon glyphicon-calendar"></i>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="col-md-2 col-xs-12">
                                                            <label class="control-label">End Date :</label>
                                                        </div>
                                                        <div class="col-md-10 col-xs-12">
                                                            <div class='input-group date' >
                                                                <input type='text' class="form-control max-wide" id="EndDate" autocomplete="off" readonly="readonly" data-provide="datepicker" />
                                                                <span class="input-group-addon">
                                                                    <i class="glyphicon glyphicon-calendar"></i>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div style="text-align: right">
                                                    <button id="nextPage2" class="btn btn-warning" type="button" style="width:100px;margin:0.5rem" >Next</button>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%--   ======Step 2======--%>
                            <div id="step-2" class="">
                                <div class="panel-group">
                                    <div class="panel panel-default" style="margin-top: 1em;">
                                        <div class="panel-heading">
                                            <h4>Cut Off Export</h4>
                                            <input id="idWFType" type="hidden" class="form-control">
                                        </div>
                                        <div class="panel-body" style="text-align:center;">
                                            <%--<button class="btn btn-warning" type="button" style="width:100px;" id="export">Export</button>--%>
                                            <h2>Download export file</h2>
                                            <asp:Button runat="server" ID="Dowloadtext" class="btn btn-warning" OnClick="OT_Export" Text="Download" />
                                            <div style="overflow: hidden; width: 0; height: 0;">
                                                <asp:TextBox runat="server" ID="snssite_ref" />
                                                <asp:TextBox runat="server" ID="snsstrDate" />
                                                <asp:TextBox runat="server" ID="snsendDate" />
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

    <div class="modal fade" id="modalSiteRef" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-xs">
            <div class="modal-content">
                <%--<div class="modal-header">
                </div>--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;text-align:center;height:500px;">
                    
                    <div style="margin-top: 25%;">
                        <label style="font-size:20px;">Select Company</label>
                        <select class="form-control center" style="max-width:70%;margin-top:1rem;" id="siteRef">
                            <option value="">=======Please Select Company=======</option>
                            <option value="ERP_PK">PATKOL & TYGIENIC</option>
                            <option value="ERP_HA">HEATAWAY</option>
                            <option value="ERP_PKT">PATKOL TRADING</option>
                        </select> 
                        <div style="margin-top:2rem;text-align:center;">
                            <button type="button" class="btn btn-info" style="width: 20rem;" id="next" disabled >Select</button>
                        </div>
                    </div>
                    <div style="text-align: right;">
                        
                    </div>
                </div>

            </div>
        </div>
    </div>
    <%--modalSiteRef  --%>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#StartDate").datepicker({ format: "dd/mm/yyyy" });
            $('#EndDate').datepicker({ format: "dd/mm/yyyy" });
            $("#modalSiteRef").modal("show");
            $('#smartwizard').smartWizard({
                theme: 'arrows',
                keyNavigation: false,
                showStepURLhash: false,
                selected: 0, //ใส่ 0 จะเริ่มที่ Step แรกสุด
                transitionEffect: 'slide',
                toolbarSettings: { toolbarPosition: 'none', showNextButton: 'false', showPreviousButton: 'false' }
            });

            $("#btnSearch").on("click", function () {
                $("#modalSiteRef").modal("show");
            });
            $("#next").on("click", function () {
                var company_name = $("#siteRef option:selected").text();
                $("#erp_text").text(company_name);
                $("#modalSiteRef").modal("hide");
            });
            $("#siteRef").on("change", function () {
                var site_ref = $("#siteRef").val();
                $("#MainContent_snssite_ref").val(site_ref);
                if (site_ref) {
                    $("#next").prop("disabled", false);
                } else {
                    $("#next").prop("disabled", true);
                }
            });

            $("#nextPage2").on("click", function () {
                var endDate = $("#EndDate").val();
                var strDate = $("#StartDate").val();
                $("#MainContent_strDate").val(strDate);
                $("#MainContent_endDate").val(endDate);
                if (strDate && endDate) {
                    $('#smartwizard').smartWizard("next");
                } else {
                    alert("Please select effect date");
                }
            });

            $("#export").on("click", function () {
                var strDate = $("#StartDate").val();
                var endDate = $("#EndDate").val();
                //var siteRef = $("#siteRef").val();

                if (siteRef == "ERP_PK") {
                    $.ajax({
                        type: 'post',
                        url: 'CutOff.aspx/VW_SFiCsh_Format_Temp_CutOff_PK',
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ strDate: strDate,endDate: endDate, siteRef: siteRef }),
                        success: function (response) {
                            $.ajax({
                                type: 'post',
                                url: 'CutOff.aspx/VW_SFiCsh_Format_Temp_CutOff_TG',
                                async: false,
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                data: JSON.stringify({ strDate: strDate,endDate: endDate, siteRef: siteRef }),
                                success: function (response) {
                                    alert("Success");
                                }
                            });

                        }
                    });
                }
                else if (siteRef == "ERP_HA") {
                    $.ajax({
                        type: 'post',
                        url: 'CutOff.aspx/VW_SFiCsh_Format_Temp_CutOff_HA',
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ strDate: strDate,endDate: endDate, siteRef: siteRef }),
                        success: function (response) {
                            alert("Success");
                        }
                    });
                }
            });

        });
    </script>
</asp:Content>
