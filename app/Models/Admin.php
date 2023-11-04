<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticable;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Admin extends Authenticable
{

    use HasFactory, Notifiable;

    protected $guard = 'admin';
    protected $fillable = [
        'full_name',
        'username',
        'password',
        'role',
        'is_active'
    ];
    protected $guarded = [];
    protected $hidden = [
        'password', 'remember_token',
    ];
}
