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

    static $withRelation = ['pelanggaran.category_pelanggaran', 'kelas'];

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

        $status = 'confirm';

        if (empty($search) && empty($kelas)) {
            return $builder->with(
                array_merge(
                    self::$withRelation,
                    ['pelanggaran' => fn($q) => $q->where('status', $status)]
                )
            );
        }

        if ($kelas && $search) {
            // return $builder->where(function (Builder $sql) use ($search, $kelas, $status) {
            //     $sql->where('class_id', $kelas)->where("full_name", "like", "%{$search}%")->with(
            //         array_merge(
            //             self::$withRelation,
            //             ['pelanggaran' => fn($q) => $q->where('status', $status)]
            //         )
            //     );
            // });
            return $builder
                ->where('class_id', $kelas)->where("full_name", "like", "%{$search}%")->with(
                    array_merge(
                        self::$withRelation,
                        ['pelanggaran' => fn($q) => $q->where('status', $status)]
                    )
                );
        }

        if ($kelas == '0' && $search) {
            return $builder->where("full_name", "like", "%{$search}%")->with(
                array_merge(
                    self::$withRelation,
                    ['pelanggaran' => fn($q) => $q->where('status', $status)]
                )
            );

            // return $builder->with(
            //     array_merge(
            //         self::$withRelation,
            //         ['pelanggaran' => fn($q) => $q->where('status', $status)]
            //     )
            // )->where("full_name", "like", "%{$search}%");

        }

        return $builder->where('class_id', $kelas)->with(
            array_merge(
                self::$withRelation,
                ['pelanggaran' => fn($q) => $q->where('status', $status)]
            )
        );
    }

    function scopeMineViolation(Builder $builder, int $id, string $year)
    {
        $status = 'confirm';

        if (empty($id)) {
            return null;
        }

        $student = $builder->with([
            'pelanggaran' => function ($q) use ($year, $status) {
                $q->where('status', $status)->whereYear('created_at', $year);
            },
            'pelanggaran.category_pelanggaran',
            'kelas'
        ])->find($id);

        $violation = $student->pelanggaran;

        return ['violations' => $violation, 'student' => $student];
    }
}
