<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



Auth::routes();

//Dashboard
Route::group(['prefix' => 'dashboard'], function () {
    Route::get('/', 'DashboardController@index')->name('dashboard_index');
    Route::post('recent_orders', 'DashboardController@recentOrderAjax');
});


//Report
Route::group(['prefix' => 'report'], function () {
    Route::get('/product', 'ReportController@productReport')->name('product_report');
    Route::post('product_ajax', 'ReportController@productAjax');

    Route::get('/order', 'ReportController@orderReport')->name('order_report');
    Route::post('order_ajax', 'ReportController@orderAjax');

    Route::get('/list_products', 'ReportController@listProducts')->name('list_products');
});


