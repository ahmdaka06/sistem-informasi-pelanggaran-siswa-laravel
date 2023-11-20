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

        return $builder->join('violation_categories', 'violation_lists.violation_category_id', '=', 'violation_categories.id')
            ->join('students', 'violation_lists.student_id', '=', 'students.id')
            ->join('class_lists', 'students.class_id', '=', 'class_lists.id')
            ->groupBy('violation_lists.student_id')
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

    function scopeKelasTeratas(Builder $builder, int $limit = 5, $bulan = null, $tahun = null)
    {
        if ($bulan == null) {
            $bulan = date('m');
        }

        if ($tahun == null) {
            $tahun = date('Y');
        }

        return $builder->join('violation_categories', 'violation_lists.violation_category_id', '=', 'violation_categories.id')
            ->join('students', 'violation_lists.student_id', '=', 'students.id')
            ->join('class_lists', 'students.class_id', '=', 'class_lists.id')
            ->groupBy('violation_lists.class_id')
            ->select(
                'class_lists.id as class_id',
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

    function scopeSiswaTerakhir(Builder $builder)
    {
        return $builder->with('siswa')->orderByDesc('created_at')->first();
    }

    function scopeSiswaMelanggarHariIniDanHariKemarin(Builder $builder)
    {
        $currentDate = new \DateTime(date('Y-m-d'));
        return $builder
            ->whereRaw('DATE(created_at) = ?', [$currentDate->format('Y-m-d')])
            ->orWhereRaw('DATE(created_at) = ?', $currentDate->modify('-1 day')->format('Y-m-d'))
            ->groupBy(DB::raw('DATE(created_at)'))
            ->orderByDesc('tanggal')
            ->selectRaw('DATE(created_at) as tanggal, COUNT(id) as jumlah_siswa')
            ->get();
    }
}
