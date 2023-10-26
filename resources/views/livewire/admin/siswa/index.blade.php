<div>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title"><i class="mdi mdi-format-list-bulleted-square"></i>Data Siswa</h4>
        </div>
        <div class="card-body">
            <a href="{{ route('admin.siswa.create') }}" class="btn btn-primary waves-effect waves-light">
                <i class="fa fa-plus fa-fw"></i> Tambah Siswa
            </a>
            <a href="{{ route('admin.siswa.create', ['excel' => true]) }}"
                class="btn btn-success waves-effect waves-light">
                <i class="fa fa-plus fa-fw"></i> Tambah Siswa via Excel
            </a>
            <div class="table-responsive mt-2">
                <table class="table table-bordered mb-0">
                    <thead class="table-light">
                        <tr>
                            <th>#</th>
                            <th>Nama</th>
                            <th>Kelas</th>
                            <th>Pelanggaran</th>
                            <th>Point</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
