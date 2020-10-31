@extends('app')
@section('content')
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Product List</h1>
        <a href="{{route('order_report')}}" class="d-none d-sm-inline-block btn btn-sm btn-danger"><i class="fas fa-create fa-sm text-white-100"> Back</i></a>

    </div>

    <!-- Content Row -->
    @include('flash::message')
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Image</th>
                        <th>Description</th>
                        <th>Amount</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($data as $product)
                    <tr>
                        <td>{{$product['name']}}</td>
                        <td>{{$product['category_name']}}</td>
                        <td><img src="{{$product['image']}}" width='50px;'></td>
                        <td>{{$product['description']}}</td>
                        <td>{{$product['amount']}}</td>
                        <td>{{$product['quantity']}}</td>
                    </tr>
                    @endforeach

                </tbody>
            </table>
        </div>
    </div>

</div>
@endsection 