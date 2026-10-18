<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\InstrumentController;

Route::redirect('/', '/instruments')->name('home');
Route::get('/instruments', [InstrumentController::class, 'index'])->name('instruments.index');
Route::get('/instruments/{instrument}', [InstrumentController::class, 'show'])->name('instruments.show');
Route::view('/about', 'about')->name('about');
