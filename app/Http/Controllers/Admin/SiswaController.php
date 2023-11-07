<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Imports\StudentImport;
use App\Models\ClassList;
use App\Models\Student;
use App\Services\StudentService;
use Illuminate\Http\Request;
use Excel;
use Exception;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Log;
use Throwable;

class SiswaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $page = [
            'title' => 'Siswa',
            'breadcrumb' => [
                'first' => 'Siswa'
            ]
        ];


        return view('admin.siswa.index', ['page' => $page]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $req = request()->all();

        if (isset($req['excel'])) {
            $page = [
                'title' => 'Tambah Siswa Excel',
                'breadcrumb' => [
                    'first' => 'Tambah Siswa Excel'
                ]
            ];

            return view('admin.siswa.createexcel', ['page' => $page]);
        }

        $page = [
            'title' => 'Tambah Siswa',
            'breadcrumb' => [
                'first' => 'Tambah Siswa'
            ]
        ];

        return view('admin.siswa.create', ['page' => $page]);
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
            Excel::import(new StudentImport, $file); // required for extension zip library (apache)

            DB::commit();
            return response()->json(['data' => $request['file']], 200);
        } catch (Throwable $e) {
            if ($e instanceof QueryException) { // jika ada query gagal
                DB::rollBack();
                // https://dev.mysql.com/doc/mysql-errors/8.0/en/server-error-reference.html
                return response()->json(['err_sql' => $e->errorInfo, 'error' => 'Gagal memasukan data. Cek format penulisan data excel di ' . config('app.link_panduan_data_siswa_excel') . " | [ {$e->errorInfo[2]} ]"], 500);
            }
            ;

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
    public function show(int $id)
    {

        $page = [
            'title' => 'Detail Siswa',
            'breadcrumb' => [
                'first' => 'Detail Siswa'
            ]
        ];

        return view('admin.siswa.show', ['id' => $id, 'page' => $page]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data = Student::find($id);

        $page = [
            'title' => 'Edit Siswa',
            'breadcrumb' => [
                'first' => 'Edit Siswa'
            ]
        ];

        $classList = ClassList::all();

        return view('admin.siswa.edit', ['page' => $page, 'classList' => $classList, 'student' => $data]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, int $id)
    {
        $student = Student::find($id);
        if (!$student) {
            abort(404, 'Data tidak dapat ditemukan');
        }

        $update = $student->update([
            'identity_number' => $request->nis,
            'full_name' => $request->nama_lengkap,
            'username' => $request->username,
            'class_id' => (int) $request->kelas,
            'gender' => $request->jenis_kelamin
        ]);

        if (!$update) {
            return abort(500, 'Gagal disimpan');
        }

        return redirect()->back()->with('success', "Data sudah berhasil di update");
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

    function cetakPdf(Request $req)
    {
        $id = (int) $req->id;
        $tanggal = $req->tanggal;

        $studentS = new StudentService;

        return $studentS->downloadPdfDetailStudent($id, $tanggal)->download('detail siswa.pdf');
    }
}
