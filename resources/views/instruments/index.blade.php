@extends('layouts.app')

@section('title', 'Katalog alat musik')

@section('content')
    <section class="hero-section">
        <div class="container hero-grid">
            <div class="hero-copy">
                <p class="eyebrow"><span class="eyebrow-mark" aria-hidden="true"></span> SUARA YANG MEMANGGILMU</p>
                <h1>Feel the Rhythm.<br><span>Find Your Sound.</span></h1>
                <p class="hero-description">Temukan alat musik yang cocok untuk perjalanan musikalmu, dari gitar akustik hingga drum dan keyboard.</p>
                <a class="btn btn-reggae" href="{{ route('instruments.index') }}#koleksi">Jelajahi Koleksi <i class="bi bi-arrow-down-right" aria-hidden="true"></i></a>
                <div class="hero-footnote"><span class="footnote-rule" aria-hidden="true"></span> Pilih instrumen. Mulai ceritamu.</div>
            </div>
            <div class="hero-art-wrap">
                <img class="hero-art" src="{{ asset('assets/images/hero-sound.svg') }}" alt="Ilustrasi gitar akustik dan gitar elektrik dalam warna kayu, merah, dan hijau">
                <div class="hero-caption"><span class="caption-dot" aria-hidden="true"></span> Temukan suara khasmu</div>
            </div>
        </div>
        <div class="hero-bottom-line" aria-hidden="true"></div>
    </section>

    <section class="catalog-section" id="koleksi">
        <div class="container">
            <div class="catalog-heading">
                <div>
                    <p class="eyebrow">PILIHAN UNTUK DIMAINKAN</p>
                    <h2>Temukan Instrumen<br class="d-md-none"> Favoritmu<span>.</span></h2>
                    <p class="section-intro">Dari petikan pertama sampai panggung yang ramai, mulai dengan alat musik yang tepat.</p>
                </div>
                <div class="catalog-count"><span>{{ $instruments->total() }}</span> instrumen dalam koleksi</div>
            </div>

            <form class="catalog-filter" method="GET" action="{{ route('instruments.index') }}" role="search">
                <label class="search-field">
                    <i class="bi bi-search" aria-hidden="true"></i>
                    <span class="visually-hidden">Cari nama atau merek instrumen</span>
                    <input type="search" name="q" value="{{ $filters['q'] ?? '' }}" placeholder="Cari nama atau merek..." maxlength="100">
                </label>
                <label class="filter-select">
                    <span class="visually-hidden">Filter jenis instrumen</span>
                    <i class="bi bi-sliders" aria-hidden="true"></i>
                    <select name="type" aria-label="Filter berdasarkan jenis">
                        <option value="">Semua jenis</option>
                        @foreach ($types as $type)
                            <option value="{{ $type }}" @selected(($filters['type'] ?? '') === $type)>{{ $type }}</option>
                        @endforeach
                    </select>
                </label>
                <button class="filter-submit" type="submit">Cari koleksi</button>
                @if (($filters['q'] ?? '') !== '' || ($filters['type'] ?? '') !== '')
                    <a class="filter-reset" href="{{ route('instruments.index') }}">Hapus filter</a>
                @endif
            </form>

            @if ($instruments->isNotEmpty())
                <div class="row g-3 g-md-4 product-grid">
                    @foreach ($instruments as $instrument)
                        <div class="col-6 col-md-4 col-xl-3">
                            <article class="product-card h-100">
                                <a class="product-image-link" href="{{ route('instruments.show', $instrument) }}" aria-label="Lihat {{ $instrument->brand }} {{ $instrument->name }}">
                                    <img class="product-image" src="{{ asset('assets/images/' . $instrument->image) }}" alt="Ilustrasi {{ $instrument->type }} {{ $instrument->brand }} {{ $instrument->name }}" loading="lazy" onerror="this.onerror=null;this.src='{{ asset('assets/images/placeholder-instrument.svg') }}'">
                                    <span class="product-index">{{ str_pad((string) $loop->iteration + ($instruments->currentPage() - 1) * $instruments->perPage(), 2, '0', STR_PAD_LEFT) }}</span>
                                </a>
                                <div class="product-details">
                                    <div class="product-meta"><span>{{ $instrument->type }}</span><span class="meta-line" aria-hidden="true"></span></div>
                                    <h3><a href="{{ route('instruments.show', $instrument) }}">{{ $instrument->name }}</a></h3>
                                    <p class="product-brand">{{ $instrument->brand }}</p>
                                    <div class="product-bottom">
                                        <p class="product-price">Rp{{ number_format((float) $instrument->price, 0, ',', '.') }}</p>
                                        <a class="product-link" href="{{ route('instruments.show', $instrument) }}" aria-label="Lihat detail {{ $instrument->name }}"><i class="bi bi-arrow-up-right" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </article>
                        </div>
                    @endforeach
                </div>
                <div class="catalog-pagination">{{ $instruments->links() }}</div>
            @else
                <div class="empty-state">
                    <span class="empty-icon" aria-hidden="true"><i class="bi bi-music-note-list"></i></span>
                    <h3>Belum ada nada yang cocok.</h3>
                    <p>Coba kata kunci atau jenis instrumen lain untuk menemukan yang kamu cari.</p>
                    <a class="btn btn-reggae" href="{{ route('instruments.index') }}">Lihat semua instrumen</a>
                </div>
            @endif
        </div>
    </section>

    <section class="closing-note">
        <div class="container closing-inner">
            <p class="eyebrow">BUKAN SOAL SEBERAPA KERAS</p>
            <h2>Yang penting, bunyinya<br><span>terasa seperti kamu.</span></h2>
            <a href="{{ route('about') }}">Kenali Musikora <i class="bi bi-arrow-up-right" aria-hidden="true"></i></a>
        </div>
    </section>
@endsection
