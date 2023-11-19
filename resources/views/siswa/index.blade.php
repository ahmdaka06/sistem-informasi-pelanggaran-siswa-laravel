@extends('siswa.layouts.siswa-layout')
@section('title', $page['title'])
@section('content')
    @livewire('siswa.dashboard', ['idSiswa' => $id])
@endsection
