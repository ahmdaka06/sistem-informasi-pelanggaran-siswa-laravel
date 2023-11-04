<?php

namespace Database\Seeders;

use App\Models\ViolationCategory;
use Illuminate\Database\Seeder;

class ViolationCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [
            ['merokok', 10],
            ['tawuran', 30],
            ['bolos sekolah', 5]
        ];

        foreach ($data as $value) {
            ViolationCategory::create([
                'name' => $value[0],
                'point' => $value[1]
            ]);
        }
    }
}
