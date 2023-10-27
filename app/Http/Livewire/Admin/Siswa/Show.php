<?php

namespace App\Http\Livewire\Admin\Siswa;

use Livewire\Component;

class Show extends Component
{
    public $detailSiswa;

    public function render()
    {
        return view('livewire.admin.siswa.show');
    }
}
