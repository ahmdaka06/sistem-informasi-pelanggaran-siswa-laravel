<?php

namespace App\Http\Livewire\Admin\Siswa;

use App\Models\ClassList;
use App\Services\StudentService;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\Component;

class Create extends Component
{
    use LivewireAlert;
    protected $listeners = ['updateKelas' => 'updateKelas', 'onChangeNamaLengkap' => 'onChangeNamaLengkap'];

    public $kelas, $namaLengkap, $nis, $username, $jenisKelamin = 'l'; // inputs

    public $usernameDiklik = false;

    public function render()
    {
        $classList = ClassList::all();
        $username = strtr($this->namaLengkap, [
            " " => "_"
        ]);

        $username = strtolower($username);

        if (!$this->usernameDiklik) {
            $this->username = $username;
        }

        return view('livewire.admin.siswa.create', ['classList' => $classList]);
    }

    function inputUsernameClick()
    {
        $this->usernameDiklik  = true;
    }

    function updateKelas(int $value)
    {
        $this->kelas = $value;
    }

    function simpan()
    {
        $this->validate([
            'kelas' => ['required', 'numeric'],
            'namaLengkap' => ['required'],
            'nis' => ['required'],
            'jenisKelamin' => ['required', 'in:l,p']
        ]);

        $student = new StudentService;

        $simpanStudent = $student->simpanData($this->kelas, $this->namaLengkap, $this->nis, $this->jenisKelamin);

        if (!$simpanStudent->status) {
            return $this->alert('error', $simpanStudent->errors);
        }

        $this->alert('success', 'Sudah berhasil di insert', [
            'toast' => true,
            'position' => 'top-right',
            'showConfirmButton' => false,
            'timer' => 3000
        ]);
    }
}
