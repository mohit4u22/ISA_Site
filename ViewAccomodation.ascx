<%@ Control Language="C#" ClassName="ViewAccomodation" %>

<script runat="server">

</script>
<script src="js/footable.js?v=2-0-1" type="text/javascript"></script>
<script src="js/footable.sort.js?v=2-0-1" type="text/javascript"></script>
<script src="js/footable.filter.js?v=2-0-1" type="text/javascript"></script>
<script src="js/footable.paginate.js?v=2-0-1" type="text/javascript"></script>
<link rel="stylesheet" href="css/footable.core.css" />
<link rel="stylesheet" href="css/footable.standalone.css" />



<div class="tab-pane active" id="demo">
    <p>
        Search:
                <input id="Accomodationfilter" type="text" />
        <%-- Status:
                <select class="filter-status">
                    <option></option>
                    <option value="active">Active</option>
                    <option value="disabled">Disabled</option>
                    <option value="suspended">Suspended</option>
                </select>--%>
        <a href="#clear" class="clear-filter" title="clear filter">[clear]</a>
        <span class="row-count"></span>
    </p>
    <table id="tblViewAccomodation" class="table demo" data-filter="#Accomodationfilter" data-page-size="5" data-page-navigation=".pagination">
        <thead>
            <tr>
                <th data-toggle="true">Name
                </th>
                <th>Email
                </th>
                <th data-hide="phone" data-name="Phone Number">Phone
                </th>
                <th data-hide="phone">Arrival
                </th>
                <th data-hide="phone">Time
                </th>
                <th>Concerned&nbsp;User
                </th>

            </tr>
        </thead>
        <tbody>
        </tbody>
        <tfoot >
            <tr>
                <td colspan="6">
                    <div class="pagination pagination-centered hide-if-no-paging"></div>
                </td>
            </tr>
        </tfoot>
    </table>
</div>


<script type="text/javascript">
    $(function () {
        $('#tblViewAccomodation').footable({
            bookmarkable: { enabled: true }
        }).bind({
            'footable_filtering': function (e) {
                var selected = $('.filter-status').find(':selected').text();
                if (selected && selected.length > 0) {
                    e.filter += (e.filter && e.filter.length > 0) ? ' ' + selected : selected;
                    e.clear = !e.filter;
                }
            },
            'footable_filtered': function () {
                var count = $('table.demo tbody tr:not(.footable-filtered)').length;
                $('.row-count').html(count + ' rows found');
            }
        });

        $('.clear-filter').click(function (e) {
            e.preventDefault();
            $('.filter-status').val('');
            $('table.demo').trigger('footable_clear_filter');
            $('.row-count').html('');
        });

        $('.filter-status').change(function (e) {
            e.preventDefault();
            $('table.demo').data('footable-filter').filter($('#Accomodationfilter').val());
        });
    });


    function PopulateAccomodationGrid() {

        $.ajax({
            type: "Get",
            url: "../WebService.asmx/RetrieveAccomodationData",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.d.length > 0) {
                    var obj = JSON.parse(result.d);
                    var txthtml = '';
                    $.each(obj, function (i, item) {
                        txthtml += '<tr>';
                        txthtml += '<td>' + item.Firstname + '&nbsp;' + item.Lastname + '</td>';
                        txthtml += '<td>' + item.Email + '</td>';
                        txthtml += '<td>' + item.Phone + '</td>';
                        txthtml += '<td>' + item.Arrivaldate + '&nbsp;' + item.Time + '</td>';
                        txthtml += '<td>' + item.Time + '</td>';
                        if (item.ConcernedUser != undefined && item.ConcernedUser != null)
                            txthtml += '<td>' + item.ConcernedUser + '</td>';
                        else
                            txthtml += '<td>N/A</td>';
                        txthtml += '</tr>';

                    });
                    $('#tblViewAccomodation tbody').html('');
                    $('#tblViewAccomodation tbody').append(txthtml).trigger('footable_redraw');

                    setTimeout(function () {
                        $.magnificPopup.open({
                            items: {
                                src: $('#small-dialog-accomodation-Grid'), // can be a HTML string, jQuery object, or CSS selector
                                type: 'inline'
                            },
                            fixedContentPos: false,
                            fixedBgPos: true,
                            overflowY: 'auto',
                            closeBtnInside: true,
                            preloader: false,
                            midClick: true,
                            removalDelay: 300,
                            mainClass: 'my-mfp-zoom-in'
                        });
                    }, 500);



                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // alert(jqXHR.responseText);
            }
        });




    }
</script>

