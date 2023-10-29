<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\ViolationCategory;


class Pelanggar extends Component
{

    public $pelanggaran;

    public function mount(){
        $this->pelanggaran = $this->getDataPelanggaran();
    }

    public function render()
    {
        return view('livewire.admin.pelanggaran.index');
    }

    function delete($id){

        dd("$id");
        $pelanggaran = ViolationCategory::find($id);
        $pelanggaran->delete();

        $this->pelanggaran = $this->getDataPelanggaran();
    }

    function getDataPelanggaran(){

        $groupedData = ViolationCategory::all();
        $result = $groupedData->sortBy(function ($item, $key) {
            if ($key == 'pelanggaran ringan') {
                return 1;
            } elseif ($key == 'pelanggaran sedang') {
                return 2;
            } elseif ($key == 'pelanggaran berat') {
                return 3;
            } else {
                return 999;
            }
        });
        return $result;
    }
}
