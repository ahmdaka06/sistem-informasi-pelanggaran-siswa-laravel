@extends('admin.layouts.app')
@section('title', $page['title'])
@section('content')
@section('style')
    <!-- Plugins css -->
    <link href="{{ asset('assets/libs/dropzone/min/dropzone.min.css') }}" rel="stylesheet" type="text/css">

    <!-- Bootstrap Css -->
    <link href="{{ asset('assets/css/bootstrap.min.css') }}" id="bootstrap-style" rel="stylesheet" type="text/css">
    <!-- Icons Css -->
    <link href="{{ asset('assets/css/icons.min.css') }}" rel="stylesheet" type="text/css">
    <!-- App Css-->
    <link href="{{ asset('assets/css/app.min.css') }}" id="app-style" rel="stylesheet" type="text/css">
@endsection


<div class="card">
    <div class="card-body">

        <h4 class="card-title">Dropzone</h4>
        <p class="card-title-desc">DropzoneJS is an open source library
            that provides drag’n’drop file uploads with image previews.
        </p>

        <div>
            <form action="#" class="dropzone dz-clickable">

                <div class="dz-message needsclick">
                    <div class="mb-3">
                        <i class="display-4 text-muted uil uil-cloud-upload"></i>
                    </div>

                    <h4>Drop files here or click to upload.</h4>
                </div>
            </form>
        </div>

        <div class="text-center mt-4">
            <button type="button" class="btn btn-primary waves-effect waves-light">Send Files</button>
        </div>
    </div>
</div>
@section('scripts')
    {{-- <script src="{{ asset('assets/libs/dropzone/min/dropzone.min.js') }}"></script> --}}
    <script src="{{ asset('assets/libs/jquery/jquery.min.js') }}"></script>
    <script src="{{ asset('assets/libs/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/libs/metismenu/metisMenu.min.js') }}"></script>
    <script src="{{ asset('assets/libs/simplebar/simplebar.min.js') }}"></script>
    <script src="{{ asset('assets/libs/node-waves/waves.min.js') }}"></script>
    <script src="{{ asset('assets/libs/waypoints/lib/jquery.waypoints.min.js') }}"></script>
    <script src="{{ asset('assets/libs/jquery.counterup/jquery.counterup.min.js') }}"></script>

    <!-- Plugins js -->
    <script src="{{ asset('assets/libs/dropzone/min/dropzone.min.js') }}"></script>

@endsection

@endsection
