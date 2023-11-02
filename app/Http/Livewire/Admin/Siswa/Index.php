<?php

namespace App\Http\Livewire\Admin\Siswa;

use App\Models\ClassList;
use App\Models\Student;
use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;


class Index extends Component
{
    use LivewireAlert;

    public $textFilter, $kelasId, $datas;

    protected $listeners = ['onChangeKelas' => 'onChangeKelas', 'delete' => 'delete'];

    function onChangeKelas($kelasId)
    {
        $this->kelasId = $kelasId;
    }

    function delete($id)
    {
        Student::find($id)->delete();
        $this->alert('success', 'Data sudah berhasil di hapus', [
            'toast' => true,
            'position' => 'top-right',
            'showConfirmButton' => false,
            'timer' => 3000
        ]);
    }

    public function render()
    {
        $datas = $this->datas = collect(Student::search($this->textFilter, $this->kelasId)->get());
        $students = $datas
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
