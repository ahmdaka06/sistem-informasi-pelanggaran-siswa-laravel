<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\ViolationLists;
use App\Models\ViolationCategory;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});



Route::get("data-siswa", function(){
    $tanggalSekarang = date("Y-m-d");
    $tanggalSekarang = "2023-10-25";
    $data =  collect($this->pelanggaranSiswa = ViolationLists::with("student", "student.kelas", "jenisPelanggaran")->where("created_at", "LIKE", "%{$tanggalSekarang}%")->get());

    $filtered = $data->reject(function ($value, int $key) {
        return $value->id == 10;
    });

    // $filtered[] = [
    //     "name" => "hi"
    // ];
     
    // $filtered->all();

    
        // dd($data);
        // return $data;
    return response()->json($data, 200);
});

route::get("pelanggaran", function(){
    $pelanggaran = ViolationCategory::all();
    $groupedData = $pelanggaran->groupBy('jenis_pelanggaran')->map(function ($group) {
        return $group->map(function ($item) {
            return [
                'name' => $item->name,
                'point' => $item->point,
            ];
        });
    });

    $result = $groupedData->sortBy(function ($item, $key) {
        if ($key == 'pelanggaran-ringan') {
            return 1;
        } elseif ($key == 'pelanggaran-sedang') {
            return 2;
        } elseif ($key == 'pelanggaran-berat') {
            return 3;
        } else {
            return 999;
        }
    });
    return $groupedData;
});