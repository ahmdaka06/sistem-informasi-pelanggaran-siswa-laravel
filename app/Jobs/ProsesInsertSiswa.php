<?php

namespace App\Jobs;

use App\Models\ClassList;
use App\Models\Student;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class ProsesInsertSiswa implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public $collection;
    public function __construct($collection)
    {
        //
        $this->collection = $collection;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $dataResult = [];
        $dataKelas = ClassList::all();
        foreach ($this->collection as $key => $row) {
            if ($key == 0) {
                continue;
            }
            $nis = $row[1];
            $gender = strtolower($row[2]);
            $fullName = $row[0];
            $kelas = $row[3];
            $username = strtr(strtolower($fullName), [
                " " => "_"
            ]) . "_$key";

            $classId = $dataKelas->filter(fn($item) => $item['name'] == $kelas)->toArray();
            // $classId = $classId[0]['id'];
            // dd($classId[0]['id']);
            // if (count($classId) == 0) {
            //     dd($kelas);
            //     break;
            // }

            // dd($classId[0]['id']);
            // Student::create();

            array_push($dataResult, [
                'class_id' => 1,
                'email' => "$username@gamil.com",
                'identity_number' => $nis,
                'full_name' => $fullName,
                'username' => $username,
                'password' => bcrypt('password'),
                'gender' => $gender,
            ]);
        }

        foreach ($dataResult as $key => $result) {
            if ($key % 100 == 0) {
                sleep(1);
            }
            Student::create($result);
        }
    }
}
