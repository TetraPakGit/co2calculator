<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductsEdit.aspx.cs" Inherits="CO2Web.Templates.Pages.Admin.ProductsEdit" %>
            <input type="hidden" name="row_id" <%= DataValues == null ? "" : "value=\"" + Request["id"] + "\"" %> />
        <% for (int i=1; i < DataFields.Count(); i++) {
              var field = DataFields[i];
               %>
            <p><label for="field_<%= i %>"><%= field %></label>
            <input type="text" name="field_<%= i %>" <%= DataValues == null ? "" : "value=\"" + DataValues[i-1] + "\"" %> /></p>
        <% } %>

        <% if (DataValues != null) { %>
            <button onclick="deleteProduct(); return false;"><%= Translate("Delete", "Admin") %></button>
        <% } %>
            <button style="float: right" onclick="saveProduct(); return false;"><%= Translate("Save", "Admin") %></button>
