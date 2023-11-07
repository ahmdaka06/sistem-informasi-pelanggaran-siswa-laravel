<?php

namespace App\Services;

use App\Jobs\ProsesInsertSiswa;
use App\Models\ClassList;
use App\Models\Student;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use PhpParser\Node\Stmt\Return_;
use Psy\Readline\Hoa\Console;
use SebastianBergmann\CodeUnit\FunctionUnit;
use Throwable;
use PDF;

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

    function simpanDataExcel($collection): void
    {
        // dd($collection);
        try {
            foreach ($collection as $key => $row) {
                if ($key == 0) {
                    continue;
                }
                $nis_tanpa_titik = str_replace('.', '', $row[1]);
                Student::create([
                    'class_id' => $row[3],
                    'email' => "$nis_tanpa_titik@gmail.com",
                    'identity_number' => $nis_tanpa_titik,
                    'full_name' => $row[0],
                    'username' => $nis_tanpa_titik,
                    'password' => Hash::make($nis_tanpa_titik),
                    'gender' => strtolower($row[2]),
                ]);
            }
            dispatch(new ProsesInsertSiswa($collection));

        } catch (Throwable $e) {
            Log::info($e->getMessage());
            abort(500);
        }
    }

    private function prosesMengolahDataMingguan($dataBulanan)
    {
        try {
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

            $sumWeek = collect($jumlahHasilMingguan)->sum();
            return [
                'avg_per_week' => $hasilAkhirRataRataMingguan,
                'sum_per_week' => $hasilAkhirMingguan,
                'sum_week' => $sumWeek,
                'avg_week' => count($rataRataHasilMungguan) <= 0 ? 0 : round(collect($rataRataHasilMungguan)->sum() / count($rataRataHasilMungguan))
            ];
        } catch (Throwable $e) {
            Log::error($e->getMessage());
            abort(500);
        }
    }

    private function prosesMengolahDataBulanan($dataBulanan)
    {
        try {
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

            $sumMonth = collect($jumlahHasilBulanan)->sum();

            return [
                'avg_per_month' => $hasilAkhirRataRata,
                'sum_per_month' => $hasilAkhirJumlah,
                'sum_month' => $sumMonth,
                'avg_month' => count($rataRataHasilBulanan) <= 0 ? 0 : round(collect($rataRataHasilBulanan)->sum() / count($rataRataHasilBulanan))
            ];
        } catch (Throwable $e) {
            Log::error($e->getMessage());
            abort(500);
        }
        // dd(['jumlah' => $hasilAkhirJumlah, 'rata_rata' => $hasilAkhirRataRata, 'bulan' => $bulanTersedia]);
    }

    function getMineViolationDataForGraphic($idSiswa, string $bulanDanTahun = null)
    {
        try {
            $pisah = explode("-", $bulanDanTahun);
            $tahun = isset($pisah[0]) ? $pisah[0] : null;
            $bulan = isset($pisah[1]) ? $pisah[1] : null;

            if (!$tahun || !$bulan) {
                return false;
            }

            $daftarBulan = ['', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', "Desember"];
            $bulan = (int) $bulan;
            $detailSiswa = Student::mineViolation($idSiswa, $tahun); // -> data ini detail dari salah satu siswa dan menghasilkan data pertahun dan akan menampilkan yang status == 'confirm'

            $student = $detailSiswa['violations'];

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
                ->filter(fn($value) => $value['month'] == $bulan)
                ->sortBy('day') // -> ini bisa optional
                ->groupBy('week_of_month');

            $dataBulanan = $data->groupBy('month')->sortKeys();

            $hasilAkhirBulanan = $this->prosesMengolahDataBulanan($dataBulanan);
            $hasilAkhirMingguan = $this->prosesMengolahDataMingguan($dataMingguan);

            return array_merge($hasilAkhirBulanan, $hasilAkhirMingguan, [
                'detail_siswa' => $dataMentah,
                'siswa' => $detailSiswa['student'],
                'bulan' => $daftarBulan[$bulan],
                'tahun' => $tahun
            ]);
        } catch (Throwable $e) {
            Log::error($e->getMessage());
            abort(500);
        }
    }

    function downloadPdfDetailStudent(int $id, string $tanggal)
    {
        try {
            $data = $this->getMineViolationDataForGraphic($id, $tanggal);
            $dataPelanggaranSiswa = Student::with('pelanggaran.category_pelanggaran')->where('id', $id)->first();
            $detailSiswa = $data['siswa']->toArray();
            $data = [
                'nomorSurat' => $id,
                // => y
                'jumlahSatuBulan' => $data['sum_week'],
                // => y
                'jumlahSatuTahun' => $data['sum_month'],
                // => y
                'rataRataSatuBulan' => $data['avg_week'],
                // => y
                'rataRataSatuTahun' => $data['avg_month'],
                'namaLengkap' => $detailSiswa['full_name'],
                // => y
                'nis' => $detailSiswa['identity_number'],
                // => y
                'kelas' => $detailSiswa['kelas']['name'],
                // => y
                'jenisKelamin' => $detailSiswa['gender'] == 'l' ? "Laki-Laki" : "Perempuan",
                // => y
                'totalPoint' => $data['sum_month'],
                // => y
                'bulan' => $data['bulan'],
                // => y
                'tahun' => $data['tahun'],
                // => y
                'pelanggaran' => $dataPelanggaranSiswa->pelanggaran,
                'no' => 1
            ];
            $pdf = PDF::loadView('admin.siswa.pdf.detail', $data)->setOptions(['defaultFont' => 'sans-serif']);
            return $pdf;
        } catch (Throwable $e) {
            Log::error($e->getMessage());
            abort(500);
        }
    }
}
