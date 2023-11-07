<?php

namespace App\Imports;

use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\ToCollection;
use App\Services\StudentService;
use App\Models\ClassList;

class CobaImport implements ToCollection
{
    /**
     * @param Collection $collection
     */
    public function collection(Collection $collection)
    {
        //
        $dataBaru = [];
        foreach ($collection as $key => $row) {
            if ($key == 0) {
                continue;
            }
            array_push($dataBaru, $row);
            // Student::create([
            //     'class_id' => $key,
            //     'email' => "$row[3]@gamil.com",
            //     'identity_number' => $row[3],
            //     'full_name' => $row[0],
            //     'username' => $row[3],
            //     'password' => $row[1],
            //     'gender' => 'l',
            // ]);
        }
        $dataBaru = collect($dataBaru);
        $kelas = $dataBaru->groupBy(3)->toArray();
        $dataKelas = [];

        $i = 1;
        try {
            foreach ($kelas as $key => $k) {
                array_push($dataKelas, $key);
                $data = explode(' ', $key);
                $kelas = isset($data[0]) ? $data[0] : null;
                $jurusan = isset($data[1]) ? $data[1] : null;
                $i++;
            }
        } catch (\Throwable $e) {
            dd($e->getMessage());
        }

        foreach ($dataKelas as $k) {
            $explode = explode(' ', $k);
            $kelas = $explode[0] ? $explode[0] : null;
            $jurusan = $explode[1] ? $explode[1] : null;
            ClassList::create([
                'teacher_id' => rand(1, 5),
                'name' => $k,
                'kelas' => $kelas,
                'jurusan' => $jurusan
            ]);
        }

        // $student = new StudentService;
        // $student->simpanDataExcel($collection);
    }
}
