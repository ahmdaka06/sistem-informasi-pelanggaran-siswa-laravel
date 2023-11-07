<div>
    {{-- A good traveler has no fixed plans and is not intent upon arriving. --}}
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Formulir Input Data Kelas</h4>
            <p class="card-title-desc">Silahkan isi input di bawah ini.</p>

            <div class="mb-3 row">
                <label for="example-text-input" class="col-md-2 col-form-label">Nama Kelas</label>
                <div class="col-md-10">
                    <input class="form-control" type="text" wire:model="namaKelas" placeholder="Nama Kelas">
                    @error('namaKelas')
                        <span class="text-danger error">{{ $message }}</span>
                    @enderror
                </div>
            </div>

            <div class="mb-3 row" e>
                <label class="col-md-2 col-form-label">Guru</label>
                <div class="col-md-10">
                    <div wire:ignore>
                        <select class="form-select js-example-basic-single form-control" name="state" id="state">
                            <option value = "" selected>Pilih Guru</option>
                            @foreach ($teachers as $teacher)
                                <option value="{{ $teacher->id }}">{{ $teacher->full_name }}</option>
                            @endforeach
                        </select>
                    </div>
                    @error('teacherId')
                        <span class="text-danger error">{{ $message }}</span>
                    @enderror
                </div>
            </div>

            <a href="{{ route('admin.kelas.index') }}" class="btn btn-primary">Kembali</a>
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
        Livewire.emit('onChangeTeacherId', this.value)
    });
</script>
</div>
