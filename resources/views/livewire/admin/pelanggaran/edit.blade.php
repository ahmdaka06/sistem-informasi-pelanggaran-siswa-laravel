<div>
    <form>
        <div class="form-group">
            <label for="exampleFormControlInput1">Jenis Pelanggaran</label>
            <select class="form-select" aria-label="Default select example" wire:model="jenis_pelanggaran">
                <option selected>Pilh Jenis Pelanggaran</option>
                <option value="pelanggaran ringan">Pelanggaran Ringan</option>
                <option value="pelanggaran sedang">Pelanggaran Sedang</option>
                <option value="pelanggaran berat">Pelanggaran Berat</option>
              </select>
            {{-- @error('full_name') <span class="text-danger error">{{ $message }}</span>@enderror --}}
        </div>


        <div class="form-group">
            <label for="exampleFormControlInput2">Nama Pelanggaran</label>
            <input type="text" class="form-control" id="exampleFormControlInput2" wire:model="name" placeholder="Nama Pelanggaran">
            @error('name') <span class="text-danger error">{{ $message }}</span>@enderror
        </div>

        <div class="form-group">
            <label for="exampleFormControlInput2">Point</label>
            <input type="number" class="form-control" id="exampleFormControlInput2" wire:model="point">
            @error('point') <span class="text-danger error">{{ $message }}</span>@enderror
        </div>

        <div class="form-group mt-3">
            <button type="button" wire:loading.attr="disabled" wire:click.prevent="update({{ $primaryKey }})" class="btn btn-primary">Submit</button>
        </div>
    </form>
</div>