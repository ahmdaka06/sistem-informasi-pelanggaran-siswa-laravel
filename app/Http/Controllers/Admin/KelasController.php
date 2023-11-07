<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Imports\ClassImport;
use App\Models\ClassList;
use App\Models\Teacher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Log;

class KelasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $page = [
            'title' => 'Kelas',
            'breadcrumb' => [
                'first' => 'Kelas'
            ]
        ];

        return view('admin.kelas.index', ['page' => $page]);
        // return "ini adalah halman index";
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        // $page = [
        //     'title' => 'Input Kelas',
        //     'breadcrumb' => [
        //         'first' => 'Input Kelas'
        //     ]
        // ];

        // return view('admin.kelas.create', ['page' => $page]);
        $req = request()->all();

        if (isset($req['excel'])) {
            $page = [
                'title' => 'Tambah Siswa Excel',
                'breadcrumb' => [
                    'first' => 'Tambah Siswa Excel'
                ]
            ];

            return view('admin.kelas.createexcel', ['page' => $page]);
        }

        $page = [
            'title' => 'Tambah Siswa',
            'breadcrumb' => [
                'first' => 'Tambah Siswa'
            ]
        ];

        return view('admin.kelas.create', ['page' => $page]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'file' => ['required', 'mimes:xlsx, xls']
            ]);

            if ($validator->fails()) {
                $errors = $validator->errors()->toArray();
                return response()->json([
                    'error' => $errors['file'][0]
                ], 400);
            }

            $file = $request->file('file');

            // https://stackoverflow.com/questions/38104348/install-php-zip-on-php-5-6-on-ubuntu -> install php zip di linux
            \Excel::import(new ClassImport, $file); // required for extension zip library (apache)

            DB::commit();

            return response()->json(['data' => $request['file']], 200);
        } catch (\Throwable $e) {
            if ($e instanceof QueryException) { // jika ada query gagal
                DB::rollBack();
                // https://dev.mysql.com/doc/mysql-errors/8.0/en/server-error-reference.html
                return response()->json(['err_sql' => $e->errorInfo, 'error' => 'Gagal memasukan data. Cek format penulisan data excel di ' . config('app.link_panduan_data_siswa_excel') . " | [ {$e->errorInfo[2]} ]"], 500);
            }

            Log::error($e->getMessage());
            abort(500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(int $id)
    {
        $data = ClassList::with('guru')->find($id);

        $teachers = Teacher::all();

        $page = [
            'title' => 'Edit Kelas',
            'breadcrumb' => [
                'first' => 'Edit Kelas'
            ]
        ];

        return view('admin.kelas.edit', ['data' => $data, 'page' => $page, 'teachers' => $teachers]);
        // return "ini adalah halaman edit";
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //

        return $request->all();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
