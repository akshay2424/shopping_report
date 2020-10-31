@extends('app')
@section('content')
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Order Report</h1>
        <!-- <a href="{{url('/company/create')}}" class="d-none d-sm-inline-block btn btn-sm btn-primary"><i class="fas fa-create fa-sm text-white-50">Create Company</i></a> -->
    </div>

    <!-- Content Row -->
    @include('flash::message')
    <div class="card-body">
        <!-- <span>Show/Hide Columns</span><br> -->
        <div class="content-box">
            <div class="row">
                <div class="col-lg-8">
                    <div class="element-wrapper">
                        <h6 class="element-header">
                            Show/Hide Columns
                        </h6>
                        <!-- <input type="checkbox" name='hide_columns[]' value='0'> Name -->
                        <div class="element-box">
                            <div class="form-group row">
                                <div class="col-sm-2">
                                    <div class="form-check">
                                        <label class="form-check-label"><input name='hide_columns[]' value='0' class="form-check-input" checked type="checkbox">User Name</label>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-check">
                                        <label class="form-check-label"><input name='hide_columns[]' value='2' class="form-check-input" checked type="checkbox">Billing Email</label>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-check">
                                        <label class="form-check-label"><input name='hide_columns[]' value='3' class="form-check-input" checked type="checkbox">Billing Name</label>
                                    </div>
                                </div>

                                <div class="col-sm-2">
                                    <div class="form-check">
                                        <label class="form-check-label"><input name='hide_columns[]' value='4' class="form-check-input" checked type="checkbox">Billing Address</label>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-check">
                                        <label class="form-check-label"><input name='hide_columns[]' value='5' class="form-check-input" checked type="checkbox">Billing City</label>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-check">
                                        <label class="form-check-label"><input name='hide_columns[]' value='6' class="form-check-input" checked type="checkbox">Billing Postalcode</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-2">
                                    <div class="form-check">
                                        <label class="form-check-label"><input name='hide_columns[]' value='7' class="form-check-input" checked type="checkbox">Billing phone</label>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-check">
                                        <label class="form-check-label"><input name='hide_columns[]' value='8' class="form-check-input" type="checkbox">Billing Name On Card</label>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-check">
                                        <label class="form-check-label"><input name='hide_columns[]' value='9' class="form-check-input" checked type="checkbox">Billing Discount</label>
                                    </div>
                                </div>

                                <div class="col-sm-2">
                                    <div class="form-check">
                                        <label class="form-check-label"><input name='hide_columns[]' value='10' class="form-check-input" checked type="checkbox">Billing Tax</label>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-check">
                                        <label class="form-check-label"><input name='hide_columns[]' value='11' class="form-check-input" checked type="checkbox">Billing Total</label>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-check">
                                        <label class="form-check-label"><input name='hide_columns[]' value='12' class="form-check-input" type="checkbox">Payment Gateway</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-2">
                                    <div class="form-check">
                                        <label class="form-check-label"><input name='hide_columns[]' value='13' class="form-check-input" type="checkbox">Order Status</label>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-check">
                                        <label class="form-check-label"><input name='hide_columns[]' value='14' class="form-check-input" type="checkbox">Order Date</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="mr-2 mb-2 btn btn-primary btn-rounded" id="but_showhide" type="button"> Show/Hide</button>
                </div>
                <div class="col-lg-4">
                    <div class="element-wrapper">
                        <h6 class="element-header">
                            Date Filter
                        </h6>
                        <!-- <input type="checkbox" name='hide_columns[]' value='0'> Name -->
                        <div class="element-box">
                            <div id="invoice-daterangepicker" class="gymie-range-daterangepicker btn bg-grey-50 daterange-padding no-border color-grey-600 hidden-xs no-shadow" style="background-color: blue; color: aliceblue;">
                                <i class="fa fa-calendar margin-right-10"></i>
                                <span>Select Date Range</span>
                                <i class="fa fa-arrow-down margin-left-5"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- <button class="mr-2 mb-2 btn btn-primary btn-rounded" id="but_showhide" type="button"> Show/Hide</button> -->
            </div>
        </div>
    </div>
    <div class="table-responsive">
        <table class="table table-bordered" id="orderReportTable" width="100%" cellspacing="0">
            <thead>
                <tr>
                    <th>User Name</th>
                    <th>Products</th>
                    <th>Billing Email</th>
                    <th>Billing Name</th>
                    <th>Billing Address</th>
                    <th>Billing city</th>
                    <th>Billing Postalcode</th>
                    <th>Billing phone</th>
                    <th>Billing Name On Card</th>
                    <th>Billing Discount</th>
                    <th>Billing Tax</th>
                    <th>Billing Total</th>
                    <th>Payment Gateway</th>
                    <th>Order Status</th>
                    <th>Order Date</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>

@endsection
@section('footer_scripts')

<link href="https://cdn.datatables.net/buttons/1.6.3/css/buttons.dataTables.min.css" rel="stylesheet" />

<script src="//cdn.datatables.net/buttons/1.6.0/js/dataTables.buttons.min.js"></script>
<script src="//cdn.datatables.net/buttons/1.6.0/js/buttons.flash.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="//cdn.datatables.net/buttons/1.6.0/js/buttons.html5.min.js"></script>
<script src="//cdn.datatables.net/buttons/1.6.0/js/buttons.print.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/fontawesome.min.js" integrity="sha512-i3N2a3sMtKOQHXCJF3qEpce5twcGN9mRsWQe6PUTf9WS/eG5XkivI97uxit7B2nRGz5XuoszBaqndSqxdeVfag==" crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        fetch_data();
        chek_column();

        function fetch_data(start_date, end_date) {
            $('#orderReportTable').DataTable({
                "processing": true,
                "serverSide": true,
                stateSave: true,
                dom: 'Bfrtip',
                "buttons": [
                    'pageLength',
                    {
                        "extend": 'copy',
                        "text": '<i class="fa fa-files-o" style="color: green;"></i>',
                        "titleAttr": 'Copy',
                        "action": newexportaction,
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
                    {
                        "extend": 'excel',
                        "text": '<i class="fa fa-file-excel-o" style="color: green;"></i>',
                        "titleAttr": 'Excel',
                        "action": newexportaction,
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
                    {
                        "extend": 'csv',
                        "text": '<i class="fa fa-file-text-o" style="color: green;"></i>',
                        "titleAttr": 'CSV',
                        "action": newexportaction,
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
                    {
                        "extend": 'pdf',
                        "text": '<i class="fa fa-file-pdf-o" style="color: green;"></i>',
                        "titleAttr": 'PDF',
                        "action": newexportaction,
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
                    {
                        "extend": 'print',
                        "text": '<i class="fa fa-print" style="color: green;"></i>',
                        "titleAttr": 'Print',
                        "action": newexportaction,
                        exportOptions: {
                            columns: ':visible'
                        }
                    }

                ],

                "ajax": {
                    "url": "{{ url('report/order_ajax') }}",
                    "dataType": "json",
                    "type": "POST",
                    "data": {
                        start_date: start_date,
                        end_date: end_date
                    }
                },
                // 'user_id', 'billing_email', 'billing_name', 'billing_address', 'billing_city'
                // , 'billing_postalcode', 'billing_phone', 'billing_name_on_card', 'billing_discount', 'billing_tax', 'billing_total', 'payment_gateway'
                "columns": [
                    {
                        "data": "user_id"
                    },
                    {
                        "data": "products",
                        orderable: false,
                        searchable: false
                    },
                    {
                        "data": "billing_email"
                    },
                    {
                        "data": "billing_name"
                    },
                    {
                        "data": "billing_address"
                    },
                    {
                        "data": "billing_city"
                    },
                    {
                        "data": "billing_postalcode"
                    },
                    {
                        "data": "billing_phone"
                    },
                    {
                        "data": "billing_name_on_card"
                    },
                    {
                        "data": "billing_discount"
                    },
                    {
                        "data": "billing_tax"
                    },
                    {
                        "data": "billing_total"
                    },
                    {
                        "data": "payment_gateway"
                    },
                    {
                        "data": "order_status"
                    },
                    {
                        "data": "created_at"
                    },

                ]
            });
        }

        function newexportaction(e, dt, button, config) {
            var self = this;
            var oldStart = dt.settings()[0]._iDisplayStart;
            dt.one('preXhr', function(e, s, data) {
                // Just this once, load all data from the server...
                data.start = 0;
                data.length = 2147483647;
                dt.one('preDraw', function(e, settings) {
                    // Call the original action function
                    if (button[0].className.indexOf('buttons-copy') >= 0) {
                        $.fn.dataTable.ext.buttons.copyHtml5.action.call(self, e, dt, button, config);
                    } else if (button[0].className.indexOf('buttons-excel') >= 0) {
                        $.fn.dataTable.ext.buttons.excelHtml5.available(dt, config) ?
                            $.fn.dataTable.ext.buttons.excelHtml5.action.call(self, e, dt, button, config) :
                            $.fn.dataTable.ext.buttons.excelFlash.action.call(self, e, dt, button, config);
                    } else if (button[0].className.indexOf('buttons-csv') >= 0) {
                        $.fn.dataTable.ext.buttons.csvHtml5.available(dt, config) ?
                            $.fn.dataTable.ext.buttons.csvHtml5.action.call(self, e, dt, button, config) :
                            $.fn.dataTable.ext.buttons.csvFlash.action.call(self, e, dt, button, config);
                    } else if (button[0].className.indexOf('buttons-pdf') >= 0) {
                        $.fn.dataTable.ext.buttons.pdfHtml5.available(dt, config) ?
                            $.fn.dataTable.ext.buttons.pdfHtml5.action.call(self, e, dt, button, config) :
                            $.fn.dataTable.ext.buttons.pdfFlash.action.call(self, e, dt, button, config);
                    } else if (button[0].className.indexOf('buttons-print') >= 0) {
                        $.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
                    }
                    dt.one('preXhr', function(e, s, data) {
                        // DataTables thinks the first item displayed is index 0, but we're not drawing that.
                        // Set the property to what it was before exporting.
                        settings._iDisplayStart = oldStart;
                        data.start = oldStart;
                    });
                    // Reload the grid with the original page. Otherwise, API functions like table.cell(this) don't work properly.
                    setTimeout(dt.ajax.reload, 0);
                    // Prevent rendering of the full data to the DOM
                    return false;
                });
            });
            // Requery the server with the new one-time export settings
            dt.ajax.reload();
        };

        // Hide & show columns
        $('#but_showhide').click(function() {
            // alert();
            var checked_arr = [];
            var unchecked_arr = [];
            var empDataTable = $('#orderReportTable').DataTable();
            // Read all checked checkboxes
            $.each($('input[type="checkbox"]:checked'), function(key, value) {
                checked_arr.push(this.value);
            });

            // Read all unchecked checkboxes
            $.each($('input[type="checkbox"]:not(:checked)'), function(key, value) {
                unchecked_arr.push(this.value);
            });
            // Hide the checked columns
            empDataTable.columns(checked_arr).visible(true);

            // Show the unchecked columns
            empDataTable.columns(unchecked_arr).visible(false);
        });

        function chek_column() {
            var checked_arr = [];
            var unchecked_arr = [];
            var empDataTable = $('#orderReportTable').DataTable();
            // Read all checked checkboxes
            $.each($('input[type="checkbox"]:checked'), function(key, value) {
                checked_arr.push(this.value);
            });

            // Read all unchecked checkboxes
            $.each($('input[type="checkbox"]:not(:checked)'), function(key, value) {
                unchecked_arr.push(this.value);
            });
            // Hide the checked columns
            empDataTable.columns(checked_arr).visible(true);

            // Show the unchecked columns
            empDataTable.columns(unchecked_arr).visible(false);
        }

        function cb(start, end) {
            $('.gymie-range-daterangepicker span').html(moment(start).format('YYYY-MM-DD') + ' - ' + moment(end).format('YYYY-MM-DD'));
            $('#drp_start').val(moment(start).format('YYYY-MM-DD'));
            $('#drp_end').val(moment(end).format('YYYY-MM-DD'));
            var start_date = moment(start).format('YYYY-MM-DD');
            var end_date = moment(end).format('YYYY-MM-DD');
            // var contest_id = $('#filter').val();
            $('#orderReportTable').DataTable().destroy();

            fetch_data(start_date, end_date);

        }
        $('.gymie-range-daterangepicker').daterangepicker({
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            }
        }, cb);
    });
</script>
@endsection 