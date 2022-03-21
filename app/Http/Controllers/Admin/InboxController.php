<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Webklex\IMAP\Facades\Client;

class InboxController extends Controller
{
    public function index()
    {
        $page = [
            'title' => 'Inbox Email',
            'breadcrumb' => [
                'first' => 'Inbox Email'
            ]
        ];
        return view('admin.inbox.index', compact('page'));
    }
}
