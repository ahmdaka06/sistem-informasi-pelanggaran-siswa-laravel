@extends('admin.layouts.app')
@section('title', $page['title'])
@section('content')
    <div class="card">
        <form action="{{ route('admin.kelas.update', $data->id) }}" method="post">
            @csrf
            @method('put')
            <div class="card-body">
                <h4 class="card-title">Formulir Edit Data Kelas</h4>
                <p class="card-title-desc">Silahkan edit data di bawah ini.</p>

                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">Nama Kelas</label>
                    <div class="col-md-10">
                        <input class="form-control" type="text" value="{{ $data['name'] }}" placeholder="Nama Kelas"
                            name="name">
                        @error('namaKelas')
                            <span class="text-danger error">{{ $message }}</span>
                        @enderror
                    </div>
                </div>

                <div class="mb-3 row" e>
                    <label class="col-md-2 col-form-label">Guru</label>
                    <div class="col-md-10">
                        <div>
                            <select class="form-select js-example-basic-single form-control" name="teacher_id"
                                id="state">
                                <option value = "" selected>Pilih Guru</option>
                                @foreach ($teachers as $teacher)
                                    <option value="{{ $teacher->id }}" @if ($data['teacher_id'] == $teacher->id) selected @endif>
                                        {{ $teacher->full_name }}</option>
                                @endforeach
                            </select>
                        </div>
                        @error('teacherId')
                            <span class="text-danger error">{{ $message }}</span>
                        @enderror
                    </div>
                </div>

                <a href="{{ route('admin.kelas.index') }}" class="btn btn-primary">Kembali</a>
                <button class="btn btn-success disable">Simpan</button>
            </div>
        </form>
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
@endsection
