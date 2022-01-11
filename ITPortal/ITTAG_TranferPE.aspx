<%@ Page Title="Tranfer Owner" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ITTAG_TranferPE.aspx.cs" Inherits="ITPortal.ITTAG_Tranfer" %>

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
        .over-volumn {
            color: #b71c1c;
            /*font-size: 18px;*/
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
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
            <h2>Transfer IT Tag Owner</h2>
            </div>

            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
            </div>
        </div>
    </div>
    <div class="panel-group">
        <div class="panel-body">
            <div class="row">
                <div id="smartwizard">
                    <ul>
                        <li class="check" data-step="Step1"><a href="#step-1">IT TAG(Old)</a></li>
                        <li class="check" data-step="Step2"><a href="#step-2">IT TAG(New)</a></li>
                        <li class="check" data-step="Step3"><a href="#step-3">Fillter Check</a></li>
                        <li class="check" data-step="Step4"><a href="#step-4">Complete</a></li>
                    </ul>
                    <div class="row">
                        <div id="step-1" class="">
                            <div class="panel-group">
                                <div class="panel panel-default" style="margin-top: 1em;">
                                    <div class="panel-heading">
                                        <h4>Select ITTAG (Old)</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <div class="row" style="margin-bottom: 2rem;">
                                                <div class="col-md-12">
                                                    <div class="col-md-2">
                                                        <label class="control-label">Transfer Type :</label>
                                                    </div>
                                                    <div class="col-md-10">
                                                        <select class="form-control max-wide  max-wide" id="Tranfer_Type">
                                                            <option value="">=== Select Transfer ===</option>
                                                            <option value="Normal">Hardware,Software(Normal)</option>
                                                            <option value="JD">SoftwareGroup(JD)</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-bottom: 2rem;">
                                                <div class="col-md-12">
                                                    <div class="col-md-2">
                                                        <label class="control-label">Tag Code :</label>
                                                    </div>
                                                    <div class="col-md-10">
                                                        <div class="input-group">
                                                            <input type="text" class="form-control max-wide" id="Old_IT_Tag_Code" autocomplete="off" readonly="readonly">
                                                            <div class="input-group-btn">
                                                                <button class="btn btn-default Browse_modal" type="button" data-type="Old_ITTAG">
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
                                                        <label class="control-label">TAG Group :</label>
                                                    </div>
                                                    <div class="col-md-10">
                                                        <input type="text" class="form-control max-wide Show_tag_group" autocomplete="off" readonly="readonly">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-bottom: 2rem;">
                                                <div class="col-md-12">
                                                    <div class="col-md-2">
                                                        <label class="control-label">TAG Group Name :</label>
                                                    </div>
                                                    <div class="col-md-10">
                                                        <input type="text" class="form-control max-wide" id="Old_GroupName" autocomplete="off" readonly="readonly">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-bottom: 2rem;">
                                                <div class="col-md-12">
                                                    <div class="col-md-2">
                                                        <label class="control-label">Type Name :</label>
                                                    </div>
                                                    <div class="col-md-10">
                                                        <input type="text" class="form-control max-wide ShowTypeName" autocomplete="off" readonly="readonly">
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="text-align: right">
                                                <button id="nextPage2" class="btn btn-warning Pos_Worker" type="button"
                                                    data-toggle="modal" disabled>
                                                    Next</button>
                                            </div>
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
                                        <h4>IT TAG(New)</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <div class="row" style="margin-bottom: 2rem;">
                                                    <div class="col-md-12">
                                                        <div class="col-md-2">
                                                            <label class="control-label">Tag Code :</label>
                                                        </div>
                                                        <div class="col-md-10">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control max-wide" id="New_IT_Tag_Code" autocomplete="off" readonly="readonly">
                                                                <div class="input-group-btn">
                                                                    <button class="btn btn-default Browse_modal" type="button" data-type="ITTAG_New">
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
                                                            <label class="control-label">Tag Group Name:</label>
                                                        </div>
                                                        <div class="col-md-10">
                                                            <input type="text" class="form-control max-wide" id="New_GroupName" autocomplete="off" readonly="readonly">
                                                            <input type="text" class="form-control max-wide" id="New_Voulme" style="display: none" autocomplete="off" readonly="readonly">
                                                            <input type="text" class="form-control max-wide" id="New_Used" style="display: none" autocomplete="off" readonly="readonly">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row divJD" style="margin-bottom: 2rem;">
                                                    <div class="col-md-12">
                                                        <div class="col-md-2">
                                                            <label class="control-label">Tag Group :</label>
                                                        </div>
                                                        <div class="col-md-10">
                                                             <input type="text" class="form-control max-wide Show_tag_group" autocomplete="off" readonly="readonly">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row divNormal" style="margin-bottom: 2rem;">
                                                    <div class="col-md-12">
                                                        <div class="col-md-2">
                                                            <label class="control-label">Type Name :</label>
                                                        </div>
                                                        <div class="col-md-10">
                                                            <input type="text" class="form-control max-wide ShowTypeName" autocomplete="off" readonly="readonly">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row" style="margin-bottom: 2rem;">
                                                    <div class="col-md-12">
                                                        <div class="col-md-2">
                                                            <label class="control-label">Start Date :</label>
                                                        </div>
                                                        <div class="col-md-10">
                                                            <div class="input-group">
                                                                <input id="New_StartDate" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div style="text-align: right;">
                                                    <button id="nextPage3" class="btn btn-warning" type="button"
                                                        data-toggle="modal" disabled>
                                                        Next</button>
                                                </div>
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
                                        <h4>Fillter Check</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div style="max-width: 100%;">
                                            <div class="col-md-12 col-sm-12">
                                                <div class="row">
                                                       <p style="font-weight:bold">TAG Code Old : <span id="txt_Old_IT_Tag_Code" > </span>  ( <span id="Old_Volumn"></span> Used )</p>
                                                       <p style="font-weight:bold">TAG Code New : <span id="txt_New_IT_Tag_Code"></span> ( <span id="New_Volumn"></span> Voulme )</p>
                                                       <p style="font-size:18px;"> Remain <span id="fillter_amount"></span>  / <span id="fillter_quota" style="color:green;font-weight:bold"></span></p>
                                                   
                                                </div>
                                                <div class="row">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover table-bordered" id="Table_Fillter">
                                                            <thead>
                                                                <tr>
                                                                    <th class="center" style="width: 10%;">
                                                                        <input class="form-check-input fillterCheck" id="checkAll" type="checkbox" value="" style="margin-left: 23px;">
                                                                    </th>
                                                                    <th>Emp Num</th>
                                                                    <th>Name</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="List_Fillter">
                                                                <%--  <tr>
                                                                    <td class="center">
                                                                        <input class="form-check-input checkboxAssign" type="checkbox" value=""></td>
                                                                    <td>62116</td>
                                                                    <td>ชนณ์ประคัลภ์ ภาณุเศรษฐ์กุล</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="center">
                                                                        <input class="form-check-input checkboxAssign" type="checkbox" value=""></td>
                                                                    <td>63008</td>
                                                                    <td>อรรณพ ธนาวิศาล</td>
                                                                </tr>--%>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div style="text-align: right;">
                                                    <button id="nextPage4" class="btn btn-warning" type="button"
                                                        data-toggle="modal">
                                                        Next</button>
                                                </div>
                                            </div>
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
                                            <div class="row">

                                                <div class="col-md-12 col-sm-12">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover table-bordered" id="Table_Complete">
                                                            <thead>
                                                                <tr>
                                                                    <th>Tag Code</th>
                                                                    <th>Emp Num</th>
                                                                    <th>Name</th>
                                                                    <th>Tag Group Name</th>
                                                                    <th>Start Date</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="List_Complete">
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
                        <%--======End Step 3======--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--End Wizard--%>

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
            //GetSiteRef();
            //GetLocation();
            var UserPosition = CheckPermission('ITTAG', 'Tranfer Owner');
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

            $('#New_StartDate').datepicker({ format: 'dd/mm/yyyy', autoHide: true });

            $('#smartwizard').smartWizard({
                theme: 'arrows',
                keyNavigation: false,
                showStepURLhash: false,
                selected: 0, //ใส่ 0 จะเริ่มที่ Step แรกสุด
                transitionEffect: 'slide',
                toolbarSettings: { toolbarPosition: 'none', showNextButton: 'false', showPreviousButton: 'false' }
            });

            var Table_Fillter = $("#Table_Fillter").DataTable({
                searching: true,
            });
            var Table_Complete = $("#Table_Complete").DataTable({
                searching: true,
            });
            
            //testcheckbox();
            
            $(document).on("click", "#nextPage2", function () {
                $('#smartwizard').data('smartWizard').next(1);
                var Tranfer_Type = $("#Tranfer_Type").val();
                if (Tranfer_Type == "Normal") {
                    $(".divNormal").show();
                    $(".divJD").hide();
                } else if (Tranfer_Type == "JD") {
                    $(".divNormal").show();
                    $(".divJD").hide();
                    //$(".divNormal").hide();
                    //$(".divJD").show();
                }
            });

            $(document).on("click", "#nextPage3", function () {
                var StartDate = $("#New_StartDate").val();
                if (StartDate != "") {
                    $('#smartwizard').data('smartWizard').next(2);
                    //Uncheck All Checkbox
                    $('input[type="checkbox"]').prop('checked', false);
                    $('#fillter_amount').text(0);

                 } else {
                    swal('Error', 'กรุณากรอก StartDate', 'error');
                }
                    console.log('Page3')
            });
            
            $(document).on("click", "#nextPage4", function () {
               console.log('Page4')
                let text = "Tranfer ITTAG " + $("#Old_IT_Tag_Code").val() + " to " + $("#New_IT_Tag_Code").val() + " ?";
                var IT_TAG_Code_Old = $("#Old_IT_Tag_Code").val();
                var IT_TAG_Code_New = $("#New_IT_Tag_Code").val();
                var StartDate = $("#New_StartDate").val();
                var quota = $("#fillter_quota").text();
                var countchecked = $("#List_Fillter  input[type=checkbox]:checked").length;
                var SQLIN = "";
                    swal({
                        title: 'Confirm?',
                        text: text,
                        icon: 'info',
                        buttons: {
                            cancel: true,
                            confirm: true,
                        },
                    }).then(function (confirm) {
                        if (confirm) {
                            var rows = Table_Fillter.$("tr");
                            //console.log(rows)
                            var i = 0;
                            console.log(countchecked);
                            console.log(parseInt(quota));
                            if (parseInt(countchecked) > parseInt(quota)  ) {
                                swal('ไม่สามารถ Tranfer ได้', 'เนื่องจาก ITTAG (' + IT_TAG_Code_New + ') (Step3) มี Voulme ไม่เพียงพอ', 'error');
                            }
                            else if (parseInt(countchecked) == 0){
                                swal('ไม่สามารถ Tranfer ได้ ', 'กรุณาเลือก ITTAG ที่ต้องการ Tranfer', 'error');
                            }
                            else if( parseInt(countchecked)  <= parseInt(quota) && countchecked > 0) {
                                rows.each(function (index, value) {
                                    var checked = $(this).find("input[type=checkbox]").prop("checked");
                                if (checked) {
                                    var ID = $(this).find("input[type=checkbox]").attr("data-id");
                                    var EmpNum = $(this).find("td:nth-child(2)").text();
                                    var Name = $(this).find("td:nth-child(3)").text();
                                    $.ajax({
                                        type: "post",
                                        async: false,
                                        url: "<%= ResolveUrl("Default.aspx/SP_IT_TAG_Log_Transfer") %>",
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        data: JSON.stringify({
                                            ID: ID, IT_TAG_Code_Old, IT_TAG_Code_New: IT_TAG_Code_New, StartDate: StartDate
                                        }),
                                        success: function (response) {
                                            //Save Log Tranfer Step
                                        }
                                    });
                                    $.ajax({
                                        type: "post",
                                        async: false,
                                        url: "<%= ResolveUrl("Default.aspx/SP_IT_TAG_PE_Transfer_Multi") %>",
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        data: JSON.stringify({
                                            ID: ID, IT_TAG_Code_Old, IT_TAG_Code_New: IT_TAG_Code_New, StartDate: StartDate, Action: 'Transfer'
                                        }),
                                        success: function (response) {
                                            if (response.d.length > 0) {
                                                var ID = response.d;
                                                if (i == 0) {
                                                    SQLIN += "'" + ID + "'";

                                                } else {
                                                    SQLIN += ",'" + ID + "'";
                                                    //Set string to query in  Tranfer_Complete_VW_IT_TAG_PE_ALL
                                                }
                                                i++;
                                            }
                                        }
                                    });
                                    //Tranfer Step
                                }
                                });
                                swal('Complete', 'Transfer Complete', 'success');
                                Tranfer_Complete_VW_IT_TAG_PE_ALL(SQLIN);
                                $('#smartwizard').data('smartWizard').next(3);
                            }
                        }
                    })
               
            });
            //Click Step 2,3,4


            $(document).on("click", ".Browse_modal", function () {
                var Tranfer_Type = $("#Tranfer_Type").val();
                var Type = $(this).attr("data-type");
                $("#search_box").empty();
                $("#search_box").append('<input type="text" id="Search_' + Type + '" placeholder="Search.." class="form-control max-wide" autocomplete="off">');
                if (Type == 'Old_ITTAG') {
                    if (Tranfer_Type != "") {
                        GetBrowseITTAG(Type, Tranfer_Type, '');
                    } else {
                        swal('Error', 'กรุณาเลือก Transfer Type', 'error');
                    }
                }//End Old Tag

                else if (Type == 'ITTAG_New') {
                    GetBrowseITTAG(Type,Tranfer_Type,'');
                }//End New Tag

            });

            $(document).on("change", "#Search_Old_ITTAG", function () {
                var Tranfer_Type = $("#Tranfer_Type").val();
                var search = $(this).val();
                 GetBrowseITTAG('Old_ITTAG',Tranfer_Type,search);
                $("#modalBrowseSearch").modal("show");
            });
            $(document).on("change", "#Search_ITTAG_New", function () {
                var Tranfer_Type = $("#Tranfer_Type").val();
                var search = $(this).val();
                 GetBrowseITTAG('ITTAG_New',Tranfer_Type,search);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("click", ".clickselecttext_ITTAG_Old", function () {
                var IT_Tag_Code = $(this).closest("tr").find("td:nth-child(1)").text();
                var TagGroupName = $(this).closest("tr").find("td:nth-child(2)").text();
                var TypeName = $(this).closest("tr").find("td:nth-child(3)").text();
                var Used = $(this).closest("tr").find("td:nth-child(4)").text();
                var tag_group = $(this).attr("data-tag_group");
                $("#Old_IT_Tag_Code").val(IT_Tag_Code);
                $(".ShowTypeName").val(TypeName);
                $("#Old_GroupName").val(TagGroupName);
                $(".Show_tag_group").val(tag_group);
                $("#txt_Old_IT_Tag_Code").text(IT_Tag_Code);
                $("#Old_Volumn").text(Used);
                $("#modalBrowseSearch").modal("hide");
                var Tranfer_Type = $("#Tranfer_Type").val();
                GetTable_Fillter(IT_Tag_Code,Tranfer_Type);
               $( "#nextPage2" ).prop( "disabled", false );
            });

            $(document).on("click", ".clickselecttext_ITTAG_New", function () {
                var IT_Tag_Code = $(this).closest("tr").find("td:nth-child(1)").text();
                var TagGroupName = $(this).closest("tr").find("td:nth-child(2)").text();
                var New_Used = $(this).closest("tr").find("td:nth-child(4)").text();
                var New_Voulme = $(this).closest("tr").find("td:nth-child(5)").text();
                var qouta = parseInt(New_Voulme) - parseInt(New_Used);
                console.log(qouta);
                $("#fillter_quota").text(qouta+'');
                $("#fillter_amount").text('0');
                $("#New_Voulme").val(New_Voulme);
                $("#New_Used").val(New_Used);
                $("#New_IT_Tag_Code").val(IT_Tag_Code);
                $("#New_GroupName").val(TagGroupName);
                $("#txt_New_IT_Tag_Code").text(IT_Tag_Code);
                $("#New_Volumn").text(New_Voulme);
                $("#modalBrowseSearch").modal("hide");
               $( "#nextPage3" ).prop( "disabled", false );
            });
            

            $(document).on("change", ".fillterCheck", function () {
                var countchecked = $("#List_Fillter  input[type=checkbox]:checked").length;
                var quota = $("#fillter_quota").text();
                $("#fillter_amount").text(countchecked);
                if (countchecked > quota) {
                    $("#fillter_amount").attr("style", "color:red;");
                } else {
                    $("#fillter_amount").attr("style", "color:black;");
                }
            });

            $(document).on("click", "#checkAll", function () {
                var rows = Table_Fillter.rows({ 'search': 'applied' }).nodes();
                $('input[type="checkbox"]', rows).prop('checked', this.checked);
            });


            function GetBrowseITTAG(Type,Tranfer_Type,search) {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                fragment = "";
                fragmentHeader = `<th>TAG Code</th>
                                     <th>Tag Group Name</th>
                                     <th>Type Name</th>
                                     <th>Used</th>
                                     <th>Voulme</th>`;
                if (Type == 'Old_ITTAG') {
                    $("#Titlebrowse").text("Select Old ITTAG");
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/Get_Tranfer_VW_IT_TAG_PE_Browse") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({Tranfer_Type: '',TypeCondition:'', search: search,Browse_Step:''}),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    //[IT_Tag_Code],[Tag_Group],[MainType],[TypeName],[TagGroup],[TagGroupName],[Used],[Volume]
                                    var IT_Tag_Code = val[0];
                                    var Tag_Group = val[1];
                                    var MainType = val[2];
                                    var TypeName = val[3];
                                    var TagGroup = val[4];
                                    var TagGroupName = val[5];
                                    var Used = val[6];
                                    var Volume = val[7];
                                    
                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselecttext_ITTAG_Old" data-Tag_Group="'+Tag_Group+'" href="javascript:void(0)">' + IT_Tag_Code + '</a></td>';
                                    fragment += '<td><a class="clickselecttext_ITTAG_Old" data-Tag_Group="'+Tag_Group+'" href="javascript:void(0)">' + TagGroupName + '</a></td>';
                                    fragment += '<td><a class="clickselecttext_ITTAG_Old" data-Tag_Group="'+Tag_Group+'"  href="javascript:void(0)">' + TypeName + '</a></td>';
                                    fragment += '<td><a class="clickselecttext_ITTAG_Old" data-Tag_Group="'+Tag_Group+'" href="javascript:void(0)">' + Used + '</a></td>';
                                    fragment += '<td><a class="clickselecttext_ITTAG_Old" data-Tag_Group="'+Tag_Group+'" href="javascript:void(0)">' + Volume + '</a></td>';
                                    fragment += '</tr>';
                                });
                            }
                        }
                    });
                    $("#TBheaderBrowse").append(fragmentHeader);
                    $("#TBbodyBrowse").append(fragment);
                    $("#modalBrowseSearch").modal("show");
                }
                if (Type == 'ITTAG_New') {
                    if (Tranfer_Type == "Normal") {
                    var TypeCondition = $(".ShowTypeName").val()
                    }
                    else if (Tranfer_Type == "JD") {
                    //var TypeCondition = $(".Show_tag_group").val()
                    var TypeCondition = $(".ShowTypeName").val()
                    }
                    $("#Titlebrowse").text("Select New ITTAG");
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/Get_Tranfer_VW_IT_TAG_PE_Browse") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Tranfer_Type: Tranfer_Type,TypeCondition:TypeCondition, search: search,Browse_Step:'New'}),
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
                                        fragment += '<td><span class="over-volumn">' + TypeName + '</span></td>';
                                        fragment += '<td><span class="over-volumn">' + Used + '</span></td>';
                                        fragment += '<td><span class="over-volumn">' + Volume + '</span></td>';
                                 } else {
                                        fragment += '<td><a class="clickselecttext_ITTAG_New" data-Tag_Group="'+Tag_Group+'" href="javascript:void(0)">' + IT_Tag_Code + '</a></td>';
                                        fragment += '<td><a class="clickselecttext_ITTAG_New" data-Tag_Group="'+Tag_Group+'" href="javascript:void(0)">' + TagGroupName + '</a></td>';
                                        fragment += '<td><a class="clickselecttext_ITTAG_New" data-Tag_Group="'+Tag_Group+'"  href="javascript:void(0)">' + TypeName + '</a></td>';
                                        fragment += '<td><a class="clickselecttext_ITTAG_New" data-Tag_Group="'+Tag_Group+'" href="javascript:void(0)">' + Used + '</a></td>';
                                        fragment += '<td><a class="clickselecttext_ITTAG_New" data-Tag_Group="'+Tag_Group+'" href="javascript:void(0)">' + Volume + '</a></td>';
                                }
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
            function GetTable_Fillter(ITTAG,Tranfer_Type) {
                Table_Fillter.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Tranfer_VW_IT_TAG_PE_ALL") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({IT_TAG_Code: ITTAG ,Tranfer_Type : Tranfer_Type}),
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
                                Table_Fillter.row.add(['<input class="form-check-input fillterCheck" data-id="' + ID + '" type="checkbox" value="">', Emp_num, FullName]).draw().node();

                            });
                        }

                    }
                });
            }//End VW_IT_TAG_PE_ALL
            function Tranfer_Complete_VW_IT_TAG_PE_ALL(SQLIN) {
                Table_Complete.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Tranfer_Complete_VW_IT_TAG_PE_ALL") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ SQLIN: SQLIN }),
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
                                var hrefITTAG = '<td><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code + '" target="_bank">' + IT_TAG_Code + '</a></td>';
                                var hrefEmpNum = '<td><a href="ITTAG_MaintainPE.aspx?EmpNum=' + Emp_num + '" target="_bank">' + Emp_num + '</a></td>';

                                Table_Complete.row.add([hrefITTAG, hrefEmpNum, FullName, TagGroupName, StartDate.substr(0, 10)]).draw().node();

                            });
                        }

                    }
                });
            }//End VW_IT_TAG_PE_ALL

            function testcheckbox() {
                Table_Fillter.clear().draw();
                for (i = 1; i <= 50; i++) {
                    Table_Fillter.row.add(['<input class="form-check-input center" type="checkbox" value=""></td>', i + '', i + ' ชนณ์ประคัลภ์ ภาณุเศรษฐ์กุล']).draw().node();
                }
            }


        });
        //End Document ready




    </script>
</asp:Content>
