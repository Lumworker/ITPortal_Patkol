<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GenerateNewWorkFlow.aspx.cs" Inherits="ITPortal.GenerateNewWorkFlow" %>

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
    </style>
    <div class="page-header">
        <h2>Generate New WorkFlow K2 version5</h2>
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
            </div>
            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                <button class="btn btn-info" id="Search" type="button" data-toggle="modal" disabled>Search</button>
            </div>
        </div>
    </div>

    <div class="panel-group">
        <div class="panel-body">
            <div class="row">
                <div id="smartwizard">
                    <ul>
                        <li class="check" data-step="Step1"><a href="#step-1">WorkFlow</a></li>
                        <li class="check" data-step="Step2"><a href="#step-2">Column</a></li>
                        <li class="check" data-step="Step3"><a href="#step-3">Store Procedures</a></li>
                        <li class="check" data-step="Step4"><a href="#step-4">HTML</a></li>
                        <li class="check" data-step="Step5"><a href="#step-5">Javascript</a></li>
                        <li class="check" data-step="Step6"><a href="#step-6">C#</a></li>
                    </ul>
                    <div>
                        <%--   ======Step 1======--%>
                        <div id="step-1" class="">
                            <div class="panel-group">
                                <div class="panel panel-default" style="margin-top: 1em;">
                                    <div class="panel-heading">
                                        <h4>Work Flow Type</h4>
                                    </div>
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="col-md-2 col-xs-12">
                                                        <label class="control-label">WorkFlow Type :</label>
                                                    </div>
                                                    <div class="col-md-10 col-xs-12">
                                                        <div class="input-group">
                                                            <input id="Workflow_Type" type="text" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                            <div class="input-group-btn">
                                                                <button class="btn btn-default Browse_modal" type="button" data-type="WFType">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="col-md-2 col-xs-12">
                                                        <label class="control-label">Table Name :</label>
                                                    </div>
                                                    <div class="col-md-10 col-xs-12">
                                                        <input id="Table_Name" type="text" class="form-control max-wide" autocomplete="off">
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="col-md-2 col-xs-12">
                                                        <label class="control-label">Type :</label>
                                                    </div>
                                                    <div class="col-md-10 col-xs-12">
                                                        <select class="form-control max-wide" id="SelectType">
                                                            <option value="">=====Select Leave=====</option>
                                                            <option value="S">Single</option>
                                                            <option value="M">Multiple</option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>
                                            <div style="text-align: right">
                                                <button id="nextPage2" class="btn btn-warning" type="button" data-toggle="modal">Next</button>
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
                                        <h4>Column</h4>
                                        <input id="idWFType" type="hidden" class="form-control">
                                    </div>
                                    <div class="panel-body">
                                        <div class="row" style="margin-bottom: 1rem;">
                                            <div class="col-md-8">
                                                <div class="col-md-2">
                                                    <label>Show rows </label>
                                                </div>
                                                <div class="col-md-4" style="padding: 0; width: auto;">
                                                    <select class="form-control" name="state" id="maxRows">
                                                        <option value="5000">Show ALL</option>
                                                        <option value="25">25</option>
                                                        <option value="40">40</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="max-width: 100%;">
                                            <table id="TBSearchColumn" class="table table-striped table-bordered table-responsive">
                                                <thead>
                                                    <tr class="header" id="TBheaderSearchColumn">
                                                        <th>Column</th>
                                                        <th>Name</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="TBBodySearchColumn"></tbody>
                                            </table>
                                        </div>
                                        <div class='pagination-container'>
                                            <nav style="text-align: center;">
                                                <ul class="pagination">

                                                    <li data-page="prev">
                                                        <span>< <span class="sr-only">(current)</span></span>
                                                    </li>
                                                    <!--	Here the JS Function Will Add the Rows -->
                                                    <li data-page="next" id="prev">
                                                        <span>> <span class="sr-only">(current)</span></span>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </div>
                                        <div style="text-align: right;">
                                            <button id="nextPage3" class="btn btn-warning" type="button" data-toggle="modal">Next</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--   ======Step 3======--%>
                        <div id="step-3" class="">
                            <div class="panel-group">
                                <div class="panel panel-default" style="margin-top: 1em;">
                                    <div class="panel-heading">
                                        <h4>Store Procedures</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div style="max-width: 100%;">
                                            <textarea id="txtGenarateSP" class="form-control max-wide" rows="17"></textarea>
                                        </div>
                                        <div style="text-align: right; margin: 1rem;">
                                            <button id="nextPage4" class="btn btn-warning" type="button" data-toggle="modal">Next</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--   ======Step 4======--%>
                        <div id="step-4" class="">
                            <div class="panel-group">
                                <div class="panel panel-default" style="margin-top: 1em;">
                                    <div class="panel-heading">
                                        <h4>HTML</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div style="max-width: 100%;">
                                            <textarea id="txtGenarateHTML" class="form-control max-wide" rows="17"></textarea>
                                        </div>
                                        <div style="text-align: right; margin: 1rem;">
                                            <button id="nextPage5" class="btn btn-warning" type="button" data-toggle="modal">Next</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--   ======Step 5======--%>
                        <div id="step-5" class="">
                            <div class="panel-group">
                                <div class="panel panel-default" style="margin-top: 1em;">
                                    <div class="panel-heading">
                                        <h4>Javascript</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div style="max-width: 100%;">
                                            <textarea id="txtGenarateJavascript" class="form-control max-wide" rows="17"></textarea>
                                        </div>
                                        <div style="text-align: right; margin: 1rem;">
                                            <button id="nextPage6" class="btn btn-warning" type="button" data-toggle="modal">Next</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--   ======Step 5======--%>
                    <div id="step-6" class="">
                        <div class="panel-group">
                            <div class="panel panel-default" style="margin-top: 1em;">
                                <div class="panel-heading">
                                    <h4>Store Procedures</h4>
                                </div>
                                <div class="panel-body">
                                    <div style="max-width: 100%;">
                                        <textarea id="txtGenarateC" class="form-control max-wide" rows="17"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--modalBrowse --%>
    <div class="modal fade" id="modalBrowseSearch" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-xs">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 id="browseHeader" class="modal-title">Text</h4>
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
                                <th>Column</th>
                                <th>Name</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id='TBbodyBrowse'></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>


    <div style="overflow: hidden; width: 0; height: 0;">
        <asp:TextBox runat="server" ID="snsTable_Name" />
    </div>
    <script type="text/javascript">

        $(document).ready(function () {

            $('#smartwizard').smartWizard({
                theme: 'arrows',
                keyNavigation: false,
                showStepURLhash: false,
                selected: 0, //ใส่ 0 จะเริ่มที่ Step แรกสุด
                transitionEffect: 'slide',
                toolbarSettings: { toolbarPosition: 'none', showNextButton: 'false', showPreviousButton: 'false' }
            });
            $('#example').DataTable({
                "paging": false,
                "ordering": false,
                "info": false
            });


            $(document).on("click", ".Browse_modal", function () {
                var fragment = '';
                var Type = $(this).attr("data-type");

                $("#browseHeader").text(Type);
                $("#TBbodyBrowse").empty();
                $("#search_box").empty();
                $("#search_box").append('<input type="text" id="' + Type + '" placeholder="Search.." class="form-control max-wide" autocomplete="off">');

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/TB_WorkflowType") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Search: '' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var WorkflowType = val[0];
                                var Name = val[1];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectType" href="javascript:void(0)" >' + WorkflowType + '</a></td>';
                                fragment += '<td><a class="clickselectType" href="javascript:void(0)" >' + Name + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                        $("#TBbodyBrowse").append(fragment);
                        $("#modalBrowseSearch").modal("show");
                    }
                });
            });

            $(document).on('change', "#WFType", function () {
                var fragment = '';
                $("#TBbodyBrowse").empty();
                var WFType = $("#WFType").val();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/TB_WorkflowType") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Search: WFType }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var WorkflowType = val[0];
                                var Name = val[1];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectType" href="javascript:void(0)" >' + WorkflowType + '</a></td>';
                                fragment += '<td><a class="clickselectType" href="javascript:void(0)" >' + Name + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });

            $(document).on("click", ".clickselectType", function () {
                var tr = $(this).closest("tr");
                var Workflow_Type = tr.find("td:nth-child(1)").text();
                $("#Workflow_Type").val(Workflow_Type);
                $("#modalBrowseSearch").modal("hide");
                document.getElementById("Search").disabled = false;
            });

            $(document).on("click", "#nextPage2", function () {
                var Workflow_Type = $("#Workflow_Type").val();
                var Table_Name = $("#Table_Name").val();
                var SelectType = $("#SelectType").val();
                var idWFType = '';
                var fragment = '';
                if (Workflow_Type != '' && Table_Name != '' && SelectType != '') {
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/CheckWFType") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Workflow_Type: Workflow_Type, Table_Name: Table_Name, SelectType: SelectType }),
                        success: function (response) {
                            var ID = response.d;
                            if (ID != "") {
                                $("#idWFType").val(ID);
                                idWFType = $("#idWFType").val();
                            }
                        }
                    });

                    if (idWFType != "") {
                        //console.log("idWFType != 0");
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SearchWFType ") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ Workflow_Type: Workflow_Type, Table_Name: Table_Name, SelectType: SelectType }),
                            success: function (response) {
                                if (response.d.length > 0) {
                                    $.each(response.d, function (index, val) {
                                        var ID = val[0];
                                        var ColumnTB = val[1];
                                        var Name = val[2];
                                        fragment += '<tr>';
                                        fragment += '<td>' + ColumnTB + '</td>';
                                        fragment += '<td><input type="text" class="form-control max-wide" autocomplete="off" data-oldvalue="' + Name + '" data-columnID="' + ID + '" value="' + Name + '" ></td>';
                                        fragment += '</tr>';
                                    });
                                }
                                $("#TBBodySearchColumn").append(fragment);
                                getPagination("#TBSearchColumn");
                            }
                        });
                    }
                    else {
                        //console.log("idWFType == 0");
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_ColumnName_Insert") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ Workflow_Type: Workflow_Type, Table_Name: Table_Name, SelectType: SelectType }),
                            success: function (response) {
                                $.ajax({
                                    type: "post",
                                    async: false,
                                    url: "<%= ResolveUrl("Default.aspx/SearchWFType") %>",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    data: JSON.stringify({ Workflow_Type: Workflow_Type, Table_Name: Table_Name, SelectType: SelectType }),
                                    success: function (response) {
                                        if (response.d.length > 0) {
                                            $.each(response.d, function (index, val) {
                                                var ID = val[0];
                                                var ColumnTB = val[1];
                                                var Name = val[2];
                                                fragment += '<tr>';
                                                fragment += '<td>' + ColumnTB + '</td>';
                                                fragment += '<td><input type="text" class="form-control max-wide" autocomplete="off" data-oldvalue="' + Name + '" data-columnID="' + ID + '" value="' + Name + '" ></td>';
                                                fragment += '</tr>';
                                            });
                                        }
                                        $("#TBBodySearchColumn").append(fragment);
                                        getPagination("#TBSearchColumn");
                                    }
                                });
                            }
                        });
                    }
                    $("#MainContent_snsTable_Name").val(Table_Name);
                    $('#smartwizard').data('smartWizard')._showStep(1);
                }
                else {
                    swal("กรุณา กรอกข้อมูลให้ครบถ้วน!", "", "info");
                }
            });


            $(document).on("click", "#nextPage3", function () {
                $("#IMGUpload").modal("show");
                $("#TBBodySearchColumn tr").each(function () {
                    var column = $(this).find("td:nth-child(1)").text();
                    var value = $(this).find("td:nth-child(2)").find("input[type=text]").val();
                    var oldvalue = $(this).find("td:nth-child(2)").find("input[type=text]").attr("data-oldvalue");
                    var id = $(this).find("td:nth-child(2)").find("input[type=text]").attr("data-columnid");
                    if (value != oldvalue) {
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_ColumnName_Update") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ id: id, column: column, value: value }),
                            success: function (response) {
                                console.log("change", id);
                            }
                        });
                    }
                });
                $("#IMGUpload").modal("hide");

                var snsTable_Name = $("#MainContent_snsTable_Name").val();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("GenerateNewWorkFlow.aspx/Genarate_SP") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ snsTable_Name: snsTable_Name }),
                    success: function (response) {
                        var data = response.d;
                        $("#txtGenarateSP").val(data);
                    }
                });
                $('#smartwizard').data('smartWizard')._showStep(2);
            });


            $("#nextPage4").on("click", function () {
                var WFType = $("#Workflow_Type").val();
                var TB_Name = $("#MainContent_snsTable_Name").val();
                var SP_Name = "SP_" + TB_Name.trim().substr(3, TB_Name.trim().length - 3);
                var Typeflow = $("#SelectType").val();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_TBK2TableName_insert") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ WFType: WFType, TB_Name: TB_Name, SP_Name: SP_Name, Typeflow: Typeflow }),
                    success: function (response) {
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("GenerateNewWorkFlow.aspx/Genarate_HTML") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ snsTable_Name: TB_Name }),
                            success: function (response) {
                                var data = response.d;
                                $("#txtGenarateHTML").val(data);
                                $('#smartwizard').data('smartWizard')._showStep(3);
                            }
                        });
                    }
                });



            });


            $("#nextPage5").on("click", function () {
                var snsTable_Name = $("#MainContent_snsTable_Name").val();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("GenerateNewWorkFlow.aspx/Genarate_javascript") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ snsTable_Name: snsTable_Name }),
                    success: function (response) {
                        var data = response.d;
                        $("#txtGenarateJavascript").val(data);
                    }
                });
                $('#smartwizard').data('smartWizard')._showStep(4);
            });

            $("#nextPage6").on("click", function () {
                var snsTable_Name = $("#MainContent_snsTable_Name").val();
                alert("Don't have");
            });

            //แบ่งหน้า
            function getPagination(table) {
                var lastPage = 1;
                $('#maxRows').on('change', function (evt) {
                    //$('.paginationprev').html('');						// reset pagination
                    lastPage = 1;
                    $('.pagination')
                        .find('li')
                        .slice(1, -1)
                        .remove();
                    var trnum = 0; // reset tr counter
                    var maxRows = parseInt($(this).val()); // get Max Rows from select option

                    if (maxRows == 5000) {
                        $('.pagination').hide();
                    } else {
                        $('.pagination').show();
                    }

                    var totalRows = $(table + ' tbody tr').length; // numbers of rows
                    $(table + ' tr:gt(0)').each(function () {
                        // each TR in  table and not the header
                        trnum++; // Start Counter
                        if (trnum > maxRows) {
                            // if tr number gt maxRows

                            $(this).hide(); // fade it out
                        }
                        if (trnum <= maxRows) {
                            $(this).show();
                        } // else fade in Important in case if it ..
                    }); //  was fade out to fade it in
                    if (totalRows > maxRows) {
                        $(".pagination-container").css("display", "block");
                        // if tr total rows gt max rows option
                        var pagenum = Math.ceil(totalRows / maxRows); // ceil total(rows/maxrows) to get ..
                        //	numbers of pages
                        for (var i = 1; i <= pagenum;) {
                            // for each page append pagination li
                            $('.pagination #prev')
                                .before(
                                    '<li data-page="' +
                                    i +
                                    '">\
								  <span>' +
                                    i++ +
                                    '<span class="sr-only">(current)</span></span>\
								</li>'
                                )
                                .show();
                        } // end for i
                    } else {
                        $(".pagination-container").css("display", "none");
                    }// end if row count > max rows
                    $('.pagination [data-page="1"]').addClass('active'); // add active class to the first li
                    $('.pagination li').on('click', function (evt) {
                        // on click each page
                        evt.stopImmediatePropagation();
                        evt.preventDefault();
                        var pageNum = $(this).attr('data-page'); // get it's number

                        var maxRows = parseInt($('#maxRows').val()); // get Max Rows from select option

                        if (pageNum == 'prev') {
                            if (lastPage == 1) {
                                return;
                            }
                            pageNum = --lastPage;
                        }
                        if (pageNum == 'next') {
                            if (lastPage == $('.pagination li').length - 2) {
                                return;
                            }
                            pageNum = ++lastPage;
                        }

                        lastPage = pageNum;
                        var trIndex = 0; // reset tr counter
                        $('.pagination li').removeClass('active'); // remove active class from all li
                        $('.pagination [data-page="' + lastPage + '"]').addClass('active'); // add active class to the clicked
                        // $(this).addClass('active');					// add active class to the clicked
                        limitPagging();
                        $(table + ' tr:gt(0)').each(function () {
                            // each tr in table not the header
                            trIndex++; // tr index counter
                            // if tr index gt maxRows*pageNum or lt maxRows*pageNum-maxRows fade if out
                            if (
                                trIndex > maxRows * pageNum ||
                                trIndex <= maxRows * pageNum - maxRows
                            ) {
                                $(this).hide();
                            } else {
                                $(this).show();
                            } //else fade in
                        }); // end of for each tr in table
                    }); // end of on click pagination list
                    limitPagging();
                })
                    .val(25)
                    .change();

                // end of on select change

                // END OF PAGINATION
            }

            function limitPagging() {
                // alert($('.pagination li').length)

                if ($('.pagination li').length > 7) {
                    if ($('.pagination li.active').attr('data-page') <= 3) {
                        $('.pagination li:gt(5)').hide();
                        $('.pagination li:lt(5)').show();
                        $('.pagination [data-page="next"]').show();
                    } if ($('.pagination li.active').attr('data-page') > 3) {
                        $('.pagination li:gt(0)').hide();
                        $('.pagination [data-page="next"]').show();
                        for (let i = (parseInt($('.pagination li.active').attr('data-page')) - 2); i <= (parseInt($('.pagination li.active').attr('data-page')) + 2); i++) {
                            $('.pagination [data-page="' + i + '"]').show();

                        }

                    }
                }
            }
        });
    </script>
</asp:Content>
