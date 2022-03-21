<?php

namespace App\Http\Livewire\Admin\Admin;

use Livewire\Component;
use App\Models\Admin;
use Jantinnerezo\LivewireAlert\LivewireAlert;

class Create extends Component
{
    use LivewireAlert;

    public $full_name, $username, $password, $role;
    public $isFormEdit = false;

    private function resetInputFields(){
        $this->full_name = '';
        $this->username = '';
        $this->password = '';
        $this->role = '';
    }

    public function render()
    {
        $this->isFormEdit =  false;
        // FORM //
        $form_role = [
            'super-admin' => 'SUPER ADMIN',
            'admin' => 'ADMIN'
        ];
        // END FORM //
        return view('livewire.admin.admin.create', compact('form_role'));
    }

    public function store()
    {

        $this->validate([
            'full_name' => 'required',
            'username' => 'required|unique:admins,username',
            'password' => 'required',
            'role' => 'required|in:super-admin,admin',
        ], [], [

            'full_name' => 'Nama lengkap'
        ]);
        $insert = Admin::create([
            'full_name' => $this->full_name,
            'username' => $this->username,
            'password' => bcrypt($this->password),
            'role' => $this->role,
            'is_active' => 1
        ]);

        $this->alert('success', 'Berhasil menambahkan admin #' . $insert->id);

        $this->resetInputFields();

        $this->emit('adminStore');
    }
}
