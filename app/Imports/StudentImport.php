<?php

namespace App\Imports;

use App\Models\Student;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;

class StudentImport implements ToCollection
{
    /**
     * @param Collection $collection
     */
    public function collection(Collection $collection)
    {
        foreach ($collection as $key => $row) {
            if ($key == 0) {
                continue;
            }
            Student::create([
                'class_id' => $key,
                'email' => "$row[3]@gamil.com",
                'identity_number' => $row[3],
                'full_name' => $row[0],
                'username' => $row[3],
                'password' => $row[1],
                'gender' => 'l',
            ]);
        }
    }
}
