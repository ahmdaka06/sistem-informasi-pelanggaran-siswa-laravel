<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\ViolationCategory;
use Jantinnerezo\LivewireAlert\LivewireAlert;

class Pelanggar extends Component
{
    use LivewireAlert;

    public $pelanggaran, $no = 1, $search;
    protected $listeners = ['delete', 'adminRefresh'];
    public $isFormEdit = false;

    public $jenis_pelanggaran, $name, $point;

    public function resetInput(){
        $this->jenis_pelanggaran = "";
        $this->name = "";
        $this->point = "";
    }

    public function render()
    {
        // $this->pelanggaran = $this->getSortedData();
       
        $dataQuery = ViolationCategory::orderBy('id', 'DESC');
        if ($this->search <> null) {
            // dd($this->search);
            $dataQuery->where(function ($query) {
                $query->where('id', 'like', '%'.$this->search.'%')
                ->orWhere('jenis_pelanggaran', 'like', '%'.$this->search.'%')
                ->orWhere('name', 'like', '%'.$this->search.'%')
                ->orWhere('point', 'like', '%'.$this->search.'%');
            });
            $data = $this->getSortedData($dataQuery->get());
        } else{
            $dataQuery = ViolationCategory::all();
            $data = $this->getSortedData($dataQuery);
        }


        return view('livewire.admin.pelanggaran.index', compact('data'));
    }

    public function adminRefresh()
    {
        # code...
    }

    function store(){

        try {
            $data = [
                "jenis_pelanggaran" => $this->jenis_pelanggaran,
                "name" => $this->name,
                "point" => $this->point,
            ];



            // dd($data);

            $newData = ViolationCategory::create($data);
            $this->alert('success', 'Berhasil menambahkan data Pelanggaran #' . $newData->id);
            $this->resetInput();
            $this->emit('adminRefresh');
        } catch (Exception $e) {
            // return $e;
            dd($e);
        }

    }


    function delete($id){

        // dd("$id");
        $pelanggaran = ViolationCategory::find($id);
        $pelanggaran->delete();

        $this->pelanggaran = $this->getSortedData(ViolationCategory::all());
    }

    function getSortedData($data){

        $groupedData = collect($data);
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

        // return $sorted;
        return $sorted->values()->all();
    }


    public function closeModal(){
        // $this->resetInputFields();
        // dd($this->pelanggaran);
        $this->isFormEdit = false;
    }
}
