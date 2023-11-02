<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Student; 
class StudentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */

    protected $model = Student::class;


    public function definition()
    {
        $name = $this->faker->name;
        return [
        'class_id' => 2,
        'email' => $this->faker->unique()->safeEmail,
        'identity_number' => $this->faker->randomNumber(8, false),
        'full_name' => $name,
        'username' => $name,
        'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
        'gender' => 'l',
        'address' => $this->faker->address,
        'phone_number' => $this->faker->phoneNumber,
        'is_active' => 1,
        ];
    }
}
