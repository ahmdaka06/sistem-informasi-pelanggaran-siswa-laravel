@extends('admin.layouts.app')
@section('title', $page['title'])
@section('content')
    @livewire('admin.siswa.show', ['detailSiswa' => $detailSiswa])
@endsection
