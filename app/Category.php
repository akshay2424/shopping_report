<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    //category
    protected $table = 'category';

    protected $fillable = ['name', 'status'];
}
