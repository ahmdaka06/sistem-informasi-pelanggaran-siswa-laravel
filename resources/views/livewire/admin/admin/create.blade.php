<div>
    <form>
        <div class="form-group">
            <label for="exampleFormControlInput1">Nama Lengkap</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Nama lengkap" wire:model="full_name">
            @error('full_name') <span class="text-danger error">{{ $message }}</span>@enderror
        </div>
        <div class="form-group">
            <label for="exampleFormControlInput2">Username</label>
            <input type="text" class="form-control" id="exampleFormControlInput2" wire:model="username" placeholder="Username">
            @error('username') <span class="text-danger error">{{ $message }}</span>@enderror
        </div>
        <div class="form-group">
            <label for="exampleFormControlInput2">Email</label>
            <input type="email" class="form-control" id="exampleFormControlInput2" wire:model="email" placeholder="Email">
            @error('email') <span class="text-danger error">{{ $message }}</span>@enderror
        </div>
        <div class="form-group">
            <label for="exampleFormControlInput2">Phone Number</label>
            <input type="text" class="form-control" id="exampleFormControlInput2" wire:model="phone_number" placeholder="Phone Number">
            @error('phone_number') <span class="text-danger error">{{ $message }}</span>@enderror
        </div>
        <div class="form-group">
            <label for="exampleFormControlInput2">Password</label>
            <input type="password" class="form-control" id="exampleFormControlInput2" wire:model="password" placeholder="Password">
            @error('password') <span class="text-danger error">{{ $message }}</span>@enderror
        </div>
        <div class="form-group">
            <label for="exampleFormControlInput2">Role</label>
            <select name="role" class="form-control" id="role" wire:model="role">
                <option value="">Pilih salah satu...</option>
                @foreach ($form_role as $key => $value)
                    <option value="{{ $key }}"> {{ $value }}</option>
                @endforeach
            </select>
            @error('role') <span class="text-danger error">{{ $message }}</span>@enderror
        </div>
        <div class="form-group mt-3">
            <button type="button" wire:loading.attr="disabled"  wire:click.prevent="store()" class="btn btn-primary">Submit</button>
        </div>
    </form>
</div>
