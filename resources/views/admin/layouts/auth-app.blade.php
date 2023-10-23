
<!doctype html>
<html lang="en">

    <head>

        <meta charset="utf-8" />
        <title>@yield('title')</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesbrand" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        @livewireStyles
        @yield('assets')
        <!-- Bootstrap Css -->
        <link href="{{ asset('assets/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="{{ asset('assets/css/icons.min.css') }}" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="{{ asset('assets/css/app.min.css') }}" rel="stylesheet" type="text/css" />
        <script src="{{ asset('assets/libs/jquery/jquery.min.js') }}"></script>
        @yield('style')

    </head>

    <body class="authentication-bg">
        <div>
            <div class="account-pages my-5 pt-sm-5">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="text-center">
                                <a href="{{ url('/') }}" class="mb-5 d-block auth-logo">
                                    <img src="{{ asset('assets/images/logo-dark.png') }}" alt="" height="22" class="logo logo-dark">
                                    <img src="{{ asset('assets/images/logo-light.png') }}" alt="" height="22" class="logo logo-light">
                                </a>
                            </div>
                        </div>
                    </div>
                    @yield('content')
                </div>
            </div>
        </div>
        @livewireScripts

        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <x-livewire-alert::scripts />

        <!-- JAVASCRIPT -->
        <script src="{{ asset('assets/libs/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
        <script src="{{ asset('assets/libs/metismenu/metisMenu.min.js') }}"></script>
        <script src="{{ asset('assets/libs/simplebar/simplebar.min.js') }}"></script>
        <script src="{{ asset('assets/libs/node-waves/waves.min.js') }}"></script>
        <script src="{{ asset('assets/libs/waypoints/lib/jquery.waypoints.min.js') }}"></script>
        <script src="{{ asset('assets/libs/jquery.counterup/jquery.counterup.min.js') }}"></script>
        @yield('scripts')
        <!-- App js -->
        <script src="{{ asset('assets/js/app.js') }}"></script>
    </body>
</html>

