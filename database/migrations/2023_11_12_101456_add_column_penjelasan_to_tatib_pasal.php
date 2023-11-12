<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnPenjelasanToTatibPasal extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('tatib_pasal', function (Blueprint $table) {
            $table->text('penjelasan')->after('judul_pasal')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('tatib_pasal', function (Blueprint $table) {
            $table->dropColumn('penjelasan');
        });
    }
}
