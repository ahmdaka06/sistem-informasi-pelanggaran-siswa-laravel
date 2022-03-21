<?php

namespace App\Http\Livewire\Admin\Admin;

use Livewire\Component;
use App\Models\Admin;

class Edit extends Component
{
    public $full_name, $username, $password, $role;
    public $isFormEdit = false;

    public function mount($admin)
    {
        $this->isFormEdit = true;
        $data = Admin::find($admin);
        $this->full_name = $data->full_name;
        $this->username = $data->username;
        $this->password = '';
        $this->role = $data->role;
    }

    public function render()
    {
        // FORM //
        $form_role = [
            'super-admin' => 'SUPER ADMIN',
            'admin' => 'ADMIN'
        ];
        // END FORM //
        return view('livewire.admin.admin.edit', compact('form_role'));
    }
}
