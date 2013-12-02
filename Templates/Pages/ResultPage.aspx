<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MasterPages/Web.Master" AutoEventWireup="true" CodeBehind="ResultPage.aspx.cs" Inherits="CO2Web.Templates.Pages.ResultPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="curtain-container">
        <div id="curtain">
            <div class="container">
                <div class="row curtain-header">
                    <div class="span12">
                        <h2><%= Translate("HeaderTitle", "Calculator") %></h2>
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
            </div><!--/.container-->
        </div><!--/#curtain-->
        <div id="curtain-arrow"></div>
    </div><!--/#curtain-container-->

    <div id="content">
        <div class="container">
            <div class="row">
                <div class="span12">
                    <div id="page-header">
                        <div class="breadcrumbs">
                            <asp:PlaceHolder ID="pcCrumb" runat="server" />
<%--                            <a href="#">Calculating CO<sub>2</sub></a> / <a href="#">Tetra Amet</a> / <a href="#">Base</a> / <a href="#">200 ml</a>--%>
                        </div>
                        <a href="javascript:window.print();" class="print-icon" title="Print"></a>
                        <h1 class="no-print-header">Result</h1>
                        <h1 class="print-header">Indicative CO<sub>2</sub> profile</h1>
                    </div>
                    <div class="result-header">
                        <div class="result-img">
                            <img src="<%= ResultImageUrl(CurrentNode) %>" alt="" />
                        </div>
                        <div class="result-flyout">
                            <div class="result-flyout-arrow"></div>
                            <div class="result-flyout-text">
                                <div class="ip">
                                    <%= CurrentNode.ConcatTitle() %><br />
                                    <%= Translate("Volume","Details summary") %>: <%= CurrentNode.Data[2] %> ml<br />
                                    <%= Translate("Opening","Details summary") %>: <%= CurrentNode.Data[3] %><br />
                                    <%= Translate("Package weight","Details summary") %>: <%= CurrentNode.SleevePlusTopWeight  %>g<br />
                                   <asp:PlaceHolder runat="server" ID="CapOpeningPlaceHolder"> <%= Translate("CapOpening","Details summary") %>: <%= CurrentNode.CapOpeningWeight  %>g<br /></asp:PlaceHolder>
                                    <%= Translate("Total weight","Details summary") %>: <%= CurrentNode.TotalWeight  %>g
                                </div>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab1"><%= Translate("PackageGraph","TabTitles") %></a>
                        </li>
                        <li>
                            <a href="#tab2"><%= Translate("ComparativeNumbers","TabTitles") %></a>
                        </li>
                        <li>
                            <a href="#tab3"><%= Translate("Facts","TabTitles") %></a>
                        </li>
                    </ul><!--/.nav-tabs-->
                    <div id="tab1" class="nav-tabs-content row-fluid">
                        <div class="span12 diagram">
                            <div class="ip">
                                <h1 class="print-header"><%= Translate("HeaderTitle","PackageGraph") %></h1>
                                <h2><%= Translate("SubTitle","PackageGraph") %></h2>
                                <div class="row-fluid">
                                    <div class="span3"><%= Translate("RawMaterialForPackageAndOpening","PackageGraph") %>*</div>
                                    <div class="span2"><img src="/Templates/Styles/img/result_circle1.png" alt=""/></div>
                                    <div class="span7">
                                        <div class="graph-container">
                                            <div class="graph graph1" style="width:<%= Percent(CurrentNode.GetGWPRaw(), 140) %>%;">
                                                <img src="/Templates/Styles/img/graph1.gif" alt=""/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span3"><%= Translate("RawMaterialConvertingPackageOpening","PackageGraph") %>*</div>
                                    <div class="span2"><img src="/Templates/Styles/img/result_circle2.png" /></div>
                                    <div class="span7">
                                        <div class="graph-container">
                                            <div class="graph graph1" style="width:<%= Percent(CurrentNode.GetGWPRaw(), 140) %>%;">
                                                <img src="/Templates/Styles/img/graph1.gif" alt="" />
                                            </div>
                                            <div class="graph graph2" style="width:<%= Percent(CurrentNode.GetGWPConv(), 140) %>%;">
                                                <img src="/Templates/Styles/img/graph2.gif" alt="" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-fluid row-bottom row-colors">
                                    <div class="span5">* <%= Translate("IncludingTransports","PackageGraph") %></div>
                                    <div class="span7">
                                        <p><img src="/Templates/Styles/img/graph1.gif" alt="" /><%= CurrentNode.GetGWPRaw() %>g <%= Translate("RawMaterial","PackageGraph") %></p>
                                        <p><img src="/Templates/Styles/img/graph2.gif" alt="" /><%= CurrentNode.GetGWPConv() %>g <%= Translate("ConvertingTopMoulding","PackageGraph") %></p>
                                        <p><em><%= Translate("ResultsToNearestGram","PackageGraph") %></em></p>
                                    </div>
                                </div>
                                <div class="row-fluid row-bottom print-row">
                                    <div class="span12">
                                        <p>The results from our carton CO<sub>2</sub> calculator show the CO<sub>2</sub> footprint of the carton under European conditions up to the moment when the packaging material leaves our factories. An assessment across the full life cycle requires additional data that varies locally, and with each specific product. For example distribution distances vary depending on where each package is filled and sold; some filled packages are stored chilled while others not; some packages will be recycled, others not. The calculated results are not exact; they are indicative and based on a number of simplifications. To get the exact CO<sub>2</sub> footprint of a package you need to know its specific material composition, in which converting factory it was produced and whether raw materials were brought to Tetra Pak by train or truck. We have calculated average factors which are representative for the most common packaging material specifications of our standard beverage cartons (based on sales data 2008). Package specifications and weights vary locally and with product protection requirements. CO<sub>2</sub> footprint data will necessarily change over time as methodologies and data are refined. </p>
                                    </div>
                                </div>
                            </div><!--/.ip-->
                        </div><!--/.span12-->
                    </div><!--/#tab1-->
                    <div id="tab2" class="nav-tabs-content row-fluid">
                        <div class="span12 diagram">
                            <div class="ip">
                                <h1 class="print-header"><%= Translate("HeaderTitle","Comparative") %></h1>
                                <h2><%= Translate("SubTitle","Comparative") %></h2>
                                <div class="row-fluid">
                                    <div class="span4"><%= CurrentNode.ConcatTitle() %></div>
                                    <div class="span8">
                                        <div class="graph-container">
                                            <div class="graph graph1" style="width:<%= Percent(CurrentNode.GetGWPConv() + CurrentNode.GetGWPRaw(), 384) %>%;"><!--14g/384g-->
                                                <img src="/Templates/Styles/img/graph1.gif" alt=""/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span4"><%= Translate("WatchingTV","Comparative") %>*</div>
                                    <div class="span8">
                                        <div class="graph-container">
                                            <div class="graph graph2" style="width:28%;"><!--109g/384g-->
                                                <img src="/Templates/Styles/img/graph2.gif" alt=""/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span4"><%= Translate("DrivingCar","Comparative") %>**</div>
                                    <div class="span8">
                                        <div class="graph-container">
                                            <div class="graph graph3" style="width:41%;"><!--158g/384g-->
                                                <img src="/Templates/Styles/img/graph3.gif" alt=""/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span4"><%= Translate("Dishwasher","Comparative") %>*</div>
                                    <div class="span8">
                                        <div class="graph-container">
                                            <div class="graph graph4" style="width:100%;"><!--384g-->
                                                <img src="/Templates/Styles/img/graph4.gif" alt=""/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-fluid row-colors">
                                    <div class="offset4 span8">
                                        <p><img src="/Templates/Styles/img/graph1.gif" alt="" /><%= CurrentNode.GetGWPConv() + CurrentNode.GetGWPRaw() %>g</p>
                                        <p><img src="/Templates/Styles/img/graph2.gif" alt="" />109g</p>
                                        <p><img src="/Templates/Styles/img/graph3.gif" alt="" />158g</p>
                                        <p><img src="/Templates/Styles/img/graph4.gif" alt="" />384g</p>
                                    </div>
                                </div>
                                <div class="row-fluid row-bottom">
                                    <div class="span12">
                                        <p><em><%= Translate("SubText","Comparative") %></em></p>
                                    </div>
                                </div>
                            </div><!--/.ip-->
                        </div><!--/.span12-->
                    </div><!--/#tab2-->
                    <div id="tab3" class="nav-tabs-content row-fluid">
                        <div class="span12">
                            <div class="ip">
                                <h1 class="print-header"><%= Translate("HeaderTitle","Facts") %></h1>
                                <img src="http://www.tetrapak.com/_layouts/images/TetraPak.CO2Calculator/TV.jpg" class="float-right" alt=""/>
                                <ol>
                                    <li><%= Translate("WatchingTVDescription","Facts") %> <%= Math.Round(109f / CurrentNode.GetGWPTotal()) %> <%= CurrentNode.ConcatTitleWithPerforation() %> *</li>
                                    <li><%= Translate("DrivingCarDescription","Facts") %> <%= Math.Round(158f / CurrentNode.GetGWPTotal()) %> <%= CurrentNode.ConcatTitleWithPerforation() %> **</li>
                                    <li><%= Translate("DishwasherDescription","Facts") %> <%= Math.Round(384f / CurrentNode.GetGWPTotal()) %> <%= CurrentNode.ConcatTitleWithPerforation() %> *</li>
                                    <li><%= Translate("FlightDescription","Facts") %> <%= Math.Round(700000f / CurrentNode.GetGWPTotal()) %> <%= CurrentNode.ConcatTitleWithPerforation() %> ***</li>
                                </ol>
                                <p><em>
                                    <%= Translate("SubText","Facts") %>
                                   </em></p>
                            </div><!--/.ip-->
                            <div class="print-row">
                                <div class="ip">
                                    <p>The results should not be used to support comparative assertions made to the public nor directly for labelling. Any such use would fall outside of the requirements of the relevant ISO standards. The results should not be compared with those generated in the earlier version of the CO<sub>2</sub> calculator. In this updated version, made available February 2010, updates have been made to emission factors and material specifications. The calculations were made with latest (as available November 2009) available industry average data and for European conditions. For production of liquid packaging board and the converting operation, average data as presented by The Alliance for Beverage Cartons and the Environment (www.ace.be) was used, for plastics data as presented by Plastics Europe was used (www.plasticseurope.org), and for aluminium foil data as presented by European Aluminium Association was used (www.eaa.net). The methodology employed is in line with the ISO standard on LCA (ISO 14040 and 14044).</p>
                                </div><!--/.ip-->
                            </div>
                        </div><!--/.span12-->
                    </div><!--/#tab3-->
                </div><!--/.span12-->
            </div><!--/.row-->
        </div><!--/.container-->
        
<%--        <%= CurrentNode.PaperWeight %>|<%= CurrentNode.AluminiumWeight %>|<%= CurrentNode.PlasticWeight %>|<%= CurrentNode.BiobasedWeight %>--%>
    </div><!--/#content-->
</asp:Content>
