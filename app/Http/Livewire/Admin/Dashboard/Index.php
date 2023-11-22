<?php

namespace App\Http\Livewire\Admin\Dashboard;

use App\Models\ViolationList;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Index extends Component
{
    public $filterSiswaTeratas, $filterKelasTeratas;

    protected $listeners = ['grafikCoi' => 'loadGrafik'];

    public function loadGrafik($data)
    {
        $data = ViolationList::getDetailCategoryPelanggaranForGraphic();
        $pelanggaran = $data['pelanggaran'];
        $kelas = $data['series_kelas'];

        $this->emit('getDataCategoryPelanggaran', json_encode(['pelanggaran' => $pelanggaran, 'kelas' => $kelas]));
    }

    function mount()
    {
        $this->filterSiswaTeratas = date('Y-m');
        $this->filterKelasTeratas = date('Y-m');
    }
    private function siswaTeratas()
    {
        [$tahun, $bulan] = explode('-', $this->filterSiswaTeratas);
        $siswaTeratas = ViolationList::dataTeratasSiswa(5, $bulan, $tahun);
        return $siswaTeratas;
    }

    private function kelasTeratas()
    {
        [$tahun, $bulan] = explode('-', $this->filterKelasTeratas);
        return ViolationList::kelasTeratas(5, $bulan, $tahun);
    }

    public function render()
    {
        $siswaTeratas = $this->siswaTeratas();
        $kelasTeratas = $this->kelasTeratas();
        $siswaTerakhir = ViolationList::siswaTerakhir();
        $siswaMelanggarHarian = ViolationList::siswaMelanggarHariIniDanHariKemarin();

        $siswaMelanggarHariIni = 0;
        $siswaMelanggarHariKemarin = 0;
        $kenaikanPadaHariIni = false;

        foreach ($siswaMelanggarHarian as $harian) {
            if ($harian['tanggal'] == date('Y-m-d')) {
                $siswaMelanggarHariIni = $harian['jumlah_siswa'];
            } else if ($harian['tanggal'] != date('Y-m-d')) {
                $siswaMelanggarHariKemarin = $harian['jumlah_siswa'];
            }
        }

        try {
            if ($siswaMelanggarHariIni > $siswaMelanggarHariKemarin) {
                $persentaseKenaikanSiswaHarian = round(($siswaMelanggarHariIni - $siswaMelanggarHariKemarin) / $siswaMelanggarHariIni * 100);
                $kenaikanPadaHariIni = true;
            } else if ($siswaMelanggarHariKemarin > $siswaMelanggarHariIni) {
                $kenaikanPadaHariIni = false;
                $persentaseKenaikanSiswaHarian = round(($siswaMelanggarHariKemarin - $siswaMelanggarHariIni) / $siswaMelanggarHariKemarin * 100);
            } else if ($siswaMelanggarHariIni == $siswaMelanggarHariKemarin) {
                $persentaseKenaikanSiswaHarian = 0;
            }
        } catch (\DivisionByZeroError $e) {
            $persentaseKenaikanSiswaHarian = 0;
        }

        \Log::info(DB::getQueryLog());
        $this->emit('getDataCategoryPelanggaran', true);
        return view('livewire.admin.dashboard.index', array_merge([
            'siswaTeratas' => $siswaTeratas,
            'kelasTeratas' => $kelasTeratas,
            'siswaTerakhir' => $siswaTerakhir
        ], compact(['siswaMelanggarHariIni', 'persentaseKenaikanSiswaHarian', 'siswaMelanggarHariKemarin', "kenaikanPadaHariIni"])));
    }
}
