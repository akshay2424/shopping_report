<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $table = 'orders';

    protected $fillable = [
        'user_id', 'billing_email', 'billing_name', 'billing_address', 'billing_city'
        , 'billing_postalcode', 'billing_phone', 'billing_name_on_card', 'billing_discount', 'billing_tax', 'billing_total', 'payment_gateway','order_status'
    ];

    
}