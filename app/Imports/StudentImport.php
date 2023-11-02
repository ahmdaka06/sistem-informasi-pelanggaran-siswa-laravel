<?php

namespace App\Imports;

use App\Services\StudentService;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;

class StudentImport implements ToCollection
{
    /**
     * @param Collection $collection
     */
    public function collection(Collection $collection)
    {
        $student = new StudentService;
        $student->simpanDataExcel($collection);
    }
}
