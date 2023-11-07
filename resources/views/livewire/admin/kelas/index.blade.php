<div>
    {{-- If your happiness depends on money, you will never be happy with yourself. --}}
    <div class="card">
        <div class="card-header">
            <h4 class="card-title"><i class="mdi mdi-format-list-bulleted-square"></i>Data Siswa</h4>
        </div>
        <div class="card-body">
            <div class="container-fluid d-flex justify-content-between">
                <div>
                    <a href="{{ route('admin.kelas.create') }}" class="btn btn-primary waves-effect waves-light">
                        <i class="fa fa-plus fa-fw"></i> Tambah Kelas
                    </a>
                    <a href="{{ route('admin.kelas.create', ['excel' => true]) }}"
                        class="btn btn-success waves-effect waves-light mt-">
                        <i class="fa fa-plus fa-fw"></i> Tambah Kelas via Excel
                    </a>
                </div>

                <div class="d-flex">
                    <div wire:ignore>
                        <select class="form-select js-example-basic-single form-control" name="state" id="state">
                            <option value = "0" selected>Pilih Kelas</option>
                            @foreach ($classList as $kelas)
                                <option value="{{ $kelas->id }}">{{ $kelas->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    @error('kelas')
                        <span class="text-danger error">{{ $message }}</span>
                    @enderror
                    <input type="text" class="form-control form-control-sm" wire:model="textFilter"
                        placeholder="Cari Nama">
                </div>
            </div>
            <div class="table-responsive mt-2">
                <table class="table table-bordered mb-0">
                    <thead class="table-light">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Kelas</th>
                            <th scope="col">Guru</th>
                            <th scope="col" class="d-flex justify-content-end">Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        @foreach ($items as $key => $item)
                            <tr>
                                <td>{{ $key + 1 }}</td>
                                <td>{{ $item->name }}</td>
                                <td>{{ $item->guru->full_name }}</td>
                                <td class="d-flex justify-content-end gap-1">

                                    <button class="btn btn-danger" title="Delete"
                                        data-delete-id={{ $item->id }}>Delete</button>
                                    <a href="{{ route('admin.kelas.edit', $item->id) }}"
                                        class="btn btn-primary">Edit</a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
    // window.addEventListener('initSomething', event => {
    $(document).ready(function() {
        $('.js-example-basic-single').select2();
    });

    $('.js-example-basic-single').on('change', function() {
        // alert(this.value);
        Livewire.emit('onChangeKelas', this.value)
    });

    $("button[title=\"Delete\"]").click(function() {
        let _this = $(this);
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                // alert(_this.data('delete-id'));
                Livewire.emit('delete', _this.data("delete-id"));
            }
        });
    });
</script>
