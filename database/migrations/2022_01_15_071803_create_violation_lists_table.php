<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateViolationListsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('violation_lists', function (Blueprint $table) {
            $table->id();
            $table->foreignId('violation_category_id');
            $table->foreignId('student_id');
            $table->foreignId('class_id');
            $table->foreignId('student_parent_id');
            $table->enum('report_by', ['student', 'teacher', 'admin']);
            $table->timestamp('report_at')->nullable();
            $table->longText('note');
            $table->mediumText('photo_proof');
            $table->enum('status', ['pending', 'confirm', 'reject']);
            $table->timestamps();
        });
    }

    /**8
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('violation_lists');
    }
}
