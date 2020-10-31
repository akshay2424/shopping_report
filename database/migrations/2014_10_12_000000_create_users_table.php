<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('full_name')->nullable();
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->boolean('is_admin')->default(0);
            $table->string('password', 3000)->nullable();
            $table->string('mobile')->nullable();
            $table->string('signup_type')->nullable();
            $table->string('gender')->nullable();
            $table->string('address')->nullable();
            $table->string('city')->nullable();
            $table->string('pin_code')->nullable();
            $table->string('state')->nullable();
            $table->string('country')->nullable();
            $table->string('image_url', 3000)->nullable();
            $table->date('date_of_birth')->nullable();
            $table->boolean('status')->default(1);
            $table->rememberToken();
            $table->timestamp('created_at')->default(\DB::raw('CURRENT_TIMESTAMP'));
            $table->timestamp('updated_at')->default(\DB::raw('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'));
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
