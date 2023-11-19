<?php

namespace App\Http\Livewire\Admin\Pasal;

use App\Models\Tatib_bab;
use App\Models\Tatib_pasal;
use Livewire\Component;

class Index extends Component
{
    public $isiPasal = "";
    public function render()
    {
        $tatib = Tatib_bab::with("pasal")->get();
        return view('livewire.admin.pasal.index', compact('tatib'));
    }

    public function detailPasal($id){
        $pasal = Tatib_pasal::find($id);


        // dd($pasal->isi_pasal);
        $this->isiPasal = $pasal->isi_pasal;
    }
}
