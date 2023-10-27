<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColoumnJenisPelanggaranToViolationCategories extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('violation_categories', function (Blueprint $table) {
            $table->string("jenis_pelanggaran", 50)->after("id");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('violation_categories', function (Blueprint $table) {
            $table->dropColumn('jenis_pelanggaran');
        });
    }
}
