<%@ Page Title="Maintain TagGroup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ITTAG_MaintainTagGroup.aspx.cs" Inherits="ITPortal.MaintainTagGroup" %>

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
    </style>
    <div class="page-header">
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
            <h2>Maintain IT TAG Group</h2>
            </div>

            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                <button id="btnModalNew" class="btn btn-success Pos_Worker" type="button" data-toggle="modal" style="float: right">New </button>
            </div>
        </div>
    </div>


    <div class="panel-group">
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="col-md-12">
                    <div class="row">
                       <%-- <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label1221" class="col-md-3 col-xs-12 " runat="server" Font-Bold="True" Text="Owner"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control max-wide" id="Search_Owner">
                                    <option value="">=======Please Select Owner=======</option>
                                    <option value="System Administrative">System Administrative</option>
                                    <option value="Technical Support">Technical Support</option>
                                    <option value="Help Desk Support">Help Desk Support</option>
                                </select>
                            </div>
                        </div>--%>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label99" class="col-md-3 col-xs-12 " runat="server" Font-Bold="True" Text="Main Type"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control max-wide" id="Search_Maintype">
                                    <option value="">=======Please Select Maintype=======</option>
                                    <option value="Hardware">Hardware</option>
                                    <option value="Software">Software</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Type Name :"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                  <input type="text" class="form-control" id="Search_TypeName" style="min-width: 100%" autocomplete="off" />
                            </div>
                        </div>
                    </div>

                    <!--END Row-->
                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label1" class="col-md-3 col-xs-12 " runat="server" Font-Bold="True" Text="Status : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control max-wide" id="Search_Status">
                                    <option value="">ALL</option>
                                    <option value="Active">Active</option>
                                    <option value="InActive">InActive</option>
                                </select>
                            </div>
                        </div>


                    </div>
                </div>
                <!--END Row-->

                <div class="col-md-12">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <div class="col-md-8 col-xs-12">
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <button type="button" id="btnClearReport_Group" class="btn btn-warning btn-block" style="float: right;">Clear</button>
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <button type="button" id="btnSearchReport_Group" class="btn btn-info btn-block" style="float: right;">Search</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--panel-body-->
        </div>
        <!--Panel-Group -->
    </div>


    <div class="panel-group">
        <!--panel-default-->
        <div class="panel panel-default" style="margin-top: 1em;" id="divDataTable">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered table-responsive center" style="width: 100%" id="tableGroup">
                                <thead>
                                    <tr>
                                        <%--<th>Owner</th>--%>
                                        <th>Main Type</th>
                                        <th>Type Name</th>
                                        <th>Tag Group</th>
                                        <th>Tag Group Name</th>
                                        <th>Status</th>
                                        <th>Usage</th>
                                        <th>Total</th>
                                        <th>Report Seq</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="ListGroup">
                               <%--     <tr>
                                        <td>Owner</td>
                                        <td>Main Type</td>
                                        <td>Type Name</td>
                                        <td>Tag Group</td>
                                        <td>Tag Group Name</td>
                                        <td>Status</td>
                                        <td>Usage</td>
                                        <td>Total</td>
                                        <td>
                                            <button class="btn btn-warning  btnModalEdit" data-id="' + ID + '" type="button">Edit</button></td>
                                    </tr>--%>
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


    
    <div class="modal fade" id="ModalGroup" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em; ">
                        <div class="col-md-7 col-sm-12">
                            <h4 class="modal-title"><span id="TitleModalGroup"></span> : ITTag Group</h4>
                        </div>
                        <div class="col-md-5 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-success" id="SaveGroup" >Save</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    
                    <div class="row">
                   <div class="col-md-12 col-sm-12 col-xs-12">
                        <input type="text" id="text_GroupID" class="form-control max-wide" style="display:none;" autocomplete="off" disabled />
                       <%-- <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-xs-12">
                                <label class="control-label" style="font-size: 13px">Owner :</label>
                            </div>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control max-wide" id="text_Owner">
                                    <option value="">=======Please Select Owner=======</option>
                                    <option value="System Administrative">System Administrative</option>
                                    <option value="Technical Support">Technical Support</option>
                                    <option value="HelpDesk Support">HelpDesk Support</option>
                                </select>
                            </div>
                        </div>--%>
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-12">
                            <Label  class="control-label"  style="font-size: 13px">Main Type</Label>
                            </div>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control max-wide" id="text_Maintype">
                                    <option value="">=======Please Select Maintype=======</option>
                                    <option value="Hardware">Hardware</option>
                                    <option value="Software">Software</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <label class="control-label" style="font-size: 13px">Type Name :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-12"> 
                                <input type="text" id="text_TypeName" class="form-control " style="min-width: 100%" autocomplete="off"  />
                          <%--      <div class="input-group">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default btn_Search_TypeName" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <label class="control-label" style="font-size: 13px">Tag Group :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" id="text_TagGroup" class="form-control " style="min-width: 100%" autocomplete="off" />
                            </div>
                        </div>
                       
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <label class="control-label" style="font-size: 13px">Tag Group Name :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" id="text_TagGroupName" class="form-control " style="min-width: 100%" autocomplete="off"  />
                            </div>
                        </div>
                       
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <label class="control-label" style="font-size: 13px">Status :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <select class="form-control max-wide" id="text_Status">
                                    <option value="">====== Select Status ======</option>
                                    <option value="Active">Active</option>
                                    <option value="InActive">InActive</option>
                                </select>
                            </div>
                        </div>

                       
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <label class="control-label" style="font-size: 13px">Report Seq. :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" id="text_ReportSeq" class="form-control " style="min-width: 100%" autocomplete="off" />
                            </div>
                        </div>
                    </div>
                    </div>

                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <%--Browse New/Edit--%>

     <div class="modal fade" id="ModalTypeName" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-7 col-lg-9 col-sm-12">
                            <h4 class="modal-title">Search Type Name</h4>
                        </div>
                        <div class="col-md-5 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div id="search_box_TypeName">
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <table class="table table-bordered table-responsive">
                        <thead runat="server">
                            <tr>
                                <th>TypeName</th>
                            </tr>
                        </thead>
                        <tbody id='TBodyTypeName'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%--Browse Type Name--%>

    <script>
        $(document).ready(function () {


            var tableGroup = $("#tableGroup").DataTable({
                searching: true,
                responsive: true,
                "order": []
            });

            
            var UserPosition = CheckPermission('ITTAG', 'Maintain Tag Group');
            console.log(UserPosition)
            SetPage(UserPosition)
            if (UserPosition != "") {
                GetTable();
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

            
           
            $(document).on("click", "#btnSearchReport_Group", function () {
                GetTable();
            });
            $(document).on("click", "#btnClearReport_Group", function () {
                //$("#Search_Owner").val('');
                $("#Search_Maintype").val('');
                $("#Search_TypeName").val('');
                $("#Search_Status").val('');
                GetTable();
            });
            //End Search

            //$(".btn_Search_TypeName").on('click', function () {
            //    var search = "";
            //    var clickfrom = $(this).attr('data-type');
            //    if (clickfrom == 'New') {
            //        var button = '<input type="text" id="Modal_TypeName_New" placeholder="Search.." class="form-control max-wide" autocomplete="off">';
            //    } else if (clickfrom = 'Search') {
            //        var button = '<input type="text" id="Modal_TypeName_Search" placeholder="Search.." class="form-control max-wide" autocomplete="off">';
            //    }
            //    $("#search_box_Emp").empty();
            //    $("#search_box_Emp").append(button);
            //    //GetTypeName(search);
            //    $("#ModalTypeName").modal("show");
            //});

            $(document).on("change", "#Modal_TypeName_Search", function () {
                var search = $("#Modal_TypeName_Search").val();
                //GetTypeName_Search(search)
            });
            $(document).on("change", "#Modal_TypeName_New", function () {
                var search = $("#Modal_TypeName_New").val();
                //GetTypeName_New(search)
            });

            $(document).on("click", "#btnModalNew", function () {
                var ID = 0;
                $("#text_GroupID").val(ID);
                //$("#text_Owner").val('');
                $("#text_Maintype").val('');
                $("#text_TypeName").val('');
                $("#text_TagGroup").val('');
                $("#text_TagGroupName").val('');
                $("#text_Status").val('');
                $("#text_ReportSeq").val('');
                $("#text_TagGroup").attr("disabled", false);
                $("#text_Maintype").attr("disabled", false);
                $("#TitleModalGroup").text("New");
                $("#ModalGroup").modal("show");
            });

            $(document).on("click", ".btnModalEdit", function () {
                var ID = $(this).attr('data-id');
                //var Owner =  $(this).closest("tr").find("td:nth-child(1)").text();
                var MainType =  $(this).closest("tr").find("td:nth-child(1)").text();
                var TypeName =  $(this).closest("tr").find("td:nth-child(2)").text();
                var TagGroup =  $(this).closest("tr").find("td:nth-child(3)").text();
                var TagGroupName = $(this).closest("tr").find("td:nth-child(4)").text();
                var Status = $(this).closest("tr").find("td:nth-child(5)").text();
                var ReportSeq = $(this).closest("tr").find("td:nth-child(8)").text();
                $("#text_GroupID").val(ID);
                //$("#text_Owner").val(Owner);
                $("#text_Maintype").val(MainType);
                $("#text_TypeName").val(TypeName);
                $("#text_TagGroup").val(TagGroup);
                $("#text_TagGroupName").val(TagGroupName);
                $("#text_Status").val(Status);
                $("#text_ReportSeq").val(ReportSeq);
                $("#text_TagGroup").attr("disabled", true);
                $("#text_Maintype").attr("disabled", true);
                $("#TitleModalGroup").text("Edit");
                $("#ModalGroup").modal("show");
            });

            $(document).on("click", "#SaveGroup", function () {
                SaveGroup();
            });
            
            function SaveGroup() {
                var ID = $("#text_GroupID").val();
                //var Owner = $("#text_Owner").val();
                var MainType = $("#text_Maintype").val();
                var TypeName = $("#text_TypeName").val();
                var TagGroup = $("#text_TagGroup").val();
                var TagGroupName = $("#text_TagGroupName").val();
                var Status = $("#text_Status").val();
                var ReportSeq = $("#text_ReportSeq").val();
                if (  MainType != "" && TagGroup != ""&& Status !=""  && ReportSeq !="") {
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/SP_IT_TAG_Group") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: ID,  MainType: MainType, TypeName: TypeName, TagGroup: TagGroup
                            , TagGroupName: TagGroupName, Status: Status, ReportSeq: ReportSeq
                        }),
                        success: function (response) {
                            var Msg = response.d;
                            if (Msg == 'Tag Group have owner') {
                                swal('Tag Group have owner', 'มี ITTAG ที่ยัง Active อยู่ในGroupนี้', 'error'); GetTable();
                                $("#ModalGroup").modal("hide");
                            }
                            else if (Msg == 'No Action') {
                                swal('Error', 'TagGroup มีอยู่ในระบบแล้ว', 'error');
                            } else {
                                swal('Complete', 'สร้าง ITTAG Group สำเร็จ', 'success'); GetTable();
                                $("#ModalGroup").modal("hide");
                            }
                            console.log(Msg);
                        }
                    });
                } else {
                      swal('Error', 'กรุณากรอกข้อมูลให้ครบถ้วน', 'error');
                }
            }

            function GetTable() {
                //var Owner = $("#Search_Owner").val();
                var MainType = $("#Search_Maintype").val();
                var TypeName = $("#Search_TypeName").val();
                var Status = $("#Search_Status").val();
                $("#IMGUpload").modal("show");
                tableGroup.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/VW_IT_TAG_Group") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({  MainType: MainType, TypeName: TypeName, Status: Status }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                // [ID],[MainType],[TypeName],[TagGroup],[TagGroupName],[Status],[ReportSeq],[Used],[Total] 
                                var ID = val[0];
                                var MainType = val[1];
                                var TypeName = val[2];
                                var TagGroup = val[3];
                                var TagGroupName = val[4];
                                var Status = val[5];
                                var ReportSeq = val[6];
                                var use = val[7];
                                var Total = val[8] != "" ? val[8] : '0';
                                if (UserPosition == "Admin" || UserPosition == "Worker") {
                                    tableGroup.row.add([
                                        MainType,
                                        TypeName,
                                        TagGroup,
                                        TagGroupName,
                                        Status,
                                        use,
                                        Total,
                                        ReportSeq,
                                        '<td><button class="btn btn-warning  btnModalEdit" data-id="' + ID + '" type="button" >Edit</button></td> ',
                                    ]).draw(false);
                                }
                                else if (UserPosition == "Viewer") {
                                    tableGroup.row.add([
                                        MainType,
                                        TypeName,
                                        TagGroup,
                                        TagGroupName,
                                        Status,
                                        use,
                                        Total,
                                        ReportSeq,
                                        '',
                                    ]).draw(false);
                                }
                            });
                        }
                         $("#IMGUpload").modal("hide");
                    }

                });
            }
            //End Document Ready
        });
    </script>





</asp:Content>
