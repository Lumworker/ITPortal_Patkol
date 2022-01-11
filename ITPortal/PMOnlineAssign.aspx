<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PMOnlineAssign.aspx.cs" Inherits="ITPortal.PMOnlineAssign" %>

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
        <h2>PM Online Assignment</h2>
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
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

                        <div class="form-group col-md-12">
                            <span style="font-size: 14pt; font-weight: bold; margin-bottom: 10px;">เลือก IT Tag Group ที่ต้องการ Assignment</span>
                        </div>

                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Group"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="txtGroup" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                                    <div class="input-group-btn">
                                        <button id="buttonSearch_TagGroup" class="btn btn-default" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                        </div>
                    </div>
                </div>
                <!--END Row-->

                <!--panel-body-->
            </div>
            <!--panel-default-->
        </div>
        <!--Panel-Group -->
    </div>

    <div class="panel-group max-wide" id="divDataTable" style="display: none;">
        <!--panel-default-->
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            </div>
                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                <button type="button" id="btnAssign" class="btn btn-warning PositionCheck" style="float: right;">Assignment</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered center" style="width: 100%" id="tableReportingChecklist">
                                <thead>
                                    <tr>
                                        <th class="center" style="width: 10%;">
                                            <input class="form-check-input" id="checkAll" type="checkbox" value="" style="margin-left: 23px;">
                                        </th>
                                        <th class="center">Site Ref</th>
                                        <th class="center">IT Tag</th>
                                        <th class="center">Group</th>
                                        <th class="center">Employee Name</th>
                                        <th class="center">Modal</th>
                                        <th class="center">Contract</th>
                                    </tr>
                                </thead>
                                <tbody id="ListReportingChecklist">
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
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div id="search_box">
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <table id="TableListCustomer" class="table table-bordered table-responsive">
                        <thead id="Thead2" runat="server">
                            <tr>
                                <th>Tag Group</th>
                                <th>Tag Group Name</th>
                                <th>Main Type</th>
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

    <%--Modal Search Group--%>
    <script>
        $(document).ready(function () {

            var tableReportingChecklist = $("#tableReportingChecklist").DataTable({
                searching: true,
                responsive: true,
                "order": []
            });

            $(document).on("click", "#buttonSearch_TagGroup", function () {
                var search = '';
                var Type = 'txtSearchItTag';
                var button = '<input type="text" id="' + Type + '" placeholder="Search Group.." class="form-control max-wide" autocomplete="off">'
                $("#search_box").empty();
                $("#search_box").append(button);
                $("#ModalSearch").modal("show");
                GetIT_TAG_Group(search);
            });


            $(document).on("click", ".selectGroup", function () {
                var IT_Tag_Group = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#txtGroup").val(IT_Tag_Group);
                GetIT_TAG_Assign(IT_Tag_Group);
            });


            $(document).on("click", "#checkAll", function () {
                // Get all rows with search applied
                var rows = tableReportingChecklist.rows({ 'search': 'applied' }).nodes();
                // Check/uncheck checkboxes for all rows in the table
                $('input[type="checkbox"]', rows).prop('checked', this.checked);
            });


            $(document).on("click", "#btnAssign", function () {
                if ($("#ListReportingChecklist").find(".checkboxAssign:checked").length > 0) {
                    swal({
                        title: 'Confirm Assign?',
                        text: "ตรวจสอบความถูกต้องของข้อมูล ก่อนยืนยันการมอบหมายงาน",
                        icon: 'info',
                        buttons: {
                            cancel: true,
                            confirm: true,
                        },
                    }).then(function (confirm) {
                        if (confirm) {
                        $("#IMGUpload").modal("show");
                            var rows = tableReportingChecklist.$("tr");
                            rows.each(function () {
                                var check_to_checked = $(this).find("input[type=checkbox]").prop("checked");
                                if (check_to_checked) {
                                    var site_ref = $(this).closest("tr").find("td:nth-child(2)").text();
                                    var IT_TAG = $(this).closest("tr").find("td:nth-child(3)").text();
                                    var IT_TAG_GROUP = $(this).closest("tr").find("td:nth-child(4)").text();
                                    $.ajax({
                                         //  beforeSend: function () {
                                        //    $("#IMGUpload").modal("show");
                                        //},

                                        type: "POST",
                                        async: false,
                                        url: "<%= ResolveUrl("Default.aspx/SP_PMOnline_Assign_Insert") %>",
                                       
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            data: JSON.stringify({ IT_TAG: IT_TAG, IT_TAG_GROUP: IT_TAG_GROUP, site_ref: site_ref }),
                                            success: function (response) {
                                            }
                                        });
                                    }
                                }).promise().done(function () {

                                    $('input[type="checkbox"]').prop('checked', false);
                                    var IT_Tag_Group = $("#txtGroup").val();
                                    GetIT_TAG_Assign(IT_Tag_Group);
                                    $("#IMGUpload").modal("hide");
                                    swal('Complete', 'มอบหมายงานสำเร็จ', 'success');

                                });
                            }
                        })
                }
                else {
                    swal('Error', 'กรุณาเลือก  IT Tag ', 'error');
                }
            });

            ////////////////////////ON Change//////////////////////////////////
            $(document).on("keyup", "#txtSearchItTag", function () {
                var search = $("#txtSearchItTag").val();
                GetIT_TAG_Group(search)
            });


            function GetIT_TAG_Assign(IT_Tag_Group) {
                $("#IMGUpload").modal("show");
                tableReportingChecklist.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GetIT_TAG_Assign_New") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Group: IT_Tag_Group }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[IT_Tag_Code], [Tag_Group], [Purchase_Type], [Start_Contract_date], [Expire_Contract_date],
                                //    [Detail], [Brand], [Model], [Volume], [TAG_Status], [SN], [Product_Key], [PONumber],
                                //    [UnitPrice], [Vendor], [Asset_of_Company], [Asset_No], [Asset_Date], [Processor],
                                //    [CPU_Clock], [RAM], [HDD], [Owner], [MainType], [TypeName], [Emp_num], [FullName]
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
                                var Owner = val[22];
                                var MainType = val[23];
                                var TypeName = val[24];
                                var Emp_num = val[25];
                                var FullName = val[26];
                                tableReportingChecklist.row.add([
                                    '<td class="center" ><input class="form-check-input checkboxAssign" type="checkbox" value=""></td>',
                                    Asset_of_Company,
                                    IT_Tag_Code,
                                    Tag_Group,
                                    FullName,
                                    Brand,
                                    Start_Contract_date.substr(0, 10)
                                ]).draw(false);
                            });
                        }
                        $('.PositionCheck').css('display', 'none');
                        //tableReportingChecklist.columns([0]).visible(false);
                        PageSetPosition();
                        $("#ModalSearch").modal("hide");
                        $("#divDataTable").css("display", "");
                        $("#IMGUpload").modal("hide");
                    }

                });
            }
            function PageSetPosition() {
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%=ResolveUrl("default.aspx/SetPositionPage")%>",
                    contentType: "application/json; charset = utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Position: "Creator" }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                $('.PositionCheck').css('display', 'block');
                                tableReportingChecklist.columns([0]).visible(true);

                            });
                        }
                        else {
                            $('.PositionCheck').css('display', 'none');
                            tableReportingChecklist.columns([0]).visible(false);
                        }
                        //console.log(Position);
                    }
                })
            }

        });
        ////////////////////////End Document Ready//////////////////////////////////


        function GetIT_TAG_Group(search) {
            $("#TBodySearch").empty();
            var fragment = "";
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/GetIT_TAG_Group_New_PMoneline") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ search: search }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var TagGroup = val[0];
                            var TagGroupName = val[1];
                            var MainType = val[2];
                            fragment += '<tr>';
                            fragment += '<td><a href="javascript:void(0)" class="selectGroup">' + TagGroup + '</a></td>';
                            fragment += '<td><a href="javascript:void(0)" class="selectGroup">' + TagGroupName + '</a></td>';
                            fragment += '<td><a href="javascript:void(0)" class="selectGroup">' + MainType + '</a></td>';
                            fragment += '</tr>';
                            //console.log(TagGroup);
                        });
                    }
                    $("#TBodySearch").append(fragment);
                }
            });
            $("#ModalSearch").modal("show");
        }



    </script>
</asp:Content>
