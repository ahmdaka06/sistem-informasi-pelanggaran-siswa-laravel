<?php

namespace App\Http\Livewire\Admin\pencatatan;
use App\Models\ClassList;
use App\Models\Student;

use Livewire\Component;

class Index extends Component
{
    public $foo = "default", $count = 0, $kelas = "", $students=[];

    protected $listeners = ['postAdded' => 'incrementPostCount'];

    public function mount(){
        // $this->foo = "update";

        $this->kelas = ClassList::all();
        // $this->students = Student::all();
    }
 
    public function render()
    {
        return view('livewire.admin.pencatatan.index');
    }

    public function updatedFoo(){
        $this->students = Student::where("class_id", $this->foo)->get();
    }

    function incrementPostCount() {
        $this->count += 1;
    }
}
