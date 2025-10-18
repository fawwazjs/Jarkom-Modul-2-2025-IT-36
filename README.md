# Laporan Jarkom Modul 2 Kelompok K-36

## Anggota

| Nama | NRP|
|-------------------------------|---------------|
| Ahmad Wildan Fawwaz| 5027241001 |
| Muhammad Rakha Hananditya R.| 5027241015 |

## Pendahuluan

بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيْمِ

<p align="justify">
&emsp; Segala puji syukur kita panjatkan atas kehadirat Allah Subḥānahu wa Ta‘ālā, karena berkat atas rahmat, karunia, dan nikmat-Nya praktikum modul 1 untuk mata kuliah Komunikasi Data dan Jaringan Komputer dapat diselesaikan dengan cukup. Tidak lupa shalawat serta salam semoga senantiasa tercurah kepada junjungan kita Nabi Muhammad Shallallāhu ‘alaihi wa Sallam, suri teladan terbaik bagi umat manusia, beserta keluarga, sahabat, dan para pengikutnya hingga akhir zaman.
</p>

<p align="justify">
&emsp; Laporan ini disusun sebagai suatu bentuk pertanggungjawaban akademik atas kegiatan praktikum yang telah dilaksanakan. Selain itu, laporan ini berfungsi sebagai dokumentasi resmi tertulis dari seluruh rangkaian kegiatan yang telah dilakukan, sehingga dapat menjadi acuan dalam evaluasi maupun penilaian praktikum.
</p>

Rasulullah Shallallāhu ‘alaihi wa Sallam pernah bersabda:

إِذَا مَاتَ ابْنُ آدَمَ انْقَطَعَ عَمَلُهُ إِلَّا مِنْ ثَلَاثٍ: صَدَقَةٍ جَارِيَةٍ، أَوْ عِلْمٍ يُنْتَفَعُ بِهِ، أَوْ وَلَدٍ صَالِحٍ يَدْعُو لَهُ


<em>Artinya</em>:
<p align="justify">  
"Apabila anak Adam meninggal dunia, maka terputuslah amalnya kecuali tiga perkara: sedekah jariyah, ilmu yang bermanfaat, atau anak shalih yang mendoakannya." 
  
(HR. Muslim, no. 1631)
</p>
  
<p align="justify">
&emsp; Maka dari itu, semoga apa yang tertulis pada laporan ini dapat menjadi ilmu yang bermanfaat, serta menjadi keberkahan dan amal yang diterima di sisi Allah Subḥānahu wa Ta‘ālā. Semoga bagi yang membaca ini, Allah memudahkan semua langkahnya dalam menuntut ilmu, mengamalkannya, serta menjaganya agar tidak sekadar menjadi hafalan, namun juga menjadi bekal yang membawanya ke surga.
</p>

Āmīn yā Rabbal ‘ālamīn.

## Daftar Isi

- [Anggota](#anggota)
- [Pendahuluan](#pendahuluan)
- [Daftar Isi](#daftar-isi)
- [Walkthrough](#walkthrough)
	- [Soal 1](#-soal-1)
	- [Soal 2](#-soal-2)
 	- [Soal 3](#-soal-3)
  	- [Soal 4](#-soal-4)
  	- [Soal 5](#-soal-5)
  	- [Soal 6](#-soal-6)
  	- [Soal 7](#-soal-7)
  	- [Soal 8](#-soal-8)
  	- [Soal 9](#-soal-9)
  	- [Soal 10](#-soal-10)
  	- [Soal 11](#-soal-11)
  	- [Soal 12](#-soal-12)
  	- [Soal 13](#-soal-13)
  	- [Soal 14](#-soal-14)
  	- [Soal 15](#-soal-15)
  	- [Soal 16](#-soal-16)
  	- [Soal 17](#-soal-17)
  	- [Soal 18](#-soal-18)
  	- [Soal 19](#-soal-19)
  	- [Soal 20](#-soal-20)
- [Kendala Pengerjaan](#kendala-pengerjaan)

## Walkthrough

### • Soal 1

<blockquote>
	<ol>
		<li>
			<p align="justify">
				Di tepi Beleriand yang porak-poranda, Eonwe merentangkan tiga jalur: Barat untuk Earendil dan Elwing, Timur untuk Círdan, Elrond, Maglor, serta pelabuhan DMZ bagi Sirion, Tirion, Valmar, Lindon, Vingilot. Tetapkan alamat dan default gateway tiap tokoh sesuai glosarium yang sudah diberikan.
			</p>
		</li>
	</ol>
</blockquote>

<p align="justify">
&emsp; Untuk mendefinisikan alamat dan default gateway, maka kita dapat beralih ke menu <code>Configure > Edit Network Configuration</code> untuk setiap node yang ada.
</p>


<p align="center">
	<img src="" alt="a" width="80%" height="80%">  
</p>

### • Soal 2

<blockquote>
    <ol start="2">
        <li>
            <p align="justify">
Angin dari luar mulai berhembus ketika Eonwe membuka jalan ke awan NAT. Pastikan jalur WAN di router aktif dan NAT meneruskan trafik keluar bagi seluruh alamat internal sehingga host di dalam dapat mencapai layanan di luar menggunakan IP address.
    </p>
        </li>
    </ol>
</blockquote>

### • Soal 3

<blockquote>
    <ol start="3">
        <li>
            <p align="justify">
Kabar dari Barat menyapa Timur. Pastikan kelima klien dapat saling berkomunikasi lintas jalur (routing internal via Eonwe berfungsi), lalu pastikan setiap host non-router menambahkan resolver 192.168.122.1 saat interfacenya aktif agar akses paket dari internet tersedia sejak awal.
    </p>
        </li>
    </ol>
</blockquote>

### • Soal 4

<blockquote>
    <ol start="4">
        <li>
            <p align="justify">Para penjaga nama naik ke menara, di Tirion (ns1/master) bangun zona <xxxx>.com sebagai authoritative dengan SOA yang menunjuk ke ns1.<xxxx>.com dan catatan NS untuk ns1.<xxxx>.com dan ns2.<xxxx>.com. Buat A record untuk ns1.<xxxx>.com dan ns2.<xxxx>.com yang mengarah ke alamat Tirion dan Valmar sesuai glosarium, serta A record apex <xxxx>.com yang mengarah ke alamat Sirion (front door), aktifkan notify dan allow-transfer ke Valmar, set forwarders ke 192.168.122.1. Di Valmar (ns2/slave) tarik zona <xxxx>.com dari Tirion dan pastikan menjawab authoritative. pada seluruh host non-router ubah urutan resolver menjadi IP dari ns1.<xxxx>.com → ns2.<xxxx>.com → 192.168.122.1. Verifikasi query ke apex dan hostname layanan dalam zona dijawab melalui ns1/ns2.
    </p>
        </li>
    </ol>
</blockquote>

### • Soal 5

<blockquote>
    <ol start="5">
        <li>
            <p align="justify">“Nama memberi arah,” kata Eonwe. Namai semua tokoh (hostname) sesuai glosarium, eonwe, earendil, elwing, cirdan, elrond, maglor, sirion, tirion, valmar, lindon, vingilot, dan verifikasi bahwa setiap host mengenali dan menggunakan hostname tersebut secara system-wide. Buat setiap domain untuk masing masing node sesuai dengan namanya (contoh: eru.<xxxx>.com) dan assign IP masing-masing juga. Lakukan pengecualian untuk node yang bertanggung jawab atas ns1 dan ns2.
    </p>
        </li>
    </ol>
</blockquote>

### • Soal 6

<blockquote>
    <ol start="6">
        <li>
            <p align="justify">Lonceng Valmar berdentang mengikuti irama Tirion. Pastikan zone transfer berjalan, Pastikan Valmar (ns2) telah menerima salinan zona terbaru dari Tirion (ns1). Nilai serial SOA di keduanya harus sama
    </p>
        </li>
    </ol>
</blockquote>

### • Soal 7

<blockquote>
    <ol start="7">
        <li>
            <p align="justify">Peta kota dan pelabuhan dilukis. Sirion sebagai gerbang, Lindon sebagai web statis, Vingilot sebagai web dinamis. Tambahkan pada zona <xxxx>.com A record untuk sirion.<xxxx>.com (IP Sirion), lindon.<xxxx>.com (IP Lindon), dan vingilot.<xxxx>.com (IP Vingilot). Tetapkan CNAME :
www.<xxxx>.com → sirion.<xxxx>.com, 
static.<xxxx>.com → lindon.<xxxx>.com, dan 
app.<xxxx>.com → vingilot.<xxxx>.com. 
Verifikasi dari dua klien berbeda bahwa seluruh hostname tersebut ter-resolve ke tujuan yang benar dan konsisten.
    </p>
        </li>
    </ol>
</blockquote>

### • Soal 8

<blockquote>
    <ol start="8">
        <li>
            <p align="justify">Setiap jejak harus bisa diikuti. Di Tirion (ns1) deklarasikan satu reverse zone untuk segmen DMZ tempat Sirion, Lindon, Vingilot berada. Di Valmar (ns2) tarik reverse zone tersebut sebagai slave, isi PTR untuk ketiga hostname itu agar pencarian balik IP address mengembalikan hostname yang benar, lalu pastikan query reverse untuk alamat Sirion, Lindon, Vingilot dijawab authoritative.
    </p>
        </li>
    </ol>
</blockquote>

### • Soal 9

<blockquote>
    <ol start="9">
        <li>
            <p align="justify">Lampion Lindon dinyalakan. Jalankan web statis pada hostname static.<xxxx>.com dan buka folder arsip /annals/ dengan autoindex (directory listing) sehingga isinya dapat ditelusuri. Akses harus dilakukan melalui hostname, bukan IP.
    </p>
        </li>
    </ol>
</blockquote>

### • Soal 10

<blockquote>
    <ol start="10">
        <li>
            <p align="justify">Vingilot mengisahkan cerita dinamis. Jalankan web dinamis (PHP-FPM) pada hostname app.<xxxx>.com dengan beranda dan halaman about, serta terapkan rewrite sehingga /about berfungsi tanpa akhiran .php. Akses harus dilakukan melalui hostname.
    </p>
        </li>
    </ol>
</blockquote>

### • Soal 11

<blockquote>
    <ol start="11">
        <li>
            <p align="justify">Di muara sungai, Sirion berdiri sebagai reverse proxy. Terapkan path-based routing: /static → Lindon dan /app → Vingilot, sambil meneruskan header Host dan X-Real-IP ke backend. Pastikan Sirion menerima www.<xxxx>.com (kanonik) dan sirion.<xxxx>.com, dan bahwa konten pada /static dan /app di-serve melalui backend yang tepat.
    </p>
        </li>
    </ol>
</blockquote>

### • Soal 12

<blockquote>
    <ol start="12">
        <li>
            <p align="justify">Ada kamar kecil di balik gerbang yakni /admin. Lindungi path tersebut di Sirion menggunakan Basic Auth, akses tanpa kredensial harus ditolak dan akses dengan kredensial yang benar harus diizinkan.
    </p>
        </li>
    </ol>
</blockquote>

### • Soal 13

<blockquote>
    <ol start="13">
        <li>
            <p align="justify">“Panggil aku dengan nama,” ujar Sirion kepada mereka yang datang hanya menyebut angka. Kanonisasikan endpoint, akses melalui IP address Sirion maupun sirion.<xxxx>.com harus redirect 301 ke www.<xxxx>.com sebagai hostname kanonik.
    </p>
        </li>
    </ol>
</blockquote>

### • Soal 14

<blockquote>
    <ol start="14">
        <li>
            <p align="justify">Di Vingilot, catatan kedatangan harus jujur. Pastikan access log aplikasi di Vingilot mencatat IP address klien asli saat lalu lintas melewati Sirion (bukan IP Sirion).
    </p>
        </li>
    </ol>
</blockquote>

### • Soal 15

<blockquote>
    <ol start="15">
        <li>
            <p align="justify">Pelabuhan diuji gelombang kecil, salah satu klien yakni Elrond menjadi penguji dan menggunakan ApacheBench (ab) untuk membombardir http://www.<xxxx>.com/app/ dan http://www.<xxxx>.com/static/ melalui hostname kanonik. Untuk setiap endpoint lakukan 500 request dengan concurrency 10, dan rangkum hasil dalam tabel ringkas.
    </p>
        </li>
    </ol>
</blockquote>

### • Soal 16

<blockquote>
    <ol start="16">
        <li>
            <p align="justify">Badai mengubah garis pantai. Ubah A record lindon.<xxxx>.com ke alamat baru (ubah IP paling belakangnya saja agar mudah), naikkan SOA serial di Tirion (ns1) dan pastikan Valmar (ns2) tersinkron, karena static.<xxxx>.com adalah CNAME → lindon.<xxxx>.com, seluruh akses ke static.<xxxx>.com mengikuti alamat baru, tetapkan TTL = 30 detik untuk record yang relevan dan verifikasi tiga momen yakni sebelum perubahan (mengembalikan alamat lama), sesaat setelah perubahan namun sebelum TTL kedaluwarsa (masih alamat lama karena cache), dan setelah TTL kedaluwarsa (beralih ke alamat baru).
    </p>
        </li>
    </ol>
</blockquote>

### • Soal 17

<blockquote>
    <ol start="17">
        <li>
            <p align="justify">Andaikata bumi bergetar dan semua tertidur sejenak, mereka harus bangkit sendiri. Pastikan layanan inti bind9 di ns1/ns2, nginx di Sirion/Lindon, dan PHP-FPM di Vingilot autostart saat reboot, lalu verifikasi layanan kembali menjawab sesuai fungsinya.
    </p>
        </li>
    </ol>
</blockquote>

### • Soal 18

<blockquote>
    <ol start="18">
        <li>
            <p align="justify">Sang musuh memiliki banyak nama. Tambahkan melkor.<xxxx>.com sebagai record TXT berisi “Morgoth (Melkor)” dan tambahkan morgoth.<xxxx>.com sebagai CNAME → melkor.<xxxx>.com, verifikasi query TXT terhadap melkor dan bahwa query ke morgoth mengikuti aliasnya.
    </p>
        </li>
    </ol>
</blockquote>


### • Soal 19

<blockquote>
    <ol start="19">
        <li>
            <p align="justify">Pelabuhan diperluas bagi para pelaut. Tambahkan havens.<xxxx>.com sebagai CNAME → www.<xxxx>.com, lalu akses layanan melalui hostname tersebut dari dua klien berbeda untuk memastikan resolusi dan rute aplikasi berfungsi.
    </p>
        </li>
    </ol>
</blockquote>

### • Soal 20

<blockquote>
    <ol start="20">
        <li>
            <p align="justify">Kisah ditutup di beranda Sirion. Sediakan halaman depan bertajuk “War of Wrath: Lindon bertahan” yang memuat tautan ke /app dan /static. Pastikan seluruh klien membuka beranda dan menelusuri kedua tautan tersebut menggunakan hostname (mis. www.<xxxx>.com), bukan IP address.
    </p>
        </li>
    </ol>
</blockquote>


## Kendala Pengerjaan
<ol>
	<li>
		<p align="justify">
		</p>
	</li>
</ol>
