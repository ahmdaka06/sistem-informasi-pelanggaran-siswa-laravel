<?php

namespace App\Http\Livewire\Admin\Siswa;

use App\Models\ClassList;
use Livewire\Component;

class Create extends Component
{
    public function render()
    {
        $classList = ClassList::all();
        return view('livewire.admin.siswa.create', ['classList' => $classList]);
    }
}
