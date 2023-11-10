                    <!--- Sidemenu -->
                    <div id="sidebar-menu">
                        <!-- Left Menu Start -->
                        <ul class="metismenu list-unstyled" id="side-menu">
                            <li class="menu-title">Menu</li>

                            <li>
                                <a href="{{ route('admin.dashboard') }}">
                                    <i class="uil-home-alt"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>
                            @auth("admin")
                                <li>
                                    <a href="{{ route('admin.admin.index') }}">
                                        <i class="mdi mdi-account-multiple-outline"></i>
                                        <span>Admin</span>
                                    </a>
                                </li>
                            @endauth
                            {{-- <li>
                                <a href="{{ route('admin.teacher.index') }}">
                                    <i class="mdi mdi-account-multiple-outline"></i>
                                    <span>Teacher</span>
                                </a>
                            </li> --}}
                            <li>
                                <a href="{{ route('admin.pelanggaran.index') }}">
                                    <i class="mdi mdi-account-multiple-outline"></i>
                                    <span>Pelanggaran</span>
                                </a>
                            </li>
                            <li>
                                <a href="{{ route('admin.pencatatan.index') }}">
                                    <i class="mdi mdi-account-multiple-outline"></i>
                                    <span>Pencatatan</span>
                                </a>
                            </li>
                            {{-- <li class="{{ Route::is('admin.pencatatan.*') ? 'mm-active' : '' }}">
                                <a class="{{ Route::is('admin.pencatatan.*') ? 'active' : '' }}"
                                    href="{{ route('admin.pencatatan.index') }}">
                                    <i class="mdi mdi-account-multiple-outline"></i>
                                    <span>Pencatatan</span>
                                </a>
                            </li> --}}
                            <li class="{{ Route::is('admin.kelas.*') ? 'mm-active' : '' }}">
                                <a class="{{ Route::is('admin.kelas.*') ? 'active' : '' }}"
                                    href="{{ route('admin.kelas.index') }}">
                                    <i class="mdi mdi-account-multiple-outline"></i>
                                    <span>Kelas</span>
                                </a>
                            </li>
                            <li class="{{ Route::is('admin.siswa.*') ? 'mm-active' : '' }}">
                                <a class="{{ Route::is('admin.siswa.*') ? 'active' : '' }}"
                                    href="{{ route('admin.siswa.index') }}">
                                    <i class="mdi mdi-account-multiple-outline"></i>
                                    <span>Siswa</span>
                                </a>
                            </li>
                            <li>
                                <a class="" href="{{ route('admin.inbox.index') }}">
                                    <i class="mdi mdi-mailbox-open-up-outline"></i>
                                    <span>Mailbox</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- Sidebar -->
