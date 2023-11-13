<?php

namespace App\Http\Livewire\Admin\Pasal;

use App\Models\Tatib_bab;
use App\Models\Tatib_pasal;
use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;


class Create extends Component
{
    use LivewireAlert;
    public $isi_pasal, $judul_pasal, $nomor_pasal, $nomor_bab, $judul_bab;
    protected $listeners = ['store', 'store_bab'];
    public function render()
    {

        $bab = Tatib_bab::all();
        return view('livewire.admin.pasal.create', compact('bab'));
    }

    public function store($idBab){
        $data = [
            'bab_id' => $idBab,
            'nomor_pasal' =>  $this->nomor_pasal,
            'judul_pasal' => $this->judul_pasal,
            "isi_pasal" => $this->isi_pasal
        ];

        $simpan = Tatib_pasal::create($data);

        $this->alert('success', 'Data berhasil di tambahkan', [
            'toast' => true,
            'position' => 'top-right',
            'showConfirmButton' => false,
            'timer' => 3000
        ]);

        // $this->emit('berhasil_simpan_pasal');
        $this->resetInputPasal();
    }

    public function store_bab($data){


        $simpan = Tatib_bab::create($data);

        // dd($simpan)

        $this->alert('success', 'Bab berhasil di tambahkan', [
            'toast' => true,
            'position' => 'top-right',
            'showConfirmButton' => false,
            'timer' => 3000
        ]);

        $this->emit('berhasil_simpan_bab', ['id' => $simpan->id, 'nomor_bab' => $simpan->nomor_bab, 'judul' => $simpan->judul]);
    }

    public function resetInputPasal(){
        $this->isi_pasal = "";
        $this->judul_pasal = "";
        $this->nomor_pasal = "";
    }


    public function resetInputBab(){
        $this->nomor_bab = "";
        $this->judul_bab = "";
    }


    public function berhasil_simpan_bab($data){
        $this->resetInputBab();
    }
}
