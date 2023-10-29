<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColoumnClasToViolationList extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('violation_lists', function (Blueprint $table) {
            // $table->dropColumn('class_id');
            // $table->string("clas", 100)->after("student_id");
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
            $table->string("class_id")->after("student_id");
            $table->dropColumn('clas');
        });
    }
}
