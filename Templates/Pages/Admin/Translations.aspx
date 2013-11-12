<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/Templates/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Translations.aspx.cs" Inherits="CO2Web.Templates.Pages.Admin.Translations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var aaData = <%= TableData() %>;
            var t = $('table#translationsdisplay').dataTable({
                'aaData': aaData,
                'aoColumns': [{ 'sTitle': 'Group' }, { 'sTitle': 'Key' }, { 'sTitle': 'Value' }, { 'sTitle': 'HiddenValue' }],
                'aoColumnDefs': [{ 'bVisible': false, 'aTargets': [3] }],
                'fnDrawCallback': function () { wireEditable(this) }
            });

            wireEditable(t);
        });

        function wireEditable(table)
        {
            $('table#translationsdisplay tr').on('click', function (event) {
                var aData = table.fnGetData( this );
                var id = aData[1];
                $('#editgroup').val(aData[0]);
                $('#editkey').val(aData[1]);
                $('#editvalue').val(aData[3]);

                $('#dispgroup').html(aData[0]);
                $('#dispkey').html(aData[1]);
                $('.translationseditor').show();
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="translations">
        <table id="translationsdisplay">
        </table>
    </div>
    <div class="translationseditor">
        <div class="row">
            <label for="dispkey">Key:</label><span id="dispkey"></span>
            <label for="dispgroup">Group:</label><span id="dispgroup"></span>
            <input id="editkey" name="editkey" type="hidden" />
            <input id="editgroup" name="editgroup" type="hidden" />
        </div>
        <div class="row">
            <textarea id="editvalue" name="editvalue"></textarea>
        </div>
        <div class="row">
            <asp:Button ID="btnSave" runat="server" />
        </div>
        
    </div>
</asp:Content>
