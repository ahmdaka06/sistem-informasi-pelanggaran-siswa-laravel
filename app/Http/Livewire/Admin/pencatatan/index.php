<?php

namespace App\Http\Livewire\Admin\pencatatan;
use App\Models\ClassList;
use App\Models\Student;
use App\Models\ViolationCategory;
use App\Models\ViolationLists;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Exception;


use Livewire\Component;

class Index extends Component
{
    use LivewireAlert;
    public $count = 0, $kelas = "", $students=[], $pelanggarans = [], $pelanggaranSiswa = [], $no = 1;

    public $inputKelas, $inputPelanggaran, $inputSiswa, $inputCatatan;

    protected $listeners = ['updateSiswa' => 'updateSiswa', 'updatePelanggaran' => 'updatePelanggaran', 'delete' => 'delete'];

    public function resetInput(){
        $this->inputCatatan = "";
    }

    public function mount(){
       
        $this->students = $this->getDataSiswa();
        $this->pelanggarans = ViolationCategory::all();
        $this->pelanggaranSiswa = $this->getDataListPelangaran();

        // dd(ViolationLists::with("student", "jenisPelanggaran")->where("created_at", "LIKE", "%{$tanggalSekarang}%")->get());
        // return ViolationLists::with("student", "jenisPelanggaran")->where("created_at", "LIKE", "%{$tanggalSekarang}%")->get();
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
            $data = [
                "clas" => $this->inputKelas,
                "violation_category_id" => $this->inputPelanggaran,
                "student_id" => $this->inputSiswa,
                "note" => $this->inputCatatan,
                "report_by" => "teacher",
                "status" => "confirm"
            ];

            // dd($data);

            $newData = ViolationLists::create($data);
            // dd($newData);

            $this->pelanggaranSiswa = $this->getDataListPelangaran();

            $this->resetInput();

            $this->alert('success', 'Data berhasil di tambahkan', [
                'toast' => true,
                'position' => 'top-right',
                'showConfirmButton' => false,
                'timer' => 3000
            ]);

        } catch (Exception $e) {
            // return $e;
            dd($e);
        }

    }

    function delete($id){
        $pelanggaran = ViolationLists::find($id);
        $pelanggaran->delete();
        // $data = collect($this->pelanggaranSiswa);

        // $filtered = $data->reject(function ($value, int $key) use ($id) {
        //     return $value->id == $id;
        // });

        // $this->pelanggaranSiswa = $filtered->all();

        $this->pelanggaranSiswa = $this->getDataListPelangaran();
        $this->alert('success', 'Data berhasil di hapus', [
            'toast' => true,
            'position' => 'top-right',
            'showConfirmButton' => false,
            'timer' => 3000
        ]);
        // dd("$id");
    }

    function getDataSiswa(){
        return Student::with(["kelas" => function($query){ $query->select('id','name'); }])->select("id", 'full_name', 'class_id')->get();
    }

    function getDataListPelangaran(){
        $tanggalSekarang = date("Y-m-d");
        return  ViolationLists::with("student", "jenisPelanggaran")->where("created_at", "LIKE", "%{$tanggalSekarang}%")->orderBy('created_at', 'desc')->get();
    }
}
