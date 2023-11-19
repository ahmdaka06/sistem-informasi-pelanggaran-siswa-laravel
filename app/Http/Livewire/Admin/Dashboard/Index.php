<?php

namespace App\Http\Livewire\Admin\Dashboard;

use App\Models\ViolationList;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Index extends Component
{
    public $filterSiswaTeratas, $filterKelasTeratas;

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
        \Log::info(DB::getQueryLog());
        return view('livewire.admin.dashboard.index', [
            'siswaTeratas' => $siswaTeratas,
            'kelasTeratas' => $kelasTeratas,
            'siswaTerakhir' => $siswaTerakhir
        ]);
    }
}
