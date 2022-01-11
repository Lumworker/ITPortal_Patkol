<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PMAllLineMaintainCheckList.aspx.cs" Inherits="ITPortal.PMAllLineMaintainCheckList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .form-control {
            min-width: 100%;
        }

        .row-eq-height {
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
        }

        @media only screen and (max-width: 990px) {
            .row-eq-height {
                display: -webkit-box;
                display: grid;
            }
        }

        .SelectLine, .SelectLine:focus {
            color: #f0ad4e;
            font-weight: bold;
        }
    </style>
    <div class="page-header">
        <h2>Maintain CheckList Type</h2>
            <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
            </div>
            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                 <button type="button" class="btn btn-info PositionCheck" id="btnsync" style="float:right">Sync Cheklist</button>
                
                                    <input id="child-TypeID" type="text" class="form-control max-wide" disabled style="display:none;">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="row-eq-height">
            <div class="col-md-6 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-9">
                                <h4>
                                    <strong>Checklist Type</strong>
                                </h4>
                            </div>
                            <div class="col-md-3 text-right">
                                <button type="button" class="btn btn-success PositionCheck" id="btnClickModalAddType" style="float:right">Add</button>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table table-hover" id="tableType">
                                        <thead>
                                            <tr>
                                                <th style="width: 100%">Name</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="ListMainType">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!--END row-->
                    </div>
                </div>
            </div>
            <!--End col 7-->
            <div class="col-md-6 col-xs-12" id="BlockDetail" style="display: none">
                <div class="panel panel-default">

                       
                    <div class="panel-body">
                        <div class="row">
                                <ul class="nav nav-tabs">
                                    <li class="active" data-type="Detail"><a href="#1" data-toggle="tab" id="tab-Detail">Check List Detail</a></li>
                                    <li data-type="Group"><a href="#2" data-toggle="tab" id="tab-Group">IT Tag Group</a></li>
                                </ul>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="tab-content ">
                                    <div class="tab-pane active" id="1">
                                        <div class="panel-body">
                                            <button type="button" class="btn btn-success PositionCheck " id="btnClickModalAddDetail" style="float: right;">Add Detail</button>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover" id="tableDetail">
                                                            <thead>
                                                                <tr>
                                                                    <th>Level</th>
                                                                    <th>Name</th>
                                                                    <th>Status</th>
                                                                    <th></th>
                                                                    <th></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="LoadDetail"></tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End Tab1-->
                                    <div class="tab-pane " id="2">
                                        <div class="panel-body">
                                            <button type="button" class="btn btn-success PositionCheck " id="btnClickModalAddGroup" style="float: right; display: block;">Add Group</button>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover" id="tableGroup">
                                                            <thead>
                                                                <tr>
                                                                    <th>Group tag</th>
                                                                    <th></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="LoadGroup"></tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End Tab2-->
                                </div>
                            </div>
                        </div>
                        <!--END row-->
                    </div>
                </div>
            </div>
            <!--End col 8-->
        </div>
    </div>

    <div class="modal fade" id="Modal" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title" id="modalHeaderText">New Type</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--Start modal body--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <div class="col-md-12 col-sm-12 col-xs-12">


                        <div id="modal-type" style="display: none;">

                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em; display: none;">
                                <div class="col-md-4">
                                    <label class="control-label" style="font-size: 13px">ID :</label>
                                </div>
                                <div class="col-md-8">
                                    <input id="txtTypeID" type="text" class="form-control max-wide" disabled>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                                <div class="col-md-4">
                                    <label class="control-label" style="font-size: 13px">Name :</label>
                                </div>
                                <div class="col-md-8">
                                    <input id="txtTypeName" type="text" class="form-control max-wide">
                                </div>
                            </div>
                        </div>
                        <%--End modal-type --%>
                        <div id="modal-group" style="display: none;">

                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em; display: none;">
                                <div class="col-md-4">
                                    <label class="control-label" style="font-size: 13px">Group ID :</label>
                                </div>
                                <div class="col-md-8">
                                    <input id="txtTagGroupID" type="text" class="form-control max-wide" disabled>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                                    <input id="txtSearchItTag" type="text" placeholder="Search Group..." class="form-control max-wide" autocomplete="off">
                               </div>
                            <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                                <table id="TableListCustomer" class="table table-bordered table-responsive">
                                    <thead id="Thead1" runat="server">
                                        <tr>
                                            <th>Tag Group</th>
                                            <th>Tag Group Name</th>
                                            <th>MainType</th>
                                        </tr>
                                    </thead>
                                    <tbody id='TBodySearch'></tbody>
                                </table>
                            </div>
                        </div>
                    <%--End modal-Group --%>
                    <div id="modal-detail" style="display: none;">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em; display: none;">
                            <div class="col-md-4">
                                <label class="control-label" style="font-size: 13px">Detail ID :</label>
                            </div>
                            <div class="col-md-8">
                                <input id="txtdetailID" type="number" class="form-control max-wide" disabled>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-4">
                                <label class="control-label" style="font-size: 13px">Level :</label>
                            </div>
                            <div class="col-md-8">
                                <input id="txtdetaillevel" type="text" class="form-control max-wide">
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-4">
                                <label class="control-label" style="font-size: 13px">Detail name :</label>
                            </div>
                            <div class="col-md-8">
                                <input id="txtdetailname" type="text" class="form-control max-wide">
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-4">
                                <label class="control-label" style="font-size: 13px">Status:</label>
                            </div>
                            <div class="col-md-8">
                                <select class="custom-select form-control max-wide" id="txtStatus">
                                    <option selected value="Active">Active</option>
                                    <option value="InActive">InActive</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <%--End modal-Group --%>
                </div>
            </div>
            <%--End modal body--%>
            <div class="modal-footer" id="Browsefooter">
                <button type="button" class="btn btn-success" id="btnAddnewType" style="display: none; float: right;">Save</button>
                <%--<button type="button" class="btn btn-success" id="btnAddnewGroup" style="display:none;float: right;">Save</button>--%>
                <button type="button" class="btn btn-success" id="btnAddnewDetail" style="display: none; float: right;">Save</button>
            </div>

        </div>
    </div>
    </div>
     <%--End modal Type--%>


    <script>
        $(document).ready(function () {

            LoadType();

            ///ตัวอย่างหน้า Machine Master (TPMPATKOL)
            $(document).on('click', '.ClickTypeSelectDetail', function () {
                $("#ListMainType").find("tr").find("td").find("a").removeClass("SelectLine");
                var row = $(this).closest("tr");
                //var ID = parseInt(row.attr("data-id"));
                //var ID = row.find("td:nth-child(1)").text();
                var ID = $(this).closest("tr").attr("data-id");
                var txtTypeName = row.find("td:nth-child(1)").text();
                $("#lblTextHeaderDetail").text(ID + " " + txtTypeName).attr("data-idmainequipmentname", ID);
                //ซ่อนเมนูอื่น

                $("#child-TypeID").val(ID);
                console.log(ID);
                $("#LoadDetail").empty();
                $("#BlockDetail").show();
                row.find("td").find("a").addClass("SelectLine");
                LoadDetail(ID);
                LoadGroup(ID);
            });

            $(document).on('click', '#btnClickModalAddType', function () {
                $("#txtTypeName").val('')
                showModal("Type", "New");
            });
            $(document).on('click', '#btnClickModalAddGroup', function () {
                var search = '';
                $("#txtSearchItTag").val('')
                GetIT_TAG_Group(search);
                showModal("Group", "New");
            });

            $(document).on('click', '#btnClickModalAddDetail', function () {
                $("#txtdetaillevel").val('')
                $("#txtdetailname").val('')
                $("#txtStatus").val('Active')
                showModal("Detail", "New");
            });

            $(document).on('click', '#btnsync', function () {
                if (confirm("Confirm Sync?")) {
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/SP_PMOnline_sync_CheckList") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify(),
                        success: function (response) {
                          swal('Complete', 'Sync ข้อมูลสำเร็จ', 'success');
                        }
                    });
                } 
            });


            $(document).on('click', '#btnAddnewType', function () {
                var id = $("#txtTypeID").val();
                var name = $("#txtTypeName").val();
                if (name != "") {
                    if (id == '' || id == null) {
                        id = 0;
                    }
                    SyncType(id, name)
                    $("#txtTypeID").val('');
                    $("#txtTypeName").val('');
                    $("#Modal").modal("hide");
                }
                else {
                    swal('Error', 'กรุณาใส่ชื่อ Type', 'error');
                }
            });

            $(document).on('click', '.selectGroup', function () {
                var Type_ID = $("#child-TypeID").val();
                var IT_TAG_Group = $(this).closest("tr").find("td:nth-child(1)").text();
                var ID = $("#txtTagGroupID").val();
                if (IT_TAG_Group != "") {
                    if (ID == '' || ID == null) {
                        ID = 0;
                    }
                    SyncGroup(ID, IT_TAG_Group, Type_ID);
                    $("#Modal").modal("hide");
                }
            });

            $(document).on('click', '.btnDeleteGroup', function () {
                var Type_ID = $("#child-TypeID").val();
                var IT_TAG_Group = $(this).closest("tr").find("td:nth-child(1)").text();
                var ID = $(this).closest("tr").attr("data-groupID");
                //confirm
                swal({
                    title: 'Comfirm Delete?',
                    text: "ยืนยันลบข้อมูล",
                    icon: 'info',
                    buttons: {
                        cancel: true,
                        confirm: true,
                    },
                }).then(function (confirm) {
                    if (confirm) {
                    SyncGroup(ID, IT_TAG_Group, Type_ID);
                    }
                })
            });


            $(document).on('click', '#btnAddnewDetail', function () {
                var ID = $("#txtdetailID").val();
                var Type_ID = $("#child-TypeID").val();
                var Level = $("#txtdetaillevel").val();
                var Name = $("#txtdetailname").val();
                var Status = $("#txtStatus").val();
                if (Name != "" && Level != '') {
                    if (ID == '' || ID == null) {
                        ID = 0;
                    }
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/SP_PMOnline_CheckList_Detail") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: ID, Type_ID: Type_ID, Level: Level, Name: Name, Status: Status }),
                        success: function (response) {
                            swal('Complete', 'บันทึกข้อมูล สำเร็จ', 'success');
                            $("#txtdetaillevel").val('');
                            $("#txtdetailname").val('');
                            $("#txtStatus").val('');
                            LoadDetail(Type_ID);
                            $("#Modal").modal("hide");
                        }
                    });
                }
                else {
                    swal('Error', 'กรุณาใส่ชื่อ ข้อมูลให้ครบ', 'error');
                }
            });
            $(document).on('click', '.btnUpdateDetail', function () {
                showModal("Detail", "Edit");
                var ID = $(this).closest("tr").attr("data-detail_id");
                var Type_ID = $("#child-TypeID").val();
                var Level = $(this).closest("tr").find("td:nth-child(1)").text();
                var Name = $(this).closest("tr").find("td:nth-child(2)").text();
                var Status = $(this).closest("tr").find("td:nth-child(3)").text();
                $("#txtdetailID").val(ID);
                $("#txtdetaillevel").val(Level);
                $("#txtdetailname").val(Name);
                $("#txtStatus").val(Status);
            });

            $(document).on('click', '.btnUpdateType', function () {
                showModal("Type", "Edit");
                var ID = $(this).closest("tr").attr("data-id");
                var Name = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#txtTypeID").val(ID);
                $("#txtTypeName").val(Name);
            });


            //End Document Onclick
            $(document).on("keyup", "#txtSearchItTag", function () {
                var search = $("#txtSearchItTag").val();
                GetIT_TAG_Group(search)
            });

            //End Document Onchange

            
        function LoadType() {
            $("#ListMainType").empty();
            $.ajax({
                type: "POST",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/GetCheckList_Type") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify(),
                success: function (response) {
                    var frament = "";
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var ID = val[0];
                            var name = val[1];
                            frament += '<tr data-id="' + ID + '">';
                            frament += '<td><a class="ClickTypeSelectDetail" href="javascript:void(0)">' + name + '</a></td>';
                            frament += '<td><button type="button" class="btn btn-warning PositionCheck btnUpdateType"><i class=" glyphicon glyphicon-wrench" aria-hidden="true"></i></button></td>';
                            frament += '</tr>';
                        });
                        $("#ListMainType").append(frament);
                        PageSetPosition();
                    }
                }
            });
        }

        function LoadGroup(ID) {
            var Type_id = ID;
            var frament = "";
            $("#LoadGroup").empty();
            $.ajax({
                type: "POST",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/GetCheckList_Group") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ Type_id: Type_id }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var groupID = val[0];
                            var Type_ID = val[1];
                            var IT_TAG_Group = val[2];
                            frament += '<tr data-groupID ="' + groupID + '" data-Type_ID="' + Type_ID + '">';
                            frament += '<td><span class="" href="javascript:void(0)">' + IT_TAG_Group + '</span></td>';
                            frament += '<td><button type="button" class="btn btn-danger btnDeleteGroup PositionCheck"><i class="glyphicon glyphicon-trash" aria-hidden="true"></i></button></td>';
                            frament += '</tr>';
                        });
                    }
                    $("#LoadGroup").append(frament);
                        PageSetPosition();
                }
            });
        }

        function LoadDetail(ID) {
            var Type_id = ID;
            var frament = "";
            $("#LoadDetail").empty();
            $.ajax({
                type: "POST",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/GetCheckList_Detail") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ Type_id: Type_id }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var ID = val[0];
                            var Type_ID = val[1];
                            var Level = val[2];
                            var Name = val[3];
                            var Status = val[4];
                            frament += '<tr data-Detail_ID="' + ID + '" data-Type_ID="' + Type_ID + '">';
                            frament += '<td><span class="ClickDetailSelectChecklist" href="javascript:void(0)">' + Level + '</span></td>';
                            frament += '<td><span class="ClickDetailSelectChecklist" href="javascript:void(0)">' + Name + '</span></td>';
                            frament += statusColor(Status);
                            frament += '<td><button type="button" class="btn btn-warning btnUpdateDetail PositionCheck"><i class="glyphicon glyphicon-wrench" aria-hidden="true"></i></button></td>';
                            frament += '</tr>';
                        });
                    }
                    $("#LoadDetail").append(frament);
                        PageSetPosition();
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
                            });
                        }

                        else {
                            $('.PositionCheck').css('display', 'none');
                        }
                    }
                })
            }

            function SyncGroup(ID, IT_TAG_Group, Type_ID) {
            $.ajax({
                type: "POST",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/SP_PMOnline_CheckList_Group") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ ID: ID, IT_TAG_Group: IT_TAG_Group, Type_ID: Type_ID }),
                success: function (response) {
                    swal('Complete', 'บันทึก ข้อมูลสำเร็จ', 'success');
                    LoadGroup(Type_ID);
                    $("#Modal").modal("hide");
                    $("#txtTagGroup").val('');
                    $("#txtTagGroupID").val('');
                }
            });
            }

            function SyncType(id, name) {
            $.ajax({
                type: "POST",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/SP_PMOnline_CheckList_Type") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ id: id, name: name }),
                success: function (response) {
                    swal('Complete', 'บันทึก ข้อมูลสำเร็จ', 'success');
                    $("#txtTypeID").val('');
                    $("#txtTypeName").val('');
                    LoadType()
                    $("#Modal").modal("hide");
                }
            });
        }

        });
        //End Document Ready


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
                            //[TagGroup],[TagGroupName]
                            var TagGroup = val[0];
                            var TagGroupName = val[1];
                            var MainType = val[2];
                            fragment += '<tr>';
                            fragment += '<td><a class="selectGroup">' + TagGroup + '</a></td>';
                            fragment += '<td><a class="selectGroup">' + TagGroupName + '</a></td>';
                            fragment += '<td><a class="selectGroup">' + MainType + '</a></td>';
                            fragment += '</tr>';
                        });
                    }
                    $("#TBodySearch").append(fragment);
                }
            });
        }

        

        

        function statusColor(Status) {
            if (Status == "Active") {
                var ReturnStatus = '<td><span class="ClickDetailSelectChecklist" href="javascript:void(0)" style="color:Green;">' + Status + '</span></td>';
            }
            else if (Status == "InActive") {
                var ReturnStatus = '<td><span class="ClickDetailSelectChecklist" href="javascript:void(0)" style="color:Red;">' + Status + '</span></td>';
            }
            return ReturnStatus;
        }

        function showModal(Modalname, ModalTitlename) {
            if (Modalname == "Type") {
                $("#modalHeaderText").text(ModalTitlename + " Type");
                $("#modal-type").css("display", "")
                $("#modal-group").css("display", "none")
                $("#modal-detail").css("display", "none")
                $("#btnAddnewType").css("display", "")
                $("#btnAddnewGroup").css("display", "none")
                $("#btnAddnewDetail").css("display", "none")
            }
            else if (Modalname == "Group") {
                $("#modalHeaderText").text(ModalTitlename + " Group");
                $("#modal-type").css("display", "none")
                $("#modal-group").css("display", "")
                $("#modal-detail").css("display", "none")
                $("#btnAddnewType").css("display", "none")
                //$("#btnAddnewGroup").css("display","")
                $("#btnAddnewDetail").css("display", "none")
            }
            else if (Modalname == "Detail") {
                $("#modalHeaderText").text(ModalTitlename + " Detail");
                $("#modal-type").css("display", "none")
                $("#modal-group").css("display", "none")
                $("#modal-detail").css("display", "")
                $("#btnAddnewGroup").css("display", "none")
                $("#btnAddnewType").css("display", "none")
                $("#btnAddnewDetail").css("display", "")
            }
            $("#Modal").modal("show");
        }




    </script>

</asp:Content>
