<?php

namespace App\Http\Livewire\Admin\Auth\Guru;

use Livewire\Component;
use Illuminate\Support\Facades\Auth;
use Jantinnerezo\LivewireAlert\LivewireAlert;

class Login extends Component
{
    use LivewireAlert;

    public $username, $password, $remember, $count = 0;

    public function render()
    {
        return view('livewire.admin.auth.guru.login');
    }
    private function resetInputFields(){
        $this->username = '';
        $this->password = '';
        $this->remember = '';
    }

    public function login(){
        $this->validate([
            'username' => 'required',
            'password' => 'required',
        ]);
        if(Auth::guard('teacher')->attempt(['username' => $this->username, 'password' => $this->password], $this->remember)){
            $this->alert('success', 'Login berhasil !!');
            return redirect(route('guru.dashboard'));
        } else {
            $this->alert('error', 'Username atau password salah !!');
        }
    }

    // public function data(){
    //     rert
    // }




}
