<?php

namespace Database\Seeders;

use App\Models\ClassList;
use App\Models\Student;
use App\Models\ViolationList;
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
        $data = [
            '11 RPL 1', 
            '11 RPL 2', 
            '12 RPL 1', 
            '10 TO 1', 
            '10 TO 2', 
            '10 TO 3', 
            '10 TO 4', 
            '10 TO 5', 
            '10 TO 6', 
            '10 TO 7', 
            '10 TO 8', 
            '10 TM 1', 
            '10 TM 2', 
            '10 TM 3', 
            '10 TM 4', 
            '10 TKJ 1', 
            '10 TKJ 2', 
            '10 TKJ 3', 
            '10 TKJ S', 
            '10 PPLG 1', 
            '10 PPLG 2', 
            '10 MPB 1',
            '10 MPB 2',
            '10 MPB 3',
            '11 TKR 1',
            '11 TKR 2',
            '11 TKR 3',
            '11 TKR 4',
            '11 TKR 5',
            '11 TSM 1',
            '11 TSM 2',
            '11 TSM 3',
            '11 TSM 4',
            '11 TSM 5',
            '11 TP 1',
            '11 TP 2',
            '11 TP 3',
            '11 TKJ 1',
            '11 TKJ 2',
            '11 TKJ 3',
            '11 TKJ S',
            '11 MP 1',
            '11 MP 2',
            '12 TKR 1',
            '12 TKR 2',
            '12 TKR 3',
            '12 TKR 4',
            '12 TKR 5',
            '12 TSM 1',
            '12 TSM 2',
            '12 TSM 3',
            '12 TSM 4',
            '12 TP 1',
            '12 TP 2',
            '12 TP 3',
            '12 TKJ 1',
            '12 TKJ 2',
            '12 TKJ 3',
            '12 TKJ 4',
            '12 TKJ Smsg',
            '12 MP 1'
        ];

        sort($data);
        Student::truncate();
        ClassList::truncate();
        ViolationList::truncate();


        foreach ($data as $i) {
            [$kelas, $jurusan, $ruangan] = explode(" ", $i);
            ClassList::create([
                'teacher_id' => rand(5, 14),
                'name' => $i,
                'kelas' => $kelas,
                'jurusan' => $jurusan
            ]);
        }
    }
}
