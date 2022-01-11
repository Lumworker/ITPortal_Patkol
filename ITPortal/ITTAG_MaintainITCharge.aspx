<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ITTAG_MaintainITCharge.aspx.cs" Inherits="ITPortal.ITTAG_MaintainITCharge" %>

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
            <div class="col-md-6" style="text-align: left;">
            <h2>Maintain IT TAG Charge</h2>
            </div>

            <div class="col-md-6" style="text-align: right">
                <%--<button id="btnModalNew" class="btn btn-info" type="button" data-toggle="modal">New </button>--%>
                <button id="btnModalNew" class="btn btn-success Pos_Worker" type="button" data-toggle="modal" style="float: right">New </button>
            </div>
        </div>
    </div>

    <div class="panel-group">
        <!--panel-default-->
        <div class="panel panel-default" style="margin-top: 1em;" id="divDataTable">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered table-responsive center" style="width: 100%" id="tableCharge">
                                <thead>
                                    <tr>
                                        <th>Tag Group</th>
                                        <th>Tag Group Name</th>
                                        <th>Main Type</th>
                                        <th>Charge1</th>
                                        <th>Charge2</th>
                                        <th>Charge3</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="ListCharge">
                                    <tr>
                                        <td>Tag Group</td>
                                        <td>Tag Group Name</td>
                                        <td>Main Type</td>
                                        <td>Charge1</td>
                                        <td>Charge2</td>
                                        <td>Charge3</td>
                                        <td><button class="btn btn-warning  btnModalEdit" data-id="' + ID + '" type="button" >Edit</button></td>
                                    </tr>
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

     <div class="modal fade" id="ModalCharge" role="dialog">
        <div class="modal-dialog modal-xs">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em; ">
                        <div class="col-md-7 col-sm-12">
                            <h4 class="modal-title"><span id="TitleModalCharge"></span> : ITTag Charge</h4>
                        </div>
                        <div class="col-md-5 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-success Pos_Worker" id="SaveCharge" >Save</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    
                    <div class="row">
                   <div class="col-md-12 col-sm-12 col-xs-12">
                        <input type="text" id="text_ChargeID" class="form-control max-wide" style="display:none;"  autocomplete="off" disabled />
                        
                           <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <label class="control-label" style="font-size: 13px">Tag Group :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="text_TagGroup" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" data-type="TagGroup">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <label class="control-label" style="font-size: 13px">Tag Group Name :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" id="text_TagGroupName" class="form-control " style="min-width: 100%" autocomplete="off" disabled />
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <label class="control-label" style="font-size: 13px">Main Type :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-12"> 
                                <input type="text" id="text_Maintype" class="form-control " style="min-width: 100%" autocomplete="off" disabled />
                          
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <label class="control-label" style="font-size: 13px">Charge 1 :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-12"> 
                                <input type="text" id="text_Charge1" class="form-control "   pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" style="min-width: 100%" autocomplete="off"  />
                          
                            </div>
                        </div>
                       <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <label class="control-label" style="font-size: 13px">Charge 2 :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-12"> 
                                <input type="text" id="text_Charge2" class="form-control "  pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency"  style="min-width: 100%" autocomplete="off"  />
                          
                            </div>
                        </div>
                       <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <label class="control-label" style="font-size: 13px">Charge 3 :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-12"> 
                                <input type="text" id="text_Charge3" class="form-control "  pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" style="min-width: 100%" autocomplete="off"  />
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
            

            var tableCharge = $("#tableCharge").DataTable({
                searching: true,
                responsive: true,
                "order": []
            });
            //GetTable();
            
            var UserPosition =  CheckPermission('ITTAG', 'Maintain IT Charge');
            console.log(UserPosition)
             if (UserPosition != "") {
                GetIT_TAG_Charge();
                SetinputCurrency();
                SetPage(UserPosition) 
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



            $(document).on("click", "#btnModalNew", function () {
                
                $("#text_ChargeID").val(0);
                $("#text_TagGroup").val('');
                $("#text_TagGroupName").val('');
                $("#text_Maintype").val('');
                $("#text_Charge1").val('');
                $("#text_Charge2").val('');
                $("#text_Charge3").val('');
                $("#TitleModalCharge").text("New");
                $(".Browse_modal").attr("disabled", false);
                $("#ModalCharge").modal("show");
            });


            $(document).on("click", ".btnModalEdit", function () {
                var ID = $(this).attr('data-id');
                var TagGroup =  $(this).closest("tr").find("td:nth-child(1)").text();
                var TagGroupName =  $(this).closest("tr").find("td:nth-child(2)").text();
                var MainType =  $(this).closest("tr").find("td:nth-child(3)").text();
                var Charge1 =  $(this).closest("tr").find("td:nth-child(4)").text();
                var Charge2 =  $(this).closest("tr").find("td:nth-child(5)").text();
                var Charge3 = $(this).closest("tr").find("td:nth-child(6)").text();
                $("#text_ChargeID").val(ID);
                $("#text_TagGroup").val(TagGroup);
                $("#text_TagGroupName").val(TagGroupName);
                $("#text_Maintype").val(MainType);
                $("#text_Charge1").val(Charge1);
                $("#text_Charge2").val(Charge2);
                $("#text_Charge3").val(Charge3);
                $(".Browse_modal").attr("disabled", true);
                $("#TitleModalCharge").text("Edit");
                $("#ModalCharge").modal("show");
            });


            $(document).on("click", ".Browse_modal", function () {
                var fragment = '';
                var fragmentHeader = '';
                var Type = $(this).attr("data-type");

                $("#Titlebrowse").text(Type);
                $("#TBbodyBrowse").empty();
                $("#TBheaderBrowse").empty();
                $("#search_box").empty();
                $("#search_box").append('<input type="text" id="' + Type + '" placeholder="Search.." class="form-control max-wide" autocomplete="off">');

                if (Type == 'TagGroup') {
                    fragmentHeader = `<th>Tag Group</th>
                                     <th>Tag Group Name</th>
                                    <th>Main Type</th>`;
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/TB_IT_TAG_Group") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Owner: '', MainType: '', TypeName: '', Status: '' }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
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
                }//End BrowseTagGroup

                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });
            $(document).on("change", "#TagGroup", function () {
                var fragment = '';
                var search = $("#TagGroup").val();
                $("#TBbodyBrowse").empty();
                $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/TB_IT_TAG_Group") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Owner: '', MainType: '', TypeName: search, Status: '' }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
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
                          $("#TBbodyBrowse").append(fragment);
                        }
                });
                
            });


            $(document).on("click", ".clickselecttext_TagGroup", function () {
                var text_TagGroup = $(this).closest("tr").find("td:nth-child(1)").text();
                var TagGroupName = $(this).closest("tr").find("td:nth-child(2)").text();
                var Maintype = $(this).closest("tr").find("td:nth-child(3)").text();
                $("#text_TagGroup").val(text_TagGroup);
                $("#text_TagGroupName").val(TagGroupName);
                $("#text_Maintype").val(Maintype);
                $("#modalBrowseSearch").modal("hide");
            });


             $(document).on("click", "#SaveCharge", function () {
                SaveCharge();
            });
            
            function SaveCharge() {
                var ID = $("#text_ChargeID").val();
                var TagGroup = $("#text_TagGroup").val();
                var MainType = $("#text_TagGroupName").val();
                var TypeName = $("#text_Maintype").val();
                var Charge1 = $("#text_Charge1").val();
                var Charge2 = $("#text_Charge2").val();
                var Charge3 = $("#text_Charge3").val();
                
                var Charge1 = removeCurrency(Charge1)
                var Charge2 = removeCurrency(Charge2)
                var Charge3 = removeCurrency(Charge3)

                if (TagGroup != "" && Charge1 != "" && Charge2 != "" && Charge3 != "") {
                    console.log(ID)
                    console.log(TagGroup)
                    console.log(MainType)
                    console.log(TypeName)
                    console.log(Charge1)
                    console.log(Charge2)
                    console.log(Charge3)
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/SP_IT_TAG_Charge") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: ID, Tag_Group: TagGroup, Charge1: Charge1, Charge2: Charge2, Charge3: Charge3
                        }),
                        success: function (response) {
                            var Msg = response.d;
                            //if (Msg == 'No Action') {
                            //    alert('TagGroup มีอยู่ในระบบแล้ว')
                            //} else {
                            //    alert('Complete')
                            //}
                            //GetTable();
                            swal("บันทึกรายการเสร็จสิ้น", "", "success")
                            GetIT_TAG_Charge();
                            $("#ModalCharge").modal("hide");
                        }

                    });
                } else {
                    swal('Error', 'กรุณากรอกข้อมูลให้ครบถ้วน', 'error');
                }
               
            }

            function GetIT_TAG_Charge() {
                $("#IMGUpload").modal("show");
                tableCharge.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GetIT_TAG_Charge") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[ID],[Tag_Group],[Charge1],[Charge2],[Charge3][TagGroupName],[MainType]
                                var ID = val[0];
                                var Tag_Group = val[1];
                                var Charge1 = val[2];
                                var Charge2 = val[3];
                                var Charge3 = val[4];
                                var TagGroupName = val[5];
                                var MainType = val[6];
                                if (UserPosition == "Admin" || UserPosition == "Worker") {
                                    
                                tableCharge.row.add([
                                    Tag_Group,
                                    TagGroupName,
                                    MainType,
                                    Charge1,
                                    Charge2,
                                    Charge3,
                                    '<td><button class="btn btn-warning  btnModalEdit Pos_Worker" data-id="' + ID + '" type="button" >Edit</button></td> '
                                ]).draw(false);
                                } else {
                                tableCharge.row.add([
                                    Tag_Group,
                                    TagGroupName,
                                    MainType,
                                    Charge1,
                                    Charge2,
                                    Charge3,
                                    ''
                                ]).draw(false);
                                }
                            });
                        }
                        $("#IMGUpload").modal("hide");
                    }
                });
            }

        });
        //End Document Ready
        
    function SetinputCurrency() {
            $("input[data-type='currency']").on({
                keyup: function () {
                    formatCurrency($(this));
                },
                blur: function () {
                    formatCurrency($(this), "blur");
                }
            });
        }
        function removeCurrency(text) {
            return text.replace(/,/g, '');
        }

    </script>



</asp:Content>
