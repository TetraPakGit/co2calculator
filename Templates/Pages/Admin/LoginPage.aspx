<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="CO2Web.Templates.Pages.Admin.LoginPage" %>
<%@ Import Namespace="CO2Web.Library" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:PlaceHolder ID="LoginPlaceHolder" runat="server">
            <%= Translate("Username", "Login") %>
            <asp:TextBox ID="UsernameTextBox" runat="server"></asp:TextBox>
            <%= Translate("Password", "Login") %>
            <asp:TextBox ID="PasswordTextBox" runat="server"></asp:TextBox>
            <asp:Button ID="LoginButton" runat="server" OnClick="LoginButton_Click" />
            <asp:Literal ID="WrongPasswordLiteral" runat="server"></asp:Literal>
        </asp:PlaceHolder>    
    </div>
</asp:Content>
