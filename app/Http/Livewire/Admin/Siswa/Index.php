<?php

namespace App\Http\Livewire\Admin\Siswa;

use App\Models\ClassList;
use App\Models\Student;
use Livewire\Component;

class Index extends Component
{
    public $textFilter, $kelasId;

    protected $listeners = ['onChangeKelas' => 'onChangeKelas'];

    function onChangeKelas($kelasId)
    {
        $this->kelasId = $kelasId;
    }

    public function render()
    {
        $students = collect(Student::search($this->textFilter, $this->kelasId)->get())
            ->map(function ($item) {
                $totalPoint = 0;
                $pelanggarans = $item->pelanggaran;

                foreach ($pelanggarans as $pelanggaran) {
                    $point = $pelanggaran['category_pelanggaran']['point'];
                    $totalPoint += $point;
                }

                $item->total_point = $totalPoint;
                return $item;
            });

        $classList = ClassList::all();
        return view('livewire.admin.siswa.index', ['students' => $students, 'classList' => $classList]);
    }
}
