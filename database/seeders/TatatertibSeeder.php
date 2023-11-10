<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class TatatertibSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        /*
          BAB III
            HAK SISWA
            Pasal 4
            Hak Siswa
            1.Mendapatkan pengajaran yang layak sesuai undang-undang dasar 1945 yang berkeadilan
            2.Mendapatkan pendidikan dan pelatihan sesuai program keahlian yang dipilih serta jadwal
            yang sudah ditetapkan sekolah
            3.Menggunakan dan atau memanfaatkan fasilitas sarana dan prasarana sesuai dengan
            peraturan yang sudah ditetapkan sekolah
            4.Mengikuti kegiatan sekolah yang berhubungan dengan pengembangan diri
         */

         $data = [
            [
                'id' => 3,
                'nomor_bab' => 'III',
                'judul_bab' => 'HAK SISWA',
                'pasal' => [
                    [
                        'id' => 4,
                        'bab_id' => 3,
                        'nomor_pasal' => '4',
                        'judul_pasal' => 'Hak Siswa',
                        'butir_pasal' => [
                            [
                                'pasal_id' => '4',
                                'isi_pasal' => "Mendapatkan pengajaran yang layak sesuai undang-undang dasar 1945 yang berkeadilan"
                            ],
                            [
                                'pasal_id' => '4',
                                'isi_pasal' => "Mendapatkan pendidikan dan pelatihan sesuai program keahlian yang dipilih serta jadwal yang sudah ditetapkan sekolah"
                            ],
                            [
                                'pasal_id' => '4',
                                'isi_pasal' => "Menggunakan dan atau memanfaatkan fasilitas sarana dan prasarana sesuai dengan peraturan yang sudah ditetapkan sekolah"
                            ],
                            [
                                'pasal_id' => '4',
                                'isi_pasal' => "Mengikuti kegiatan sekolah yang berhubungan dengan pengembangan diri"
                            ],
                        ],
                    ]
                ],
            ]
        ];


        foreach($data as $bab){
            
        };
    }
}
