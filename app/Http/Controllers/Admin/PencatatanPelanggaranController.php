<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ViolationLists;


class PencatatanPelanggaranController extends Controller
{
    public function index(){
        $page = [
            'title' => 'Pencatatan Pelanggaran',
            'breadcrumb' => [
                'first' => 'Admin'
            ]
        ];
        // $pelanggaran = ViolationLists::with("student", "student.kelas")->get();

        // return $pelanggaran;
        return view("admin.pencatatan.index", ['page' => $page]);
    }
}
