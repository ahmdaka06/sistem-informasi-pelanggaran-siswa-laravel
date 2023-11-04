<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>

<body>


    <style type="text/css">
        .tabelku {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 2px;
        }

        .tdku {
            padding-left: 3px;
        }

        #content {
            font-size: 12.5px;
            padding-left: 50px;
            padding-right: 50px;
        }
    </style>
    <center>
        <img width="100%" src="data:image/png;base64,<?php echo base64_encode(file_get_contents(public_path('assets/images/kop surat smk mutu ckp.jpg'))); ?>">
        <hr />
    </center>
    {{-- Header --}}
    <center>
        <b>
            LAPORAN PELANGGARAN SISWA<br />
            PROGRAM SMK TI MUHAMMADIYAH CIKAMPEK {{ \Carbon\Carbon::parse(now())->isoFormat('Y') }}<br />
            Nomor : {{ $nomorSurat }}/118/BASTB-PSP/{{ \Carbon\Carbon::parse(now())->isoFormat('Y') }}
        </b>
    </center>
    <br />

    <div id="content">
        <p>Assalamualaikum wr wb.</p>
        <font align="justify">&emsp; &emsp; Pada Hari ini
            {{ \Carbon\Carbon::parse(now())->isoFormat('dddd') }} Tanggal
            {{ \Carbon\Carbon::parse(now())->isoFormat('D MMMM Y') }}, kami yang mengundang saudara/i :</font>
        <table width="100%" style="margin-top: 10px">
            <tr>
                <td width="2%"></td>
                <td width="30%">Nama</td>
                <td width="1%">:</td>
                <td width="67%"> <b>{{ $namaLengkap }}</b></td>
            </tr>
            <tr>
                <td width="2%"></td>
                <td width="30%">Jenis Kelamin</td>
                <td width="1%">:</td>
                <td width="67%"> <b>{{ $jenisKelamin }}</b></td>
            </tr>
            <tr>
                <td></td>
                <td>Nis</td>
                <td>:</td>
                <td>{{ $nis }}</td>
            </tr>
            <tr>
                <td></td>
                <td valign="top">Kelas</td>
                <td valign="top">:</td>
                <td>{{ $kelas }}</td>
            </tr>
        </table>
        <br />
        <font align="justify">Dengan ini, kesiswaan menyatakan bahwa saudara <b>{{ $namaLengkap }}</b>telah melakukan
            pelanggaran dengan total point pelanggaran <b>{{ $totalPoint }}</b> pada tahun {{ $tahun }}.
            Pihak sekolah perlu membahas ini
            kepada saudara yang bersangkutan, guna menyelesaikan masalah ini secara bersama-sama demi perbaikan perilaku
            siswa. Berikut adalah data pelanggarannya :
        </font>
        <br /><br />
        <table border="1" width="100%" class="tabelku">
            <tr>
                <th class="tdku" rowspan="2">NO</th>
                <th class="tdku" colspan="2">Jumlah Point</th>
                <th class="tdku" colspan="2">Rata Rata Point Per Hari</th>

            </tr>

            <tr>
                <th class="tdku">Bulan {{ $bulan }}</th>
                <th class="tdku">Tahun {{ $tahun }}</th>
                <th class="tdku">Bulan {{ $bulan }}</th>
                <th class="tdku">Tahun {{ $tahun }}</th>
            </tr>

            <tr>
                <td class="tdku">
                    <center>1</center>
                </td>
                <td class="tdku">
                    <center>{{ $jumlahSatuBulan }}</center>
                </td>
                <td class="tdku">
                    <center>{{ $jumlahSatuTahun }}</center>
                </td>
                <td class="tdku">
                    <center>{{ $rataRataSatuBulan }}</center>
                </td>
                <td class="tdku">
                    <center>{{ $rataRataSatuTahun }}</center>
                </td>
            </tr>
        </table>
        <br />

        {{-- <font align="justify">Seluruh barang yang diserahterimakan dalam keadaan baik, baru dan lengkap. Berita Acara
            Serah
            Terima ini memperhatikan beberapa hal sebagai berikut : </font>
        <table width="100%">
            <tr>
                <td width="5%" valign="top">1.</td>
                <td width="95%">Seluruh barang yang telah diserahterimakan tidak akan di perjual–belikan kepada pihak
                    lain;
                </td>
            </tr>
            <tr>
                <td valign="top">2.</td>
                <td>Seluruh barang yang telah diserahterimakan akan dimanfaatkan sesuai peruntukannya;</td>
            </tr>
            <tr>
                <td valign="top">3.</td>
                <td>Seluruh barang yang telah diserahterimakan tidak ada pungutan biaya apapun (<b>GRATIS</b>);</td>
            </tr>
            <tr>
                <td valign="top">4.</td>
                <td>Memberikan laporan setiap musim tanam setiap tahun yang ditujukan kepada Dinas Pertanian Kabupaten
                    Aceh
                    Besar dalam bentuk format laporan terlampir;</td>
            </tr>
            <tr>
                <td valign="top">5.</td>
                <td>Apabila bantuan alsintan tersebut tidak dimanfaatkan, maka akan ditarik kembali oleh Dinas Pertanian
                    Kabupaten Aceh Besar yang selanjutnya akan di relokasikan/ diberikan ke Poktan yang membutuhkan.
                </td>
            </tr>
        </table>
        <br />
        <font align="justify">Demikian Berita Acara Serah Terima Barang ini dibuat dan ditandatangani kedua belah pihak
            dengan
            sebenarnya.</font>
        <br /> <br /> --}}
        <font align="justify" style="text-align: justify">
            Kehadiran anda sangat penting untuk membahas masalah ini dan mencari solusi yang tepat. Kami sangat
            menghargai
            partisipasi Anda dalam pertemuan ini.
            Terima kasih atas perhatian Anda dan harapan kami untuk bisa bertemu dan menyelesaikan masalah ini bersama.
        </font>
        <br />
        <br />

        <font align="justify">Demikian pemberitahuan ini kami sampaikan mohon maklum
            adanya, atas perhatian Bapak/Ibu orang tua/wali murid kami ucapkan
            terima kasih. </font>
        <table width="100%" style="margin-top: 70px">
            <tr>
                <td width="42%">
                    {{-- <center><b>PIHAK KEDUA</b></center> --}}
                </td>
                <td width="16%"></td>
                <td width="42%">
                    {{-- <center><b>PIHAK PERTAMA</b></center> --}}
                </td>
            </tr>
            <tr>
                <td><br /><br /><br /><br /><br /><br />
                    {{-- <center><b><u>{{ $namaLengkap }}</u></b></center> --}}
                </td>
                <td></td>
                <td><br /><br /><br /><br /><br /><br />
                    {{-- <center><b><u>Syahruddin, S.TP., MP</u></b></center> --}}
                </td>
            </tr>
            <tr>
                <td>
                    <center></center>
                </td>
                <td></td>
                <td>
                    {{-- <center>Nip. 19830507 200604 1 016</center> --}}
                </td>
            </tr>
            <tr>
                <td>
                    {{-- <center>Mengetahui :</center> --}}
                </td>
                <td>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    {{-- <center>Keuchik Gampong {{ $namaDesa }} <br />Kecamatan {{ $namaKecamatan }}</center> --}}
                </td>
                <td></td>
                <td>
                    <center>Kotabaru, {{ \Carbon\Carbon::parse(now())->isoFormat('D MMMM Y') }}<br /></center>
                </td>
            </tr>
            <tr>
                <td><br /><br /><br /><br /><br /><br />
                    {{-- <center><b><u>{{ $geuchik }}</u></b></center> --}}
                </td>
                <td></td>
                <td><br /><br /><br /><br /><br /><br />
                    <center><b><u>Guntur Syahputra, S.pd</u></b></center>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>
                    <center>Kesiswaan</center>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>
                    <center>Nip. 19700925 199803 1 008</center>
                </td>
            </tr>
        </table>

    </div>
</body>

</html>
