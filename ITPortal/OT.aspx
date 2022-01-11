<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OT.aspx.cs" Inherits="ITPortal.OT" %>
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

    <div class="page-header">

        <div class="row" style="margin-top:3rem">
            <div class="col-md-4 col-sm-4 col-xs-12">
                <h2 style="text-align: left;">OT Export</h2>
            </div>
            <div class="col-md-8 col-sm-8 col-xs-12" style="margin-top: 1rem;">
                <h3 id="erp_text" style="float:right;">ERP_ID</h3>
                <button class="btn btn-default" style="margin-top: 1rem;margin-right:1rem;float:right;" id="btnSearch" type="button" >
                    <i class="glyphicon glyphicon-search"></i>
                </button>
            </div>
        
        </div>
        
         <%--<asp:Button runat="server" ID="Dowloadtext" class="btn btn-info" OnClick="SaveExcel" Text="Dowload" />--%>
        <%--<button type="button" id="download">Download PK txt</button>
        <button type="button" id="download_TG">Download TG txt</button>
        <button type="button" id="test">Call store</button>--%>
        <div class="container">
            <div class="col-md-12">
                <div class="row">
                    <div id="smartwizard">
                        <ul>
                            <li class="check" data-step="Step1"><a href="#step-1">Import OT</a></li>
                            <%--<li class="check" data-step="Step2"><a href="#step-2">Load Actual</a></li>--%>
                            <li class="check" data-step="Step2"><a href="#step-3">File</a></li>
                        </ul>
                        <div>
                            <div id="step-1" class="">
                                <div class="panel-group">
                                    <div class="panel panel-default" style="margin-top: 1em;">
                                        <div class="panel-body">
                                            <div class="panel-default">
                                                <div class="fileupload fileupload-new" data-provides="fileupload" style="text-align: center; margin: 50px;">
                                                    <span class="btn btn-primary btn-file"><span class="fileupload-new">Select file </span>
                                                        <span class="fileupload-exists">Change</span>
                                                        <input type="file" id="input-file-now1" /></span>
                                                    <span class="fileupload-preview"></span>
                                                    <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none">×</a>
                                                </div>
                                            </div>
                                            <div style="float: right;">
                                                <button type="button" class="btn btn-warning" id="nextStep1" style="display: none">Load <span class="glyphicon glyphicon-open"></span></button>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--<div id="step-2" class="">
                                <div class="panel-body">
                                    <div class="fileupload fileupload-new" data-provides="fileupload" style="text-align: center; margin: 50px;">
                                                <span class="btn btn-primary btn-file"><span class="fileupload-new">Select file </span>
                                            <span class="fileupload-exists">Change</span>
                                            <input type="file" id="input-file-now2" /></span>
                                        <span class="fileupload-preview"></span>
                                        <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none">×</a>
                                    </div>
                                    <div style="float: right;">
                                        <button type="button" class="btn btn-warning" id="nextStep2" style="display: none">Load <span class="glyphicon glyphicon-open"></span></button>
                                    </div>
                                </div>
                            </div>--%>
                            <div id="step-3" class="">
                                <div class="panel-body">
                                    <div style="text-align: center">
                                        <div>
                                            <h1 style="color:green">Download export file</h1>
                                            <div style="text-align:center;">
                                                <asp:Button runat="server" ID="Dowloadtext" class="btn btn-warning" OnClick="PK_Export_Excel" Text="Download" />
                                            </div>
                                            <div style="overflow: hidden; width: 0; height: 0;">
                                                <asp:TextBox runat="server" ID="snssite_ref" />
                                            </div>
                                            <%--<span class="glyphicon glyphicon-duplicate" style="text-align:center;font-size:130px;margin: 30px;"></span>--%>
                                        </div>
                                        <%--<h5 style="color:red">*Dowload Copyfile*</h5>--%>
                                       <%-- <asp:Button runat="server" ID="Dowloadtext" class="btn btn-info" OnClick="Dowloadtext_Click" Text="Dowload" />--%>
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
                            <div style="margin-top:2rem;">
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
    </div>
    <script type="text/javascript">
        $(document).ready(function () {

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
                //$("#MainContent_snssite_ref").val(company_name);
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

            $(document).on("change", "#input-file-now1", function () {
                var file = $("#input-file-now1").val();
                if (file != "") {
                    $('#nextStep1').css('display', 'block');
                }
                else {
                    $('#nextStep1').css('display', 'none');
                }
            });

            $(document).on("click", "#nextStep1", function () {
                var excel = $("#input-file-now1")[0].files[0];
                var extention = excel.name;
                var lastDot = extention.lastIndexOf('.');
                var ext = extention.substring(lastDot + 1);
                var excelExtention = ['xlsx', 'xlsm', 'xlsb', 'xltx', 'xltm', 'xls', 'xlt', 'CSV'];
                if (excel = '') {
                    alert("Plese select files.");
                }
                else if (!excelExtention.includes(ext)) {
                    alert("Plese check files.");
                }
                else {
                    excel = $("#input-file-now1")[0].files[0];
                    LoadFile(excel, "OT");
                }
            });

            
        });

        function LoadFile(data, type) {
            //console.log(data);
            var siteRef = $("#siteRef").val();
            $("#IMGUpload").modal("show");
            var formData = new FormData();
            formData.append('file', data);
            formData.append('name', (data.name).substr((data.name).lastIndexOf('//') + 1).split('.')[0]);
            formData.append('type', type);
            formData.append('siteRef', siteRef);
            $.ajax({
                type: 'post',
                url: './LoadOT.ashx',
                data: formData,
                async: false,
                processData: false,
                contentType: false,
                success: function (status) {
                    //if (siteRef == "ERP_PK") {
                        $.ajax({
                            type: 'post',
                            url: 'Default.aspx/SP_TB_OT_Salesforce_Process',
                            async: false,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ site_ref: siteRef }),
                            success: function (response) {

                        //        $.ajax({
                        //            type: 'post',
                        //            url: 'OT.aspx/PK_Export_Excel_Notepad',
                        //            async: false,
                        //            contentType: "application/json; charset=utf-8",
                        //            dataType: "json",
                        //            data: JSON.stringify({ site_ref: siteRef }),
                        //            success: function (response) {
                        //                console.log("test");
                        //                $.ajax({
                        //                    type: 'post',
                        //                    url: 'Default.aspx/SP_TB_OT_Salesforce_Archive',
                        //                    async: false,
                        //                    contentType: "application/json; charset=utf-8",
                        //                    dataType: "json",
                        //                    data: JSON.stringify({ site_ref: siteRef }),
                        //                    success: function (response) {

                        //                    }
                        //                });

                        //            }
                        //        });
                            }
                        });
                    //}
                    
                    setTimeout(function () {
                        $('#smartwizard').smartWizard("next");
                        $("#IMGUpload").modal("hide");
                    }, 5000);
                },
                error: function () {
                    alert("Whoops something went wrong!");
                }
            });
        }

    !function (e) { var t = function (t, n) { this.$element = e(t), this.type = this.$element.data("uploadtype") || (this.$element.find(".thumbnail").length > 0 ? "image" : "file"), this.$input = this.$element.find(":file"); if (this.$input.length === 0) return; this.name = this.$input.attr("name") || n.name, this.$hidden = this.$element.find('input[type=hidden][name="' + this.name + '"]'), this.$hidden.length === 0 && (this.$hidden = e('<input type="hidden" />'), this.$element.prepend(this.$hidden)), this.$preview = this.$element.find(".fileupload-preview"); var r = this.$preview.css("height"); this.$preview.css("display") != "inline" && r != "0px" && r != "none" && this.$preview.css("line-height", r), this.original = { exists: this.$element.hasClass("fileupload-exists"), preview: this.$preview.html(), hiddenVal: this.$hidden.val() }, this.$remove = this.$element.find('[data-dismiss="fileupload"]'), this.$element.find('[data-trigger="fileupload"]').on("click.fileupload", e.proxy(this.trigger, this)), this.listen() }; t.prototype = { listen: function () { this.$input.on("change.fileupload", e.proxy(this.change, this)), e(this.$input[0].form).on("reset.fileupload", e.proxy(this.reset, this)), this.$remove && this.$remove.on("click.fileupload", e.proxy(this.clear, this)) }, change: function (e, t) { if (t === "clear") return; var n = e.target.files !== undefined ? e.target.files[0] : e.target.value ? { name: e.target.value.replace(/^.+\\/, "") } : null; if (!n) { this.clear(); return } this.$hidden.val(""), this.$hidden.attr("name", ""), this.$input.attr("name", this.name); if (this.type === "image" && this.$preview.length > 0 && (typeof n.type != "undefined" ? n.type.match("image.*") : n.name.match(/\.(gif|png|jpe?g)$/i)) && typeof FileReader != "undefined") { var r = new FileReader, i = this.$preview, s = this.$element; r.onload = function (e) { i.html('<img src="' + e.target.result + '" ' + (i.css("max-height") != "none" ? 'style="max-height: ' + i.css("max-height") + ';"' : "") + " />"), s.addClass("fileupload-exists").removeClass("fileupload-new") }, r.readAsDataURL(n) } else this.$preview.text(n.name), this.$element.addClass("fileupload-exists").removeClass("fileupload-new") }, clear: function (e) { this.$hidden.val(""), this.$hidden.attr("name", this.name), this.$input.attr("name", ""); if (navigator.userAgent.match(/msie/i)) { var t = this.$input.clone(!0); this.$input.after(t), this.$input.remove(), this.$input = t } else this.$input.val(""); this.$preview.html(""), this.$element.addClass("fileupload-new").removeClass("fileupload-exists"), e && (this.$input.trigger("change", ["clear"]), e.preventDefault()) }, reset: function (e) { this.clear(), this.$hidden.val(this.original.hiddenVal), this.$preview.html(this.original.preview), this.original.exists ? this.$element.addClass("fileupload-exists").removeClass("fileupload-new") : this.$element.addClass("fileupload-new").removeClass("fileupload-exists") }, trigger: function (e) { this.$input.trigger("click"), e.preventDefault() } }, e.fn.fileupload = function (n) { return this.each(function () { var r = e(this), i = r.data("fileupload"); i || r.data("fileupload", i = new t(this, n)), typeof n == "string" && i[n]() }) }, e.fn.fileupload.Constructor = t, e(document).on("click.fileupload.data-api", '[data-provides="fileupload"]', function (t) { var n = e(this); if (n.data("fileupload")) return; n.fileupload(n.data()); var r = e(t.target).closest('[data-dismiss="fileupload"],[data-trigger="fileupload"]'); r.length > 0 && (r.trigger("click.fileupload"), t.preventDefault()) }) }(window.jQuery)
    </script>
</asp:Content>
