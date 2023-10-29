<?php

namespace Database\Seeders;

use App\Models\ClassList;
use Illuminate\Database\Seeder;

class ClassListSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = ['10 RPL 1', '10 RPL 2', '11 RPL 1', '11 RPL 2'];

        foreach ($data as $i) {
            [$kelas, $jurusan, $ruangan] = explode(" ", $i);
            ClassList::create([
                'teacher_id' => rand(1, 9),
                'name' => $i,
                'kelas' => $kelas,
                'jurusan' => $jurusan
            ]);
        }
    }
}
