<div>

    <div class="row">
        <div class="col-lg-12 mb-2">
            <form>
                <div class="row">
                    <div class="form-group col-md-4">
                        <label for="">Limit</label>
                        <select wire:model="paginate" class="form-control">
                            <option value="10">Default</option>
                            <option value="25">25</option>
                            <option value="50">50</option>
                            <option value="50">100</option>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="">Role</label>
                        <select wire:model="selectRole" class="form-control">
                            <option value="">Semua</option>
                            @foreach ($form_role as $key => $value)
                            <option value="{{ $key }}">{{ $value }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="">Pencarian</label>
                        <input wire:model="search" class="form-control" type="search" placeholder="Search" aria-label="Search">
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title"><i class="mdi mdi-format-list-bulleted-square"></i> Admin</h4>
                </div>
                <div class="card-body">
                    <button type="button" class="btn btn-primary waves-effect waves-light" data-bs-toggle="modal" data-bs-target=".bs-example-modal-xl">
                        <i class="fa fa-plus fa-fw"></i> Tambah Admin
                    </button>
                    <div class="table-responsive mt-2">
                        <table class="table table-bordered mb-0">
                            <thead  class="table-light">
                                <tr>
                                    <th>#</th>
                                    <th>Nama</th>
                                    <th>Username</th>
                                    <th>Role</th>
                                    <th>Status</th>
                                    <th>Tgl. Dibuat</th>
                                    <th>Tgl. Diperbarui</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($lists as $value)
                                <tr>
                                    <td>{{ $value->id }}</td>
                                    <td>{{ $value->full_name }}</td>
                                    <td>{{ $value->username }}</td>
                                    <td>{{ $value->role }}</td>
                                    <td>
                                        <div class="form-check form-switch mb-3" dir="ltr">
                                            <input type="checkbox" class="form-check-input" id="customSwitch1" wire:click="changeIsActive({{ $value->id }}, {{ $value->is_active }})" {{ $value->is_active == 1 ? 'checked' : '' }}>
                                            <label class="form-check-label" for="customSwitch1">{{ $value->is_active == 1 ? 'Aktif' : 'Nonaktif' }}</label>
                                        </div>
                                    </td>
                                    <td>{{ parseCarbon($value->created_at)->isoFormat('dddd, D MMMM Y, HH:mm:ss') }}</td>
                                    <td>{{ parseCarbon($value->updated_at)->isoFormat('dddd, D MMMM Y, HH:mm:ss') }}</td>
                                    <td>
                                        <a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target=".bs-example-modal-xl" wire:click="edit({{ $value->id }})" class="px-3 text-primary"><i class="uil uil-pen font-size-18"></i></a>
                                        <a href="javascript:void(0);" class="px-3 text-danger"  wire:click="delete({{ $value->id }})"><i class="uil uil-trash-alt font-size-18"></i></a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <br>
                    {{ $lists->links() }}
                </div>
            </div>
        </div>
    </div>
    <!-- end row -->
    <!--  Extra Large modal example -->
    <div wire:ignore.self class="modal fade bs-example-modal-xl" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myExtraLargeModalLabel"><i class="fa fa-plus fa-fw"></i> {{ (!$isFormEdit) ? 'Tambah Admin' : 'Edit Admin #' . $primaryKey }}</h5>
                    <button type="button" wire:click.prevent="closeModal()" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">
                    @if (!$isFormEdit)
                    @include('livewire.admin.admin.create')
                    @else
                    @include('livewire.admin.admin.edit')
                    @endif
                </div>
                <div class="modal-footer">
                    <button wire:click.prevent="closeModal()" type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <script type="text/javascript">
        window.livewire.on('adminRefresh', () => {
            Swal.hideLoading()
            $('.bs-example-modal-xl').modal('hide');
        });
    </script>
</div>


