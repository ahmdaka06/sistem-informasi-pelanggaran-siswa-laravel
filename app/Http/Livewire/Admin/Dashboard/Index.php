<?php

namespace App\Http\Livewire\Admin\Dashboard;

use App\Models\ViolationList;
use Livewire\Component;

class Index extends Component
{
    public $filterSiswaTeratas;

    function mount()
    {
        $this->filterSiswaTeratas = date('Y-m');
    }
    private function siswaTeratas()
    {
        [$tahun, $bulan] = explode('-', $this->filterSiswaTeratas);
        $siswaTeratas = ViolationList::dataTeratasSiswa(5, $bulan, $tahun);
        return $siswaTeratas;
    }

    public function render()
    {
        $siswaTeratas = $this->siswaTeratas();
        return view('livewire.admin.dashboard.index', [
            'siswaTeratas' => $siswaTeratas
        ]);
    }
}
