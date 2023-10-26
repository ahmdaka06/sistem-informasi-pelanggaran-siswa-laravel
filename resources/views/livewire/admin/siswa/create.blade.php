<div>
    <div class="card">
        <div class="card-body">

            <h4 class="card-title">Formulir Input Data Siswa</h4>
            <p class="card-title-desc">Silahkan isi input di bawah ini.</p>

            <div class="mb-3 row">
                <label for="example-text-input" class="col-md-2 col-form-label">NIS</label>
                <div class="col-md-10">
                    <input class="form-control" type="text" placeholder="NIS" id="example-text-input">
                </div>
            </div>

            <div class="mb-3 row">
                <label for="example-text-input" class="col-md-2 col-form-label">Nama Lengkap</label>
                <div class="col-md-10">
                    <input class="form-control" type="text" placeholder="Nama Lengkap" id="example-text-input">
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-md-2 col-form-label">Kelas</label>
                <div class="col-md-10">
                    <select class="form-select js-example-basic-single form-control" wire:model="inputKelas"
                        name="state" id="state">
                        <option value = "0" selected>Pilih Kelas</option>
                        @foreach ($classList as $kelas)
                            <option value="{{ $kelas->id }}">{{ $kelas->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-md-2 col-form-label">Jenis Kelamin</label>
                <div class="col-md-10">
                    <select class="form-select">
                        <option>Laki-Laki</option>
                        <option>Perempuan</option>
                    </select>
                </div>
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
    // }
</script>
