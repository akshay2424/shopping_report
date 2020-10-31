<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderStatus extends Model
{
    //order_status
    protected $table = 'order_status';

    protected $fillable = ['name', 'status'];
}
