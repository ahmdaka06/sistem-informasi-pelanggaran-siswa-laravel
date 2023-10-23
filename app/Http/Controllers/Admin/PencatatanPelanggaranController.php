<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PencatatanPelanggaranController extends Controller
{
    public function index(){
        $page = [
            'title' => 'Pencatatan Pelanggaran',
            'breadcrumb' => [
                'first' => 'Admin'
            ]
        ];

        return view("admin.pencatatan.index", ['page' => $page]);
    }
}
