<?php

namespace App\Services;

use App\Models\Student;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Throwable;

class StudentService
{
    public $errors, $status;

    function simpanData(int $kelas, string $namaLengkap, string $nis, string $jenisKelamin)
    {
        try {

            $username = strtr($namaLengkap, [
                " " => "_"
            ]);

            $username = strtolower($username);

            $validator = Validator::make([
                'username' => $username
            ], [
                'username' => ['required', 'unique:students,username']
            ]);

            if ($validator->fails()) {
                $errors = $validator->errors()->toArray();
                $this->errors = $errors['username'][0];
                $this->status = false;
                return $this;
            }

            Student::create([
                'class_id' => $kelas,
                'username' => $username,
                'identity_number' => $nis,
                'full_name' => $namaLengkap,
                'password' => Hash::make('password'),
                'gender' => $jenisKelamin,
            ]);

            $this->status = true;

            return $this;
        } catch (Throwable $e) {
            $this->status = false;
            Log::error($e->getMessage());
            throw $e; // harus bikin error handling yang menyatakan bahwa validasi gagal
        }
    }

    function getDataForGraphic(Student $student)
    {
        $pelanggaranBaru = $student->pelanggaran->map(function ($item) {
            $createdAt = Carbon::parse($item->created_at);
            $dayOfWeek = $createdAt->dayOfWeek;
            $monthOfYear = $createdAt->month;
            $day = $createdAt->day;
            $weekOfMonth = $createdAt->weekOfMonth;
            $dayName = $createdAt->format('l');

            $item->day_name = $dayName;
            $item->day = $day;
            $item->week_of_month = $weekOfMonth;
            $item->day_of_week = $dayOfWeek;
            $item->month = $monthOfYear;

            return $item;
        });

        unset($student->pelanggaran);

        $student->pelanggaran = $pelanggaranBaru->toArray();

        // dd($student->toArray());
    }
}
