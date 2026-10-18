@extends('layouts.app')

@section('title', $instrument->brand . ' ' . $instrument->name)

@section('content')
    <section class="detail-section">
        <div class="container">
            <nav class="breadcrumb-line" aria-label="Breadcrumb">
                <a href="{{ route('instruments.index') }}">Katalog</a>
                <i class="bi bi-chevron-right" aria-hidden="true"></i>
                <span aria-current="page">{{ $instrument->name }}</span>
            </nav>

            <div class="row g-4 g-lg-5 detail-layout">
                <div class="col-lg-7">
                    <div class="detail-image-frame">
                        <img src="{{ asset('assets/images/' . $instrument->image) }}" alt="Ilustrasi {{ $instrument->type }} {{ $instrument->brand }} {{ $instrument->name }}" onerror="this.onerror=null;this.src='{{ asset('assets/images/placeholder-instrument.svg') }}'">
                        <span class="detail-image-label">{{ $instrument->type }}</span>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="detail-copy">
                        <p class="eyebrow">{{ $instrument->type }}</p>
                        <p class="detail-brand">{{ $instrument->brand }}</p>
                        <h1>{{ $instrument->name }}</h1>
                        <p class="detail-price">Rp{{ number_format((float) $instrument->price, 0, ',', '.') }}</p>
                        <div class="detail-rule" aria-hidden="true"><span></span><span></span><span></span></div>
                        <h2>Tentang instrumen ini</h2>
                        <p class="detail-description">{{ $instrument->description }}</p>
                        <a class="btn btn-reggae" href="{{ route('instruments.index') }}"><i class="bi bi-arrow-left" aria-hidden="true"></i> Kembali ke katalog</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    @if ($recommendations->isNotEmpty())
        <section class="related-section">
            <div class="container">
                <div class="related-heading"><p class="eyebrow">MASIH DALAM NADA YANG SAMA</p><h2>Jelajahi {{ $instrument->type }} lainnya<span>.</span></h2></div>
                <div class="row g-3 g-md-4">
                    @foreach ($recommendations as $recommendation)
                        <div class="col-6 col-md-4">
                            <a class="related-card" href="{{ route('instruments.show', $recommendation) }}">
                                <img src="{{ asset('assets/images/' . $recommendation->image) }}" alt="" loading="lazy" onerror="this.onerror=null;this.src='{{ asset('assets/images/placeholder-instrument.svg') }}'">
                                <span><small>{{ $recommendation->brand }}</small><strong>{{ $recommendation->name }}</strong></span>
                                <i class="bi bi-arrow-up-right" aria-hidden="true"></i>
                            </a>
                        </div>
                    @endforeach
                </div>
            </div>
        </section>
    @endif
@endsection
