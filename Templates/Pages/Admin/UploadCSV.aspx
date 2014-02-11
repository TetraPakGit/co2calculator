<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="UploadCSV.aspx.cs" Inherits="CO2Web.Templates.Pages.Admin.UploadCSV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="uploadsection">
        <h2><%= Translate("UploadCSV", "Admin") %></h2>
        <div class="admin">
            <asp:FileUpload ID="CSVUpload" runat="server" />
            <asp:Button ID="CSVUploadButton" runat="server" Text="Upload Image" OnClick="CSVButtonUpload_Click" />&nbsp;<%= Translate("UploadCSVInfo", "Admin") %>
            <br/>
            <asp:Literal runat="server" ID="StatusLiteral"></asp:Literal>
        </div>
        <h2><%= Translate("DownloadCSV", "Admin") %></h2>
        <div class="admin">
            <asp:Button ID="DownloadButton" runat="server" OnClick="DownloadButton_Click"/>
        </div>
    </div>
</asp:Content>
