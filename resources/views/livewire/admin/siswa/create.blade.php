<div>
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Formulir Input Data Siswa</h4>
            <p class="card-title-desc">Silahkan isi input di bawah ini.</p>

            <div class="mb-3 row">
                <label for="example-text-input" class="col-md-2 col-form-label">NIS</label>
                <div class="col-md-10">
                    <input class="form-control" type="text" wire:model="nis" placeholder="NIS">
                    @error('nis')
                        <span class="text-danger error">{{ $message }}</span>
                    @enderror
                </div>
            </div>

            <div class="mb-3 row">
                <label for="example-text-input" class="col-md-2 col-form-label">Nama Lengkap</label>
                <div class="col-md-10">
                    <input class="form-control" type="text" wire:change="inputUsernameClick" wire:model="namaLengkap"
                        placeholder="Nama Lengkap">
                    @error('namaLengkap')
                        <span class="text-danger error">{{ $message }}</span>
                    @enderror
                </div>
            </div>

            <div class="mb-3 row">
                <label for="example-text-input" class="col-md-2 col-form-label">Username</label>
                <div class="col-md-10">
                    <input class="form-control" type="text" wire:click="inputUsernameClick" wire:model="username"
                        placeholder="Username">
                    @error('username')
                        <span class="text-danger error">{{ $message }}</span>
                    @enderror

                </div>
            </div>


            <div class="mb-3 row" e>
                <label class="col-md-2 col-form-label">Kelas</label>
                <div class="col-md-10">
                    <div wire:ignore>
                        <select class="form-select js-example-basic-single form-control" wire:model="kelas"
                            name="state" id="state">
                            <option value = "" selected>Pilih Kelas</option>
                            @foreach ($classList as $kelas)
                                <option value="{{ $kelas->id }}">{{ $kelas->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    @error('kelas')
                        <span class="text-danger error">{{ $message }}</span>
                    @enderror
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-md-2 col-form-label">Jenis Kelamin</label>
                <div class="col-md-10">
                    <select class="form-select" wire:model="jenisKelamin">
                        <option value="l" selected>Laki-Laki</option>
                        <option value="p">Perempuan</option>
                    </select>
                    @error('jenisKelamin')
                        <span class="text-danger error">{{ $message }}</span>
                    @enderror
                </div>
            </div>

            <a href="{{ route('admin.siswa.index') }}" class="btn btn-primary">Kembali</a>
            <button wire:click="simpan" class="btn btn-success disable">Simpan</button>
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
        Livewire.emit('updateKelas', this.value)
    });
    // }
</script>
