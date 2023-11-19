<?php

namespace App\Http\Livewire\Admin\Pasal;

use App\Models\Tatib_bab;
use App\Models\Tatib_pasal;
use Livewire\Component;

class Index extends Component
{
    public $detailPasal = [ 'nomor_pasal' => '' , 'judul_pasal' => "", "isi_pasal" => ""];
    public function render()
    {
        $tatib = Tatib_bab::with("pasal")->get();
        return view('livewire.admin.pasal.index', compact('tatib'));
    }

    public function detailPasal($id){
        $pasal = Tatib_pasal::with('bab')->where('id', $id)->first();

        $this->detailPasal = $pasal;
    }
}
