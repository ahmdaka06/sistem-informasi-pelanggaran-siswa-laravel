<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'class_id',
        'email',
        'identity_number',
        'full_name',
        'username',
        'password',
        'gender',
        'address',
        'phone_number',
        'is_active',
    ];


    public function kelas(){
        return $this->belongsTo(ClassList::class, "class_id", "id");
    }
}
