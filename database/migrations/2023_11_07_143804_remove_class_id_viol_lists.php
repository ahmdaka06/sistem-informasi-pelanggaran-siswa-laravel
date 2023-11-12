<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RemoveClassIdViolLists extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('violation_lists', function (Blueprint $table) {
            //
            // $table->unsignedBigInteger('class_id')->nullable()->change();
            // $table->unsignedBigInteger('student_parent_id')->nullable()->change();
            // $table->mediumText('photo_proof')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('violation_lists', function (Blueprint $table) {
            //
            $table->dropColumn('class_id');
            $table->dropColumn('student_parent_id');
            $table->dropColumn('photo_proof');
        });
    }
}
