<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnTeacherIdEtcToViolationList extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('violation_lists', function (Blueprint $table) {
            // $table->dropColumn('report_by');
            $table->bigInteger('teacher_id')->after('report_by')->nullable();
            $table->bigInteger('admin_id')->after('teacher_id')->nullable();
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
            // $table->dropColumn('report_by');
            $table->dropColumn("teacher_id");
            $table->dropColumn("admin_id");
        });
    }
}
