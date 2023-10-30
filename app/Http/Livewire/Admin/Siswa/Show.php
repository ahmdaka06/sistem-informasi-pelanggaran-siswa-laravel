<?php

namespace App\Http\Livewire\Admin\Siswa;

use App\Models\Student;
use App\Services\StudentService;
use Livewire\Component;

class Show extends Component
{
    public $idSiswa, $bulan;

    protected $listeners = ['updateBulan' => 'updateBulan'];

    function mount()
    {
        $this->bulan = date('Y-m');
    }

    public function render()
    {
        $student = new StudentService;
        $yoi = $student->getMineViolationDataForGraphic($this->idSiswa, $this->bulan);
        $this->emit('mingguan', json_encode($yoi['sum_per_week']));
        $this->emit('bulanan', json_encode($yoi['sum_per_month']));
        return view('livewire.admin.siswa.show', ['detailSiswa' => $yoi['detail_siswa']]);
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
