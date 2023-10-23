<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i = 1999; $i < 2000; $i++) {
            \App\Models\Admin::create([
                'full_name' => 'Super Admin' . $i,
                'username' => 'superadmin' . $i,
                'password' => bcrypt('superadmin' . $i),
                'role' => 'super-admin',
                'is_active' => 1,
            ]);
        }
    }
}
