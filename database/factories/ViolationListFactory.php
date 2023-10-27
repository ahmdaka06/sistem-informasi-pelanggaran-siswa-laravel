<?php

namespace Database\Factories;

use App\Models\ClassList;
use App\Models\Student;
use App\Models\StudentParent;
use App\Models\ViolationCategory;
use Illuminate\Database\Eloquent\Factories\Factory;

class ViolationListFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'violation_category_id' => ViolationCategory::all()->random()->id,
            'student_id' => Student::all()->random()->id,
            'class_id' => ClassList::all()->random()->id,
            'student_parent_id' => 1,
            'report_by' => 'teacher',
            'note' => 'Jangan diulangi lagi ya',
            'status' => 'pending',
            'photo_proof' => 'foto'
        ];
    }
}
