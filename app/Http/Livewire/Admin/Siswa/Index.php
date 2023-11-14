<?php

namespace App\Http\Livewire\Admin\Siswa;

use App\Events\PelanggaranInserted;
use App\Models\ClassList;
use App\Models\Student;
use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\WithPagination;
use Log;


class Index extends Component
{
    use LivewireAlert, WithPagination;

    public $textFilter, $kelasId = '0', $datas, $filterSort = 'asc';

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
        $data_from = ($this->page - 1) * 10 == 0 ? 1 : ($this->page - 1) * 10;
        $data_to = $this->page * 10;
        $data_all = Student::search($this->textFilter, $this->kelasId)->count('id');

        // Masih ada problem ketika mencari data diluar scope paginate, data nya tidak muncul
        $datas = null;
        $items = null;
        if ($this->textFilter || $this->kelasId != '0') {
            $datas = Student::search($this->textFilter, $this->kelasId)->orderBy("created_at", $this->filterSort)->get();
            $items = $datas->map(function ($item) {
                $totalPoint = 0;
                $pelanggarans = $item->pelanggaran;

                foreach ($pelanggarans as $pelanggaran) {
                    $point = $pelanggaran['category_pelanggaran']['point'];
                    $totalPoint += $point;
                }

                $item->total_point = $totalPoint;
                return $item;
            });
        } else {
            $datas = Student::orderBy("created_at", $this->filterSort)->simplePaginate(10);
            $items = $datas->getCollection()->map(function ($item) {
                $totalPoint = 0;
                $pelanggarans = $item->pelanggaran;

                foreach ($pelanggarans as $pelanggaran) {
                    $point = $pelanggaran['category_pelanggaran']['point'];
                    $totalPoint += $point;
                }

                $item->total_point = $totalPoint;
                return $item;
            });
        }


        $classList = ClassList::all();

        return view('livewire.admin.siswa.index', [
            'students' => $items,
            'itemsPaginate' => $datas,
            'classList' => $classList,
            "data_from" => $data_from,
            "data_to" => $data_to,
            "data_all" => $data_all,
        ]);
    }
}
