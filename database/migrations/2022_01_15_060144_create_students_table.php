<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('students', function (Blueprint $table) {
            $table->id();
            $table->foreignId('class_id')->nullable();
            $table->string('email', 50)->unique();
            $table->string('identity_number')->unique();
            $table->string('full_name');
            $table->string('username', 50)->unique();
            $table->string('password');
            $table->enum('gender', ['l', 'p']);
            $table->longText('address')->nullable();
            $table->string('phone_number')->nullable();
            $table->rememberToken();
            $table->tinyInteger('is_active')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('students');
    }
}
