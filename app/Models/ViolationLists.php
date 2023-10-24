<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ViolationLists extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'violation_category_id',
        'student_id',
        'class_id',
        'student_parent_id',
        'report_by',
        'report_at',
        'note',
        'photo_proof',
        'report_at',
        'status',
    ];

    public function student(){
        return $this->belongsTo(Student::class, 'student_id', 'id');
    }

    public function jenisPelanggaran(){
        return $this->belongsTo(ViolationCategory::class, "violation_category_id", "id");
    }
}
