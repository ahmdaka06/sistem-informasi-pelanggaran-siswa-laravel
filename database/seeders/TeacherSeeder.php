<?php

namespace Database\Seeders;

use App\Models\Teacher;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class TeacherSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // [ 'full_name', 'identity_number', 'email', 'username', 'password', 'phone_number', 'is_active']
        for($i = 1; $i <= 10; $i++){
            Teacher::create([
                'full_name' => "guru$i",
                'identity_number' => rand(1, 1000) * rand(1, 1000),
                'email' => "guru$i@gmail.com",
                'username' => "guru$i",
                'password' => Hash::make('123'),
                'phone_number' => "089477",
                'is_active' => 1
            ]);
        }
    }
}
