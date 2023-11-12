<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tatib_bab extends Model
{
    use HasFactory;
    protected $table = "Tatib_bab";
    protected $fillable = [
        'nomor_bab',
        'judul'
    ];

    function pasal()
    {
        return $this->hasMany(Tatib_pasal::class, 'bab_id');
    }
}
