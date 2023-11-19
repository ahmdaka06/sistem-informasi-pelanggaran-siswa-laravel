<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PasalController extends Controller
{
    public function index(){
        $page = [
            'title' => 'Pasal',
            'breadcrumb' => [
                'first' => 'Pasal'
            ]
        ];

        return view('admin.pasal.index', ['page' => $page]);
    }

    public function create(){
        $page = [
            'title' => 'Tambah Pasal Baru',
            'breadcrumb' => [
                'first' => 'Pasal'
            ]
        ];

        return view("admin.pasal.create", ['page' => $page]);
    }
}
