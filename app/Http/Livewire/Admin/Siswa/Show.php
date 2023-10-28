<?php

namespace App\Http\Livewire\Admin\Siswa;

use App\Services\StudentService;
use Livewire\Component;

class Show extends Component
{
    public $detailSiswa;

    public function render()
    {
        $student = new StudentService;
        $student->getDataForGraphic($this->detailSiswa);
        return view('livewire.admin.siswa.show');
    }
}
