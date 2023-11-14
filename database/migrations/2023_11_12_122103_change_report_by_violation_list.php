<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class ChangeReportByViolationList extends Migration
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
            DB::statement("ALTER TABLE violation_lists MODIFY COLUMN report_by ENUM('student','teacher', 'admin')");
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
            $table->dropColumn('report_by');
        });
    }
}
