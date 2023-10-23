<?php

namespace App\Http\Controllers\Admin\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Jantinnerezo\LivewireAlert\LivewireAlert;

use Livewire\Component;

class LoginController extends Controller
{
    use LivewireAlert;

    
    public function __construct() {
        $this->middleware('guest:admin')->only('index');
    }
    public function index(){
        return view('admin.'. request()->segment(2) .'.login');
    }

    public function login(){
       echo "hiiii";
    }


    public function logout(){
        if (Auth::guard('admin')->check() == false) return redirect(route('admin.auth.login'));
        Auth::guard('admin')->logout();
        session()->flash('success', 'Logout berhasil !!. Selamat datang kembali');
        return redirect(route('admin.auth.login'));
    }
}
