<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="CO2Web.Templates.Pages.Upload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="uploadsection">
        <h2>Upload image (600x400)</h2>
        <div class="images">
            <asp:PlaceHolder ID="pcImage" runat="server" />
        </div>
        <div class="admin">
            <asp:FileUpload ID="fuImage" runat="server" />
            <asp:Button ID="btnUploadImage" runat="server" Text="Upload Image" />
        </div>
    </div>
    <div class="uploadsection">
        <h2>Upload thumb image (150x150)</h2>
        <div class="images">
            <asp:PlaceHolder ID="pcThumbs" runat="server" />
        </div>
        <div class="admin">
            <asp:FileUpload ID="fuThumb" runat="server" />
            <asp:Button ID="btnUploadThumb" runat="server" Text="Upload Thumb" />
        </div>
    </div>
    </asp:Content>
