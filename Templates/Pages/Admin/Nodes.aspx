<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Nodes.aspx.cs" Inherits="CO2Web.Templates.Pages.Admin.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div style="float: left; width: 200px;">
                <asp:TreeView ID="tree" runat="server" />
            </div>
            <div style="float: left; width: 600px;">
                <div class="row">
                    <asp:Label AssociatedControlID="txtTitle" runat="server" />
                    <asp:TextBox ID="txtTitle" runat="server" />
                </div>
                <div class="row">
                    <asp:Label ID="Label1" AssociatedControlID="fuImageUpload" runat="server" />
                    <asp:Image ID="imgImage" runat="server" />
                    <asp:FileUpload ID="fuImageUpload" runat="server" />
                </div>
                <div class="row">
                    <asp:Button ID="btnSave" runat="server" Text="Save" />
                    <asp:Button ID="btnAddChild" runat="server" Text="Add child" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
