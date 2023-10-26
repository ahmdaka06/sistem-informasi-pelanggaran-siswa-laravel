<?php

namespace App\Http\Livewire\Admin\pencatatan;
use App\Models\ClassList;
use App\Models\Student;
use App\Models\ViolationCategory;
use App\Models\ViolationLists;
use Exception;


use Livewire\Component;

class Index extends Component
{
    public $count = 0, $kelas = "", $students=[], $pelanggarans = [], $pelanggaranSiswa = [], $no = 1;

    public $inputKelas, $inputPelanggaran, $inputSiswa, $inputCatatan;

    protected $listeners = ['updateSiswa' => 'updateSiswa', 'updatePelanggaran' => 'updatePelanggaran'];

    public function resetInput(){
        $this->inputCatatan = "";
    }

    public function mount(){
        $tanggalSekarang = date("Y-m-d");
        $this->students = Student::with("kelas")->get();
        $this->pelanggarans = ViolationCategory::all();
        $this->pelanggaranSiswa = ViolationLists::with("student", "student.kelas", "jenisPelanggaran")->where("created_at", "LIKE", "%{$tanggalSekarang}%")->get();
        // 'name','LIKE',"%{$search}%"
        // $this->students = Student::all();
    }
    // public function dehydrate()
    // {
    //     $this->dispatchBrowserEvent('initSomething');
    // }

    public function render()
    {
        return view('livewire.admin.pencatatan.index');
    }

    function updateSiswa($value) {
        $input = explode(",",$value);

        $this->inputSiswa = $input[0];
        $this->inputKelas = $input[1];
    }


    function updatePelanggaran($value) {
        $this->inputPelanggaran = $value;
    }

    function store(){

        try {

            $tanggalSekarang = date("Y-m-d");
            $data = [
                "clas" => $this->inputKelas,
                "violation_category_id" => $this->inputPelanggaran,
                "student_id" => $this->inputSiswa,
                "note" => $this->inputCatatan,
                "report_by" => "teacher",
                "status" => "confirm"
            ];

            // dd($data);

           ViolationLists::create($data);


           $this->pelanggaranSiswa = ViolationLists::with("student", "student.kelas", "jenisPelanggaran")->where("created_at", "LIKE", "%{$tanggalSekarang}%")->get();

           $this->resetInput();

        } catch (Exception $e) {
            // return $e;
            dd($e);
        }

    }

    function delete($id){
        $tanggalSekarang = date("Y-m-d");
        $pelanggaran = ViolationLists::find($id);
        $pelanggaran->delete();

        $this->pelanggaranSiswa = ViolationLists::with("student", "student.kelas", "jenisPelanggaran")->where("created_at", "LIKE", "%{$tanggalSekarang}%")->get();
        // dd("$id");
    }
}
