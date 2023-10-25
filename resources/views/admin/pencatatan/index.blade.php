@extends('admin.layouts.app')
@section('title', $page['title'])
@section('content')
@livewire('admin.pencatatan.index')
@endsection
{{-- @section('script')
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>



            $('.js-example-basic-single').select2();

            $('.js-example-basic-single').on('change', function() {
                // alert( this.value );
                Livewire.emit('postAdded', this.value)
            });
    </script>
@endsection --}}
