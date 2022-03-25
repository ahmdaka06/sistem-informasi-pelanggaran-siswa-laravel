<?php

namespace App\Http\Controllers\Admin;

use App\Models\Teacher;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class TeacherController extends Controller
{
    public function index()
    {
        $page = [
            'title' => 'Teacher',
            'breadcrumb' => [
                'first' => 'Teacher'
            ]
        ];
        return view('admin.teacher.index' , compact('page'));
    }
}
