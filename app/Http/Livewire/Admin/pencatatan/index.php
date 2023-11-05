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

    public $inputKelas, $inputPelanggaran, $inputSiswa, $inputCatatan, $search;

    protected $listeners = ['updateSiswa' => 'updateSiswa', 'updatePelanggaran' => 'updatePelanggaran', 'delete' => 'delete'];

    public function resetInput(){
        $this->inputCatatan = "";
    }

    public function mount(){
        $this->students = $this->getDataSiswa();
        $this->pelanggarans = ViolationCategory::all();
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
        $tanggalSekarang = date("Y-m-d");
        if ($this->search <> null) {
            $data = ViolationLists::with("student","jenisPelanggaran")
            ->where("created_at", "LIKE", "%$tanggalSekarang%")
            // ->orWhere(function($query){
            //     $query->where("clas", "LIKE", "%$this->search%");
            // })
            ->whereHas("student", function($query){
                $query->where("full_name", "LIKE", "%{$this->search}%");
            })
            ->orWhereHas("jenisPelanggaran", function($query){
                $query->where("jenis_pelanggaran", "LIKE", "%{$this->search}%");
                $query->orWhere("name", "LIKE", "%{$this->search}%");
            })
            ->orderBy('created_at', 'desc')
            ->get();
        }else{
            // $data = $this->getDataListPelangaran();
            // $data = ViolationLists::with("student", function($query){
            //     $query->where("identity_number", "23245017");
            // }, "jenisPelanggaran")
            // ->where("created_at", "LIKE", "%{$tanggalSekarang}%")->orderBy('created_at', 'desc')
            // ->get();
            $data = ViolationLists::with("student","jenisPelanggaran")
            ->where("created_at", "LIKE", "%$tanggalSekarang%")->orderBy('created_at', 'desc')
            ->get();
            // $data = ViolationLists::whereHas("student", function($query){
            //     $query->where("identity_number", "23245017");
            // })
            // ->get();

            // dd($data);

            // $data = $a->student()->where('identity_number', '23245017')->get();
        }
        return view('livewire.admin.pencatatan.index', compact('data'));
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
}
