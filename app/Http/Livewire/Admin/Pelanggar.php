<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\ViolationCategory;


class Pelanggar extends Component
{

    public $pelanggaran;

    public function mount(){
        $this->pelanggaran = ViolationCategory::orderBy("jenis_pelanggaran")->get();
    }

    public function render()
    {
        return view('livewire.admin.pelanggaran.index');
    }
}
