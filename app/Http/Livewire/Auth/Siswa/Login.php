<?php

namespace App\Http\Livewire\Auth\Siswa;

use Illuminate\Support\Facades\Auth;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\Component;

class Login extends Component
{
    use LivewireAlert;

    public $username, $password, $remember, $count = 0;
    private function resetInputFields()
    {
        $this->username = '';
        $this->password = '';
        $this->remember = '';
    }

    public function login()
    {
        $this->validate([
            'username' => 'required',
            'password' => 'required',
        ]);
        if (Auth::guard('siswa')->attempt(['username' => $this->username, 'password' => $this->password], $this->remember)) {
            $this->alert('success', 'Login berhasil !!');
            return redirect(route('siswa.dashboard'));
        } else {
            $this->alert('error', 'Username atau password salah !!');
        }
    }
    public function render()
    {
        return view('livewire.auth.siswa.login');
    }
}
