@extends('app')
@section('content')
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
        <!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
    </div>

    <!-- Content Row -->
    <div class="row">
    
        <!-- No of Orders -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Number Of Orders</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">{{$data['no_of_orders']}}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Total Earnings -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total Earnings</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">${{$data['total_earning']}}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--  No of Items-->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Number Of Items</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">{{$data['no_of_items']}}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Pending Requests Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Number Of Coustomers</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">{{$data['no_of_coustomers']}}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-users fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Content Row -->

    <div class="row">

        <!-- Area Chart -->
        <div class="col-xl-6 col-lg-6">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="chart-area">
                        <canvas id="myAreaChart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-xxxl-6">
            <div class="element-wrapper">
                <h6 class="element-header">
                    New Orders
                </h6>
                <div class="element-box">
                    <div id="invoice-daterangepicker" class="gymie-range-daterangepicker btn bg-grey-50 daterange-padding no-border color-grey-600 hidden-xs no-shadow" style="background-color: blue; color: aliceblue;">
                        <i class="fa fa-calendar margin-right-10"></i>
                        <span>Select Date Range</span>
                        <i class="fa fa-arrow-down margin-left-5"></i>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-lightborder" id="recentOrderTable">
                            <thead>
                                <tr>
                                    <th>
                                        Customer
                                    </th>
                                    <th>
                                        Products
                                    </th>
                                    <th>
                                        Status
                                    </th>
                                    <th>
                                        Total
                                    </th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>



</div>
<!-- /.container-fluid -->
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

        function fetch_data(start_date, end_date) {
            $('#recentOrderTable').DataTable({
                "processing": true,
                "serverSide": true,
                "lengthChange": false,
                searching: false,
                info: false,
                stateSave: true,

                "ajax": {
                    "url": "{{ url('dashboard/recent_orders') }}",
                    "dataType": "json",
                    "type": "POST",
                    "data": {
                        start_date: start_date,
                        end_date: end_date
                    }
                },
                // 'user_id', 'billing_email', 'billing_name', 'billing_address', 'billing_city'
                // , 'billing_postalcode', 'billing_phone', 'billing_name_on_card', 'billing_discount', 'billing_tax', 'billing_total', 'payment_gateway'
                "columns": [{
                        "data": "user_name",
                        orderable: false,
                        searchable: false
                    },

                    {
                        "data": "image",
                        orderable: false,
                        searchable: false
                    },
                    {
                        "data": "order_status",
                        orderable: false,
                        searchable: false

                    },
                    {
                        "data": "billing_total",
                        orderable: false,
                        searchable: false
                    },

                ]
            });
        }

        function cb(start, end) {
            $('.gymie-range-daterangepicker span').html(moment(start).format('YYYY-MM-DD') + ' - ' + moment(end).format('YYYY-MM-DD'));
            $('#drp_start').val(moment(start).format('YYYY-MM-DD'));
            $('#drp_end').val(moment(end).format('YYYY-MM-DD'));
            var start_date = moment(start).format('YYYY-MM-DD');
            var end_date = moment(end).format('YYYY-MM-DD');
            // var contest_id = $('#filter').val();
            $('#recentOrderTable').DataTable().destroy();

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


        // Area Chart 
        var ctx = document.getElementById("myAreaChart");
        var date_arr = @json($data['date_arr']);
        var data_total= @json($data['data_total']);
        var myLineChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: date_arr,
                datasets: [{
                    label: "Earnings",
                    lineTension: 0.3,
                    backgroundColor: "rgba(78, 115, 223, 0.05)",
                    borderColor: "rgba(78, 115, 223, 1)",
                    pointRadius: 3,
                    pointBackgroundColor: "rgba(78, 115, 223, 1)",
                    pointBorderColor: "rgba(78, 115, 223, 1)",
                    pointHoverRadius: 3,
                    pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
                    pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                    pointHitRadius: 10,
                    pointBorderWidth: 2,
                    data: data_total,
                }],
            },
            options: {
                maintainAspectRatio: false,
                layout: {
                    padding: {
                        left: 10,
                        right: 25,
                        top: 25,
                        bottom: 0
                    }
                },
                scales: {
                    xAxes: [{
                        time: {
                            unit: 'date'
                        },
                        gridLines: {
                            display: false,
                            drawBorder: false
                        },
                        ticks: {
                            maxTicksLimit: 7
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            maxTicksLimit: 5,
                            padding: 10,
                            // Include a dollar sign in the ticks
                            callback: function(value, index, values) {
                                return '$' + number_format(value);
                            }
                        },
                        gridLines: {
                            color: "rgb(234, 236, 244)",
                            zeroLineColor: "rgb(234, 236, 244)",
                            drawBorder: false,
                            borderDash: [2],
                            zeroLineBorderDash: [2]
                        }
                    }],
                },
                legend: {
                    display: false
                },
                tooltips: {
                    backgroundColor: "rgb(255,255,255)",
                    bodyFontColor: "#858796",
                    titleMarginBottom: 10,
                    titleFontColor: '#6e707e',
                    titleFontSize: 14,
                    borderColor: '#dddfeb',
                    borderWidth: 1,
                    xPadding: 15,
                    yPadding: 15,
                    displayColors: false,
                    intersect: false,
                    mode: 'index',
                    caretPadding: 10,
                    callbacks: {
                        label: function(tooltipItem, chart) {
                            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                            return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
                        }
                    }
                }
            }
        });
    });
</script>
@endsection 