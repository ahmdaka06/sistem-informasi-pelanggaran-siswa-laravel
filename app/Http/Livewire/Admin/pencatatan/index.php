<?php

namespace App\Http\Livewire\Admin\pencatatan;
use App\Models\ClassList;
use App\Models\Student;
use App\Models\ViolationCategory;
use App\Models\ViolationLists;

use Livewire\Component;

class Index extends Component
{
    public $count = 0, $kelas = "", $students=[], $pelanggarans = [], $pelanggaranSiswa = [];

    public $inputKelas, $inputPelanggaran, $inputSiswa, $inputCatatan;

    protected $listeners = ['postAdded' => 'incrementPostCount'];

    public function resetInput(){
        $this->inputKelas = "";
        $this->inputPelanggaran = "";
        $this->inputSiswa = "";
        $this->inputCatatan = "";
    }

    public function mount(){
        $tanggalSekarang = date("Y-m-d");
        $this->kelas = ClassList::all();
        $this->pelanggarans = ViolationCategory::all();
        $this->pelanggaranSiswa = ViolationLists::with("student", "student.kelas", "jenisPelanggaran")->where("created_at", "LIKE", "%{$tanggalSekarang}%")->get();
        // 'name','LIKE',"%{$search}%"
        // $this->students = Student::all();
    }
 
    public function render()
    {
        return view('livewire.admin.pencatatan.index');
    }

    public function updatedInputKelas(){
        $this->students = Student::where("class_id", $this->inputKelas)->get();
    }

    function incrementPostCount() {
        $this->count += 1;
    }

    function store(){
        $tanggalSekarang = date("Y-m-d");
        $data = [
            "class_id" => $this->inputKelas,
            "violation_category_id" => $this->inputPelanggaran,
            "student_id" => $this->inputSiswa,
            "note" => $this->inputCatatan,
            "report_by" => "teacher",
            "status" => "confirm"
        ];


       $simpan = ViolationLists::create($data);

       $this->pelanggaranSiswa = ViolationLists::with("student", "student.kelas", "jenisPelanggaran")->where("created_at", "LIKE", "%{$tanggalSekarang}%")->get();

       $this->resetInput();
    }
}
