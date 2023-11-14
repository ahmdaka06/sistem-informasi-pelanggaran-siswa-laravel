@extends('admin.layouts.app')
@section('title', $page['title'])
@section('content')
    @livewire('admin.siswa.index')
{{-- 
    <script>
        window.Echo.channel('pelanggaran')

            .listen('PelanggaranInserted', (e) => {

                console.log("listen nih = ", e);

            });
    </script> --}}
@endsection
