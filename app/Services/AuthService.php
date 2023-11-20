<?php

namespace App\Services;

use Illuminate\Support\Facades\Auth;

class AuthService
{
    static function logout()
    {
        $guards = config('auth.guards');

        $logout = false;
        foreach ($guards as $guardName => $guard) {
            if (Auth::guard($guardName)->check()) {
                Auth::guard($guardName)->logout();
                $logout = true;
            }
        }
        return $logout;
    }
}
