<?php

namespace App\Http\Livewire\Admin\Admin;

use App\Models\Admin;
use Livewire\Component;
use Livewire\WithPagination;
use Jantinnerezo\LivewireAlert\LivewireAlert;

class Index extends Component
{
    use WithPagination;
    use LivewireAlert;

    public $admin, $full_name, $username, $password, $role;

    public $paginate = 10;
    public $orderBy = 'DESC';
    public $search;
    public $selectRole;

    protected $queryString = ['search'];
    protected $paginationTheme = 'bootstrap';

    protected $listeners = [
        'adminRefresh',
        'destroy'
    ];

    public $isFormEdit = false;

    private function resetInputFields(){
        $this->primaryKey = '';
        $this->full_name = '';
        $this->username = '';
        $this->password = '';
        $this->role = '';
    }

    public function mount()
    {

    }

    public function adminRefresh()
    {
        # code...
    }
    public function updatingSearch()
    {
        $this->resetPage();
    }

    public function render()
    {
        // FORM //
        $form_role = [
            'admin' => 'ADMIN',
            'super-admin' => 'SUPER ADMIN'
        ];
        // END FORM //

        // QUERY //
        $dataQuery = Admin::orderBy('id', $this->orderBy);
        if ($this->search <> null) {
            $dataQuery->where(function ($query) {
                $query->where('id', 'like', '%'.$this->search.'%')
                ->orWhere('full_name', 'like', '%'.$this->search.'%')
                ->orWhere('username', 'like', '%'.$this->search.'%');
            });
        }

        if ($this->selectRole <> null) {
            $dataQuery->where('role', $this->selectRole);
        }
        // END QUERY //

        $lists = $dataQuery->paginate($this->paginate);

        return view('livewire.admin.admin.index', compact('lists', 'form_role'));
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

        $this->alert('success', 'Berhasil menambahkan data admin #' . $insert->id);

        $this->resetInputFields();

        $this->emit('adminRefresh');
    }

    public function edit(Admin $admin){

        $this->isFormEdit = true;
        $this->primaryKey = $admin->id;
        $this->full_name = $admin->full_name;
        $this->username = $admin->username;
        $this->password = '';
        $this->role = $admin->role;
    }

    public function update(Admin $admin)
    {
        $this->validate([
            'full_name' => 'required',
            'username' => 'required',
            'role' => 'required|in:super-admin,admin',
        ], [], [

            'full_name' => 'Nama lengkap'
        ]);
        $data_input = [
            'full_name' => $this->full_name,
            'username' => $this->username,
            'role' => $this->role,
            'is_active' => 1
        ];
        if ($this->password <> null) {
            $data_input['password'] = $this->password;
        }
        $isExists = Admin::where('username', $data_input['username'])->first();
        if ($data_input['username'] <> $admin->username AND $isExists) {
            $validator = makeValidator($data_input, [
                'username' => 'required|unique:admins,username',
            ], [], ['username' => 'Username']);
            if ($validator->fails()) {
                return $this->addError('username', $validator->errors()->first());
            }
        }
        $admin->update($data_input);

        $this->alert('success', 'Berhasil mengubah data admin #' . $admin->id);

        $this->resetInputFields();

        $this->emit('adminRefresh');

        $this->isFormEdit = false;
    }

    public function delete(Admin $admin){
        $this->admin = $admin;
        $this->alert('warning', 'Apakah anda yakin akan menghapus data #' . $admin->id . ' ??', [
            'showDenyButton' => true,
            'denyButtonText' => 'Tidak',
            'showConfirmButton' => true,
            'confirmButtonText' => 'Ya',
            'onConfirmed' => 'destroy',
        ]);
    }

    public function destroy(){
        $this->admin->delete();
        $this->alert('success', 'Data #'.$this->admin->id.' berhasil dihapus !!', [
            'toast' => true,
            'position' => 'top-right',
            'showConfirmButton' => false,
            'timer' => 3000
        ]);
        $this->admin = [];
        $this->emit('adminRefresh');
    }

    public function changeIsActive(Admin $admin, $isActive){
        try {
            $admin->is_active = $isActive == 1 ? 0 : 1;
            $admin->save();
            $this->alert('success', 'Berhasil mengubah status !!', [
                'toast' => true,
                'position' => 'top-right',
                'showConfirmButton' => false,
                'timer' => 3000
            ]);
        } catch (\Throwable $th) {
            $this->alert('error', 'Gagal mengubah status !! Silahkan refresh halaman', [
                'toast' => true,
                'position' => 'top-right',
                'showConfirmButton' => false,
                'timer' => 3000
            ]);
        }
        $this->emit('adminRefresh');
    }
    public function closeModal(){
        $this->resetErrorBag();
        $this->resetValidation();
        $this->resetInputFields();
        $this->isFormEdit = false;
    }
}
