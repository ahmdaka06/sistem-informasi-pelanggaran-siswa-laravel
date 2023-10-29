<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\ViolationCategory;


class Pelanggar extends Component
{

    public $pelanggaran; public $no = 1;
    protected $listeners = ['delete' => 'delete'];

    public function mount(){
        $this->pelanggaran = $this->getDataPelanggaran();
    }

    public function render()
    {
        return view('livewire.admin.pelanggaran.index');
    }

    function delete($id){

        // dd("$id");
        $pelanggaran = ViolationCategory::find($id);
        $pelanggaran->delete();

        $this->pelanggaran = $this->getDataPelanggaran();
    }

    function getDataPelanggaran(){

        $groupedData = collect(ViolationCategory::all());
        $sorted = $groupedData->sortBy(function ($item, $key) {
            if ($item['jenis_pelanggaran'] == 'pelanggaran ringan') {
                return 1;
            } elseif ($item['jenis_pelanggaran'] == 'pelanggaran sedang') {
                return 2;
            } elseif ($item['jenis_pelanggaran'] == 'pelanggaran berat') {
                return 3;
            } else {
                return 999;
            }
        });
        return $sorted->values()->all();
    }
}
