@extends('admin.layouts.app')
@section('title', $page['title'])
@section('content')
    @livewire('admin.siswa.show', ['idSiswa' => $id])
@endsection
