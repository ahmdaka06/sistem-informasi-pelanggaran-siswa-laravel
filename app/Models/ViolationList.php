<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

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

    function scopeDataTeratasSiswa(Builder $builder, int $limit = 5, $bulan = null, $tahun = null)
    {
        if ($bulan == null) {
            $bulan = date('m');
        }

        if ($tahun == null) {
            $tahun = date('Y');
        }
        // SELECT
        // 	violation_lists.id siswa_id,
        //     students.full_name nama_siswa,
        //     class_lists.name kelas,
        //     SUM(violation_categories.point) jumlah,
        //     COUNT(violation_lists.id) pelanggaran
        // FROM violation_lists
        // 	INNER JOIN violation_categories
        //     	ON violation_lists.violation_category_id = violation_categories.id
        // 	INNER JOIN students
        //     	ON violation_lists.student_id = students.id
        // 	INNER JOIN class_lists ON students.class_id = class_lists.id
        // GROUP BY violation_lists.student_id
        // ORDER BY jumlah DESC
        return $builder->join('violation_categories', 'violation_lists.violation_category_id', '=', 'violation_categories.id')
            ->join('students', 'violation_lists.student_id', '=', 'students.id')
            ->join('class_lists', 'students.class_id', '=', 'class_lists.id')
            ->groupBy('violation_lists.student_id')
            // ->where('violation_lists.created_at', '>=', '2023-01-01')
            ->select(
                'violation_lists.student_id',
                'students.full_name as nama_siswa',
                'class_lists.name as kelas',
                'violation_lists.created_at',
                $builder->raw('SUM(violation_categories.point) as total_point'),
            )
            ->orderBy('total_point', 'desc')
            ->where('violation_lists.created_at', '>=', $tahun . "-" . $bulan . "-01")
            ->where('violation_lists.created_at', '<=', $tahun . "-" . $bulan . "-31")
            ->limit($limit)
            ->get();
    }
}
