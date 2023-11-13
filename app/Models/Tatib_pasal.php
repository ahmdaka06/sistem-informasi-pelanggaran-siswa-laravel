<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tatib_pasal extends Model
{
    use HasFactory;
    protected $table = "Tatib_pasal";
    protected $fillable = [
        'bab_id',
        'nomor_pasal',
        'judul_pasal',
        'isi_pasal'
    ];

    function butir()
    {
        return $this->hasMany(Tatib_butir_pasal::class, 'pasal_id');
    }
}
