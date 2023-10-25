<div>
    {{-- Knowing others is intelligence; knowing yourself is true wisdom. --}}
    <div class="row">
        <div class="col-lg-4">
            {{-- <button wire:click="$emit('postAdded')">Klik</button> --}}
        <form action="">

            <div class="mb-3" wire:ignore>
                <label for="exampleFormControlInput1" class="form-label">Kelas</label>
                {{-- <select class="js-example-basic-single" aria-label="Default select example" wire:model="foo">
                    <option value="10 RPL">10 RPL</option>
                    <option value="10 TKJ">10 TKJ</option>
                </select> --}}
                <select class="form-select js-example-basic-single" wire:model="inputKelas" name="state" id="state">
                    <option value = "0" selected>Pilih kelas</option>
                    {{-- <optgroup label="4-legged pets"> --}}
                        @foreach($this->kelas as $kelas)
                            <option value="{{$kelas->id}}">{{$kelas->name}}</option>
                        @endforeach
                    </optgroup>
                    {{-- <option value="10 RPL">10 RPL</option>
                    <option value="10 TKJ">10 TKJ</option>
                    <option value="10 TKR">10 TKR</option>
                    <option value="10 TSM">10 TSM</option>
                    <option value="10 MPLB">10 MPLB</option>
                    <option value="10 TMI">10 TMI</option>
                    <option value="11 RPL">11 RPL</option>
                    <option value="11 TKJ">11 TKJ</option>
                    <option value="11 TKR">11 TKR</option>
                    <option value="11 TSM">11 TSM</option>
                    <option value="11 MPLB">11 MPLB</option>
                    <option value="11 TMI">11 TMI</option>
                    <option value="12 RPL">12 RPL</option>
                    <option value="12 TKJ">12 TKJ</option>
                    <option value="12 TKR">12 TKR</option>
                    <option value="12 TSM">12 TSM</option>
                    <option value="12 MPLB">12 MPLB</option>
                    <option value="12 TMI">12 TMI</option> --}}
                </select>

            </div>
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Nama</label>
                {{-- <input type="nama" class="form-control" id="exampleFormControlInput1" placeholder="Cari Nama" {{$foo !== "0" ? "" : "disabled"}}> --}}
                @if(count($students) > 0)
                    <select class="form-select" wire:model="inputSiswa" {{$kelas !== "0" ? "" : "disabled"}}>
                        <option value = "0" selected>Pilih Siswa</option>
                        @foreach($this->students as $student)
                            <option value="{{$student->id}}">{{$student->full_name}}</option>
                        @endforeach
                    </select>
                @else
                    <p>Tidak Ada Siswa</p>
                @endif
            </div>

            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Pelanggaran</label>

                {{-- <input type="nama" class="form-control" id="exampleFormControlInput1" placeholder="Cari Nama" {{$foo !== "0" ? "" : "disabled"}}> --}}
                @if(count($pelanggarans) > 0)
                    <select class="form-select" wire:model="inputPelanggaran">
                        <option value = "0" selected>Pilih Pelanggaran</option>
                        @foreach($this->pelanggarans as $pelanggaran)
                            <option value="{{$pelanggaran->id}}">{{$pelanggaran->name}}</option>
                        @endforeach
                    </select>
                @else
                    <p>Tidak Ada Data Pelanggaran</p>
                @endif
            </div>


            <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">Catatan</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Catatan Untuk Siswa" wire:model="inputCatatan"></textarea>
            </div>

            <input type="button" value="Simpan" class="btn btn-primary" wire:click.prevent="store()" />
        </form>
        </div>

        <div class="col-lg-8">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title"><i class="mdi mdi-format-list-bulleted-square"></i>Pelanggaran Siswa</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive mt-2">
                        <table class="table table-bordered mb-0">
                            <thead  class="table-light">
                                <tr>
                                    <th>#</th>
                                    <th>Nama</th>
                                    <th>Kelas</th>
                                    <th>Pelanggaran</th>
                                    <th>Point</th>
                                    {{-- <th>Tgl. Dibuat</th>
                                    <th>Tgl. Diperbarui</th> --}}
                                    {{-- <th>Aksi</th> --}}
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($pelanggaranSiswa as $value)
                                <tr>
                                    <td>{{ $value->id }}</td>
                                    <td>{{ $value->student->full_name }}</td>
                                    <td>{{ $value->student->kelas->name }}</td>
                                    <td>{{ $value->jenisPelanggaran->name }}</td>
                                    <td>{{ $value->jenisPelanggaran->point }}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{{-- @section("scripts") --}}
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>

        // window.addEventListener('initSomething', event => {
            $(document).ready(function() {
            $('.js-example-basic-single').select2();

            $('.js-example-basic-single').on('change', function() {
                // alert( this.value );
                Livewire.emit('siswaUpdate', this.value)
            });
        });
        // }
    </script>

{{-- @endsection --}}
