<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tatib_butir_pasal extends Model
{
    use HasFactory;
    protected $table = "Tatib_pasal_butir";
    protected $fillable = [
        'pasal_id',
        'isi_pasal'
    ];
}
