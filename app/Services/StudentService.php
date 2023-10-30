<?php

namespace App\Services;

use App\Models\Student;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use PhpParser\Node\Stmt\Return_;
use SebastianBergmann\CodeUnit\FunctionUnit;
use Throwable;

class StudentService
{
    public $errors, $status;

    function simpanData(int $kelas, string $namaLengkap, string $nis, string $jenisKelamin)
    {
        try {

            $username = strtr($namaLengkap, [
                " " => "_"
            ]);

            $username = strtolower($username);

            $validator = Validator::make([
                'username' => $username
            ], [
                'username' => ['required', 'unique:students,username']
            ]);

            if ($validator->fails()) {
                $errors = $validator->errors()->toArray();
                $this->errors = $errors['username'][0];
                $this->status = false;
                return $this;
            }

            Student::create([
                'class_id' => $kelas,
                'username' => $username,
                'identity_number' => $nis,
                'full_name' => $namaLengkap,
                'password' => Hash::make('password'),
                'gender' => $jenisKelamin,
            ]);

            $this->status = true;

            return $this;
        } catch (Throwable $e) {
            $this->status = false;
            Log::error($e->getMessage());
            throw $e; // harus bikin error handling yang menyatakan bahwa validasi gagal
        }
    }

    private function prosesMengolahDataMingguan($dataBulanan)
    {
        $jumlahHasilMingguan = [];
        $rataRataHasilMungguan = [];

        foreach ($dataBulanan as $key => $values) {
            foreach ($values as $i) {
                $jumlahHasilMingguan[$key] = !isset($jumlahHasilMingguan[$key]) ? 0 + $i['category_pelanggaran']['point'] : $jumlahHasilMingguan[$key] + $i['category_pelanggaran']['point'];
            }

            $rataRataHasilMungguan[$key] = round($jumlahHasilMingguan[$key] / count($values));
        }

        /* *
            [
                [1,2,3,4], -> ini adalah minggu
                [100, 120, 123, 23] -> ini adalah nilai point
            ]
        */
        $hasilAkhirMingguan = []; // -> index ke 0 = minggu , index ke 1 value nya
        $hasilAkhirRataRataMingguan = [];

        $mingguan = []; // -> mingguan akan dipakai dari hasil rata rata maupun dari hasil penjumlahan
        $jumlahMingguan = [];
        $rataRataMingguan = [];
        foreach ($jumlahHasilMingguan as $key => $jumlah) { // -> karena sama key jumlan == key rata rata, langsung akses pake $key
            array_push($mingguan, "Minggu ke-$key");
            array_push($jumlahMingguan, $jumlah);
            array_push($rataRataMingguan, $rataRataHasilMungguan[$key]);
        }

        $hasilAkhirMingguan[0] = $mingguan;
        $hasilAkhirMingguan[1] = $jumlahMingguan;
        $hasilAkhirRataRataMingguan[0] = $mingguan;
        $hasilAkhirRataRataMingguan[1] = $rataRataMingguan;

        return [
            'avg_per_week' => $hasilAkhirRataRataMingguan,
            'sum_per_week' => $hasilAkhirMingguan
        ];
    }

    private function prosesMengolahDataBulanan($dataBulanan)
    {
        $jumlahHasilBulanan = [];
        $rataRataHasilBulanan = [];

        $bulanTersedia = [];

        $daftarBulan = ['', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', "Desember"];
        foreach ($dataBulanan as $key => $values) {
            foreach ($values as $i) {
                $jumlahHasilBulanan[$key] = !isset($jumlahHasilBulanan[$key]) ? 0 + $i['category_pelanggaran']['point'] : $jumlahHasilBulanan[$key] + $i['category_pelanggaran']['point'];
            }
            $rataRataHasilBulanan[$key] = round($jumlahHasilBulanan[$key] / count($values));

            array_push($bulanTersedia, $daftarBulan[$key]);
        }

        $jumlahHasilBulanan = collect($jumlahHasilBulanan)->flatten()->toArray();
        $rataRataHasilBulanan = collect($rataRataHasilBulanan)->flatten()->toArray();

        $hasilAkhirRataRata = [$bulanTersedia, $rataRataHasilBulanan];
        $hasilAkhirJumlah = [$bulanTersedia, $jumlahHasilBulanan];

        return [
            'avg_per_month' => $hasilAkhirRataRata,
            'sum_per_month' => $hasilAkhirJumlah
        ];

        dd(['jumlah' => $hasilAkhirJumlah, 'rata_rata' => $hasilAkhirRataRata, 'bulan' => $bulanTersedia]);
    }

    function getMineViolationDataForGraphic($idSiswa, string $bulanDanTahun = null)
    {
        [$tahun, $bulan] = explode("-", $bulanDanTahun);
        $bulan = (int)$bulan;
        $detailSiswa = Student::mineViolation($idSiswa, $tahun); // -> data ini detail dari salah satu siswa dan menghasilkan data pertahun dan akan menampilkan yang status == 'confirm'

        $student = $detailSiswa;

        $mappingData = function ($item) {
            $createdAt = Carbon::parse($item->created_at);
            $dayOfWeek = $createdAt->dayOfWeek;
            $monthOfYear = $createdAt->month;
            $day = $createdAt->day;
            $weekOfMonth = $createdAt->weekOfMonth;
            $dayName = $createdAt->format('l');

            $item->day_name = $dayName;
            $item->day = $day;
            $item->week_of_month = $weekOfMonth;
            $item->day_of_week = $dayOfWeek;
            $item->month = $monthOfYear;

            return $item;
        };

        $data = $student->map($mappingData);
        $dataMentah = $data->sortBy('created_at');

        $dataMingguan = $data
            ->filter(fn ($value) => $value['month'] == $bulan)
            ->sortBy('day') // -> ini bisa optional
            ->groupBy('week_of_month');

        $dataBulanan = $data->groupBy('month')->sortKeys();

        $hasilAkhirBulanan = $this->prosesMengolahDataBulanan($dataBulanan);
        $hasilAkhirMingguan =  $this->prosesMengolahDataMingguan($dataMingguan);

        return array_merge($hasilAkhirBulanan, $hasilAkhirMingguan, ['detail_siswa' => $dataMentah]);
    }
}
