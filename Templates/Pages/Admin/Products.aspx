<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="CO2Web.Templates.Pages.Admin.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            Load();
            //$('table#productsdisplay tr').on('click', function (event) {
            //    var aData = t.fnGetData( this );
            //    var id = aData[0];
            //    editProduct(id);

            //    //$('#productseditor').fancybox({ type: 'html', content: 'html' }).click();
            //    //$('#productseditor [name=row_id]').val(id);
            //    //$('#productseditor input[type=text]').each(function(idx, elm) {
            //    //    $(elm).val(aData[idx+1]); // 0 == row id
            //    //});
            //});

            //$('table#translationsdisplay tr').on('click', function (event) {
            //    var aData = t.fnGetData( this );
            //    var id = aData[1];
            //    $('#editgroup').val(aData[0]);
            //    $('#editkey').val(aData[1]);
            //    $('#editvalue').val(aData[3]);

            //    $('#dispgroup').html(aData[0]);
            //    $('#dispkey').html(aData[1]);
            //    $('.translationseditor').show();
            //});
        });

        function Load() 
        {

            var aaData = <%= GetDataJson() %>;
            var aoColumns = <%= GetColumnsJson() %>;
            var t = $('table#productsdisplay').dataTable({
                'aaData': aaData,
                'aoColumns': aoColumns,
                'aoColumnDefs': [<%= GetColumnDefsJson() %>],
                'fnDrawCallback': function () { wireEditable(this) }
            });

            wireEditable(t);
        }

        function wireEditable(table) {
            $('table#productsdisplay tr').on('click', function (event) {
                var aData = table.fnGetData( this );
                
                var aPos = table.fnGetPosition( this );
                
                // Get the data array for this row

                var id = aPos;
                editProduct(id);
            });
        }

        function deleteProduct()
        {
            var row = $('#productseditor input[name=row_id]').val();
            if (confirm('Are you sure you want to delete this product? This can\'t be undone'))
            {
                $.get('productsdelete.aspx?id=' + row, null, function() {
                    var table =  $('table#productsdisplay').dataTable();
                    table.fnDeleteRow(row, null, true);
                    alert('<%= Translate("ProductDeleted", "Admin") %>');

                });

            }
            
        }

        function saveProduct()
        {
            var data = $('#productseditor input').serialize();
            var table =  $('table#productsdisplay').dataTable();

            $.post('productssave.aspx', data, function(result) {
                var row = $('#productseditor input[name=row_id]').val(); // find row to update

                if (row) {
                    $('#productseditor input').each(function(idx,elm) {
                        if (elm.name.substring(0, 5) == 'field')
                            table.fnUpdate($(elm).val(), row, elm.name.split('_')[1], false, false); // update table
                    });
                }
                else
                {
                    location.href = 'products.aspx';
                }

                //table.fnDraw();
                
                alert('<%= Translate("ProductSaved", "Admin") %>');
            });

        }

        function editProduct(id) {
            
            

            var url = 'productsedit.aspx' + (id ? '?id=' + id : '');
            $.get(url, null, function (response) {
                $.fancybox('<div id="productseditor">' + response + '</div>', { width: 960, height: 400 });
            });
        }

        //function wireEditable(t)
        //{
        //    $('table#productsdisplay td').editable('/templates/pages/admin/productssave.aspx', {
        //        "callback": function( sValue, y ) {
        //            var aPos = t.fnGetPosition( this );
        //            //t.fnUpdate( sValue, aPos[0], aPos[2] );
        //        },
        //        "submitdata": function ( value, settings ) {
        //            return {
        //                "row_id": t.fnGetData(this.parentNode)[0],
        //                "column": t.fnGetPosition(this)[2]
        //            };
        //        },
        //        "height": "14px",
        //        "onblur": "submit"
        //    });
        //}
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="products">
        <table id="productsdisplay">
        </table>
        <button onclick="editProduct(); return false"><%= Translate("AddProduct", "Admin") %></button>
        <asp:HiddenField ID="DeleteIndex" runat="server" />
    </div>
</asp:Content>
