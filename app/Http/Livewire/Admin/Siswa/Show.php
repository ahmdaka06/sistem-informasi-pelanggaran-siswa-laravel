<?php

namespace App\Http\Livewire\Admin\Siswa;

use App\Models\Student;
use App\Services\StudentService;
use Livewire\Component;

class Show extends Component
{
    public $idSiswa, $bulan, $totalPoint, $tahun, $totalPointPerBulan, $bulanFiler, $rataRataPointTahunan, $rataRataPointBulanan; // => variabel $bulan untuk menampung bulan dan tahun (saya males ngubah karna sudah terlanjur)

    protected $listeners = ['updateBulan' => 'updateBulan'];

    function mount()
    {
        $this->bulan = date('Y-m');
    }

    function booted()
    {
        $this->emit('namaSiswa', "Keyla");
    }

    public function render()
    {
        $daftarBulan = ['-', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', "Desember"];
        $student = new StudentService;
        $yoi = $student->getMineViolationDataForGraphic($this->idSiswa, $this->bulan);
        if ($yoi) {
            $this->emit('mingguan', json_encode($yoi));
            $this->emit('bulanan', json_encode($yoi));
            $this->totalPoint = $yoi['sum_month'];
            $this->rataRataPointTahunan = $yoi['avg_month']; // => hati hati, belum di round !
            $this->rataRataPointBulanan = $yoi['avg_week']; // => hati hati, belum di round !
            $this->totalPointPerBulan = $yoi['sum_week'];
        }

        $pisah = explode("-", $this->bulan);
        $this->tahun = isset($pisah[0]) ? $pisah[0] : null;
        $this->bulanFiler = $daftarBulan[isset($pisah[1]) ? (int)$pisah[1] : 0];

        // Log::info($yoi['siswa']->)

        return view('livewire.admin.siswa.show', [
            'detailSiswa' => $yoi ? $yoi['detail_siswa'] : [],
            'grafikBulanan' => $yoi ? $yoi['sum_per_month'] : [],
            'grafikMingguan' => $yoi ? $yoi['sum_per_week'] : [],
            'grafikBulananRataRata' => $yoi ? $yoi['avg_per_month'] : [],
            'grafikMingguanRataRata' => $yoi ? $yoi['avg_per_week'] : [],
            'siswa' => $yoi ? $yoi['siswa'] : [],
        ]);
    }

    function updateBulan($value)
    {
        $this->bulan = $value;
    }

    function coba()
    {
        dd($this->bulan);
    }
}
