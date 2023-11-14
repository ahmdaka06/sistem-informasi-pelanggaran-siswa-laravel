<?php

use App\Events\CobaEvent;
use App\Events\PelanggaranInserted;
use App\Http\Controllers\Admin\KelasController;
use App\Http\Controllers\Admin\SiswaController;
use App\Imports\StudentImport;
use App\Models\ClassList;
use App\Models\ViolationList;
use Illuminate\Support\Facades\Route;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\CobaImport;

Route::get('/', function () {
    return view('welcome');
});

Route::get('ws', function () {
    // PelanggaranInserted::dispatch("Yoi");
    event(new CobaEvent);
    // broadcast(new PelanggaranInserted(true));
});

Route::get('coba-data', function () {
    // SELECT
// 	violation_lists.id siswa_id,
//     students.full_name nama_siswa,
//     class_lists.name kelas,
//     SUM(violation_categories.point) jumlah,
//     COUNT(violation_lists.id) pelanggaran
// FROM violation_lists
// 	INNER JOIN violation_categories
//     	ON violation_lists.violation_category_id = violation_categories.id
// 	INNER JOIN students
//     	ON violation_lists.student_id = students.id
// 	INNER JOIN class_lists ON students.class_id = class_lists.id
// GROUP BY violation_lists.student_id
// ORDER BY jumlah DESC

    // DB::table('violation_lists')
    //     ->join('violation_categories', 'violation_lists.violation_category_id', '=', 'violation_categories.id')
    //     ->join('students', 'violation_lists.student_id', '=', 'students.id')
    //     ->join('class_lists', 'students.class_id', '=', 'class_lists.id')->get();
    $data = ViolationList::with(['category_pelanggaran', 'siswa'])->get()->groupBy('siswa.id');
    $result = [];
    foreach ($data as $key => $pelanggarans) {
        // ambil data pertama atau data keberapapun, jika yang di get nya atribut siswa, tidak akan ada perbedaan data
        $siswa = $pelanggarans[0]['siswa'];

        $totalPoint = 0;
        foreach ($pelanggarans as $pelanggaran) {
            $totalPoint += $pelanggaran['category_pelanggaran']['point'];
        }

        $result[$totalPoint] = $pelanggarans;

    }

    $result = collect($result); // -> hasilnya adalah array, key array nya adalah total point !

    $result = $result->sortKeysDesc()->toArray();

    dd($result);
    // foreach ($result as $point => $data) {
    //     dd(['point' => $point, 'nama siswa' => $data[0]['siswa']['full_name']]);
    // }
    // dd(['total' => $result[0]])
});

Route::get('503', function () {
    $page = [
        'title' => 'Maintenance',
        'breadcrumb' => [
            'first' => 'Maintenance'
        ]
    ];
    return view('error.maintenance', compact('page'));
})->name('503main');

Route::middleware('CekAuth')->group(function () {
    Route::group(['prefix' => 'admin'], function () {
        Route::group(['prefix' => 'auth'], function () {
            Route::get('/login', [\App\Http\Controllers\Admin\Auth\LoginController::class, 'index'])->withoutMiddleware(['CekAuth'])->name('admin.auth.login');
            Route::get('/logout', [\App\Http\Controllers\Admin\Auth\LoginController::class, 'logout'])
                ->middleware('CekAdmin')
                ->name('admin.auth.logout');
        });
        Route::get('/dashboard', [\App\Http\Controllers\Admin\DashboardController::class, 'index'])->name('admin.dashboard');
        Route::get('/admin', [\App\Http\Controllers\Admin\AdminController::class, 'index'])->middleware('CekAdmin')->name('admin.admin.index');

        Route::get('/teacher', [\App\Http\Controllers\Admin\TeacherController::class, 'index'])->name('admin.teacher.index');
        Route::get('/inbox', [\App\Http\Controllers\Admin\InboxController::class, 'index'])->name('admin.inbox.index');
        Route::get('/pencatatan-pelanggaran', [\App\Http\Controllers\Admin\PencatatanPelanggaranController::class, 'index'])->name('admin.pencatatan.index');
        Route::get('/pelanggaran', [\App\Http\Controllers\Admin\PelanggaranController::class, 'index'])->name('admin.pelanggaran.index');

        // Siswa
        Route::name('admin.')->group(function () {
            Route::resource('siswa', SiswaController::class);

            Route::get('siswa/create', [SiswaController::class, 'create'])->middleware('CekAdmin')->name('siswa.create');
            Route::post('siswa', [SiswaController::class, 'store'])->middleware('CekAdmin')->name('siswa.store');
            Route::get('siswa/{siswa}/edit', [SiswaController::class, 'edit'])->middleware('CekAdmin')->name('siswa.edit');
            Route::delete('siswa/{siswa}', [SiswaController::class, 'destroy'])->middleware('CekAdmin')->name('siswa.destroy');
            Route::put('siswa/{siswa}', [SiswaController::class, 'update'])->middleware('CekAdmin')->name('siswa.update');


            Route::post('siswa/download/pdf', [SiswaController::class, 'cetakPdf'])->name('siswa.print');
            Route::resource('kelas', KelasController::class);
        });

    });


    Route::group(['prefix' => 'guru'], function () {
        Route::group(['prefix' => 'auth'], function () {
            Route::get('/login', [\App\Http\Controllers\Admin\Auth\Guru\LoginController::class, 'index'])->withoutMiddleware(['CekAuth'])->name('guru.auth.login');
            Route::get('/logout', [\App\Http\Controllers\Admin\Auth\Guru\LoginController::class, 'logout'])->name('admin.auth.logout');
        });
        Route::get('/guru/dashboard', [\App\Http\Controllers\Admin\DashboardController::class, 'index'])->name('guru.dashboard');
    });


});

















Route::get('coba', function () {
    // ClassList::create([
    //     'teacher_id' => rand(1, 5),
    //     'name' => 'Yoi',
    //     'is_active' => 1,
    //     'kelas' => "RPL",
    //     'jurusan' => "hai"
    // ]);
    Excel::import(new StudentImport, public_path('Data Siswa SMK MUTU - 1.xlsx'));
    return null;
});
