<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ITTAG_Monitoring.aspx.cs" Inherits="ITPortal.ITTAG_Monitoring" %>

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
        .JD-Job_New{
             background-color:#5cb85c;
             color:white;
        }
        .JD-Job_Old{
             background-color:#f0ad4e;
             color:white;
        }
        .sizeAlert{
             font-size:18px;
        }

    </style>




    <div class="page-header">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                    <span>Monitoring </span>
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
                        <a href="#TAB1" class="nav-link" role="tab" data-toggle="tab">MA : Hardware , Software</a>
                    </li>
                    <li class="nav-item">
                        <a href="#TAB2" class="nav-link" data-toggle="tab" role="tab">Maintennace : Hardware</a>
                    </li>
                    <li class="nav-item">
                        <a href="#TAB3" class="nav-link" data-toggle="tab" role="tab">Borrow : Hardware</a>
                    </li>
                    <li class="nav-item">
                        <a href="#TAB4" class="nav-link" data-toggle="tab" role="tab">Change Software Group </a>
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
                                <div class="row" style="text-align: left; margin-bottom: 25px;">
                                    <h3 style="margin-top: 0px;">Expire Contract date(Hardware/Software)</h3>
                                    <%--<span style="color: red; font-size: 12px; text-align: center;">ค้นหา ITTAG ใกล้หมดอายุ ด้วยช่วงระยะเวลา(เดือน) / ชื่อเดือน</span>--%>
                                </div>
                                <div class=" row ">
                                    <div class="col-md-1">
                                    </div>
                                    <div class="col-md-10">
                                        <div class="col-md-12">
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                <asp:Label ID="Label1" class="col-md-4 col-xs-12" runat="server" Font-Bold="True" Text="Expire Between"></asp:Label>
                                                <div class="col-md-8 col-xs-12">
                                                    <div class="input-group">
                                                        <input id="Expire_DayStart" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                    <%--<select class="form-control max-wide Stc0to12" id="Expire_DayStart">
                                                    </select>--%>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                <asp:Label ID="Label2" class="col-md-4 col-xs-12" runat="server" Font-Bold="True" Text="To"></asp:Label>
                                                <div class="col-md-8 col-xs-12">
                                                    <div class="input-group">
                                                        <input id="Expire_DayEnd" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                    <%-- <select class="form-control max-wide Stc0to12" id="Expire_DayEnd">
                                                    </select>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <%--<div class="col-md-12">
                                            <div class="form-group col-md-6">
                                                <asp:Label ID="Label3" class="col-md-4" runat="server" Font-Bold="True" Text="Month Name"></asp:Label>
                                                <div class="col-md-8">
                                                    <select class="form-control max-wide StcMonthName" id="Expire_MonthName">
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                            </div>
                                        </div>--%>
                                        <div class="col-md-12 col-xs-12">
                                            <div class="form-group col-md-12 col-sm-6 col-xs-12">
                                                <button class="btn btn-info" id="btnExpire_Search" style="float: right;" type="button">Search</button>
                                                <button class="btn btn-light btn-clear" data-type="Expire"  style="float: right; margin-right:5px;" type="button">Clear</button>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-1">
                                    </div>
                                </div>
                                <%--end div search--%>
                                <div class="row margin-top">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-bordered " id="tableExpire">
                                            <thead>
                                                <tr class="">
                                                    <th>Main Type</th>
                                                    <th>Purchase Type</th>
                                                    <th>Tag Code</th>
                                                    <th>Tag Group Name</th>
                                                    <th>Expire Contract  date</th>
                                                    <th>Status</th>
                                                    <th>Month</th>
                                                    <th>Month Name</th>
                                                </tr>
                                            </thead>
                                            <tbody id="ListExpire">
                                                <%--   <tr>
                                                    <td>Software</td>
                                                    <td>Purchase</td>
                                                    <td>LT1901001</td>
                                                    <td>AutoCAD LT</td>
                                                    <td>31/05/2021</td>
                                                    <td>Active</td>
                                                    <td>1.266666667</td>
                                                    <td>May</td>
                                                </tr>
                                                <tr>
                                                    <td>Software</td>
                                                    <td>Rent</td>
                                                    <td>SK19010001</td>
                                                    <td>SketchUp</td>
                                                    <td>15/05/2021</td>
                                                    <td>Active</td>
                                                    <td>0.73</td>
                                                    <td>May</td>
                                                </tr>--%>
                                            </tbody>
                                        </table>
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
                                        <%--<button class="btn btn-success" id="" data-type="New" type="button">New</button>--%>
                                    </div>
                                </div>
                                <%--End div Button--%>
                                <div class="row" style="text-align: left">
                                    <h3 style="margin-top: 0px;">Commit date(Hardware)</h3>
                                    <%--<span style="color: red; font-size: 12px; text-align: center; margin-bottom: 25px;">ค้นหาอุปกรณ์ส่งซ่อมที่ต้องได้รับคืน ด้วยช่วงระยะเวลา(วัน)/ชื่อเดือน</span>--%>
                                </div>
                                <div class=" row margin-top">
                                    <div class="col-md-1">
                                    </div>
                                    <div class="col-md-10">
                                        <div class="col-md-12">
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                <asp:Label ID="Label4" class="col-md-4 col-xs-12" runat="server" Font-Bold="True" Text="Commit Between"></asp:Label>
                                                <div class="col-md-8 col-xs-12">
                                                    <div class="input-group">
                                                        <input id="Commit_DayStart" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                    <%-- <select class="form-control max-wide Stc0to365" id="Commit_DayStart">
                                                    </select>--%>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                <asp:Label ID="Label5" class="col-md-4 col-xs-12" runat="server" Font-Bold="True" Text="To"></asp:Label>
                                                <div class="col-md-8 col-xs-12">
                                                    <div class="input-group">
                                                        <input id="Commit_DayEnd" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                    <%--   <select class="form-control max-wide Stc0to365" id="Commit_DayEnd">
                                                    </select>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <%--<div class="col-md-12">
                                            <div class="form-group col-md-6">
                                                <asp:Label ID="Label6" class="col-md-4" runat="server" Font-Bold="True" Text="Month Name"></asp:Label>
                                                <div class="col-md-8">
                                                    <select class="form-control max-wide StcMonthName" id="Commit_MonthName">
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                            </div>
                                        </div>--%>
                                        <div class="col-md-12">
                                            <div class="form-group col-md-12 col-sm-6 col-xs-12">
                                                <button class="btn btn-info" id="btnCommit_Search" style="float: right;" type="button">search</button>
                                                <button class="btn btn-light btn-clear" data-type="Commit"  style="float: right; margin-right:5px;" type="button">Clear</button>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-1">
                                    </div>
                                </div>
                                <%--end div search--%>
                                <div class="row margin-top">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-bordered" id="tableCommit">
                                            <thead>
                                                <tr>
                                                    <th>Main Type</th>
                                                    <th>Purchase Type</th>
                                                    <th>Tag Code</th>
                                                    <th>Tag Group Name</th>
                                                    <th>Commit date</th>
                                                    <th>Status</th>
                                                    <th>Day </th>
                                                    <th>Month Name</th>
                                                </tr>
                                            </thead>
                                            <tbody id="ListCommit">
                                                <%--    <tr>
                                                    <td>1</td>
                                                    <td>Software</td>
                                                    <td>Purchase</td>
                                                    <td>NB2101001</td>
                                                    <td>Notebook</td>
                                                    <td>31/05/2021</td>
                                                    <td>Active</td>
                                                    <td>38</td>
                                                    <td>May</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>Software</td>
                                                    <td>Rent</td>
                                                    <td>PR2003002</td>
                                                    <td>Printer</td>
                                                    <td>15/05/2021</td>
                                                    <td>Active</td>
                                                    <td>22</td>
                                                    <td>May</td>
                                                </tr>--%>
                                            </tbody>
                                        </table>
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
                                        <%--<button class="btn btn-success" id="" data-type="New" type="button">New</button>--%>
                                    </div>
                                </div>
                                <%--End div Button--%>

                                <div class="row" style="text-align: left">
                                    <h3 style="margin-top: 0px;">Borrow date(Hardware)</h3>
                                    <%--<span style="color: red; font-size: 12px; text-align: center; margin-bottom: 25px;">ค้นหาอุปกรณ์ยืม/จ่ายที่ต้องเรียกคืน ด้วยช่วงระยะเวลา(วัน)/ชื่อเดือน</span>--%>
                                </div>
                                <div class=" row margin-top">
                                    <div class="col-md-1">
                                    </div>
                                    <div class="col-md-10">
                                        <div class="col-md-12">
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                <asp:Label ID="Label7" class="col-md-4 col-xs-12" runat="server" Font-Bold="True" Text="Borrow Between"></asp:Label>
                                                <div class="col-md-8 col-xs-12">
                                                    <div class="input-group">
                                                        <input id="Brrow_DayStart" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                    <%--  <select class="form-control max-wide Stc0to365" id="Brrow_DayStart">
                                                    </select>--%>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                <asp:Label ID="Label8" class="col-md-4 col-xs-12" runat="server" Font-Bold="True" Text="To"></asp:Label>
                                                <div class="col-md-8 col-xs-12">
                                                    <div class="input-group">
                                                        <input id="Brrow_DayEnd" class="form-control notText max-wide" placeholder="dd/mm/yyyy" type="text" autocomplete="off">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                    <%-- <select class="form-control max-wide Stc0to365" id="Brrow_DayEnd">
                                                    </select>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <%--<div class="col-md-12">
                                            <div class="form-group col-md-6">
                                                <asp:Label ID="Label9" class="col-md-4" runat="server" Font-Bold="True" Text="Month Name"></asp:Label>
                                                <div class="col-md-8">
                                                    <select class="form-control max-wide StcMonthName" id="Brrow_MonthName">
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-6 ">
                                            </div>
                                        </div>--%>

                                        <div class="col-md-12">
                                            <div class="form-group col-md-12 ">
                                                <button class="btn btn-info" id="btnBorrow_Search" style="float: right;" type="button">search</button>
                                                <button class="btn btn-light btn-clear" data-type="Borrow"  style="float: right; margin-right:5px;" type="button">Clear</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                    </div>
                                </div>
                                <%--end div search--%>
                                <div class="row margin-top">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-bordered" id="tableBorrow">
                                            <thead>
                                                <tr>
                                                    <%--<th>No</th>--%>
                                                    <th>Emp Num</th>
                                                    <th>Name</th>
                                                    <th>Cost Center</th>
                                                    <th>Level</th>
                                                    <th>Tag Code</th>
                                                    <th>Tag Group Name</th>
                                                    <th>Start date</th>
                                                    <th>Borrow Due date</th>
                                                    <th>Project</th>
                                                    <th>Detail</th>
                                                    <th>Day</th>
                                                    <th>Month Name</th>
                                                </tr>
                                            </thead>
                                            <tbody id="ListBrrow">
                                                <%--  <tr>
                                                    <td>56203</td>
                                                    <td>สิทธิชน พลชู</td>
                                                    <td>5IT733</td>
                                                    <td>G6</td>
                                                    <td>NB2101001</td>
                                                    <td>Notebook Company</td>
                                                    <td>01/04/2019</td>
                                                    <td>20/04/2021</td>
                                                    <td></td>
                                                    <td>May</td>
                                                    <td>-3</td>
                                                    <td>Apr</td>
                                                </tr>
                                                <tr>
                                                    <td>48065</td>
                                                    <td>ณัฐกิตต์ ไชย์รบชู</td>
                                                    <td>5IT733</td>
                                                    <td>G7</td>
                                                    <td>PR2003002</td>
                                                    <td>Notebook Company</td>
                                                    <td>01/04/2019</td>
                                                    <td>20/04/2021</td>
                                                    <td></td>
                                                    <td>xxxx</td>
                                                    <td>8</td>
                                                    <td>May</td>
                                                </tr>
                                                <tr>
                                                    <td>57028</td>
                                                    <td>กรวิชญ์ คนหาญ</td>
                                                    <td>5IT733</td>
                                                    <td>G6</td>
                                                    <td></td>
                                                    <td>Printer</td>
                                                    <td>01/04/2019</td>
                                                    <td>20/04/2021</td>
                                                    <td></td>
                                                    <td>Site ลูกค้า</td>
                                                    <td>7   </td>
                                                    <td>Apr</td>
                                                </tr>--%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--================End Tab 3====================-->
                        <div class="tab-pane fade" role="tabpanel" id="TAB4">
                            <div class="col-md-12">

                                <div class="row form-group">
                                    <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                    </div>
                                    <div class="col-md-8 col-xs-8" style="text-align: right">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-bordered" id="tableCharge">
                                            <thead>
                                                <tr>
                                                    <th>Emp Num</th>
                                                    <th>Name</th>
                                                    <th>Cost Center</th>
                                                    <th>Level</th>
                                                    <th class="JD-Job_New">Job title New</th>
                                                    <th class="JD-Job_New">Job Desc New</th>
                                                    <th class="JD-Job_New">JD code New</th>
                                                    <th class="JD-Job_Old">JD code Old</th>
                                                    <th class="JD-Job_Old">Jobs Desc Old</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="ListCharge">
                                              <%--  <tr>
                                                    <td>1</td>
                                                    <td>56203</td>
                                                    <td>สิทธิชน พลชู</td>
                                                    <td>5IT733</td>
                                                    <td>G6</td>
                                                    <td>D100085</td>
                                                    <td>Technical SupportSupervisor</td>
                                                    <td>AG0007</td>
                                                    <td>AG0007</td>
                                                    <td>Support1</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>48065</td>
                                                    <td>ณัฐกิตต์ ไชย์รบ</td>
                                                    <td>5IT733</td>
                                                    <td>G7</td>
                                                    <td>D100085</td>
                                                    <td>Technical SupportSupervisor</td>
                                                    <td>AG0007</td>
                                                    <td>AG0001</td>
                                                    <td>Support2</td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>57028</td>
                                                    <td>กรวิชญ์ คนหาญ</td>
                                                    <td>5IT733</td>
                                                    <td>G6</td>
                                                    <td>D100085</td>
                                                    <td>Technical SupportSupervisor</td>
                                                    <td>AG0007</td>
                                                    <td>AG0001</td>
                                                    <td>Support3</td>
                                                </tr>--%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--================End Tab 4====================-->
                </div>
            </div>
        </div>
    </div>


    <script>
        $(document).ready(function () {
            var tableExpire = $("#tableExpire").DataTable({
                searching: false,
                lengthChange: true,
            });

            var tableCommit = $("#tableCommit").DataTable({
                searching: false,
                lengthChange: true,
            });

            var tableBorrow = $("#tableBorrow").DataTable({
                searching: false,
                lengthChange: true,
            });
            var tableCharge = $("#tableCharge").DataTable({
                searching: false,
                lengthChange: true,
            });

            
            var UserPosition = CheckPermission('ITTAG', 'Monitoring');
            console.log(UserPosition)
            if (UserPosition != "") {
                SetDatePicker();
                set_Stc0to100();
                set_Stc0to365();
                set_StcMonthName();
                Get_TBExpire(ToDate(0), ToLastDate(2));
                Get_TBCommit('', '');
                Get_TBBorrow('', '');
                Get_TBCharge();
                $("#Expire_DayStart").val(ToDate(0));
                $("#Expire_DayEnd").val(ToLastDate(2));

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
            
            


            $(document).on("click", "#btnExpire_Search", function () {
                var DayStart = $("#Expire_DayStart").val();
                var DayEnd = $("#Expire_DayEnd").val();
                //var MonthName = $("#Expire_MonthName").val();
                Get_TBExpire(DayStart, DayEnd);
            });

            $(document).on("click", "#btnCommit_Search", function () {
                var DayStart = $("#Commit_DayStart").val();
                var DayEnd = $("#Commit_DayEnd").val();
                //var MonthName = $("#Commit_MonthName").val();
                Get_TBCommit(DayStart, DayEnd);
            });

            $(document).on("click", "#btnBorrow_Search", function () {
                var DayStart = $("#Brrow_DayStart").val();
                var DayEnd = $("#Brrow_DayEnd").val();
                //var MonthName = $("#Brrow_MonthName").val();
                //console.log(DayStart);
                //console.log(DayEnd);
                //console.log(MonthName);
                Get_TBBorrow(DayStart, DayEnd,);
            });

            $(document).on("click", ".btn-clear", function () {
                var type = $(this).attr("data-type");
                if (type == "Expire") {
                    $("#Expire_DayStart").val('');
                    $("#Expire_DayEnd").val('');
                    Get_TBExpire('', '');
                }
                else if(type == "Commit") {
                    $("#Commit_DayStart").val('');
                    $("#Commit_DayEnd").val('');
                    Get_TBCommit('', '');
                }
                else if(type == "Borrow") {
                    $("#Brrow_DayStart").val('');
                    $("#Brrow_DayEnd").val('');
                    Get_TBBorrow('', '');
                }
            });


            function Get_TBExpire(DayStart, DayEnd) {
                tableExpire.clear().draw();

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/VW_IT_TAG_Monitoring_ExpireTag") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ DayStart: DayStart, DayEnd: DayEnd }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[IT_Tag_Code], [Tag_Group], [Purchase_Type], [Start_Contract_date], [Expire_Contract_date]
                                //, [MainType], [TypeName], [TagGroupName], [Tag_Group_Status], [Month], [Month_Name]
                                var IT_Tag_Code = val[0];
                                var Taggroup = val[1];
                                var Purchase_Type = val[2];
                                var Start_Contract_date = val[3];
                                var Expire_Contract_date = val[4];
                                var MainType = val[5];
                                var TypeName = val[6];
                                var TagGroupName = val[7];
                                var Tag_Group_Status = val[8];
                                var Month = val[9];
                                var Month_Name = val[10];
                                tableExpire.row.add([MainType, Purchase_Type, '<td><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_Tag_Code + '" target="_bank">' + IT_Tag_Code + '</a><td>', TagGroupName, Expire_Contract_date.substr(0, 10)
                                    , Tag_Group_Status, Month, Month_Name]).draw().node();
                            });
                        }
                    }
                });
            }

            function Get_TBCommit(DayStart, DayEnd) {
                tableCommit.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/VW_IT_TAG_Monitoring_Commit_MA") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ DayStart: DayStart, DayEnd: DayEnd}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var IT_TAG_Code = val[1];
                                var site_ref = val[2];
                                var Vendor_Num = val[3];
                                var Vendor_Site_ref = val[4];
                                var Vendor_Name = val[5];
                                var PO_Case_Number = val[6];
                                var Repair_Date = val[7];
                                var Commit_Date = val[8];
                                var Return_Date = val[9];
                                var Price = val[10];
                                var Detail = val[11];
                                var Status = val[12];
                                var Purchase_Type = val[13];
                                var Tag_Group = val[14];
                                var TagGroupName = val[15];
                                var MainType = val[16];
                                var Days = val[17];
                                var Month_Name = val[18];
                                //console.log(IT_TAG_Code);
                                tableCommit.row.add([MainType, Purchase_Type, '<td><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code + '" target="_bank">' + IT_TAG_Code + '</a><td>', TagGroupName, Commit_Date.substr(0, 10)
                                    , Status, Days, Month_Name]).draw().node();
                            });
                        }
                    }
                });
            }
            function Get_TBBorrow(DayStart, DayEnd) {
                tableBorrow.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/VW_IT_TAG_Monitoring_Borrow") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ DayStart: DayStart, DayEnd: DayEnd}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[ID], [IT_TAG_Code], [StartDate], [BorrowDueDate], [Detail]
                                //, [Status], [Emp_num], [ProjectNo], [MainType], [TypeName], [TagGroup]
                                //, [TagGroupName], [FullName], [CostCenter], [CostCenterDesc], [Level], [JobTitle_ID]
                                //, [JobTitle_Name], [Days], [Month_Name]
                                var ID = val[0];
                                var IT_TAG_Code = val[1];
                                var StartDate = val[2];
                                var BorrowDueDate = val[3];
                                var Detail = val[4];
                                var Status = val[5];
                                var Emp_num = val[6];
                                var ProjectNo = val[7];
                                var MainType = val[8];
                                var TypeName = val[9];
                                var TagGroup = val[10];
                                var TagGroupName = val[11];
                                var FullName = val[12];
                                var CostCenter = val[13];
                                var CostCenterDesc = val[14];
                                var Level = val[15];
                                var JobTitle_ID = val[16];
                                var JobTitle_Name = val[17];
                                var Days = val[18];
                                var Month_Name = val[19];
                                var hrefITTAG = '<td><a href="ITTAG_MaintainITTAG.aspx?ITTAG=' + IT_TAG_Code + '" target="_bank">' + IT_TAG_Code + '</a></td>';
                                var hrefEmpNum = '<td><a href="ITTAG_MaintainPE.aspx?EmpNum=' + Emp_num + '" target="_bank">' + Emp_num + '</a></td>';
                                tableBorrow.row.add([
                                    hrefEmpNum
                                    , FullName
                                    , CostCenter
                                    , Level
                                    , hrefITTAG
                                    , TagGroupName
                                    , StartDate.substr(0, 10)
                                    , BorrowDueDate.substr(0, 10)
                                    , ProjectNo
                                    , Detail
                                    , Days
                                    , Month_Name]).draw().node();
                            });
                        }
                    }
                });
            }
            function Get_TBCharge() {
                tableCharge.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/VW_IT_TAG_Monitoring_NewJD") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                    //[JD_Code], [Emp_num], [name], [dept], [BUGroup],
                                    //[Uf_Level], [JD_Code_Old], [Level_Old], [BU_Group_Old],
                                    //[Job_Desc_Old], [Job_Title_Old], [JD_Code_New],
                                    //[Level_New], [BU_Group_New], [Job_Desc_New], [Job_Title_New] 
                                var JD_Code = val[0];
                                var Emp_num = val[1];
                                var name = val[2];
                                var dept = val[3];
                                var BUGroup = val[4];
                                var Uf_Level = val[5];
                                var JD_Code_Old = val[6];
                                var Level_Old = val[7];
                                var BU_Group_Old = val[8];
                                var Job_Desc_Old = val[9];
                                var Job_Title_Old = val[10];
                                var JD_Code_New = val[11];
                                var Level_New = val[12];
                                var BU_Group_New = val[13];
                                var Job_Desc_New = val[14];
                                var Job_Title_New = val[15];

                                tableCharge.row.add([
                                     ' <a href="./ITTAG_MaintainPE.aspx?EmpNum=' + Emp_num + '">' + Emp_num + '</a>'
                                    , name
                                    , dept
                                    , Uf_Level
                                    , Job_Title_New
                                    , Job_Desc_New
                                    , JD_Code_New
                                    , JD_Code_Old
                                    , Job_Desc_Old
                                    , '<i class="glyphicon glyphicon-exclamation-sign red sizeAlert"></i>',]).draw().node();
                            });
                        }
                    }
                });
            }

        });



        function SetDatePicker() {
            $('#Expire_DayStart').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
            $('#Expire_DayEnd').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
            $('#Commit_DayStart').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
            $('#Commit_DayEnd').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
            $('#Brrow_DayStart').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
            $('#Brrow_DayEnd').datepicker({ format: 'dd/mm/yyyy', autoHide: true });
        }
        
        function ToDate (NextDate) {
            var now = new Date();
            if (now.getMonth() == 11) {
                var today = new Date(now.getFullYear() , 0, 1+ NextDate);
            } else {
                var today = new Date(now.getFullYear() , now.getMonth(), 1+ NextDate);
            }
            var dd = String(today.getDate()  ).padStart(2, '0');
            var mm = String(today.getMonth() + 1 ).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();
            today = dd + '/' + mm + '/' + yyyy;
            return today;
        }

        function ToLastDate (Nextmonth) {
            var now = new Date();
            if (now.getMonth() == 11) {
                var today = new Date(now.getFullYear() , 0, -1);
            } else {
                var today = new Date(now.getFullYear() , now.getMonth(), -1);
            }
            var dd = String(today.getDate() +1 ).padStart(2, '0');
            var mm = String(today.getMonth() + 2 + Nextmonth).padStart(2, '0'); //January is 0! // Month + 2 Because Day-1
            //console.log(mm);
            var yyyy = today.getFullYear();
            
            today = dd + '/' + mm + '/' + yyyy;
            return today;
        }


        function set_Stc0to100() {
            $(".Stc0to12").empty();
            var $select = $(".Stc0to12");
            for (i = 0; i <= 12; i++) {
                $select.append('<option value = "' + i + '">' + i + '</option>');
            }
        };
        function set_Stc0to365() {
            $(".Stc0to365").empty();
            var $select = $(".Stc0to365");
            for (i = 0; i <= 365; i++) {
                $select.append('<option value = "' + i + '">' + i + '</option>');
            }
        };

        function set_StcMonthName() {
            $(".StcMonthName").empty();
            var $select = $(".StcMonthName");
            $select.append(`<option value="">=== Select Month ===</option>
                            <option value="January">January</option>
                            <option value="February">February</option>
                            <option value="March">March</option>
                            <option value="April">April</option>
                            <option value="May">May</option>
                            <option value="June">June</option>
                            <option value="July">July</option>
                            <option value="August">August</option>
                            <option value="September">September</option>
                            <option value="October">October</option>
                            <option value="November">November</option>
                            <option value="December">December</option>`);
        };

    </script>



</asp:Content>
