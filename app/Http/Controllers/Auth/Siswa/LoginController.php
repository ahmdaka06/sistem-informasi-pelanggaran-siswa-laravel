<?php

namespace App\Http\Controllers\Auth\Siswa;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Jantinnerezo\LivewireAlert\LivewireAlert;

class LoginController extends Controller
{
    //

    use LivewireAlert;
    public function index()
    {
        return view('auth.siswa.login');
    }

    public function login()
    {
        echo "hiiii";
    }


    public function logout()
    {
        if (Auth::guard('siswa')->check() == false)
            return redirect(route('auth.siswa.login'));
        Auth::guard('siswa')->logout();
        session()->flash('success', 'Logout berhasil !!. Selamat datang kembali');
        return redirect(route('auth.siswa.login'));
    }
}
