<!doctype html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Musikora — katalog alat musik untuk menemukan suara yang terasa milikmu.">
    <title>@yield('title', 'Musikora') · Musikora</title>
    <link href="{{ asset('Bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('Bootstrap/icons/bootstrap-icons.min.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/css/musikora.css') }}" rel="stylesheet">
    @stack('styles')
</head>
<body>
    <a class="skip-link" href="#main-content">Lewati ke konten</a>
    <div class="colour-note" aria-hidden="true"><span></span><span></span><span></span></div>

    <nav class="navbar navbar-expand-lg navbar-dark musikora-nav" aria-label="Navigasi utama">
        <div class="container">
            <a class="navbar-brand" href="{{ route('instruments.index') }}" aria-label="Musikora, beranda">
                <img src="{{ asset('logo.png') }}" alt="Musikora — toko alat musik" width="124" height="64">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavigation" aria-controls="mainNavigation" aria-expanded="false" aria-label="Buka menu navigasi">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="mainNavigation">
                <div class="navbar-nav ms-auto align-items-lg-center gap-lg-4">
                    <a class="nav-link {{ request()->routeIs('instruments.index') ? 'active' : '' }}" href="{{ route('instruments.index') }}">Beranda</a>
                    <a class="nav-link" href="{{ route('instruments.index') }}#koleksi">Katalog</a>
                    <a class="nav-link {{ request()->routeIs('about') ? 'active' : '' }}" href="{{ route('about') }}">Tentang</a>
                    <a class="nav-cta" href="{{ route('instruments.index') }}#koleksi">Lihat koleksi <i class="bi bi-arrow-up-right" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
    </nav>

    <main id="main-content">
        @yield('content')
    </main>

    <footer class="site-footer">
        <div class="container footer-inner">
            <div class="row gy-4 align-items-end">
                <div class="col-lg-7">
                    <a href="{{ route('instruments.index') }}" class="footer-brand">Musikora<span>.</span></a>
                    <p class="footer-copy">Ruang untuk menemukan instrumen, menyusun nada, dan memulai perjalanan musikmu.</p>
                </div>
                <div class="col-lg-5">
                    <nav class="footer-nav" aria-label="Navigasi footer">
                        <a href="{{ route('instruments.index') }}">Beranda</a>
                        <a href="{{ route('instruments.index') }}#koleksi">Katalog</a>
                        <a href="{{ route('about') }}">Tentang Musikora</a>
                    </nav>
                </div>
            </div>
            <div class="footer-bottom">
                <span>Musikora · Katalog alat musik</span>
                <span>Dibuat untuk mereka yang mendengar lebih jauh.</span>
            </div>
        </div>
    </footer>

    <script src="{{ asset('Bootstrap/js/bootstrap.bundle.min.js') }}"></script>
</body>
</html>
