<?php

use App\Events\CobaEvent;
use App\Events\PelanggaranInserted;
use App\Http\Controllers\Admin\KelasController;
use App\Http\Controllers\Admin\SiswaController;
use App\Http\Controllers\Admin\PasalController;
use App\Http\Controllers\Auth\Siswa\LoginController;
use App\Imports\StudentImport;
use App\Models\ClassList;
use App\Models\ViolationList;
use Illuminate\Support\Facades\Route;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\CobaImport;

Route::get('/', function () {
    $page = [
        'title' => 'Detail Siswa',
        'breadcrumb' => [
            'first' => 'Detail Siswa'
        ]
    ];

    return view('siswa.index', ['id' => Auth::guard('siswa')->user()->id, 'page' => $page]);
})->name('siswa.dashboard');

// Route::get('ws', function () {
//     // PelanggaranInserted::dispatch("Yoi");
//     event(new CobaEvent);
//     // broadcast(new PelanggaranInserted(true));
// });

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
            Route::get('/login', [\App\Http\Controllers\Admin\Auth\LoginController::class, 'index'])->withoutMiddleware(['CekAuth'])->name('admin.auth.login')->middleware('guest');
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



        Route::group(['prefix' => 'pasal', "name" => "admin.pasal."], function () {
            Route::get("pasal", [PasalController::class, "index"])->name('admin.pasal.index');
            Route::get("pasal/create", [PasalController::class, "create"])->name('admin.pasal.create');
        });


        // Siswa
        Route::name('admin.')->group(function () {
            Route::resource('siswa', SiswaController::class);

            Route::get('siswa/create', [SiswaController::class, 'create'])->middleware('CekAdmin')->name('siswa.create');
            Route::post('siswa', [SiswaController::class, 'store'])->middleware('CekAdmin')->name('siswa.store');
            Route::get('siswa/{siswa}/edit', [SiswaController::class, 'edit'])->middleware('CekAdmin')->name('siswa.edit');
            Route::delete('siswa/{siswa}', [SiswaController::class, 'destroy'])->middleware('CekAdmin')->name('siswa.destroy');
            Route::put('siswa/{siswa}', [SiswaController::class, 'update'])->middleware('CekAdmin')->name('siswa.update');


            Route::post('siswa/download/pdf', [SiswaController::class, 'cetakPdf'])->name('siswa.print')->middleware('CekAdmin');
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

    Route::get('login', [LoginController::class, 'index'])->withoutMiddleware('CehAuth')->name('auth.siswa.login')->middleware('guest');
    Route::get('logout', [LoginController::class, 'logout'])->middleware('CekSiswa')->name('auth.siswa.logout');
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
