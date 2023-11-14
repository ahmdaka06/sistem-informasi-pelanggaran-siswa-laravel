<?php

namespace App\Http\Livewire\Admin\Dashboard;

use App\Models\ViolationList;
use Livewire\Component;

class Index extends Component
{
    public function render()
    {
        $data = ViolationList::with(['category_pelanggaran', 'siswa'])->get()->groupBy('siswa.id')->map(function ($item) {
            $totalPoint = 0;

            $dataPelanggaranSiswa = $item;

            foreach ($dataPelanggaranSiswa as $pelanggaran) {
                $totalPoint += $pelanggaran['category_pelanggaran']['point'];
            }

            $item->total_point = $totalPoint;
            return $item;
        });
        \Log::info($data->toJson());
        return view('livewire.admin.dashboard.index');
    }
}
