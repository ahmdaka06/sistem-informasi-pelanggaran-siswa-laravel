@extends('admin.layouts.app')
@section('title', $page['title'])
@section('content')
<style>
    .sidebar{
        display: block;
        background: #fff;
        width: 600px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.2);
        padding: 10px;
        position: fixed;
        top: 71px;
        /* left: -235px; */
        /* right: -1000px; */
        right: -1000px;
        height: 100%;
        z-index: 999;
        transition:all 0.3s ease-out;
    }

    .sidebarshow{
        right: 0;
    }
</style>

    @livewire('admin.pelanggar')
@endsection
