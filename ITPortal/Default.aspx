<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ITPortal._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <div class="row">
            <div class=" col-md-12">
                <h2>Home</h2>
            </div>
        </div>
    </div>
    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <%--<div class="col-md-12">
                        <div class="form-group col-md-6">
                            <button type="button" class="btn btn-default btn-block" style="height: 150px; font-size: 24px; font-weight: bold;" onclick="window.location='UpdatePorcessData.aspx'" >Update Process Data</button>
                        </div>
                         <div class="form-group col-md-6">
                            <button type="button" class="btn btn-default btn-block" style="height: 150px; font-size: 24px; font-weight: bold;" onclick="window.location='ConfigReportPermission.aspx'" >ConfigReport Permission</button>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group col-md-6">
                            <button type="button" class="btn btn-default btn-block" style="height: 150px; font-size: 24px; font-weight: bold;" onclick="window.location='SearchUserReportPermission.aspx'" >User Permission</button>
                        </div>
                        <div class="form-group col-md-6">
                            <button type="button" class="btn btn-default btn-block" style="height: 150px; font-size: 24px; font-weight: bold;" onclick="window.location='http://pk-flow/Report_Portal_Application/MaintainDropdown.aspx?site_ref=ERP_PK&Rpt=MaintainDropdown'" >Maintain Dropdown</button>
                        </div>
                         
                    </div>
                    <div class="col-md-12">
                        <div class="form-group col-md-6">
                            <button type="button" class="btn btn-default btn-block" style="height: 150px; font-size: 24px; font-weight: bold;" onclick="window.location='GenerateNewWorkFlow.aspx'" >Generate New WorkFlow </button>
                        </div>
                        <div class="form-group col-md-6">
                         </div>
                    </div>--%>
                </div>
            </div>
            <!--panel-body-->
        </div>
        <!--panel-default-->
    </div>

    
    <script>
        $(document).ready(function () {
            openNav();
        });
    </script>

</asp:Content>
