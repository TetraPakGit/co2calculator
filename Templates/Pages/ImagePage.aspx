<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MasterPages/Web.Master" AutoEventWireup="true" CodeBehind="ImagePage.aspx.cs" Inherits="CO2Web.Templates.Pages.ImagePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--    <script type="text/javascript">
        co2data = <%= GetNodesJson() %>;
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="curtain-container">
        <div id="curtain">
            <div class="container">
                <div class="row curtain-header">
                    <div class="span12">
                        <h2><%= Translate("HeaderTitle", "Calculator") %></h2>
                        <a href="#" class="close-curtain" title="Close"></a>
                        <a href="#" class="open-curtain" title="Open"><%= Translate("MoreInfo", "Calculator") %></a>
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
                        </div>
                        <a href="#" class="info-icon"></a>
                        <div class="info-flyout">
                            <div class="info-flyout-text">
                                <div class="ip">
                                    Tip! To see what type of package you have, check the underneath and see what is printed on one of the flaps. For Tetra Rex, please check whether the package has aluminuim foil on the inside.
                                </div>
                            </div>
                            <div class="info-flyout-arrow"></div>
                        </div>
                        <h1><%= CurrentNode == null ? Translate("Gallery title 1", "Gallery") : Translate("Gallery title " + (CurrentNode.ID.Split(new string[] {"---"}, StringSplitOptions.None).Count() + 1), "Gallery") %></h1>
                    </div>
                    <div id="slider" class="flexslider">
                        <ul class="slides">
                            <asp:Repeater ID="fxSlides" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <a href="<%# (Container.DataItem as CO2Web.Library.Node).Nodes.Count > 0 ? "?id=" + (Container.DataItem as CO2Web.Library.Node).ID : "resultpage.aspx?id=" + (Container.DataItem as CO2Web.Library.Node).ID %>">
                                            <img src="<%# ImageUrl((Container.DataItem as CO2Web.Library.Node)) %>" alt="<%# (Container.DataItem as CO2Web.Library.Node).Title %>" />
                                            
                                            <h2 class="flex-caption"><%# (Container.DataItem as CO2Web.Library.Node).Title %></h2>
                                        </a>
                                        <div class="btn-container">
                                            <a href="<%# (Container.DataItem as CO2Web.Library.Node).Nodes.Count > 0 ? "?id=" + (Container.DataItem as CO2Web.Library.Node).ID : "resultpage.aspx?id=" + (Container.DataItem as CO2Web.Library.Node).ID %>" class="btn btn-large">
                                                Choose <%# (Container.DataItem as CO2Web.Library.Node).Title %></a></div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                    <div id="carousel" class="flexslider">
                        <ul class="slides">
                            <asp:Repeater ID="fxCarousel" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <img src="<%# ThumbUrl((Container.DataItem as CO2Web.Library.Node)) %>" alt="<%# (Container.DataItem as CO2Web.Library.Node).Title %>" />
                                        <p class="flex-caption"><%# (Container.DataItem as CO2Web.Library.Node).Title %></p>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div><!--/.span12-->
            </div><!--/.row-->
        </div><!--/.container-->
    </div><!--/#content-->

</asp:Content>
