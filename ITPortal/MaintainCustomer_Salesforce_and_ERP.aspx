<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MaintainCustomer_Salesforce_and_ERP.aspx.cs" Inherits="ITPortal.MaintainCustomer_Salesforce_and_ERP" %>

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

        .JD-Job_End {
            background-color: #5cb85c;
            color: white;
        }

        .JD-Job_Start {
            background-color: #f0ad4e;
            color: white;
        }

        .sizeAlert {
            font-size: 18px;
        }

        .btn-Excel-dowlaod {
            background-color: #1F7244;
            color: ghostwhite;
            border: none;
        }

            .btn-Excel-dowlaod:hover {
                background-color: #006400;
                color: ghostwhite;
            }

        .btn-PDF-dowlaod {
            background-color: #a30000;
            color: ghostwhite;
            border: none;
        }

            .btn-PDF-dowlaod:hover {
                background-color: #b71c1c;
                color: ghostwhite;
            }

        .not-allowed {
            cursor: text !important;
        }

        .cursor-copy {
            cursor: pointer !important;
        }
    </style>


    <div style="overflow: hidden; width: 0; height: 0;">
        <asp:TextBox runat="server" ID="sns_siteRef" />
        <asp:TextBox runat="server" ID="sns_siteRef_name" />

        <%--End C# Print ITTag--%>
    </div>

    <div class="page-header">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="col-md-8" style="text-align: left; font-size: 30px;">
                    <span>Maintain Customer Salesforce and ERP</span>
                </div>
                <div class="col-md-4" style="text-align: right">
                </div>
            </div>
        </div>

    </div>
    <!----End Header---->

    <div class="panel-group">
        <div class="panel-body">
            <div id="smartwizard">
                <ul>
                    <li class="check" data-step="Step1"><a href="#step-1">Select Company</a></li>
                    <li class="check" data-step="Step2"><a href="#step-2">Export Data From Salesforce</a></li>
                    <li class="check" data-step="Step3"><a href="#step-3">Update Salesforce ID</a></li>
                    <li class="check" data-step="Step4"><a href="#step-4">Export & Import file Customer Information</a></li>
                    <li class="check" data-step="Step5"><a href="#step-5">Complete</a></li>
                </ul>
                <div>
                    <%--======Step 1======--%>
                    <div id="step-1" class="">
                        <div class="panel-group">
                            <div class="panel panel-default" style="margin-top: 1em;">
                                <div class="panel-heading">
                                    <h4>Select Company</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="center">
                                                <label style="font-size: 20px;">Select Company</label>
                                                <select class="form-control center" style="max-width: 30%; margin-top: 2rem; margin-right: auto; margin-left: auto;"
                                                    id="siteRef">
                                                    <option value="">=======Please Select Company=======</option>
                                                    <option value="ERP_PK">PATKOL PUBLIC COMPANY LIMITED</option>
                                                    <option value="ERP_TG">TYGIENIC CO., LTD.</option>
                                                    <option value="ERP_HA">HEATAWAY COMPANY LIMITED</option>
                                                    <option value="ERP_PKM">PATKOL ICE SOLUTIONS CO.,LTD.</option>
                                                </select>
                                                <div style="margin-top: 2rem;">
                                                    <button type="button" class="btn btn-info" style="width: 20rem;" id="nextTOPage_2" disabled>Select</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                    <%--======Step 2======--%>
                    <div id="step-2" class="">
                        <div class="panel-group">
                            <div class="panel panel-default" style="margin-top: 1em;">
                                <div class="panel-heading">
                                    <h4>Export Data From Salesforce</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 1 : เปิดโปรแกรม Data Loader</h4>
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 2.1--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 2 : กดปุ่ม Export ภายในโปรแกรม Data Loader</h4>
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 2.2--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 3 : Log in เข้าระบบ โดยกดปุ่ม
                                                            <button type="button" class="cursor-copy btn btn-info btn_CopyURL">
                                                                <i class="glyphicon glyphicon-copy"></i>
                                                            </button>
                                                        หรือ Copy URL ช่องด้านล่างและนำ URL วางในช่องสำหรับใส่ URL ใน Data Loader</h4>
                                                </div>
                                                <div class="col-md-12">
                                                    <input type="text" class="form-control not-allowed text_CopyURL" style="min-width: 100%" autocomplete="off" disabled />
                                                    <div class="alert alert-success Clipboard_CopyURL" role="alert" style="display: none">
                                                        <a href="#" class="alert-link">Script Copy to Clipboard</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 2.3--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 4 : ทำการเลือก <span style="font-weight: bold;">Object Customer</span> เพื่อทำการ Export ข้อมูล</h4>
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 2.4--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 5 : กดปุ่ม Browse  เพื่อระบุ Path สำหรับ Save file</h4>
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 2.5--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 6 : กด Next เพื่อดำเนินการขั้นต่อไป</h4>
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 2.6--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 7 : กดปุ่ม
                                                            <button type="button" class="cursor-copy btn btn-info" id="btnstep3_7">
                                                                <i class="glyphicon glyphicon-copy"></i>
                                                            </button>
                                                        หรือ Copy Script ช่องด้านล่าง และนำ Script วางในช่องสำหรับใส่ Script ใน Data Loader  </h4>
                                                </div>
                                                <div class="col-md-12">
                                                    <input type="text" id="step3_7" class="form-control not-allowed" style="min-width: 100%" autocomplete="off" disabled />
                                                    <div class="alert alert-success" id="ClipboardStep3_7" role="alert" style="display: none">
                                                        <a href="#" class="alert-link">Script Copy to Clipboard</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 2.7--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 8 : กดปุ่ม Finish เพื่อ Export</h4>
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 2.8--%>
                                    </div>

                                    <div style="text-align: right; margin: 1rem;">
                                        <button id="nextTOPage_3" class="btn btn-warning" type="button"
                                            data-toggle="modal">
                                            Next</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--======Step 3======--%>
                    <div id="step-3" class="">
                        <div class="panel-group">
                            <div class="panel panel-default" style="margin-top: 1em;">
                                <div class="panel-heading">
                                    <h4>Update Salesforce ID</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row" style="margin-bottom: 2rem; margin-top: 2rem;">
                                        <div class="col-md-12">

                                            <div class="col-md-12">
                                                <h3 class="control-label">เลือกไฟล์ Excel (CSV) ที่ได้จากการ Export </h3>
                                            </div>

                                            <div class="col-md-12 center" style="margin-bottom: 2rem;">
                                                <input type="file" class="form-control max-wide " id="Step3_fileUpload" style="/*max-width: 30%; height: 50px; */" />
                                                <%--<button id="ClickStep3_fileUpload" class="btn btn-info" type="button" data-toggle="modal"
                                                            style="min-width: 30%; height: 50px; font-size: 18px; font-weight: bold;">
                                                            Select File</button>--%>
                                            </div>
                                            <div class="col-md-12 center" style="margin-bottom: 2rem;">
                                                <button id="Step3_btnUpdate" class="btn btn-warning" type="button" data-toggle="modal"
                                                    style="min-width: 10%; height: 32px; font-size: 15px; font-weight: bold;">
                                                    Update</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div style="text-align: right; margin: 1rem;">
                                        <button id="nextTOPage_4" class="btn btn-warning" type="button"
                                            data-toggle="modal" disabled>
                                            Next</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--======Step 4======--%>
                    <div id="step-4" class="">
                        <div class="panel-group">
                            <div class="panel panel-default" style="margin-top: 1em;">
                                <div class="panel-heading">
                                    <h4>Export & Import file Customer Information</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">

                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 1 : กดปุ่ม
                                                        <button onclick="Export_Step4_1()" class="btn btn-info" type="button" data-toggle="modal"
                                                            style="min-width: 10%; height: 32px; font-size: 15px; font-weight: bold;">
                                                            Export Excel</button>
                                                       </h4>
                                                </div>

                                                <div class="col-md-12 center">
                                                    <asp:Button ID="Export_Step4_1" runat="server" OnClick="Export_Step4_1_Click" Style="display: none" />

                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 2.1--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 2 : ทำการแปลงสกุลไฟล์ Excel ที่ Export ให้เป็นสกุล CSV(MS-DOS) เท่านั้น  </h4>
                                                    <h4 class="control-label">และ Save File ที่ Y:\5IT\Common\Salesforce Customer Rating </h4>
                                                </div>
                                                <div class="col-md-12" style="margin-left: 6rem">
                                                    <%--<img src="images/Test-1.PNG" />--%>
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 2.2--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 3 : เปิดโปรแกรม Data Loader</h4>
                                                </div>
                                                <div class="col-md-12" style="margin-left: 6rem">
                                                    <%--<img src="images/Test-1.PNG" />--%>
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 2.3--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 4 : กดปุ่ม Update</h4>
                                                </div>
                                                <div class="col-md-12" style="margin-left: 6rem">
                                                    <%--<img src="images/Test-1.PNG" />--%>
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 2.4--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <%--<div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 4 : กดปุ่ม ทำการ log in เข้าระบบ โดยใช้ URL : <a class="control-label" id="step4_3"></a></h4>
                                                </div>
                                                <div class="col-md-12" style="margin-left: 6rem">
                                                </div>
                                            </div>--%>
                                            
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 5 : Log in เข้าระบบ โดยกดปุ่ม
                                                            <button type="button" class="cursor-copy btn btn-info btn_CopyURL">
                                                                <i class="glyphicon glyphicon-copy"></i>
                                                            </button>
                                                        หรือ Copy URL ช่องด้านล่างและนำ URL วางในช่องสำหรับใส่ URL ใน Data Loader</h4>
                                                </div>
                                                <div class="col-md-12">
                                                    <input type="text" class="form-control not-allowed text_CopyURL" style="min-width: 100%" autocomplete="off" disabled />
                                                    <div class="alert alert-success Clipboard_CopyURL" role="alert" style="display: none">
                                                        <a href="#" class="alert-link">Script Copy to Clipboard</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 2.5--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 6 : เลือก Object Customer </h4>
                                                </div>
                                                <div class="col-md-12" style="margin-left: 6rem">
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 2.6--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 7 : กดปุ่ม Browse file เลือก file ที่ Export ออกมาจากระบบ </h4>
                                                </div>
                                                <div class="col-md-12" style="margin-left: 6rem">
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 2.7--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 8 : กด Next เพื่อดำเนินการต่อ </h4>
                                                </div>
                                                <div class="col-md-12" style="margin-left: 6rem">
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 2.8--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 9 : กดปุ่ม Create or Edit a Map เพื่อทำการ Mapping field ให้ตรงกัน </h4>
                                                </div>
                                                <div class="col-md-12" style="margin-left: 6rem">
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 2.9--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 10 : กดปุ่ม Auto-Match Field to Column ระบบจะ Mapping ให้ อัตโนมัติ </h4>
                                                </div>
                                                <div class="col-md-12" style="margin-left: 6rem">
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 4.10--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 11 : กดปุ่ม OK เพื่อยืนยันการ Mapping </h4>
                                                </div>
                                                <div class="col-md-12" style="margin-left: 6rem">
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 4.11--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 12 : กดปุ่ม Next เพื่อดำเนินการต่อ</h4>
                                                </div>
                                                <div class="col-md-12" style="margin-left: 6rem">
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 4.12--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 13 : กดปุ่ม OK เพื่อยืนยันข้อมูลที่จะ อัพเดต</h4>
                                                </div>
                                                <div class="col-md-12" style="margin-left: 6rem">
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 4.13--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 14 : กดปุ่ม Yes เพื่อให้ระบบดำเนินการต่อ</h4>
                                                </div>
                                                <div class="col-md-12" style="margin-left: 6rem">
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 4.14--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 15 : กดปุ่ม Browse เพื่อเลือก Path ให้กับ File log ที่เกิดจากการ Update ข้อมูล</h4>
                                                </div>
                                                <div class="col-md-12" style="margin-left: 6rem">
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 4.15--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 16 : กดปุ่ม Finish เพื่อเริ่มดำเนินการนำข้อมูลเข้าระบบ</h4>
                                                </div>
                                                <div class="col-md-12" style="margin-left: 6rem">
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 4.16--%>
                                        <div class="row" style="margin-bottom: 2rem;">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <h4 class="control-label">Step 17 : หลังอัพเดตเรียบร้อยแล้ว ให้กดปุ่ม OK เพื่อจบการทำงาน</h4>
                                                </div>
                                                <div class="col-md-12" style="margin-left: 6rem">
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Step 4.17--%>

                                        <div style="text-align: right; margin: 1rem;">
                                            <button id="nextTOPage_5" class="btn btn-warning" type="button"
                                                data-toggle="modal">
                                                Next</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--======Step 5======--%>
                    <div id="step-5" class="">
                        <div class="panel-group">
                            <div class="panel panel-default" style="margin-top: 1em;">
                                <div class="panel-heading">
                                    <h4>Complete</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="col-md-12" style="margin: 6rem">
                                            <h1 style="text-align: center;">Complete</h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--======Step 5======--%>
                </div>
            </div>
        </div>
    </div>


    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.13.5/xlsx.full.min.js"></script>
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
        });

        $(document).on("click", "#nextTOPage_2", function () {
            let siteRef = $("#siteRef").val();
            let siteRef_name = $("#siteRef  option:selected").text();

            if (siteRef != "") {
                let textUrl = "";
                let textscript = "";
                if (siteRef == "ERP_PK") {
                    textUrl = "https://patkol.my.salesforce.com/";
                    textscript = "Select Id, ExternalCustomerNumber__c FROM Account WHERE ExternalCustomerNumber__c != 'null' AND Type = 'Customer' ";
                }
                else if (siteRef == "ERP_TG") {
                    textUrl = "https://patkol.my.salesforce.com/";
                    textscript = "Select Id, ExternalCustomerNumber__c FROM Account WHERE ExternalCustomerNumber__c != 'null' AND Type = 'Customer' ";

                }
                else if (siteRef == "ERP_HA") {
                    textUrl = "https://heataway.my.salesforce.com/";
                    textscript = "Select Id, External_Customer_Number__c FROM Account WHERE Account_Type__c = 'Account' ";

                }
                else if (siteRef == "ERP_PKM") {
                    textUrl = "https://patkolpcl2.my.salesforce.com";
                    textscript = "Select Id, ExternalCustomerNumber__c FROM Account WHERE Type = 'Customer' ";

                }
                $("#MainContent_sns_siteRef").val(siteRef);
                $("#MainContent_sns_siteRef_name").val(siteRef_name);
                $(".text_CopyURL").val(textUrl);
                $("#step3_7").val(textscript);

                $('#smartwizard').data('smartWizard')._showStep(1);
            }


        });

        $(document).on("click", "#nextTOPage_3", function () {
            $('#smartwizard').data('smartWizard')._showStep(2);
        });

        $(document).on("click", "#nextTOPage_4", function () {
            $('#smartwizard').data('smartWizard')._showStep(3);
        });

        $(document).on("click", "#nextTOPage_5", function () {
            $('#smartwizard').data('smartWizard')._showStep(4);
            setTimeout(
                swal('Complete', 'อัพเดทข้อมูลเสร็จสิ้น', 'success').then(function () {
                    location.reload();
                }), 5000);
        });

        $(document).on("click", "#ClickStep3_fileUpload", function () {
            $("#Step3_fileUpload").click();
        });

        $(document).on("click", "#btnstep3_7", function () {
            let Clipboard = $("#step3_7").val();
            //alert("Script Copy to Clipboard\n" + Clipboard);
            $("#ClipboardStep3_7").show();
            $('#ClipboardStep3_7').delay(500).fadeOut();
            //document.execCommand(Clipboard);
            navigator.clipboard.writeText(Clipboard);
            console.log(Clipboard)
        });

        $(document).on("click", ".btn_CopyURL", function () {
            let Clipboard = $(".text_CopyURL").val();
            //alert("Script Copy to Clipboard\n" + Clipboard);
            $(".Clipboard_CopyURL").show();
            $('.Clipboard_CopyURL').delay(500).fadeOut();
            //document.execCommand(Clipboard);
            navigator.clipboard.writeText(Clipboard);
            console.log(Clipboard)
        });

        $(document).on("change", "#siteRef", function () {
            let siteRef = $(this).val();
            if (siteRef != "") {
                $("#nextTOPage_2").prop("disabled", false);
            } else {
                $("#nextTOPage_2").prop("disabled", true);
            }
        });


        $(document).on("click", "#Step3_btnUpdate", function () {
            var filecheck = $("#Step3_fileUpload").val();

            $("#IMGUpload").modal("show")
            if (filecheck) {
                var fileUpload = $("#Step3_fileUpload")[0];
                var regex = /(.csv)$/;
                if (regex.test(fileUpload.value.toLowerCase())) {
                    if (typeof (FileReader) != "undefined") {
                        $("#IMGUpload").modal("show");
                        //console.log(fileUpload.files[0]);
                        var reader = new FileReader();
                        //For Browsers other than IE.
                        if (reader.readAsBinaryString) {
                            reader.onload = function (e) {
                                var workbook = XLSX.read(e.target.result, {
                                    type: 'binary'
                                });
                                var firstSheet = workbook.SheetNames[0];
                                //if (firstSheet == "Sheet 1") {
                                READFILE(e.target.result);
                                //$('#smartwizard').data('smartWizard')._showStep(2);
                                $("#nextTOPage_4").prop("disabled", false);
                                //} else {
                                //    swal('Error', 'Please upload correct CSV file', 'error');
                                //}
                            };
                            reader.readAsBinaryString(fileUpload.files[0]);
                        } else {
                            //For IE Browser.
                            reader.onload = function (e) {
                                var data = "";
                                var bytes = new Uint8Array(e.target.result);
                                for (var i = 0; i < bytes.byteLength; i++) {
                                    data += String.fromCharCode(bytes[i]);
                                }
                                var workbook = XLSX.read(data, {
                                    type: 'binary'
                                });
                                var firstSheet = workbook.SheetNames[0];
                                //if (firstSheet == "Sheet 1") {
                                //$('#smartwizard').data('smartWizard')._showStep(2);
                                $("#nextTOPage_4").prop("disabled", false);
                                //} else {
                                //    swal('Error', 'Please upload correct CSV file', 'error');
                                //}
                            };
                            reader.readAsArrayBuffer(fileUpload.files[0]);
                        };
                    } else {
                        swal('Error', 'This browser does not support HTML5.', 'error');
                    }
                } else {
                    console.log('not excel file')
                    swal('Error', 'Please upload CSV file only', 'error');
                }
            } else {
                swal('Error', 'Please upload CSV file Template', 'error');
            }
            $("#IMGUpload").modal("hide")
        });



        function Export_Step4_1() {
            //swal({
            //    title: 'ข้อควรระวัง',
            //    text: "xxxxxx",
            //    icon: 'info',
            //    buttons: {
            //        cancel: true,
            //        confirm: true,
            //    },
            //}).then(function (confirm) {
            //    if (confirm) {

            $("#MainContent_Export_Step4_1").click();
            //    }
            //})
        }


        function READFILE(data) {
            let siteRef = $("#siteRef").val();
            let siteRef_name = $("#siteRef  option:selected").text();

            //Read the Excel File data.
            var workbook = XLSX.read(data, {
                type: 'binary'
            });

            var firstSheet = workbook.SheetNames[0];
            //if (firstSheet == "Sheet 1") {
            //   }

            var excelRows = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[firstSheet]);
            var Array_value = [];
            //console.log(excelRows);
            if (siteRef == "ERP_HA") {
                for (var i = 0; i < excelRows.length; i++) {
                    let Array_Temp = [];
                    let ID = (excelRows[i].ID ? excelRows[i].ID : "");
                    let EXTERNAL_CUSTOMER_NUMBER__C = (excelRows[i].EXTERNAL_CUSTOMER_NUMBER__C ? excelRows[i].EXTERNAL_CUSTOMER_NUMBER__C : "");
                    Array_Temp.push(ID, EXTERNAL_CUSTOMER_NUMBER__C);
                    Array_value.push(Array_Temp);
                }
            } else {
                for (var i = 0; i < excelRows.length; i++) {
                    let Array_Temp = [];
                    let ID = (excelRows[i].ID ? excelRows[i].ID : "");
                    let EXTERNALCUSTOMERNUMBER__C = (excelRows[i].EXTERNALCUSTOMERNUMBER__C ? excelRows[i].EXTERNALCUSTOMERNUMBER__C : "");
                    Array_Temp.push(ID, EXTERNALCUSTOMERNUMBER__C);
                    Array_value.push(Array_Temp);
                }
            }
            console.log(Array_value);
            //Read file

            $.ajax({
                type: "POST",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/DeleteSaleForce_Temp") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ site_ref: siteRef }),
                success: function (response) {

                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/CrateSaleForce_Temp") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Array_value: Array_value, site_ref: siteRef }),
                        success: function (response) {

                                    $.ajax({
                                        type: "POST",
                                        async: false,
                                        url: "<%= ResolveUrl("Default.aspx/SP_SF_UpdateSalesforceID") %>",
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        data: JSON.stringify({ MainComp: siteRef, MainComp_name: siteRef_name }),
                                        success: function (response) {
                                            swal('Update Salesforce ID Complete', 'บันทึกข้อมูลสำเร็จ', 'success');
                                        }
                                    });

                        }
                    });
                }
            });
            // Delete Temp




            

        }


    </script>






</asp:Content>
