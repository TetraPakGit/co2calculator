<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MasterPages/Web.Master" AutoEventWireup="true" CodeBehind="StartPage.aspx.cs" Inherits="CO2Web.Templates.Pages.StartPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="curtain-container" class="curtain-start-page">
        <div id="curtain">
            <div class="container">
                <div class="row curtain-header">
                    <div class="span12">
                        <h2 class="no-click">Calculating CO2 for a Tetra Pak Carton</h2>
                        <a href="#" class="close-curtain" title="Close"></a>
                    </div><!--/.span12-->
                </div><!--/.row-->
                <div class="row curtain-text">
                    <div class="span12">
                        <div class="columns">
                            <div class="ip">
                                <%= Translate("Contents", "Top info panel") %>
                            </div>
                        </div>
                    </div><!--/.span12-->
                </div><!--/.row-->
                <div class="row curtain-btn">
                    <div class="span12">
                        <a href="ImagePage.aspx" class="btn btn-large">Go to calculator</a>
                    </div><!--/.span12-->
                </div><!--/.row-->
            </div><!--/.container-->
        </div><!--/#curtain-->
        <div id="curtain-arrow"></div>
    </div><!--/#curtain-container-->
</asp:Content>