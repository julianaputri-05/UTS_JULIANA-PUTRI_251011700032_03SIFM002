@extends('layouts.app')

@section('title', 'Halaman tidak ditemukan')

@section('content')
    <section class="empty-state error-state">
        <div class="container">
            <p class="eyebrow">404 · HALAMAN TIDAK DITEMUKAN</p>
            <h1>Sepertinya kita<br>kehilangan nadanya.</h1>
            <p>Halaman yang kamu cari tidak tersedia. Kembali ke katalog untuk menemukan instrumen lain.</p>
            <a class="btn btn-reggae" href="{{ route('instruments.index') }}">Kembali ke katalog</a>
        </div>
    </section>
@endsection
