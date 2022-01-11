<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ITPortal.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    


    <input type="file" class="form-control max-wide" id="fileUpload" />



    <button id="Upload" class="btn btn-warning" type="button"
        data-toggle="modal">
        Next</button>





    <script>

        $(document).ready(function () {

            $(document).on("click", "#Upload", function () {
                var fileUpload = $("#fileUpload")[0];
                LoadFile(fileUpload.files[0]);
            });
        });
        function LoadFile(data) {
            var formData = new FormData();
            formData.append('file', data);
            formData.append('name', (data.name).substr((data.name).lastIndexOf('//') + 1).split('.')[0]);
            formData.append('site_ref', 'ERP_PK');
            $.ajax({
                type: 'post',
                url: './LoadExcel_ToolTagChageStatus.ashx',
                data: formData,
                async: false,
                processData: false,
                contentType: false,
                success: function (status) {
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
    </script>

</asp:Content>
