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

    public function kelas()
    {
        return $this->belongsTo(ClassList::class, 'class_id');
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

    function scopeDetailCategoryPelanggaran(Builder $builder, $tahun = null, $bulan = null)
    {
        // $dataPelanggaran = $builder->join('violation_categories', 'violation_lists.violation_category_id', '=', 'violation_categories.id')
        //     ->join('class_lists', 'violation_lists.class_id', '=', 'class_lists.id')
        //     ->groupBy('violation_lists.violation_category_id')
        //     ->select(
        //         $builder->raw('DATE(violation_lists.created_at) as tanggal'),
        //         'violation_categories.name',
        //         $builder->raw('COUNT(violation_lists.id) as counta'),
        //         $builder->raw('COUNT(class_lists.id) as kelas')
        //     )
        //     ->orderBy('counta', 'desc')
        //     // ->where('violation_lists.created_at', '>=', $tahun . "-" . $bulan . "-01")
        //     // ->where('violation_lists.created_at', '<=', $tahun . "-" . $bulan . "-31")
        //     ->get();

        $dataPelanggaran = $builder->with('category_pelanggaran')->get()
            ->groupBy('category_pelanggaran.name');
        // ->map(function ($item, $key) {
        //     // $item->data = $item;
        //     $data = $item;
        //     $kelasGrup = $item->groupBy('kelas.id');
        //     $item->kelas_grup = $kelasGrup;
        //     unset($item);
        //     return [$key => ['data' => $data, 'kelas_grup' => $kelasGrup]];
        //     // return $item;
        // });

        $dataPelanggaranBaru = [];

        foreach ($dataPelanggaran as $kategoriPelanggaranId => $pelanggaran) {
            // dd($kategoriPelanggaranId);
            $kelasGrup = $pelanggaran->groupBy('clas');

            $kelasCount = [];
            $i = 0;
            foreach ($kelasGrup as $kelas => $dataKelas) {
                if ($i > 5)
                    break;
                $kelasCount[$kelas] = count($dataKelas->unique('student_id'));
                $i++;
            }

            $kelasCount = collect($kelasCount)->sortDesc();

            $dataPelanggaranBaru[$kategoriPelanggaranId] = [
                'total_keseluruhan' => count($pelanggaran),
                'total_kelas' => $kelasCount->toArray()
            ];
        }

        // $namaNamaPelanggaran = $dataPelanggaran->map(function ($item) {
        //     return $item->name;
        // });

        $dataPelanggaranBaru = collect($dataPelanggaranBaru)->sortByDesc('total_keseluruhan');

        return [
            // 'namaNamaPelanggaran' => $namaNamaPelanggaran,
            'dataPelanggaran' => $dataPelanggaranBaru
        ];
    }

    public function scopeGetDetailCategoryPelanggaranForGraphic(Builder $builder)
    {
        $data = $this->detailCategoryPelanggaran()['dataPelanggaran']->map(function ($item) {
            return [
                'total_keseluruhan' => $item['total_keseluruhan'],
                'total_kelas' => $item['total_kelas'],
                'jumlah_kelas' => count($item['total_kelas'])
            ];
        });

        $maxJumlahKelas = $data->max('jumlah_kelas');

        $dataDataKelas = null;
        foreach ($data as $item) {
            if ($item['jumlah_kelas'] == $maxJumlahKelas) {
                $dataDataKelas = array_keys($item['total_kelas']);
                break;
            }
        }

        $pelanggaranPelanggaran = [
            $data->map(function ($item, $key) {
                return $key;
            })->flatten(),
            $data->map(function ($item) {
                return $item['total_keseluruhan'];
            })->flatten()
        ];

        $pelanggaranKelas = []; // => data yang sudah konsisten

        $pelanggaranBerdasarkanKelas = []; // => ini hasilnya seharusnya cuma 4

        foreach ($data as $category => $item) {
            $pelanggaranSementara = null;
            foreach ($dataDataKelas as $kelas) {
                $pelanggaranSementara = isset($item['total_kelas'][$kelas]) ? $item['total_kelas'][$kelas] : 0;
                $pelanggaranKelas[$category][$kelas] = $pelanggaranSementara;

                if (isset($pelanggaranBerdasarkanKelas[$kelas])) {
                    array_push($pelanggaranBerdasarkanKelas[$kelas], isset($pelanggaranKelas[$category][$kelas])
                        ? $pelanggaranKelas[$category][$kelas]
                        : 0);
                } else {
                    $pelanggaranBerdasarkanKelas[$kelas] = [$pelanggaranKelas[$category][$kelas]];
                }

            }
        }

        // dd($pelanggaranBerdasarkanKelas);

        $hasilUntukSeriesGrafik = [];
        foreach ($pelanggaranBerdasarkanKelas as $kelas => $dataSetiapKelas) {
            array_push($hasilUntukSeriesGrafik, [
                'name' => $kelas,
                'data' => $dataSetiapKelas
            ]);
        }

        // dd($hasilUntukSeriesGrafik);

        return [
            'series_kelas' => $hasilUntukSeriesGrafik,
            'pelanggaran' => $pelanggaranPelanggaran,
            'data' => $data,
            'data_data_kelas' => $dataDataKelas
        ];
    }
}
