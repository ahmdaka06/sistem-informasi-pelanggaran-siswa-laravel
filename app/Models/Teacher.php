<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticable;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Teacher extends Authenticable {

    use HasFactory, Notifiable;

    protected $guard = 'teacher';
    protected $fillable = [
        'full_name', 'identity_number', 'email', 'username', 'password', 'phone_number', 'is_active'
    ];
    protected $guarded = [];
    protected $hidden = [
        'password', 'remember_token',
    ];
}
