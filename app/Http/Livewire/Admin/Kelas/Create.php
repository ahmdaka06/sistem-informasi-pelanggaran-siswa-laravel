<?php

namespace App\Http\Livewire\Admin\Kelas;

use App\Models\ClassList;
use App\Models\Teacher;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\Component;
use Log;
use Throwable;

class Create extends Component
{
    use LivewireAlert;
    public $namaKelas, $teacherId;

    protected $listeners = ['onChangeTeacherId' => 'onChangeTeacherId'];
    public function render()
    {
        $teachers = Teacher::all();
        return view('livewire.admin.kelas.create', ['teachers' => $teachers]);
    }

    function onChangeTeacherId($val)
    {
        $this->teacherId = (int) $val;
    }

    function simpan()
    {
        try {
            // dd(['namaKelas' => $this->namaKelas, 'teacherId' => $this->teacherId]);
            $this->validate([
                'namaKelas' => ['required'],
                'teacherId' => ['required', 'numeric'],
            ]);

            $explode = explode(' ', $this->namaKelas);
            $kelas = $explode[0] ? $explode[0] : 0;
            $jurusan = $explode[1] ? $explode[1] : 0;

            ClassList::create([
                'teacher_id' => $this->teacherId,
                'name' => $this->namaKelas,
                'is_active' => 1,
                'kelas' => $kelas,
                'jurusan' => $jurusan
            ]);

            $this->alert('success', 'Sudah berhasil di insert', [
                'toast' => true,
                'position' => 'top-right',
                'showConfirmButton' => false,
                'timer' => 3000
            ]);

        } catch (Throwable $e) {
            Log::error($e->getMessage());
            abort(500);
        }
    }
}
