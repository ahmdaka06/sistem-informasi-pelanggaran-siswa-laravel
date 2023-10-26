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
        for ($i = 0; $i < 2; $i++) {
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
