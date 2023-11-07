<?php

use App\Http\Controllers\Admin\KelasController;
use App\Http\Controllers\Admin\SiswaController;
use App\Imports\StudentImport;
use App\Models\ClassList;
use Illuminate\Support\Facades\Route;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\CobaImport;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::group(['prefix' => 'admin', 'middleware' => ['auth:admin']], function () {
    Route::group(['prefix' => 'auth'], function () {
        Route::get('/login', [\App\Http\Controllers\Admin\Auth\LoginController::class, 'index'])->withoutMiddleware(['auth:admin'])->name('admin.auth.login');
        Route::get('/logout', [\App\Http\Controllers\Admin\Auth\LoginController::class, 'logout'])->name('admin.auth.logout');
    });
    Route::get('/dashboard', [\App\Http\Controllers\Admin\DashboardController::class, 'index'])->name('admin.dashboard');
    Route::get('/admin', [\App\Http\Controllers\Admin\AdminController::class, 'index'])->name('admin.admin.index');
    Route::get('/teacher', [\App\Http\Controllers\Admin\TeacherController::class, 'index'])->name('admin.teacher.index');
    Route::get('/inbox', [\App\Http\Controllers\Admin\InboxController::class, 'index'])->name('admin.inbox.index');
    Route::get('/pencatatan-pelanggaran', [\App\Http\Controllers\Admin\PencatatanPelanggaranController::class, 'index'])->name('admin.pencatatan.index');
    Route::get('/pelanggaran', [\App\Http\Controllers\Admin\PelanggaranController::class, 'index'])->name('admin.pelanggaran.index');

    // Siswa
    Route::name('admin.')->group(function () {
        Route::resource('siswa', SiswaController::class);
        Route::post('siswa/download/pdf', [SiswaController::class, 'cetakPdf'])->name('siswa.print');
        Route::resource('kelas', KelasController::class);
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
