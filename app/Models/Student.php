<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
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

    static $withRelation = ['pelanggaran', 'pelanggaran.category_pelanggaran', 'kelas'];

    public function kelas()
    {
        return $this->belongsTo(ClassList::class, "class_id", "id");
    }

    function pelanggaran()
    {
        return $this->hasMany(ViolationList::class, 'student_id');
    }

    public function scopeSearch(Builder $builder, string $search = null, int $kelas = null)
    {
        if (empty($search) && empty($kelas)) {
            return $builder->with(self::$withRelation);
        }

        if ($kelas && $search) {
            return $builder->where(function (Builder $sql) use ($search, $kelas) {
                $sql->where('class_id', $kelas)->where("full_name", "like", "%{$search}%")->with(self::$withRelation);
            });
        }

        return $builder->where(function (Builder $sql) use ($search, $kelas) {
            $sql->where('class_id', $kelas)->with(self::$withRelation);
        });
    }

    function scopeMineViolation(Builder $builder, int $id, string $year)
    {
        if (empty($id)) {
            return null;
        }

        $student = $builder->with(['pelanggaran' => function ($q) use ($year) {
            $q->where('status', 'confirm')->whereYear('created_at', $year);
        }, 'pelanggaran.category_pelanggaran', 'kelas'])->find($id);

        $violation = $student->pelanggaran;

        return $violation;
    }
}
