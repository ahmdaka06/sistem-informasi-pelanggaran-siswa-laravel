@extends('admin.layouts.app')
@section('title', $page['title'])
@section('content')
    <form action="{{ route('admin.siswa.update', $student->id) }}" method="post">
        @method('put')
        @csrf
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Formulir Input Data Siswa</h4>
                <p class="card-title-desc">Silahkan isi input di bawah ini.</p>

                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">NIS</label>
                    <div class="col-md-10">
                        <input class="form-control" type="text" name="nis" value="{{ $student->identity_number }}"
                            placeholder="NIS">
                        @error('nis')
                            <span class="text-danger error">{{ $message }}</span>
                        @enderror
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">Nama Lengkap</label>
                    <div class="col-md-10">
                        <input class="form-control" name="nama_lengkap" value="{{ $student->full_name }}" type="text"
                            placeholder="Nama Lengkap">
                        @error('namaLengkap')
                            <span class="text-danger error">{{ $message }}</span>
                        @enderror
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">Username</label>
                    <div class="col-md-10">
                        <input class="form-control" name="username" type="text" value={{ $student->username }}
                            placeholder="Username">
                        @error('username')
                            <span class="text-danger error">{{ $message }}</span>
                        @enderror

                    </div>
                </div>


                <div class="mb-3 row" e>
                    <label class="col-md-2 col-form-label">Kelas</label>
                    <div class="col-md-10">
                        <div>
                            <select class="form-select js-example-basic-single form-control" name="kelas">
                                @foreach ($classList as $kelas)
                                    <option value="{{ $kelas->id }}" @if ($kelas->id === $student->class_id) selected @endif>
                                        {{ $kelas->name }}</option>
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
                        <select class="form-select" name="jenis_kelamin">
                            <option value="l" @if ($student->gender == 'l') selected @endif>Laki-Laki</option>
                            <option value="p" @if ($student->gender == 'p') selected @endif>Perempuan</option>
                        </select>
                        @error('jenisKelamin')
                            <span class="text-danger error">{{ $message }}</span>
                        @enderror
                    </div>
                </div>

                <a href="{{ route('admin.siswa.index') }}" class="btn btn-primary">Kembali</a>
                <button class="btn btn-success disable">Simpan</button>
            </div>
        </div>
    </form>
@endsection
