<?php

use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = App\User::create([
        	'full_name' => 'Super Admin', 
        	'email' => 'superAdmin@swayam.com',
        	'password' => bcrypt('12345678')
        ]);
  
    }
}
