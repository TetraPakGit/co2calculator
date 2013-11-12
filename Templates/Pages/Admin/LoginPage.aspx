<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="CO2Web.Templates.Pages.Admin.LoginPage" %>
<%@ Import Namespace="CO2Web.Library" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:PlaceHolder ID="LoginPlaceHolder" runat="server">
            <%= Translate("Password", "Login") %>
            <asp:TextBox ID="PasswordTextBox" runat="server"></asp:TextBox>
            <asp:Button ID="LoginButton" runat="server" OnClick="LoginButton_Click" />
            <asp:Literal ID="WrongPasswordLiteral" runat="server"></asp:Literal>
        </asp:PlaceHolder>    
        <asp:PlaceHolder ID="LoggedInPlaceHolder" runat="server" Visible="False">
            Jacek

        </asp:PlaceHolder>
    </div>
    <div>
                <asp:Button ID="SaveButton" runat="server" OnClick="SaveButton_Click" />
                <asp:GridView ID="ProductGridView" runat="server" AutoGenerateEditButton="True" AllowCustomPaging="True" OnRowEditing="ProductGridView_Editing" AllowPaging="false" OnRowUpdating="ProductGridView_Updating" >
                </asp:GridView>

    </div>
</asp:Content>
