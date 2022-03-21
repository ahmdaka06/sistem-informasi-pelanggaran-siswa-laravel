<div>
    @if (session()->has('error'))
        <div class="alert alert-primary bg-danger alert-dismissible fade show text-white font-weight-bold" role="alert">
            <strong>{{ session('error') }}</strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">

            </button>
        </div>
    @endif
    @if (session()->has('success'))
        <div class="alert alert-primary bg-success alert-dismissible fade show text-white font-weight-bold" role="alert">
            {{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">

            </button>
        </div>
    @endif
</div>
