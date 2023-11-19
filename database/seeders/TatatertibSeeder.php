<?php

namespace Database\Seeders;

use App\Models\Tatib_bab;
use App\Models\Tatib_butir_pasal;
use App\Models\Tatib_pasal;
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
                'id' => 1, // unik, mengikuti nomor bab, misal : jika bab 3 maka id adalah 3
                'nomor_bab' => 'I',
                'judul_bab' => 'KETENTUAN UMUM',
                'pasal' => [
                    [
                        'id' => 1, // unik
                        'bab_id' => 1,
                        'nomor_pasal' => '1',
                        'judul_pasal' => 'Pengertian',
                        'penjelasan' => "Sekolah adalah lembaga tempat berlangsungnya pendidikan,tempat proses belajar mengajar
                                dan siswa berlatih Kepribadian, kecerdasan, keterampilan berkembang sesuai dengan tujuan
                                pendidikan
                                \n \n
                                Agar terlaksana dan tercapainya tujuan diatas maka perlu adanya usaha, itikad, pengertian
                                dan kerjasama antara seluruh personal sekolah (Guru, Karyawan, siswa dan orang tua/wali
                                murid dan masyarakat serta instansi terkait)
                                \n \n
                                Aturan dan tata tertib di buat untuk menciptakan suasana yang kondusif dan mendukung
                                sepenuhnya tujuan pendidikan sehingga kegiatan belajar siswa dan guru mengajar dapat
                                terjadi demi tercapainya tujuan pendidikan.
                                \n \n
                                Tata Tertib dan Pembinaan Karakter yang dimaksud adalah:", // text ada dibawah judul soal, jika tidak ada, kosongkan
                        'butir_pasal' => [
                            [
                                'pasal_id' => 1,
                                'isi_pasal' => "Pedoman adalah hal pokok/ketentuan yang menjadi dasar petunjuk untuk menentukan atau
                                melaksanakan sesuatu;"
                            ],
                            [
                                'pasal_id' => 1,
                                'isi_pasal' => "Tata Tertib adalah peraturan - peraturan yang harus ditaati atau dilaksanakan oleh setiap
                                peserta didik SMK TI Muhammadiyah Cikampek dengan penuh kesadaran dan
                                tanggungjawab;"
                            ],
                            [
                                'pasal_id' => 1,
                                'isi_pasal' => "Peserta Didik adalah peserta didik atau siswa yang mempunyai Nomor Induk Siswa dan
                                tercatat secara administratif di SMK TI Muhammadiyah Cikampek."
                            ],
                            [
                                'pasal_id' => 1,
                                'isi_pasal' => "Pembinaan Karakter adalah suatu proses pembentukan manusia sesuai dengan
                                perkembangan peserta didik melalui metode dan sistem yang didasarkan pada prinsip
                                perubahan tingkah laku yang konsisten secara lahiriah dan batiniah, sehingga menjadi
                                manusia yang sehat, terampil, berwatak, berkepribadian dan berahlak mulia;"
                            ],
                            [
                                'pasal_id' => 1,
                                'isi_pasal' => "SMK TI Muhammadiyah adalah Amal Usaha yang bergerak di bidang pendidikan tingkat
                                menengah kejuruan yang beralamat di Jl Raya Parakan No. 71 kel Cikampek Utara kec
                                Kotabaru Kab Karawang 41374 Jawa Barat."
                            ],
                        ],
                    ]
                ],
            ],
            [
                'id' => 2, // unik, mengikuti nomor bab, misal : jika bab 3 maka id adalah 3
                'nomor_bab' => 'II',
                'judul_bab' => 'DASAR DAN TUJUAN',
                'pasal' => [
                    [
                        'id' => 2, // unik
                        'bab_id' => 2,
                        'nomor_pasal' => '2',
                        'judul_pasal' => 'Dasar',
                        'penjelasan' => "Pedoman Tata Tertib dan Pembinaan Karakter yang ditetapkan untuk mengatur kebiasaan,
                            perilaku dan sikap peserta didik SMK TI Muhammadiyah Cikampek, dibuat berdasarkan
                            Pancasila, Undang - Undang Dasar Negara Republik Indonesia Tahun 1945, nilai - nilai dan
                            norma yang dianut sekolah serta masyarakat.", // text ada dibawah judul soal, jika tidak ada, kosongkan
                        'butir_pasal' => [],
                    ],
                    [
                        'id' => 3, // unik
                        'bab_id' => 2,
                        'nomor_pasal' => '3',
                        'judul_pasal' => 'Tujuan',
                        'penjelasan' => "Pedoman Tata Tertib dan Pembinaan Karakter ini, dibuat dengan tujuan :", // text ada dibawah judul soal, jika tidak ada, kosongkan
                        'butir_pasal' => [
                            [
                                'pasal_id' => 3,
                                'isi_pasal' => "Mengatur kehidupan sekolah sehari - hari warga sekolah sehingga dapat mendukung
                                tercapainya visi misi dan tujuan sekolah."
                            ],
                            [
                                'pasal_id' => 3,
                                'isi_pasal' => "Menciptakan suasana sekolah yang kondusif sehingga proses belajar - mengajar berjalan
                                dengan baik dan efektif."
                            ],
                            [
                                'pasal_id' => 3,
                                'isi_pasal' => "Rambu - rambu bagi peserta didik dalam bersikap, bertingkah laku, dan melakukan
                                kegiatan sehari - hari di sekolah guna menciptakan iklim dan kultur sekolah yang baik dalam
                                rangka menciptakan manusia yang berakhlak mulia,cerdas,dan terampil."
                            ],
                            [
                                'pasal_id' => 3,
                                'isi_pasal' => "Untuk meningkatkan ketahanan sekolah"
                            ],
                            [
                                'pasal_id' => 3,
                                'isi_pasal' => "Sebagai pedoman untuk menyelesaikan masalah"
                            ],
                        ],
                    ],
                ],
            ],
            [
                'id' => 3, // unik, mengikuti nomor bab, misal : jika bab 3 maka id adalah 3
                'nomor_bab' => 'III',
                'judul_bab' => 'HAK SISWA',
                'pasal' => [
                    [
                        'id' => 4, // unik
                        'bab_id' => 3,
                        'nomor_pasal' => '4',
                        'judul_pasal' => 'Hak Siswa',
                        'penjelasan' => "", // text ada dibawah judul soal, jika tidak ada, kosongkan
                        'butir_pasal' => [
                            [
                                'pasal_id' => 4,
                                'isi_pasal' => "Mendapatkan pengajaran yang layak sesuai undang-undang dasar 1945 yang berkeadilan"
                            ],
                            [
                                'pasal_id' => 4,
                                'isi_pasal' => "Mendapatkan pendidikan dan pelatihan sesuai program keahlian yang dipilih serta jadwal
                                yang sudah ditetapkan sekolah"
                            ],
                            [
                                'pasal_id' => 4,
                                'isi_pasal' => "Menggunakan dan atau memanfaatkan fasilitas sarana dan prasarana sesuai dengan
                                peraturan yang sudah ditetapkan sekolah"
                            ],
                            [
                                'pasal_id' => 4,
                                'isi_pasal' => "Mengikuti kegiatan sekolah yang berhubungan dengan pengembangan diri"
                            ],
                        ],
                    ]
                ],
            ]
        ];
        Tatib_bab::truncate();
        Tatib_pasal::truncate();
        Tatib_butir_pasal::truncate();

        foreach($data as $bab){
            Tatib_bab::create([
                'id' => $bab['id'],
                'nomor_bab' => $bab['nomor_bab'],
                'judul' => $bab['judul_bab']
            ]);

            foreach($bab['pasal'] as $pasal) {
                Tatib_pasal::create([
                    'id' => $pasal['id'],
                    'bab_id' => $pasal['bab_id'],
                    'nomor_pasal' => $pasal['nomor_pasal'],
                    'judul_pasal' => $pasal['judul_pasal'],
                    'penjelasan' => $pasal['penjelasan']
                ]);

                foreach($pasal['butir_pasal'] as $butir){
                    Tatib_butir_pasal::create([
                        'pasal_id' => $butir['pasal_id'],
                        'isi_pasal' => $butir['isi_pasal']
                    ]);
                }
            }
        };
    }
}
