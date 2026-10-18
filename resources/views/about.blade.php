@extends('layouts.app')

@section('title', 'Tentang Musikora')

@section('content')
    <section class="about-hero">
        <div class="container about-grid">
            <div>
                <p class="eyebrow">TENTANG MUSIKORA</p>
                <h1>Setiap suara punya<br><span>tempat untuk tumbuh.</span></h1>
            </div>
            <div class="about-lead">
                <p>Musikora adalah katalog alat musik yang membantu kamu menjelajahi berbagai instrumen untuk kebutuhan bermusik.</p>
                <p>Mulai dari gitar dan ukulele hingga keyboard, drum, dan instrumen tiup. Temukan pilihan yang sesuai dengan rasa ingin tahu dan arah musikmu.</p>
                <a href="{{ route('instruments.index') }}#koleksi">Lihat katalog <i class="bi bi-arrow-up-right" aria-hidden="true"></i></a>
            </div>
        </div>
        <div class="about-rhythm" aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></div>
    </section>
    <section class="about-note">
        <div class="container about-note-inner">
            <p class="eyebrow">TEMUKAN. DENGARKAN. MAINKAN.</p>
            <h2>Musik dimulai dari<br>rasa ingin mencoba.</h2>
            <p>Jelajahi koleksi, kenali setiap instrumen, lalu tentukan suara mana yang ingin kamu bawa ke perjalanan berikutnya.</p>
        </div>
    </section>
@endsection
