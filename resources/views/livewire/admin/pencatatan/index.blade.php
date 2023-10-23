<div>
    {{-- Knowing others is intelligence; knowing yourself is true wisdom. --}}
    <div class="row">
        <div class="col-lg-4">
             <h1>Count {{$foo}}</h1>
            {{-- <button wire:click="$emit('postAdded')">Klik</button> --}}
           <form action="">
           
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Kelas</label>
                {{-- <select class="js-example-basic-single" aria-label="Default select example" wire:model="foo">
                    <option value="10 RPL">10 RPL</option>
                    <option value="10 TKJ">10 TKJ</option>
                </select> --}}
                <select class="form-select js-example-basic-single" wire:model="foo" name="state" id="state">
                    <option value = "0" selected>Open this select menu</option>

                    @foreach($this->kelas as $kelas)
                        <option value="{{$kelas->id}}">{{$kelas->name}}</option>
                    @endforeach
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
                <select class="form-select" {{$foo !== "0" ? "" : "disabled"}}>
                    @foreach($this->students as $student)
                    <option value="{{$student->id}}">{{$student->full_name}}</option>
                @endforeach
                </select>
              </div>
              <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
              </div>
           </form>
        </div>

        <div class="col-lg-8">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellat autem provident aliquam facilis ab voluptas debitis adipisci blanditiis et, excepturi earum fuga, necessitatibus ex tempora enim facere corporis eos maxime.
            Illo adipisci veritatis ea dolore recusandae eveniet dolorem optio ad rem! Eaque odit voluptate molestiae! Quod aliquam mollitia expedita tempora tempore suscipit quisquam dolorem quae optio obcaecati. Nemo, iusto impedit!
            Beatae labore sint possimus cumque, perferendis corrupti natus placeat doloribus accusantium ratione veritatis? Repellat, distinctio cumque eveniet, sit odit reiciendis nobis nulla omnis error iusto consectetur. Quia minima non totam?
            Ex, cupiditate, officia pariatur est quae sit necessitatibus asperiores maiores alias tempore laudantium mollitia harum quibusdam, dolores earum. Sit dolorem laudantium fugit repellat excepturi cumque? Fuga delectus expedita et voluptatem.
        </div>
    </div>
</div>

@section("scripts")
{{-- <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
       $(document).ready(function() {
            $('.js-example-basic-single').select2();
        });
    </script> --}}

@endsection
