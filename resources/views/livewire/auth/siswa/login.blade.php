<div>
    <div class="row align-items-center justify-content-center">
        <div class="col-md-8 col-lg-6 col-xl-5">
            <div class="card">
                <div class="card-body p-4">
                    <div class="text-center mt-2">
                        <h5 class="text-primary">Login Siswa</h5>
                    </div>
                    <div class="p-2 mt-4">
                        <form wire:submit.prevent="login">
                            @include('livewire.components.alert')
                            <div class="mb-3">
                                <label class="form-label" for="username">Username</label>
                                <input type="text" class="form-control @error('username') is-invalid @enderror"
                                    id="username" name="username" placeholder="Masukkan username"
                                    wire:model="username">
                                @error('username')
                                    <small class="text-danger error">{{ $message }}</small>
                                @enderror
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="userpassword">Password</label>
                                <input type="password" class="form-control @error('password') is-invalid @enderror"
                                    id="userpassword" name="password" placeholder="Masukkan password"
                                    wire:model="password">
                                @error('password')
                                    <small class="text-danger error">{{ $message }}</small>
                                @enderror
                            </div>

                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="auth-remember-check">
                                <label class="form-check-label" for="auth-remember-check" wire:model="remember"
                                    name="remember">Remember
                                    me</label>
                            </div>

                            <div class="mt-3 text-end">
                                <button class="btn btn-primary w-sm waves-effect waves-light" type="button"
                                    wire:loading.attr="disabled" wire:click="login">Login</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>

        </div>
    </div>
    <!-- end row -->
</div>
