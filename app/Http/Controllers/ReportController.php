<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Order;
use Illuminate\Support\Facades\DB;


class ReportController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    
    public function productReport()
    {
        return view('report.product');
    }

    public function productAjax(Request $request)
    {
        $columns = array(
            0 => 'name',
            1 => 'category_id',
            2 => 'image',
            3 => 'description',
            4 => 'amount',
            5 => 'in_stock',
        );
        // 'name', 'category_id', 'image','description','amount','in_stock','status'
        // print_r($request->start_date);die;
        $totalData = Product::count();
        $totalFiltered = $totalData;
        $limit = $request->input('length');
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        if (request()->ajax()) {
            $posts = new Product();

            $posts = $posts->leftJoin('category as ct', 'ct.id', '=', 'products.category_id');

            if (!empty($request->start_date) && !empty($request->end_date)) {
                // print_r($request->start_date."----------"."$request->end_date");die;
                $posts = $posts->whereBetween('products.created_at', [$request->start_date, $request->end_date]);
                $filter =  $posts->count();
                // $posts = $posts->where('country', '=', "in");
                $totalFiltered = $filter;
            }

            $posts = $posts->where('products.status', '=', 1);


            $posts = $posts->select('products.*', 'ct.name as category_id');


            if (!empty($request->input('search.value'))) {
                $search = $request->input('search.value');
                $posts = $posts->Where('products.name', 'LIKE', "%{$search}%")
                    ->orWhere('products.name', 'LIKE', "%{$search}%")
                    ->orWhere('ct.name', 'LIKE', "%{$search}%")
                    ->orWhere('products.amount', 'LIKE', "%{$search}%")
                    ->orWhere('products.description', 'LIKE', "%{$search}%");

                $filter =  $posts->count();
                $totalFiltered = $filter;
            }
            $posts = $posts->where('products.status', 1);
            $posts = $posts->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
        }
        $data = array();

        if (!empty($posts)) {

            foreach ($posts as $post) {
                // 'name', 'category_id', 'image','description','amount','in_stock','status'

                $nestedData['name'] = $post->name;
                $nestedData['category_id'] = $post->category_id;
                $nestedData['image'] = "&emsp;<img src='{$post->image}' width='50px;'>"; //$post->image;
                $nestedData['description'] = $post->description;
                $nestedData['amount'] = $post->amount;
                //<div class="status-pill green" data-title="Complete" data-toggle="tooltip" data-original-title="" title=""></div>
                if ($post->in_stock) {
                    $nestedData['in_stock'] = '&emsp;<div class="status-pill green" data-title="Complete" data-toggle="tooltip" data-original-title="" title=""></div>';
                } else {
                    $nestedData['in_stock'] = '&emsp;<div class="status-pill red" data-title="In Stock" data-toggle="tooltip" data-original-title="" value="In Stock" title="">Out Of Stock</div>';
                }
                $data[] = $nestedData;
            }
        }
        $json_data = array(
            "draw"            => intval($request->input('draw')),
            "recordsTotal"    => intval($totalData),
            "recordsFiltered" => intval($totalFiltered),
            "data"            => $data
        );
        echo json_encode($json_data);
    }

    public function orderReport()
    {
        return view('report.order');
    }

    public function orderAjax(Request $request)
    {
        $columns = array(
            0 => 'user_id',
            1 => 'products', 
            2 => 'billing_email',
            3 => 'billing_name',
            4 => 'billing_address',
            5 => 'billing_city',
            6 => 'billing_postalcode',
            7 => 'billing_phone',
            8 => 'billing_name_on_card',
            9 => 'billing_discount',
            10 => 'billing_tax',
            11 => 'billing_total',
            12 => 'payment_gateway',
            13 => 'order_status',
            14 => 'created_at',
        );

        $totalData = Order::count();
        $totalFiltered = $totalData;
        $limit = $request->input('length');
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        if (request()->ajax()) {
            $posts = new Order();

            $posts = $posts->leftJoin('users as usr', 'usr.id', '=', 'orders.user_id')
                ->join('order_status as ords', 'ords.id', '=', 'orders.order_status');

            if (!empty($request->start_date) && !empty($request->end_date)) {
                // print_r($request->start_date."----------"."$request->end_date");die;
                $posts = $posts->whereBetween('orders.created_at', [$request->start_date, $request->end_date]);
                $filter =  $posts->count();
                // $posts = $posts->where('country', '=', "in");
                $totalFiltered = $filter;
            }

            $posts = $posts->select('orders.*', 'usr.full_name as usr_name', 'ords.name as order_status',DB::raw("DATE_FORMAT(orders.created_at, '%d-%b-%Y') as created_at"));


            if (!empty($request->input('search.value'))) {
                $search = $request->input('search.value');
                $posts = $posts->Where('usr.full_name', 'LIKE', "%{$search}%")
                    ->orWhere('orders.billing_email', 'LIKE', "%{$search}%")
                    ->orWhere('orders.billing_name', 'LIKE', "%{$search}%")
                    ->orWhere('orders.billing_address', 'LIKE', "%{$search}%")
                    ->orWhere('orders.billing_city', 'LIKE', "%{$search}%")
                    ->orWhere('orders.billing_postalcode', 'LIKE', "%{$search}%")
                    ->orWhere('orders.billing_phone', 'LIKE', "%{$search}%")
                    ->orWhere('orders.billing_name_on_card', 'LIKE', "%{$search}%")
                    ->orWhere('orders.billing_discount', 'LIKE', "%{$search}%")
                    ->orWhere('orders.billing_tax', 'LIKE', "%{$search}%")
                    ->orWhere('orders.billing_total', 'LIKE', "%{$search}%")
                    ->orWhere('orders.payment_gateway', 'LIKE', "%{$search}%")
                    ->orWhere('ords.name', 'LIKE', "%{$search}%")
                    ->orWhere('orders.created_at', 'LIKE', "%{$search}%");

                $filter =  $posts->count();
                $totalFiltered = $filter;
            }
            $posts = $posts->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
        }
        $data = array();

        if (!empty($posts)) {

            foreach ($posts as $post) {
                // 'name', 'category_id', 'image','description','amount','in_stock','status'
                $products_list = route('list_products', ['order_id' => $post->id]);
                $nestedData['products'] ="&emsp;<a href='$products_list' class='btn btn-sm btn-info'>Products</a>";// $post->id;
                $nestedData['user_id'] = $post->usr_name;
                $nestedData['billing_email'] = $post->billing_email;
                $nestedData['billing_name'] = $post->billing_name;
                $nestedData['billing_address'] = $post->billing_address;
                $nestedData['billing_city'] = $post->billing_city;
                $nestedData['billing_postalcode'] = $post->billing_postalcode;
                $nestedData['billing_phone'] = $post->billing_phone;
                $nestedData['billing_name_on_card'] = $post->billing_name_on_card;
                $nestedData['billing_discount'] = $post->billing_discount;
                $nestedData['billing_tax'] = $post->billing_tax;
                $nestedData['billing_total'] = $post->billing_total;
                $nestedData['payment_gateway'] = $post->payment_gateway;
                $nestedData['order_status'] = $post->order_status;
                $nestedData['created_at'] = date("d M Y", strtotime($post->created_at));//$post->created_at;

                $data[] = $nestedData;
            }
        }
        $json_data = array(
            "draw"            => intval($request->input('draw')),
            "recordsTotal"    => intval($totalData),
            "recordsFiltered" => intval($totalFiltered),
            "data"            => $data
        );
        echo json_encode($json_data);
    }

    public function listProducts(Request $request)
    {
        $order_id = $request->order_id;
        $data=Order::select('pd.*','op.quantity','ct.name as category_name')
                        ->leftJoin('order_product as op','op.order_id','=','orders.id')
                        ->join('products as pd','pd.id','=','op.product_id')
                        ->join('category as ct','ct.id','=','pd.category_id')
                        ->where('orders.id',$order_id)
                        ->get();
        // print_r($products);die;
        return view('report.product_list',compact('data'));
    }//
}
