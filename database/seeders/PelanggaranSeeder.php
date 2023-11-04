<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\ViolationCategory;


class PelanggaranSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // $daftar_pelanggaran = [
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran ringan',
        //         'name' => 'Terlambat',
        //         'point' => 10
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran ringan',
        //         'name' => 'Seragam tidak sesuai hari',
        //         'point' => 10
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran ringan',
        //         'name' => 'Memakai seragam /atribut sekolah yang coret coret',
        //         'point' => 10
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran ringan',
        //         'name' => 'Memakai yang tidak sesuai ketentuan sekolah',
        //         'point' => 10
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran ringan',
        //         'name' => 'Berpakaian tidak rapi',
        //         'point' => 10
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran ringan',
        //         'name' => 'Tidak Pakai Sepatu Hitam',
        //         'point' => 10
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran ringan',
        //         'name' => 'Memakai sandal',
        //         'point' => 10
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran ringan',
        //         'name' => 'Tidak menyelesaikan tugas',
        //         'point' => 10
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran ringan',
        //         'name' => 'Main Hp saat KBM',
        //         'point' => 10
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran ringan',
        //         'name' => 'Kekantin jam KBM',
        //         'point' => 10
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran ringan',
        //         'name' => 'Tidak ikut Upacara/Senam',
        //         'point' => 10
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran ringan',
        //         'name' => 'Bikin Gaduh /Ribut',
        //         'point' => 10
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran ringan',
        //         'name' => 'Berkuku Panjang',
        //         'point' => 10
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran ringan',
        //         'name' => 'Rambut Gondrong',
        //         'point' => 10
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran ringan',
        //         'name' => 'Makeup berlebihan',
        //         'point' => 10
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran ringan',
        //         'name' => 'Berkata kasar/kotor',
        //         'point' => 10
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran ringan',
        //         'name' => 'Buang sampah sembarangan',
        //         'point' => 10
        //     ]
        // ];

        // $daftar_pelanggaran_sedang = [
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran sedang',
        //         'name' => 'Tidak melaksanakan Sholat',
        //         'point' => 25
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran sedang',
        //         'name' => 'Membawa dan menghisap Merokok',
        //         'point' => 25
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran sedang',
        //         'name' => 'Berbohong',
        //         'point' => 25
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran sedang',
        //         'name' => 'Rambut di cat',
        //         'point' => 25
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran sedang',
        //         'name' => 'Memalsukan tanda tangan',
        //         'point' => 25
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran sedang',
        //         'name' => 'Nongkrong tempat Umum dengan seragam sekolah',
        //         'point' => 25
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran sedang',
        //         'name' => 'Menyimpan/Menonton Video Porno',
        //         'point' => 25
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran sedang',
        //         'name' => 'Mencoret fasilitas sekolah',
        //         'point' => 25
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran sedang',
        //         'name' => 'Bolos jam KBM',
        //         'point' => 25
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran sedang',
        //         'name' => 'Tidak menyelesaikan KBM',
        //         'point' => 25
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran sedang',
        //         'name' => 'Tidak mengikuti (PTS,PAS.PAT dan Ujian lainnya)',
        //         'point' => 25
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran sedang',
        //         'name' => 'Alfa dua kali berturut-turut',
        //         'point' => 25
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran sedang',
        //         'name' => 'Tidak menyampaikan Informasi dari sekolah ke orang tua',
        //         'point' => 25
        //     ],
        //     [
        //         'jenis_pelanggaran' => 'pelanggaran sedang',
        //         'name' => 'Bertindik',
        //         'point' => 25
        //     ]
        // ];

        $daftar_pelanggaran_berat = [
            [
                'jenis_pelanggaran' => 'pelanggaran berat',
                'name' => 'Bertato',
                'point' => 100
            ],
            [
                'jenis_pelanggaran' => 'pelanggaran berat',
                'name' => 'Merusak sarana dan prasarana sekolah',
                'point' => 100
            ],
            [
                'jenis_pelanggaran' => 'pelanggaran berat',
                'name' => 'Mengambil barang milik orang lain',
                'point' => 100
            ],
            [
                'jenis_pelanggaran' => 'pelanggaran berat',
                'name' => 'Membawa/mengedarkan,mengkonsumsi,( minuman keras,obat-obatan terlarang dan atau sejenisnya dalam bentuk apapun ) baik dalam lingkungan sekolah maupun diluar lingkungan sekolah',
                'point' => 100
            ],
            [
                'jenis_pelanggaran' => 'pelanggaran berat',
                'name' => 'Melakukan tindak kekerasan dan atau berkelahi sesama teman baik dalam kelas,antar kelas baik dalam lingkungan Sekolah maupun di luar Sekolah (Tawuran)',
                'point' => 100
            ],
            [
                'jenis_pelanggaran' => 'pelanggaran berat',
                'name' => 'Melecehkan,mengancam dan atau lainya kepada guru,karyawan sekolah,dan sesama siswa',
                'point' => 100
            ],
            [
                'jenis_pelanggaran' => 'pelanggaran berat',
                'name' => 'Memiliki,mengedarkan menonton(vidio porno)dan sejenisnya',
                'point' => 100
            ],
            [
                'jenis_pelanggaran' => 'pelanggaran berat',
                'name' => 'Membawa menyimpan senjata tajam / api',
                'point' => 100
            ],
            [
                'jenis_pelanggaran' => 'pelanggaran berat',
                'name' => 'Melakukan pelanggaran hukum dan atau yang berhubungan dengan hukum (ke-Polisian)',
                'point' => 100
            ]
        ];

        ViolationCategory::insert($daftar_pelanggaran_berat);
    }
}
