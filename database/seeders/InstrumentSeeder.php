<?php

namespace Database\Seeders;

use App\Models\Instrument;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class InstrumentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $instruments = [
            ['name' => 'F310', 'brand' => 'Yamaha', 'price' => 1950000, 'description' => 'Gitar akustik bergaya dreadnought dengan suara seimbang dan neck yang nyaman. Pilihan yang pas untuk mulai belajar atau menemani sesi akustik.', 'image' => 'yamaha-f310.svg', 'type' => 'Gitar Akustik'],
            ['name' => 'Stratocaster Player II', 'brand' => 'Fender', 'price' => 13900000, 'description' => 'Gitar elektrik dengan tiga pickup single-coil dan karakter nada yang jernih, fleksibel untuk blues, funk, pop, hingga reggae.', 'image' => 'fender-stratocaster.svg', 'type' => 'Gitar Elektrik'],
            ['name' => 'GSR200', 'brand' => 'Ibanez', 'price' => 3950000, 'description' => 'Bass elektrik empat senar dengan neck ramping dan pickup aktif, memberikan kontrol nada yang mudah untuk pemain pemula maupun berpengalaman.', 'image' => 'ibanez-gsr200.svg', 'type' => 'Gitar Bass'],
            ['name' => 'P-125a', 'brand' => 'Yamaha', 'price' => 10900000, 'description' => 'Piano digital 88 tuts dengan aksi berbobot dan respons suara yang ekspresif. Desain ringkasnya cocok untuk latihan di rumah maupun panggung kecil.', 'image' => 'yamaha-p125.svg', 'type' => 'Piano Digital'],
            ['name' => 'E-X10', 'brand' => 'Roland', 'price' => 3750000, 'description' => 'Keyboard portabel dengan pilihan suara beragam, iringan otomatis, dan fitur latihan praktis untuk membantu membangun kebiasaan bermusik.', 'image' => 'roland-ex10.svg', 'type' => 'Keyboard'],
            ['name' => 'Nitro Mesh Kit', 'brand' => 'Alesis', 'price' => 8990000, 'description' => 'Set drum elektronik dengan pad mesh yang responsif, pedal bass, dan suara drum siap dimainkan tanpa mengganggu sekitar.', 'image' => 'alesis-nitro-mesh.svg', 'type' => 'Drum Elektronik'],
            ['name' => 'Stage Custom Birch', 'brand' => 'Yamaha', 'price' => 17900000, 'description' => 'Drum akustik berbahan birch dengan proyeksi suara kuat dan artikulasi jelas, sesuai untuk kebutuhan latihan band dan panggung.', 'image' => 'yamaha-stage-custom.svg', 'type' => 'Drum Akustik'],
            ['name' => 'Concert', 'brand' => 'Mahalo', 'price' => 990000, 'description' => 'Ukulele concert dengan badan kayu ringan dan suara hangat. Ukurannya nyaman untuk latihan akor, bernyanyi bersama, dan dibawa bepergian.', 'image' => 'mahalo-concert.svg', 'type' => 'Ukulele'],
            ['name' => 'V5 Student Violin', 'brand' => 'Yamaha', 'price' => 4950000, 'description' => 'Biola ukuran penuh yang dibuat dengan konstruksi rapi untuk pelajar. Paketnya siap mendukung latihan teknik dasar dengan tone yang lembut.', 'image' => 'yamaha-v5.svg', 'type' => 'Biola'],
            ['name' => 'YAS-280', 'brand' => 'Yamaha', 'price' => 14900000, 'description' => 'Saxophone alto untuk pelajar dengan intonasi stabil dan tata letak key yang nyaman, membantu pemain fokus mengembangkan embouchure dan musikalitas.', 'image' => 'yamaha-yas280.svg', 'type' => 'Saxophone'],
            ['name' => 'TR200 Bb', 'brand' => 'Bach', 'price' => 8900000, 'description' => 'Trumpet nada Bb dengan respons ringan dan proyeksi suara seimbang, cocok untuk pemain yang mulai serius mengembangkan teknik tiup.', 'image' => 'bach-tr200.svg', 'type' => 'Trumpet'],
            ['name' => 'Headliner Cajon', 'brand' => 'Meinl', 'price' => 1850000, 'description' => 'Cajon ringkas dengan karakter bass yang dalam dan slap yang tajam. Satu instrumen praktis untuk mengisi ritme pada pertunjukan akustik.', 'image' => 'meinl-cajon.svg', 'type' => 'Perkusi'],
        ];

        foreach ($instruments as $instrument) {
            Instrument::updateOrCreate(
                ['brand' => $instrument['brand'], 'name' => $instrument['name']],
                $instrument,
            );
        }
    }
}
