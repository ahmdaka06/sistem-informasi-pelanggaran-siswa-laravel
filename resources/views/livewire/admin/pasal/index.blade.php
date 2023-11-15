<div>

    <div wire:ignore>
        <div id="selectSiswa" class="sidebar">
            <button class="btn btn-warning btn-sm mb-3" id="tombolTutupSidebar">Tutup</button>
            <form>
                <input type="hidden" id="idPelanggaran">
                <div class="form-group mb-3">
                    <label for="exampleFormControlInput1">Jenis Pelanggaran</label>
                    <select class="form-select js-example-basic-single" aria-label="Default select example">
                        <option selected>Pilh Jenis Pelanggaran</option>
                        <option value="pelanggaran ringan">Pelanggaran Ringan</option>
                        <option value="pelanggaran sedang">Pelanggaran Sedang</option>
                        <option value="pelanggaran berat">Pelanggaran Berat</option>
                    </select>
                    {{-- @error('full_name') <span class="text-danger error">{{ $message }}</span>@enderror --}}
                </div>

                <div class="form-group mb-3">
                    <label for="exampleFormControlInput2">Nama Pelanggaran</label>
                    <textarea class="form-control" id="namaPelanggaran" placeholder="Nama Pelanggaran" rows="5"></textarea>
                    @error('name') <span class="text-danger error">{{ $message }}</span>@enderror
                </div>

                <div class="form-group mb-3">
                    <label for="exampleFormControlInput2">Point</label>
                    <input type="number" class="form-control" id="point">
                    @error('point') <span class="text-danger error">{{ $message }}</span>@enderror
                </div>

                <div class="form-group mt-3">
                    <button type="button" wire:loading.attr="disabled" onclick="updateDataPelanggaran()" class="btn btn-success">Update</button>
                </div>
            </form>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 mb-2">
            <form>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="">Pencarian</label>
                        <input wire:model="search" class="form-control" type="search" placeholder="Search" aria-label="Search">
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title"><i class="mdi mdi-format-list-bulleted-square"></i> Pasal</h4>
                </div>
                <div class="card-body">
                    @auth("admin")
                        {{-- <button type="button" class="btn btn-primary waves-effect waves-light" data-bs-toggle="modal" data-bs-target="#create">
                            <i class="fa fa-plus fa-fw"></i> Tambah Data Pelanggaran
                        </button> --}}

                        <a href="{{route('admin.pasal.create')}}" class="btn btn-primary">Tambah Data Pelanggaran</a>
                    @endauth
                    <div class="table-responsive mt-2">
                        <table class="table table-bordered mb-0">
                            <thead  class="table-light">
                                <tr>
                                    <th>Bab</th>
                                    <th>Pasal</th>
                                    <th>#</th>
                                    {{-- <th>Point</th> --}}
                                    {{-- @auth("admin")
                                        <th>Aksi</th>
                                    @endauth --}}
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($tatib as $value)
                                <tr>
                                    <td rowspan="{{count($value->pasal) + 1}}">Bab {{ $value->nomor_bab }} {{ $value->judul_bab}}</td>
                                </tr>

                                    @foreach($value->pasal as $pasal)
                                    <tr>
                                        <td>Pasal {{ $pasal->nomor_pasal }} {{ $pasal->judul_pasal }}</td>
                                        <td><button class="btn btn-success btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#detail" wire:click.prevent="detailPasal('{{$pasal->id}}')"><i class="mdi mdi-eye"></i></button></td>
                                    </tr>
                                    @endforeach
                                    {{-- <td>{{ $value->jenis_pelanggaran }}</td>
                                    <td>{{ $value->name }}</td>
                                    <td>{{ $value->point }}</td>
                                    @auth("admin")
                                        <td>
                                            <a href="javascript:void(0);" class="px-3 text-danger" onclick="hapus({{$value->id}})"><i class="uil uil-trash-alt font-size-18"></i></a>
                                            <a href="javascript:void(0);" class="munculkanselect" onclick="munculkan('{{$value->id}}', '{{$value->name}}', '{{ $value->point }}', '{{$value->jenis_pelanggaran}}' )" class="px-3 text-primary"><i class="uil uil-pen font-size-18"></i></a>
                                        </td>
                                    @endauth --}}
                                
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <br>
                    {{-- {{ $lists->links() }} --}}
                </div>
            </div>
        </div>
    </div>
    <!-- end row -->
    @auth("admin")
        <!--  Extra Large modal example -->
        <div wire:ignore.self id="detail" class="modal fade bs-example-modal-xl" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="myExtraLargeModalLabel"><i class="fa fa-plus fa-fw"></i>Tambah Pelanggaran</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body">
                        <h1>Isi Pasal</h1>
                        <pre> {{$isiPasal}} </pre>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                        {{-- <button wire:click.prevent="closeModal()" type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button> --}}
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->


        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script>
            var buttonMuncul = document.querySelectorAll(".munculkanselect");
            var selectSiswa = document.querySelector("#selectSiswa");
            var buttonTutupSidebar = document.querySelector("#tombolTutupSidebar");

            function munculkan(id, nama, point, jenisPelanggaran){
                // alert("haiiii");
                    id  = document.querySelector("#idPelanggaran").value = id;
                    namaPelanggaran  = document.querySelector("#namaPelanggaran").value = nama;
                    point            = document.querySelector("#point").value = point;


                    $('.js-example-basic-single').val(jenisPelanggaran);
                    $('.js-example-basic-single').trigger('change');
                    selectSiswa.classList.add('sidebarshow');
            }

            function updateDataPelanggaran(){
                id  = document.querySelector("#idPelanggaran").value;
                namaPelanggaran  = document.querySelector("#namaPelanggaran").value;
                point            = document.querySelector("#point").value;
                jenisPelanggaran = document.querySelector(".js-example-basic-single").value;

                dataPelanggaran = {id: id, nama : namaPelanggaran, point : point, jenis : jenisPelanggaran};
                console.log(dataPelanggaran);
                Livewire.emit('update', dataPelanggaran)

                /* JIKA INGIN KETIKA SELESAI UPDATE, SIDEBAR LANGSUNG TERSEMBUNYI LAGI  */

                // window.livewire.on('adminRefresh', () => {
                //     selectSiswa.classList.remove('sidebarshow');
                // });
            }

            buttonTutupSidebar.onclick = function(){
                selectSiswa.classList.remove('sidebarshow');
            }
        </script>

        <script>
            // window.addEventListener('initSomething', event => {
            $(document).ready(function() {
                $('.js-example-basic-single').select2();
            });
        </script>

        <script type="text/javascript">
            window.livewire.on('adminRefresh', () => {
                Swal.hideLoading()
                $('.bs-example-modal-xl#create').modal('hide');
            });
        </script>


        <script>
            function hapus(id){

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
            }

            window.livewire.on('adminRefresh', () => {
                Swal.hideLoading()
                $('.bs-example-modal-xl').modal('hide');
            });
        </script>
    @endauth
</div>


