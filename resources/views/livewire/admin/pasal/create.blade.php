<div>
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Formulir Input Data Siswa</h4>
            <p class="card-title-desc">Silahkan isi input di bawah ini.</p>

            <div class="mb-3 row"  wire:ignore>
                <label for="example-text-input" class="col-md-2 col-form-label">BAB</label>
                <div class="col-md-8">
                    <select class="form-select js-example-basic-single">
                        <option value="" selected>Pilih Bab</option>
                        @foreach ($bab as $bab)
                            <option value="{{$bab->id}}">Bab {{ $bab->nomor_bab }} - {{ $bab->judul }}</option>
                        @endforeach
                    </select>
                    @error('bab')
                        <span class="text-danger error">{{ $message }}</span>
                    @enderror
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-primary waves-effect waves-light btn-sm" data-bs-toggle="modal" data-bs-target="#create">
                        <i class="fa fa-plus fa-fw"></i> Tambah Bab
                    </button>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="example-text-input" class="col-md-2 col-form-label">Nomor Pasal</label>
                <div class="col-md-10">
                    <input class="form-control" type="number" wire:model="nomor_pasal"
                        placeholder="Nomor Pasal">
                    @error('namaLengkap')
                        <span class="text-danger error">{{ $message }}</span>
                    @enderror
                </div>
            </div>
            <div class="mb-3 row">
                <label for="example-text-input" class="col-md-2 col-form-label">Judul Pasal</label>
                <div class="col-md-10">
                    <input class="form-control" type="text" wire:model="judul_pasal"
                        placeholder="Judul Pasal">
                    @error('namaLengkap')
                        <span class="text-danger error">{{ $message }}</span>
                    @enderror
                </div>
            </div>

            <div class="mb-3 row">
                <label for="exampleFormControlTextarea1" class="col-md-2 col-form-label">Isi Pasal</label>
                <div class="col-md-10">
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" wire:model="isi_pasal"></textarea>
                </div>
            </div>


            <a href="{{ route('admin.siswa.index') }}" class="btn btn-primary">Kembali</a>
            <button onclick="simpan()" class="btn btn-success disable">Simpan</button>
        </div>
    </div>
</div>


 <!--  Extra Large modal example -->
 <div wire:ignore.self id="create" class="modal fade bs-example-modal-xl" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myExtraLargeModalLabel"><i class="fa fa-plus fa-fw"></i>Tambah Bab</h5>
                <button type="button" wire:click.prevent="closeModal()" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                </button>
            </div>
            <div class="modal-body">
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">Nomor Bab</label>
                    <div class="col-md-10">
                        <input class="form-control" type="number" wire:model="nomor_bab" id="input_nomor_bab"
                            placeholder="Nomor Bab">
                        @error('namaLengkap')
                            <span class="text-danger error">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">Judul</label>
                    <div class="col-md-10">
                        <input class="form-control" type="text" wire:model="judul_bab" id="input_judul_bab"
                            placeholder="Judul Bab">
                        @error('namaLengkap')
                            <span class="text-danger error">{{ $message }}</span>
                        @enderror
                    </div>
                </div>

                <button type="button" wire:loading.attr="disabled" onclick="simpan_bab()" class="btn btn-primary">Submit</button>
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

        function simpan(){
            let bab_id =  $('.js-example-basic-single').val();
            Livewire.emit('store', bab_id)
        }

        function simpan_bab(){
            let nomor_bab = document.querySelector("#input_nomor_bab").value;
            let judul = document.querySelector("#input_judul_bab").value;

            let data = {
                nomor_bab,
                judul
            }

            // console.log(data);


            Livewire.emit('store_bab', data)
        }

        window.livewire.on('berhasil_simpan_bab', (data) => {
                Swal.hideLoading()
                $('.bs-example-modal-xl').modal('hide');

                text = `Bab ${data.nomor_bab} - ${data.judul}`;

                var newOption = new Option(text, data.id, false, false);

                $('.js-example-basic-single').append(newOption).trigger('change');

                resetInputBab();
        });

        function resetInputBab(){
            document.querySelector("#input_nomor_bab").value = "";
            document.querySelector("#input_judul_bab").value = "";
        }

        // Livewire.on('store', postId => {
        //     alert('A post was added with the id of: ' + postId);
        // })


    // window.addEventListener('initSomething', event => {
    $(document).ready(function() {
        $('.js-example-basic-single').select2();

        // $('.js-example-basic-single').select2({
        // language: {
        //   noResults: function () {
        //     return "Data tidak ditemukan. <a href='#' onclick='tambahData()'>Tambahkan data?</a>";
        //   }
        // }});

        // $('.js-example-basic-single').find("option[value='" + data.id + "']").length

        // // Set the value, creating a new option if necessary
        // if ($('.js-example-basic-single').find("option[value='" + data.id + "']").length) {
        //     // $('.js-example-basic-single').val(data.id).trigger('change');
        //     console.log("ketemuuuu");
        // } else {
        //     // Create a DOM Option and pre-select by default
        //     // var newOption = new Option(data.text, data.id, true, true);
        //     // // Append it to the select
        //     // $('.js-example-basic-single').append(newOption).trigger('change');
        //     // alert("hiiiii");
        //     console.log("buat baruuuuu");
        // }
    });



    // $('.js-example-basic-single').on('change', function() {
    //     // alert(this.value);
    //     Livewire.emit('updateKelas', this.value)
    // });
    // }
</script>
