<?php

namespace App\Http\Middleware;

use Illuminate\Support\Facades\Auth;
use Illuminate\Auth\AuthenticationException;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Illuminate\Auth\Middleware\Authenticate as Middleware;

class Authenticate extends Middleware
{
    use LivewireAlert;
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string|null
     */
    protected function redirectTo($request)
    {
        if (Auth::guard('admin')->check()) {
            if (Auth::guard('admin')->user()->is_active == 0) {
                Auth::guard('admin')->logout();
                session()->flash('error', 'Akun anda telah dinonaktifkan');
                return route('admin.auth.login');
            }
            return route('admin.dashboard');
        }
    }
}
