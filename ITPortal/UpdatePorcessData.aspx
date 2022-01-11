<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdatePorcessData.aspx.cs" Inherits="ITPortal.UpdatePorcessData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <div class="row">
            <div class=" col-md-12">
                <h2>Update Porcess Data</h2>
            </div>
        </div>
    </div>
    <div class="panel-group">
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="col-md-12">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="K2 ID"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="txtK2" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                                    <div class="input-group-btn">
                                        <button id="buttonSearchK2" class="btn btn-default" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label1" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Subject"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtSubject" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                </div>
            </div>
            <!--panel-body-->
        </div>
        <!--panel-default-->
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-hover" id="tableK2">
                                <thead>
                                    <tr>
                                        <th>Process Data</th>
                                        <th>Values</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="ListK2">
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



    <div class="modal fade" id="ModalListK2" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">List K2</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <input type="text" class="form-control" id="ListK2_myInput" placeholder="Search K2" autocomplete="off" onkeypress="detect_enter_keyboard(event)" style="max-width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="TableK2" class="table table-bordered table-responsive">
                        <thead id="Thead1" runat="server">
                            <tr>
                                <th>K2 ID</th>
                                <th>Subject</th>
                                <th>K2 Version</th>
                            </tr>
                        </thead>
                        <tbody id='TBodyK2'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>



    <script>

        $(document).ready(function () {


            $("#buttonSearchK2").on('click', function () {
                GetListK2("");
                $("#ModalListK2").modal("show");
            });
            $("#ListK2_myInput").on('change', function () {
                var value = $(this).val();
                GetListK2(value);
            });


            $(document).on('click', '.ClickSelectK2', function () {
                var row = $(this).closest("tr");
                var td1 = row.find("td:nth-child(1)").text(),
                    td2 = row.find("td:nth-child(2)").text(),
                    td3 = row.find("td:nth-child(3)").text();
                $("#txtK2").val(td1).attr("data-k2ver", td3);
                $("#txtSubject").val(td2);
                GetListProcessValue(td1, td3);
            });

            $(document).on('click', '.btnClickUpdate', function () {
                var row = $(this).closest("tr");
                var ID = row.attr("data-id");
                var K2ID = $("#txtK2").val();
                var Value = row.find("td:nth-child(2)").find("input").val();
                var K2ver = $("#txtK2").attr("data-k2ver");
                //alert(K2ID + " : " + ID + " : " + Value + " : " + K2ver);
                UpdateProcessK2ID(K2ID, ID, Value, K2ver);
            })


            function UpdateProcessK2ID(ProcInstID, ID, Value, K2ver) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_ProcessData_Update") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ProcInstID: ProcInstID, ID: ID, Value: Value, K2ver: K2ver }),
                    success: function (response) {
                        alert("Update Complete");
                    }
                });
            }

            function GetListProcessValue(K2ID, K2ver) {
                $("#ListK2").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GetProcessData") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ K2ID: K2ID, K2ver: K2ver }),
                    success: function (response) {
                        var frament = '';
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var ProcessData = val[1];
                                var Value = val[2];

                                frament += '<tr data-id="' + ID + '">';
                                frament += "<td>" + ProcessData + "</a></td>";
                                frament += "<td><input type='text' style='min-width: 100%' autocomplete='off' onkeypress='detect_enter_keyboard(event)'  class='form-control' value='" + Value + "'></td>";
                                frament += "<td><button type='button' class='btnClickUpdate btn btn-warning btn-block'>Update</button></td>";
                                frament += "</tr>";
                            });

                        } else {
                            frament += "<tr>";
                            frament += "<td>Not Data</td>";
                            frament += "<td>Not Data</td>";
                            frament += "<td>Not Data</td>";
                            frament += "</tr>";
                        }
                        $("#ListK2").append(frament);
                    }
                });
            }

            function GetListK2(Search) {
                $("#TBodyK2").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GetK2") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Search: Search }),
                    success: function (response) {
                        var frament = '';
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var K2ID = val[0];
                                var Subject = val[1];
                                var K2Vers = val[2];

                                frament += "<tr>";
                                frament += "<td><a class='ClickSelectK2' href='javascript:void(0)' data-dismiss='modal'>" + K2ID + "</a></td>";
                                frament += "<td><a class='ClickSelectK2' href='javascript:void(0)' data-dismiss='modal'>" + Subject + "</a></td>";
                                frament += "<td><a class='ClickSelectK2' href='javascript:void(0)' data-dismiss='modal'>" + K2Vers + "</a></td>";
                                frament += "</tr>";
                            });

                        } else {
                            frament += "<tr>";
                            frament += "<td>Not Data</td>";
                            frament += "<td>Not Data</td>";
                            frament += "</tr>";
                        }
                        $("#TBodyK2").append(frament);
                    }
                });
            }

        });

    </script>

</asp:Content>
