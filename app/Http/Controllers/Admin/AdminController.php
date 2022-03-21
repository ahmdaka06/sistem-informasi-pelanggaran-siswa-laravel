<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function index()
    {
        $page = [
            'title' => 'Admin',
            'breadcrumb' => [
                'first' => 'Admin'
            ]
        ];
        return view('admin.'. request()->segment(2) .'.index' , compact('page'));
    }
}
