<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="UploadCSV.aspx.cs" Inherits="CO2Web.Templates.Pages.Admin.UploadCSV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="uploadsection">
        <h2><%= Translate("UploadCSV", "Admin") %></h2>
        <div class="admin">
            <asp:FileUpload ID="CSVUpload" runat="server" />
            <asp:Button ID="CSVUploadButton" runat="server" Text="Upload Image" OnClick="CSVButtonUpload_Click" />
            <br/>
            <asp:Literal runat="server" ID="StatusLiteral"></asp:Literal>
        </div>
    </div>

</asp:Content>
