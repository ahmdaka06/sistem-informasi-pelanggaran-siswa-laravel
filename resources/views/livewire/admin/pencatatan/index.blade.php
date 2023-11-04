


<div>
    <div class="row">
        <div class="col-lg-4">
        <form action="">

            <div class="mb-3" wire:ignore>
                <label for="exampleFormControlInput1" class="form-label">Siswa</label>
                </select>
                <select class="form-select js-example-basic-single" id="selectSiswa" name="state" id="state">
                    <option value = "0" selected>Pilih Siswa</option>
                        @foreach($this->students as $student)
                            <option value="{{$student->id.",".$student->kelas->name}}">{{$student->kelas->name}} - {{$student->full_name}}</option>
                        @endforeach
                    </optgroup>
                </select>

            </div>

            <div class="mb-3" wire:ignore>
                <label for="exampleFormControlInput1" class="form-label">Pelanggaran</label>

                @if(count($pelanggarans) > 0)
                    <select class="form-select js-example-basic-single" id="selectPelanggaran">
                        <option value="0" selected>Pilih Pelanggaran</option>
                        @foreach($this->pelanggarans as $pelanggaran)
                            <option value="{{$pelanggaran->id}}">{{substr($pelanggaran->jenis_pelanggaran, 12)}} - {{$pelanggaran->name}}</option>
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
                                    <th>No</th>
                                    <th>Nama</th>
                                    <th>Kelas</th>
                                    <th>Pelanggaran</th>
                                    <th>Point</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($pelanggaranSiswa as $value)
                                <tr>
                                    <td>{{ $no++ }}</td>
                                    <td>{{ $value->student->full_name }}</td>
                                    <td>{{ $value->clas }}</td>
                                    <td>{{ $value->jenisPelanggaran->name }}</td>
                                    <td>{{ $value->jenisPelanggaran->point }}</td>
                                    <td><button class="btn btn-danger btn-sm" onclick="hapus({{$value->id}})">Hapus</button></td>
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

            $('#selectSiswa').on('change', function() {
                // alert( this.value );
                Livewire.emit('updateSiswa', this.value)
            });
            $('#selectPelanggaran').on('change', function() {
                // alert( this.value );
                Livewire.emit('updatePelanggaran', this.value)
            });
        });

        function hapus(id) {
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
                    Livewire.emit('delete', id);
                }
            });
        };
        // }
    </script>

{{-- @endsection --}}
