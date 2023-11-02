<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Student;

class studentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Student::factory(300)->create();
    }
}
