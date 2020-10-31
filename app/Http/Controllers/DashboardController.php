<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Order;
use App\Product;
use App\User;
use Illuminate\Support\Facades\DB;


class DashboardController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $data=[];
        $data['no_of_orders'] = Order::count();
        $data['total_earning'] = order::sum('billing_total');
        $data['no_of_items'] = Product::count();
        $data['no_of_coustomers'] = User::where('is_admin','!=',1)->count();
        // Data of last 7 days  for Graph 
        $last_seven_days = Order::select('created_at',DB::raw('SUM(billing_total) total'))->groupBy('created_at')->orderBy('created_at','desc')->limit(7)->get();
        if(isset($last_seven_days) && !empty($last_seven_days)){
            foreach($last_seven_days as $key=>$day){
                $date_arr[$key]= date("d M Y", strtotime($day['created_at']));
                $data_total[$key]=$day['total'];
            }
        }
        $data['date_arr'] = array_reverse($date_arr);
        $data['data_total'] =array_reverse($data_total);

        return view('dashboard',compact('data'));
    }

    public function recentOrderAjax(Request $request)
    {
       
        $columns = array(
            0 => 'user_name',
            1 => 'image',
            2 => 'order_status',
            3 => 'billing_total',
        );

        $totalData = Order::count();
        $totalFiltered = $totalData;
        $limit = 5;
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        if (request()->ajax()) {
            $posts = new Order();

            $posts = $posts->leftJoin('users as usr', 'usr.id', '=', 'orders.user_id')
                ->join('order_status as ords', 'ords.id', '=', 'orders.order_status')
                ->join('order_product as op','op.order_id','=','orders.id')
                ->join('products as pd','pd.id','=','op.product_id');


            if (!empty($request->start_date) && !empty($request->end_date)) {
                // print_r($request->start_date."----------"."$request->end_date");die;
                $posts = $posts->whereBetween('orders.created_at', [$request->start_date, $request->end_date]);
                $filter =  $posts->count();
                // $posts = $posts->where('country', '=', "in");
                $totalFiltered = $filter;
            }

            $posts = $posts->select('orders.*', 'usr.full_name as user_name', 'ords.name as order_status','pd.image');

            $posts = $posts->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
        }
        $data = array();

        if (!empty($posts)) {

            foreach ($posts as $post) {
                // 'name', 'category_id', 'image','description','amount','in_stock','status'
                
                $nestedData['user_name'] = $post->user_name;
                $nestedData['image'] ="&emsp;<img class='cell-img' src='{$post->image}' width='40px;'>";
                $nestedData['order_status'] = $post->order_status;
                $nestedData['billing_total'] = $post->billing_total;
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
}
