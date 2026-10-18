# Musikora

Musikora adalah katalog toko alat musik bertema reggae. Pengunjung dapat melihat koleksi, mencari berdasarkan nama atau merek, memfilter jenis instrumen, dan membuka halaman detail. Data instrumen disimpan di MySQL dan ditampilkan melalui Eloquent serta Blade.

## Teknologi

- PHP 8.3 dan Laravel 13
- Blade Template
- Bootstrap 5.3.8 untuk komponen dan layout responsif, disimpan di `public/Bootstrap/`
- Bootstrap Icons 1.13.2, termasuk file font lokal di `public/Bootstrap/icons/fonts/`
- MySQL dan Eloquent ORM
- CSS khusus di `public/assets/css/musikora.css`
- Google Fonts: Space Grotesk dan DM Sans

Bootstrap dan Bootstrap Icons dimuat dari aset lokal di `public/Bootstrap/`. Google Fonts tidak dipanggil dari CDN; halaman memakai fallback tipografi lokal yang tersedia di perangkat. Setelah project terpasang, halaman katalog dapat dibuka tanpa koneksi internet.

## Fitur

- Katalog dinamis dari tabel `instruments`.
- Pencarian nama atau merek dan filter jenis melalui query Eloquent.
- Pagination yang mempertahankan filter.
- Halaman detail berdasarkan ID dan rekomendasi instrumen sejenis.
- Halaman Tentang dan 404 dengan layout yang sama.
- Harga Rupiah, navigasi responsif, dan empty state untuk pencarian tanpa hasil.
- 12 produk contoh dari seeder.

Aplikasi ini hanya mencakup katalog. Autentikasi, keranjang, pembayaran, dan dashboard admin belum disertakan.

## Persyaratan

- PHP 8.3 atau lebih baru, dengan ekstensi `pdo_mysql`, `mbstring`, `openssl`, `fileinfo`, dan `tokenizer`.
- Composer.
- MySQL yang dapat diakses dari komputer lokal.
- Laragon atau web server PHP lain.

Node.js dan npm tidak diperlukan untuk menjalankan tampilan saat ini. Bootstrap dan stylesheet Musikora dimuat langsung dari folder `public/` dan tidak dibangun melalui Vite.

## Menyiapkan aplikasi

Jalankan perintah berikut dari folder project:

```powershell
composer install
Copy-Item .env.example .env
php artisan key:generate
```

Jika `.env` sudah ada, jangan salin ulang karena dapat menimpa pengaturan lokal.

Buat database MySQL bernama `musikora`, misalnya melalui MySQL atau phpMyAdmin:

```sql
CREATE DATABASE musikora
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
```

Sesuaikan variabel berikut di `.env` dengan akun MySQL lokal:

```dotenv
APP_NAME=Musikora
APP_ENV=local
APP_DEBUG=true
APP_URL=http://127.0.0.1:8000

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=musikora
DB_USERNAME=root
DB_PASSWORD=
```

Contoh ini memakai akun `root` tanpa kata sandi, yang umum pada Laragon lokal. Jika konfigurasi MySQL Anda berbeda, isi nilai yang sesuai. Jangan bagikan atau commit `.env`.

## Migration dan data contoh

Setelah MySQL berjalan, buat tabel dan isi katalog:

```powershell
php artisan migrate --seed
```

Migration membuat tabel `instruments` dengan kolom `id`, `name`, `brand`, `price`, `description`, `image`, `type`, serta `created_at` dan `updated_at`. Seeder mengisi atau memperbarui 12 data contoh berdasarkan kombinasi merek dan nama.

Untuk menjalankan seeder instrumen saja:

```powershell
php artisan db:seed --class=InstrumentSeeder
```

Seeder dapat dijalankan ulang tanpa menggandakan produk yang sama. Baris dengan merek dan nama yang cocok akan diperbarui memakai nilai dari seeder.

Gunakan `php artisan migrate`, bukan `php artisan migrate:fresh`, jika ingin mempertahankan data. `migrate:fresh` menghapus semua tabel sebelum membuatnya ulang.

## Menjalankan server

```powershell
php artisan serve
```

Buka [http://127.0.0.1:8000](http://127.0.0.1:8000). URL `/` mengarah ke katalog di `/instruments`.

## Menggunakan katalog

- Buka katalog untuk melihat instrumen dan harga.
- Cari berdasarkan nama produk atau merek.
- Pilih jenis instrumen untuk menyaring hasil.
- Buka detail produk melalui tautan **Lihat Detail**.
- Pilih **Tentang** pada navigasi untuk membaca ringkasan Musikora.

Route bernama yang tersedia:

| Nama route | URL | Fungsi |
| --- | --- | --- |
| `home` | `/` | Mengarahkan ke katalog |
| `instruments.index` | `/instruments` | Daftar, pencarian, dan filter |
| `instruments.show` | `/instruments/{instrument}` | Detail berdasarkan ID |
| `about` | `/about` | Halaman Tentang |

Contoh URL filter: `/instruments?q=yamaha&type=Keyboard`.

## Menambahkan instrumen

Produk baru adalah baris data, bukan perubahan struktur tabel. Untuk katalog contoh ini, tambahkan produk melalui seeder:

1. Buka `database/seeders/InstrumentSeeder.php`.
2. Tambahkan satu item ke array `$instruments` dengan semua kolom berikut:

   ```php
   [
       'name' => 'Contoh Model',
       'brand' => 'Contoh Merek',
       'price' => 2500000,
       'description' => 'Deskripsi instrumen dalam Bahasa Indonesia.',
       'image' => 'contoh-model.svg',
       'type' => 'Gitar Akustik',
   ],
   ```

3. Letakkan gambar bernama sama dengan nilai `image` di `public/assets/images/`. Untuk foto produk, simpan file `.jpg`, `.png`, atau `.webp` di folder tersebut, lalu isi `image` dengan nama filenya.
4. Jalankan seeder:

   ```powershell
   php artisan db:seed --class=InstrumentSeeder
   ```

Seeder memakai `updateOrCreate` dengan pasangan `brand` dan `name`. Menjalankannya kembali akan memperbarui baris cocok tersebut dengan isi seeder.

Jika nantinya ada formulir admin, simpan produk baru melalui `Instrument::create()` setelah validasi input. Formulir admin belum termasuk dalam project ini.

### Kapan menggunakan migration?

Migration digunakan untuk mengubah struktur tabel, bukan untuk menambahkan setiap produk. Contohnya, untuk menambah kolom `sku`:

```powershell
php artisan make:migration add_sku_to_instruments_table --table=instruments
```

Definisikan perubahan pada `up()` dan langkah pembatalannya pada `down()`. Contoh isi `up()`:

```php
Schema::table('instruments', function (Blueprint $table): void {
    $table->string('sku')->nullable()->after('brand');
});
```

Jika atribut baru perlu dapat diisi Eloquent, perbarui `$fillable` di `app/Models/Instrument.php`. Terapkan perubahan dengan:

```powershell
php artisan migrate
```

Jangan mengubah migration yang sudah diterapkan di database bersama. Buat migration baru untuk perubahan berikutnya.

## Logo dan gambar

- Logo navbar: `public/logo.png`.
- Ilustrasi hero, produk, dan placeholder: `public/assets/images/`.
- Nama file produk disimpan pada kolom `image` di database.
- Blade menampilkan produk melalui `asset('assets/images/' . $instrument->image)` dan memakai `placeholder-instrument.svg` jika gambar produk tidak dapat dimuat.

Ilustrasi SVG yang disertakan adalah placeholder lokal buatan project, bukan foto asli. Ganti dengan foto yang boleh digunakan dan perbarui nilai `image` pada seeder atau database.

## Struktur project

```text
app/Models/Instrument.php
app/Http/Controllers/InstrumentController.php
database/migrations/2026_10_17_130020_create_instruments_table.php
database/seeders/InstrumentSeeder.php
database/seeders/DatabaseSeeder.php
resources/views/layouts/app.blade.php
resources/views/instruments/index.blade.php
resources/views/instruments/show.blade.php
resources/views/about.blade.php
resources/views/errors/404.blade.php
routes/web.php
public/assets/css/musikora.css
public/assets/images/
public/Bootstrap/css/bootstrap.min.css
public/Bootstrap/js/bootstrap.bundle.min.js
public/Bootstrap/icons/
public/logo.png
```

## Pemeriksaan

Gunakan perintah ini untuk memeriksa route dan kompilasi Blade:

```powershell
php artisan route:list
php artisan view:cache
```

Hapus cache view saat diperlukan:

```powershell
php artisan view:clear
```

Migration dan seeder telah dijalankan pada database lokal saat implementasi. Pengujian otomatis fitur katalog belum dibuat atau dijalankan.
