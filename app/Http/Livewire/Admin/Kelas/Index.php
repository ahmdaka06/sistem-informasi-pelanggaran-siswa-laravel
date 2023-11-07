<?php

namespace App\Http\Livewire\Admin\Kelas;

use App\Models\ClassList;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\Component;
use Log;
use Throwable;

class Index extends Component
{
    use LivewireAlert;

    public $listeners = ['delete' => 'delete'];
    public function render()
    {
        $classList = ClassList::all();
        $items = ClassList::with('guru')->get();

        return view('livewire.admin.kelas.index', ['classList' => $classList, 'items' => $items]);
    }

    function delete(int $id)
    {
        try {
            ClassList::find($id)->delete();

            $this->alert('success', 'Sudah berhasil di hapus', [
                'toast' => true,
                'position' => 'top-right',
                'showConfirmButton' => false,
                'timer' => 3000
            ]);
        } catch (Throwable $e) {
            Log::error($e->getMessage());
            abort(500);
        }
    }
}
