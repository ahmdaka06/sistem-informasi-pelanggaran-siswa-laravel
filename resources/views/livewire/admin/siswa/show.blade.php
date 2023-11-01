<div>
    @php
        use Carbon\Carbon;
    @endphp
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    {{-- Success is as dangerous as failure. --}}
    {{-- {{ $detailSiswa }} --}}
    <div class="container-fluid">
        <div class="row">
            <div class="mb-3 row">
                <label for="example-month-input" class="col-md-1 col-form-label">Month</label>
                <div class="col-md-11 d-flex">
                    <input class="form-control" type="month" value="{{ date('Y-m') }}" id="month-input">
                    <form action="{{ route('admin.siswa.print') }}" method="post">
                        @csrf
                        <input type="text" name="id" value="{{ $idSiswa }}" hidden>
                        <input type="text" value="{{ $bulan }}" name="tanggal" hidden>
                        <button class="btn btn-success ms-2" type="submit">Cetak</button>
                    </form>
                </div>

            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div style="width: 100%; height: 100%;">
                    <div id="minggu"></div>
                </div>
            </div>
            <div class="col-md-6">
                <div style="width: 100%; height: 100%;">
                    <div id="bulan"></div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="float-end">
                            <div class="dropdown">
                                <a class="dropdown-toggle" href="#" id="dropdownMenuButton3"
                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="text-muted">Recent<i class="mdi mdi-chevron-down ms-1"></i></span>
                                </a>

                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton3"
                                    style="">
                                    <a class="dropdown-item" href="#">Recent</a>
                                    <a class="dropdown-item" href="#">By Users</a>
                                </div>
                            </div>
                        </div>

                        <h4 class="card-title mb-4">Aktivitas Pelanggaran ({{ $tahun }})</h4>

                        <ol class="activity-feed mb-0 ps-2" data-simplebar="init" style="max-height: 339px;">
                            <div class="simplebar-wrapper" style="margin: 0px 0px 0px -8px;">
                                <div class="simplebar-height-auto-observer-wrapper">
                                    <div class="simplebar-height-auto-observer"></div>
                                </div>
                                <div class="simplebar-mask">
                                    <div class="simplebar-offset" style="right: -20px; bottom: 0px;">
                                        <div class="simplebar-content-wrapper"
                                            style="height: auto; padding-right: 20px; padding-bottom: 0px; overflow: hidden scroll;">
                                            <div class="simplebar-content" style="padding: 0px 0px 0px 8px;">
                                                {{-- <li class="feed-item">
                                                    <div class="feed-item-list">
                                                        <p class="text-muted mb-1 font-size-13">Today<small
                                                                class="d-inline-block ms-1">12:20 pm</small></p>
                                                        <p class="mb-0">Kamu telah dilaporan oleh seseorang karena
                                                            telah melakukan pelanggaran <span
                                                                class="text-primary">merokok</span> -- Udah saatnya kamu
                                                            harus kembali ke jalan yang benar 😊 --</p>
                                                        <p class="text-muted mb-1 font-size-13">+<small
                                                                class="d-inline-block ms-1">10 Point</small></p>
                                                    </div>
                                                </li>
                                                <li class="feed-item">
                                                    <p class="text-muted mb-1 font-size-13">22 Jul, 2020 <small
                                                            class="d-inline-block ms-1">12:36 pm</small></p>
                                                    <p class="mb-0">Kamu telah dilaporan oleh seseorang karena
                                                        telah melakukan pelanggaran <span
                                                            class="text-primary">tawuran</span></p>
                                                    <p class="text-muted mb-1 font-size-13">~<small
                                                            class="d-inline-block ms-1">Menunggu konfirmasi</small></p>
                                                </li> --}}
                                                @foreach ($detailSiswa as $item)
                                                    <li class="feed-item">
                                                        <p class="text-muted mb-1 font-size-13">
                                                            {{ Carbon::parse($item->created_at)->format('d M, Y') }}<small
                                                                class="d-inline-block ms-1">{{ Carbon::parse($item->created_at)->format('h:i A') }}</small>
                                                        </p>
                                                        <p class="mb-0">Telah dilaporan oleh seseorang karena
                                                            telah melakukan pelanggaran <span
                                                                class="text-primary">{{ $item->category_pelanggaran->name }}</span>
                                                        </p>
                                                        @if ($item->status === 'confirm')
                                                            <p class="text-muted mb-1 font-size-13">
                                                                <span>Catatan : {{ $item->note }}</span> <br />
                                                                +<small
                                                                    class="d-inline-block ms-1">{{ $item->category_pelanggaran->point }}
                                                                    Point</small>
                                                            </p>
                                                        @endif
                                                        @if ($item->status == 'pending')
                                                            <p class="text-muted mb-1 font-size-13">~<small
                                                                    class="d-inline-block ms-1">Menunggu
                                                                    konfirmasi</small>
                                                            </p>
                                                        @endif
                                                    </li>
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="simplebar-placeholder" style="width: auto; height: 474px;"></div>
                            </div>
                            <div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
                                <div class="simplebar-scrollbar"
                                    style="transform: translate3d(0px, 0px, 0px); display: none;"></div>
                            </div>
                            <div class="simplebar-track simplebar-vertical" style="visibility: visible;">
                                <div class="simplebar-scrollbar"
                                    style="height: 252px; transform: translate3d(0px, 0px, 0px); display: block;">
                                </div>
                            </div>
                        </ol>

                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="float-end mt-2" style="position: relative;">
                            <div id="customers-chart" data-colors="[&quot;--bs-primary&quot;]"
                                style="min-height: 46px;">
                                <div id="apexchartsp29zxgiv"
                                    class="apexcharts-canvas apexchartsp29zxgiv apexcharts-theme-light"
                                    style="width: 45px; height: 46px;"><svg id="SvgjsSvg1373" width="45"
                                        height="46" xmlns="http://www.w3.org/2000/svg" version="1.1"
                                        xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs"
                                        class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)"
                                        style="background: transparent;">
                                        <g id="SvgjsG1375" class="apexcharts-inner apexcharts-graphical"
                                            transform="translate(0, 0)">
                                            <defs id="SvgjsDefs1374">
                                                <clipPath id="gridRectMaskp29zxgiv">
                                                    <rect id="SvgjsRect1377" width="51" height="47" x="-3"
                                                        y="-1" rx="0" ry="0" opacity="1"
                                                        stroke-width="0" stroke="none" stroke-dasharray="0"
                                                        fill="#fff"></rect>
                                                </clipPath>
                                                <clipPath id="gridRectMarkerMaskp29zxgiv">
                                                    <rect id="SvgjsRect1378" width="49" height="49" x="-2"
                                                        y="-2" rx="0" ry="0" opacity="1"
                                                        stroke-width="0" stroke="none" stroke-dasharray="0"
                                                        fill="#fff"></rect>
                                                </clipPath>
                                            </defs>
                                            <g id="SvgjsG1379" class="apexcharts-radialbar">
                                                <g id="SvgjsG1380">
                                                    <g id="SvgjsG1381" class="apexcharts-tracks">
                                                        <g id="SvgjsG1382"
                                                            class="apexcharts-radialbar-track apexcharts-track"
                                                            rel="1">
                                                            <path id="apexcharts-radialbarTrack-0"
                                                                d="M 22.5 7.134146341463413 A 15.365853658536587 15.365853658536587 0 1 1 22.497318152626402 7.134146575498747"
                                                                fill="none" fill-opacity="1"
                                                                stroke="rgba(242,242,242,0.85)" stroke-opacity="1"
                                                                stroke-linecap="butt" stroke-width="4.258536585365854"
                                                                stroke-dasharray="0" class="apexcharts-radialbar-area"
                                                                data:pathOrig="M 22.5 7.134146341463413 A 15.365853658536587 15.365853658536587 0 1 1 22.497318152626402 7.134146575498747">
                                                            </path>
                                                        </g>
                                                    </g>
                                                    <g id="SvgjsG1384">
                                                        <g id="SvgjsG1386"
                                                            class="apexcharts-series apexcharts-radial-series"
                                                            seriesName="seriesx1" rel="1" data:realIndex="0">
                                                            <path id="SvgjsPath1387"
                                                                d="M 22.5 7.134146341463413 A 15.365853658536587 15.365853658536587 0 1 1 17.751690086433737 37.11379525038895"
                                                                fill="none" fill-opacity="0.85"
                                                                stroke="rgba(91,115,232,0.85)" stroke-opacity="1"
                                                                stroke-linecap="butt" stroke-width="4.390243902439025"
                                                                stroke-dasharray="0"
                                                                class="apexcharts-radialbar-area apexcharts-radialbar-slice-0"
                                                                data:angle="198" data:value="55" index="0" j="0"
                                                                data:pathOrig="M 22.5 7.134146341463413 A 15.365853658536587 15.365853658536587 0 1 1 17.751690086433737 37.11379525038895">
                                                            </path>
                                                        </g>
                                                        <circle id="SvgjsCircle1385" r="13.23658536585366"
                                                            cx="22.5" cy="22.5"
                                                            class="apexcharts-radialbar-hollow" fill="transparent">
                                                        </circle>
                                                    </g>
                                                </g>
                                            </g>
                                            <line id="SvgjsLine1388" x1="0" y1="0" x2="45"
                                                y2="0" stroke="#b6b6b6" stroke-dasharray="0"
                                                stroke-width="1" class="apexcharts-ycrosshairs"></line>
                                            <line id="SvgjsLine1389" x1="0" y1="0" x2="45"
                                                y2="0" stroke-dasharray="0" stroke-width="0"
                                                class="apexcharts-ycrosshairs-hidden"></line>
                                        </g>
                                        <g id="SvgjsG1376" class="apexcharts-annotations"></g>
                                    </svg>
                                    <div class="apexcharts-legend"></div>
                                </div>
                            </div>
                            <div class="resize-triggers">
                                <div class="expand-trigger">
                                    <div style="width: 46px; height: 47px;"></div>
                                </div>
                                <div class="contract-trigger"></div>
                            </div>
                        </div>
                        <div>
                            <h4 class="mb-1 mt-1"><span data-plugin="counterup">{{ $totalPointPerBulan }}</span></h4>
                            <p class="text-muted mb-0">Jumlah Point (di bulan {{ $bulanFiler }})</p>
                        </div>
                        <p class="text-muted mt-3 mb-0"><span class="text-danger me-1"><i
                                    class="mdi mdi-arrow-down-bold me-1"></i>6.24%</span> beberapa minggu terakhir
                        </p>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <div class="float-end mt-2" style="position: relative;">
                            <div id="customers-chart" data-colors="[&quot;--bs-primary&quot;]"
                                style="min-height: 46px;">
                                <div id="apexchartsp29zxgiv"
                                    class="apexcharts-canvas apexchartsp29zxgiv apexcharts-theme-light"
                                    style="width: 45px; height: 46px;"><svg id="SvgjsSvg1373" width="45"
                                        height="46" xmlns="http://www.w3.org/2000/svg" version="1.1"
                                        xmlns:xlink="http://www.w3.org/1999/xlink"
                                        xmlns:svgjs="http://svgjs.com/svgjs" class="apexcharts-svg"
                                        xmlns:data="ApexChartsNS" transform="translate(0, 0)"
                                        style="background: transparent;">
                                        <g id="SvgjsG1375" class="apexcharts-inner apexcharts-graphical"
                                            transform="translate(0, 0)">
                                            <defs id="SvgjsDefs1374">
                                                <clipPath id="gridRectMaskp29zxgiv">
                                                    <rect id="SvgjsRect1377" width="51" height="47" x="-3"
                                                        y="-1" rx="0" ry="0" opacity="1"
                                                        stroke-width="0" stroke="none" stroke-dasharray="0"
                                                        fill="#fff"></rect>
                                                </clipPath>
                                                <clipPath id="gridRectMarkerMaskp29zxgiv">
                                                    <rect id="SvgjsRect1378" width="49" height="49" x="-2"
                                                        y="-2" rx="0" ry="0" opacity="1"
                                                        stroke-width="0" stroke="none" stroke-dasharray="0"
                                                        fill="#fff"></rect>
                                                </clipPath>
                                            </defs>
                                            <g id="SvgjsG1379" class="apexcharts-radialbar">
                                                <g id="SvgjsG1380">
                                                    <g id="SvgjsG1381" class="apexcharts-tracks">
                                                        <g id="SvgjsG1382"
                                                            class="apexcharts-radialbar-track apexcharts-track"
                                                            rel="1">
                                                            <path id="apexcharts-radialbarTrack-0"
                                                                d="M 22.5 7.134146341463413 A 15.365853658536587 15.365853658536587 0 1 1 22.497318152626402 7.134146575498747"
                                                                fill="none" fill-opacity="1"
                                                                stroke="rgba(242,242,242,0.85)" stroke-opacity="1"
                                                                stroke-linecap="butt" stroke-width="4.258536585365854"
                                                                stroke-dasharray="0" class="apexcharts-radialbar-area"
                                                                data:pathOrig="M 22.5 7.134146341463413 A 15.365853658536587 15.365853658536587 0 1 1 22.497318152626402 7.134146575498747">
                                                            </path>
                                                        </g>
                                                    </g>
                                                    <g id="SvgjsG1384">
                                                        <g id="SvgjsG1386"
                                                            class="apexcharts-series apexcharts-radial-series"
                                                            seriesName="seriesx1" rel="1" data:realIndex="0">
                                                            <path id="SvgjsPath1387"
                                                                d="M 22.5 7.134146341463413 A 15.365853658536587 15.365853658536587 0 1 1 17.751690086433737 37.11379525038895"
                                                                fill="none" fill-opacity="0.85"
                                                                stroke="rgba(91,115,232,0.85)" stroke-opacity="1"
                                                                stroke-linecap="butt" stroke-width="4.390243902439025"
                                                                stroke-dasharray="0"
                                                                class="apexcharts-radialbar-area apexcharts-radialbar-slice-0"
                                                                data:angle="198" data:value="55" index="0" j="0"
                                                                data:pathOrig="M 22.5 7.134146341463413 A 15.365853658536587 15.365853658536587 0 1 1 17.751690086433737 37.11379525038895">
                                                            </path>
                                                        </g>
                                                        <circle id="SvgjsCircle1385" r="13.23658536585366"
                                                            cx="22.5" cy="22.5"
                                                            class="apexcharts-radialbar-hollow" fill="transparent">
                                                        </circle>
                                                    </g>
                                                </g>
                                            </g>
                                            <line id="SvgjsLine1388" x1="0" y1="0" x2="45"
                                                y2="0" stroke="#b6b6b6" stroke-dasharray="0"
                                                stroke-width="1" class="apexcharts-ycrosshairs"></line>
                                            <line id="SvgjsLine1389" x1="0" y1="0" x2="45"
                                                y2="0" stroke-dasharray="0" stroke-width="0"
                                                class="apexcharts-ycrosshairs-hidden"></line>
                                        </g>
                                        <g id="SvgjsG1376" class="apexcharts-annotations"></g>
                                    </svg>
                                    <div class="apexcharts-legend"></div>
                                </div>
                            </div>
                            <div class="resize-triggers">
                                <div class="expand-trigger">
                                    <div style="width: 46px; height: 47px;"></div>
                                </div>
                                <div class="contract-trigger"></div>
                            </div>
                        </div>
                        <div>
                            <h4 class="mb-1 mt-1"><span data-plugin="counterup">{{ $totalPoint }}</span></h4>
                            <p class="text-muted mb-0">Jumlah Point (di tahun {{ $tahun }})</p>
                        </div>
                        <p class="text-muted mt-3 mb-0"><span class="text-danger me-1"><i
                                    class="mdi mdi-arrow-down-bold me-1"></i>6.24%</span> beberapa minggu terakhir
                        </p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="float-end mt-2" style="position: relative;">
                                    <div id="customers-chart" data-colors="[&quot;--bs-primary&quot;]"
                                        style="min-height: 46px;">
                                        <div id="apexchartsp29zxgiv"
                                            class="apexcharts-canvas apexchartsp29zxgiv apexcharts-theme-light"
                                            style="width: 45px; height: 46px;"><svg id="SvgjsSvg1373" width="45"
                                                height="46" xmlns="http://www.w3.org/2000/svg" version="1.1"
                                                xmlns:xlink="http://www.w3.org/1999/xlink"
                                                xmlns:svgjs="http://svgjs.com/svgjs" class="apexcharts-svg"
                                                xmlns:data="ApexChartsNS" transform="translate(0, 0)"
                                                style="background: transparent;">
                                                <g id="SvgjsG1375" class="apexcharts-inner apexcharts-graphical"
                                                    transform="translate(0, 0)">
                                                    <defs id="SvgjsDefs1374">
                                                        <clipPath id="gridRectMaskp29zxgiv">
                                                            <rect id="SvgjsRect1377" width="51" height="47"
                                                                x="-3" y="-1" rx="0" ry="0"
                                                                opacity="1" stroke-width="0" stroke="none"
                                                                stroke-dasharray="0" fill="#fff"></rect>
                                                        </clipPath>
                                                        <clipPath id="gridRectMarkerMaskp29zxgiv">
                                                            <rect id="SvgjsRect1378" width="49" height="49"
                                                                x="-2" y="-2" rx="0" ry="0"
                                                                opacity="1" stroke-width="0" stroke="none"
                                                                stroke-dasharray="0" fill="#fff"></rect>
                                                        </clipPath>
                                                    </defs>
                                                    <g id="SvgjsG1379" class="apexcharts-radialbar">
                                                        <g id="SvgjsG1380">
                                                            <g id="SvgjsG1381" class="apexcharts-tracks">
                                                                <g id="SvgjsG1382"
                                                                    class="apexcharts-radialbar-track apexcharts-track"
                                                                    rel="1">
                                                                    <path id="apexcharts-radialbarTrack-0"
                                                                        d="M 22.5 7.134146341463413 A 15.365853658536587 15.365853658536587 0 1 1 22.497318152626402 7.134146575498747"
                                                                        fill="none" fill-opacity="1"
                                                                        stroke="rgba(242,242,242,0.85)"
                                                                        stroke-opacity="1" stroke-linecap="butt"
                                                                        stroke-width="4.258536585365854"
                                                                        stroke-dasharray="0"
                                                                        class="apexcharts-radialbar-area"
                                                                        data:pathOrig="M 22.5 7.134146341463413 A 15.365853658536587 15.365853658536587 0 1 1 22.497318152626402 7.134146575498747">
                                                                    </path>
                                                                </g>
                                                            </g>
                                                            <g id="SvgjsG1384">
                                                                <g id="SvgjsG1386"
                                                                    class="apexcharts-series apexcharts-radial-series"
                                                                    seriesName="seriesx1" rel="1"
                                                                    data:realIndex="0">
                                                                    <path id="SvgjsPath1387"
                                                                        d="M 22.5 7.134146341463413 A 15.365853658536587 15.365853658536587 0 1 1 17.751690086433737 37.11379525038895"
                                                                        fill="none" fill-opacity="0.85"
                                                                        stroke="rgba(91,115,232,0.85)"
                                                                        stroke-opacity="1" stroke-linecap="butt"
                                                                        stroke-width="4.390243902439025"
                                                                        stroke-dasharray="0"
                                                                        class="apexcharts-radialbar-area apexcharts-radialbar-slice-0"
                                                                        data:angle="198" data:value="55"
                                                                        index="0" j="0"
                                                                        data:pathOrig="M 22.5 7.134146341463413 A 15.365853658536587 15.365853658536587 0 1 1 17.751690086433737 37.11379525038895">
                                                                    </path>
                                                                </g>
                                                                <circle id="SvgjsCircle1385" r="13.23658536585366"
                                                                    cx="22.5" cy="22.5"
                                                                    class="apexcharts-radialbar-hollow"
                                                                    fill="transparent">
                                                                </circle>
                                                            </g>
                                                        </g>
                                                    </g>
                                                    <line id="SvgjsLine1388" x1="0" y1="0"
                                                        x2="45" y2="0" stroke="#b6b6b6"
                                                        stroke-dasharray="0" stroke-width="1"
                                                        class="apexcharts-ycrosshairs"></line>
                                                    <line id="SvgjsLine1389" x1="0" y1="0"
                                                        x2="45" y2="0" stroke-dasharray="0"
                                                        stroke-width="0" class="apexcharts-ycrosshairs-hidden"></line>
                                                </g>
                                                <g id="SvgjsG1376" class="apexcharts-annotations"></g>
                                            </svg>
                                            <div class="apexcharts-legend"></div>
                                        </div>
                                    </div>
                                    <div class="resize-triggers">
                                        <div class="expand-trigger">
                                            <div style="width: 46px; height: 47px;"></div>
                                        </div>
                                        <div class="contract-trigger"></div>
                                    </div>
                                </div>
                                <div>
                                    <h4 class="mb-1 mt-1"><span
                                            data-plugin="counterup">{{ $rataRataPointBulanan }}</span>
                                    </h4>
                                    <p class="text-muted mb-0">Rata-rata Point (di bulan {{ $bulanFiler }})</p>
                                </div>
                                <p class="text-muted mt-3 mb-0"><span class="text-danger me-1"><i
                                            class="mdi mdi-arrow-down-bold me-1"></i>6.24%</span> beberapa minggu
                                    terakhir
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="float-end mt-2" style="position: relative;">
                                    <div id="customers-chart" data-colors="[&quot;--bs-primary&quot;]"
                                        style="min-height: 46px;">
                                        <div id="apexchartsp29zxgiv"
                                            class="apexcharts-canvas apexchartsp29zxgiv apexcharts-theme-light"
                                            style="width: 45px; height: 46px;"><svg id="SvgjsSvg1373" width="45"
                                                height="46" xmlns="http://www.w3.org/2000/svg" version="1.1"
                                                xmlns:xlink="http://www.w3.org/1999/xlink"
                                                xmlns:svgjs="http://svgjs.com/svgjs" class="apexcharts-svg"
                                                xmlns:data="ApexChartsNS" transform="translate(0, 0)"
                                                style="background: transparent;">
                                                <g id="SvgjsG1375" class="apexcharts-inner apexcharts-graphical"
                                                    transform="translate(0, 0)">
                                                    <defs id="SvgjsDefs1374">
                                                        <clipPath id="gridRectMaskp29zxgiv">
                                                            <rect id="SvgjsRect1377" width="51" height="47"
                                                                x="-3" y="-1" rx="0" ry="0"
                                                                opacity="1" stroke-width="0" stroke="none"
                                                                stroke-dasharray="0" fill="#fff"></rect>
                                                        </clipPath>
                                                        <clipPath id="gridRectMarkerMaskp29zxgiv">
                                                            <rect id="SvgjsRect1378" width="49" height="49"
                                                                x="-2" y="-2" rx="0" ry="0"
                                                                opacity="1" stroke-width="0" stroke="none"
                                                                stroke-dasharray="0" fill="#fff"></rect>
                                                        </clipPath>
                                                    </defs>
                                                    <g id="SvgjsG1379" class="apexcharts-radialbar">
                                                        <g id="SvgjsG1380">
                                                            <g id="SvgjsG1381" class="apexcharts-tracks">
                                                                <g id="SvgjsG1382"
                                                                    class="apexcharts-radialbar-track apexcharts-track"
                                                                    rel="1">
                                                                    <path id="apexcharts-radialbarTrack-0"
                                                                        d="M 22.5 7.134146341463413 A 15.365853658536587 15.365853658536587 0 1 1 22.497318152626402 7.134146575498747"
                                                                        fill="none" fill-opacity="1"
                                                                        stroke="rgba(242,242,242,0.85)"
                                                                        stroke-opacity="1" stroke-linecap="butt"
                                                                        stroke-width="4.258536585365854"
                                                                        stroke-dasharray="0"
                                                                        class="apexcharts-radialbar-area"
                                                                        data:pathOrig="M 22.5 7.134146341463413 A 15.365853658536587 15.365853658536587 0 1 1 22.497318152626402 7.134146575498747">
                                                                    </path>
                                                                </g>
                                                            </g>
                                                            <g id="SvgjsG1384">
                                                                <g id="SvgjsG1386"
                                                                    class="apexcharts-series apexcharts-radial-series"
                                                                    seriesName="seriesx1" rel="1"
                                                                    data:realIndex="0">
                                                                    <path id="SvgjsPath1387"
                                                                        d="M 22.5 7.134146341463413 A 15.365853658536587 15.365853658536587 0 1 1 17.751690086433737 37.11379525038895"
                                                                        fill="none" fill-opacity="0.85"
                                                                        stroke="rgba(91,115,232,0.85)"
                                                                        stroke-opacity="1" stroke-linecap="butt"
                                                                        stroke-width="4.390243902439025"
                                                                        stroke-dasharray="0"
                                                                        class="apexcharts-radialbar-area apexcharts-radialbar-slice-0"
                                                                        data:angle="198" data:value="55"
                                                                        index="0" j="0"
                                                                        data:pathOrig="M 22.5 7.134146341463413 A 15.365853658536587 15.365853658536587 0 1 1 17.751690086433737 37.11379525038895">
                                                                    </path>
                                                                </g>
                                                                <circle id="SvgjsCircle1385" r="13.23658536585366"
                                                                    cx="22.5" cy="22.5"
                                                                    class="apexcharts-radialbar-hollow"
                                                                    fill="transparent">
                                                                </circle>
                                                            </g>
                                                        </g>
                                                    </g>
                                                    <line id="SvgjsLine1388" x1="0" y1="0"
                                                        x2="45" y2="0" stroke="#b6b6b6"
                                                        stroke-dasharray="0" stroke-width="1"
                                                        class="apexcharts-ycrosshairs"></line>
                                                    <line id="SvgjsLine1389" x1="0" y1="0"
                                                        x2="45" y2="0" stroke-dasharray="0"
                                                        stroke-width="0" class="apexcharts-ycrosshairs-hidden"></line>
                                                </g>
                                                <g id="SvgjsG1376" class="apexcharts-annotations"></g>
                                            </svg>
                                            <div class="apexcharts-legend"></div>
                                        </div>
                                    </div>
                                    <div class="resize-triggers">
                                        <div class="expand-trigger">
                                            <div style="width: 46px; height: 47px;"></div>
                                        </div>
                                        <div class="contract-trigger"></div>
                                    </div>
                                </div>
                                <div>
                                    <h4 class="mb-1 mt-1"><span
                                            data-plugin="counterup">{{ $rataRataPointTahunan }}</span>
                                    </h4>
                                    <p class="text-muted mb-0">Rata-rata Point (di tahun {{ $tahun }})</p>
                                </div>
                                <p class="text-muted mt-3 mb-0"><span class="text-danger me-1"><i
                                            class="mdi mdi-arrow-down-bold me-1"></i>6.24%</span> beberapa minggu
                                    terakhir
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        Livewire.on('mingguan', (data) => {
            data = JSON.parse(data)
            options = {
                chart: {
                    type: 'line',
                    // events: {
                    //     animationEnd: convertTDToImage
                    // }
                },
                title: {
                    text: 'Laporan Mingguan',
                    align: 'center',
                    style: {
                        fontSize: '20px'
                    }
                },
                series: [{
                    name: 'Jumlah',
                    data: data.sum_per_week[1]
                }, {
                    name: 'Rata-rata',
                    data: data.avg_per_week[1]
                }],
                xaxis: {
                    categories: data.sum_per_week[0]
                },
                markers: {
                    size: 6 // Ukuran marker
                }
            };

            var minggu = new ApexCharts(document.querySelector("#minggu"), options);
            minggu.render();
        })

        Livewire.on('bulanan', (data) => {
            data = JSON.parse(data)
            console.log('bulanan => ', data)
            bulanan = {
                chart: {
                    type: 'line',
                    // events: {
                    //     animationEnd: convertTDToImage
                    // }
                },
                title: {
                    text: 'Laporan Bulanan',
                    align: 'center',
                    style: {
                        fontSize: '20px'
                    }
                },
                series: [{
                    name: 'Jumlah',
                    data: data.sum_per_month[1]
                }, {
                    name: 'Rata-rata',
                    data: data.avg_per_month[1]
                }],
                xaxis: {
                    categories: data.sum_per_month[0]
                },
                markers: {
                    size: 6 // Ukuran marker
                }
            };
            var chart = new ApexCharts(document.querySelector("#bulan"), bulanan);
            chart.render();
        })


        bulanan = {
            chart: {
                type: 'line',
                // events: {
                //     animationEnd: convertTDToImage
                // }
            },
            title: {
                text: 'Laporan Bulanan',
                align: 'center',
                style: {
                    fontSize: '20px'
                }
            },
            series: [{
                name: 'Jumlah',
                data: <?= json_encode(isset($grafikBulanan[1]) ? $grafikBulanan[1] : []) ?>
            }, {
                name: 'Rata-rata',
                data: <?= json_encode(isset($grafikBulananRataRata[1]) ? $grafikBulananRataRata[1] : []) ?>
            }],
            xaxis: {
                categories: <?= json_encode(isset($grafikBulanan[0]) ? $grafikBulanan[0] : []) ?>
            },
            markers: {
                size: 6 // Ukuran marker
            }
        };
        var chart = new ApexCharts(document.querySelector("#bulan"), bulanan);
        chart.render();

        options = {
            chart: {
                type: 'line',
                // events: {
                //     animationEnd: convertTDToImage
                // }
            },
            title: {
                text: 'Laporan Mingguan',
                align: 'center',
                style: {
                    fontSize: '20px'
                }
            },
            series: [{
                name: 'Jumlah',
                data: <?= json_encode(isset($grafikMingguan[1]) ? $grafikMingguan[1] : []) ?>
            }, {
                name: 'Rata-rata',
                data: <?= json_encode(isset($grafikMingguanRataRata[1]) ? $grafikMingguanRataRata[1] : []) ?>
            }],
            xaxis: {
                categories: <?= json_encode(isset($grafikMingguan[0]) ? $grafikMingguan[0] : []) ?>
            },
            markers: {
                size: 6 // Ukuran marker
            }
        };

        var minggu = new ApexCharts(document.querySelector("#minggu"), options);
        minggu.render();

        $('#month-input').on('change', function() {
            // alert(this.value);
            Livewire.emit('updateBulan', this.value)
        });
    </script>
</div>
