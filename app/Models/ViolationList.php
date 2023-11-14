<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ViolationList extends Model
{
    use HasFactory;

    function category_pelanggaran()
    {
        return $this->belongsTo(ViolationCategory::class, 'violation_category_id');
    }

    public function siswa()
    {
        return $this->belongsTo(Student::class, 'student_id', 'id');
    }
}
