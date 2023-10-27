<?php

namespace Database\Seeders;

use App\Models\ViolationList;
use Illuminate\Database\Seeder;

class ViolationListSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        ViolationList::factory()->count(3)->create();
    }
}
