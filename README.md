# Database Sistem Kasir – Tugas UAS

Repository ini berisi struktur dan contoh data *Database Sistem Kasir* sederhana, dibuat untuk memenuhi Tugas Praktik UAS Mata Kuliah Basis Data.

---

## Deskripsi Database

Database ini digunakan untuk mengelola data transaksi pada sistem kasir mini market, mencakup manajemen produk, kategori, user (admin/kasir), transaksi penjualan, dan fitur diskon produk.

Database terdiri dari 6 tabel utama yang saling terhubung menggunakan *foreign key*.

---

## Penjelasan Tabel

### 1. users
Menyimpan data pengguna sistem.
- id_user – Primary key
- nama, username, password – Data login
- role – Enum: 'admin' atau 'kasir'

### 2. kategori
Kategori produk.
- id_kategori – Primary key
- nama_kategori – Nama kategori (misal: Makanan, Minuman)

### 3. produk
Data produk yang dijual.
- id_produk – Primary key
- nama_produk, harga, stok
- id_kategori – Relasi ke tabel kategori

### 4. diskon
Menyimpan syarat diskon untuk produk.
- id_diskon – Primary key
- id_produk – Produk yang diberi diskon
- minimal_qty – Jumlah minimal pembelian
- potongan – Potongan harga dalam rupiah

### 5. transaksi
Data transaksi penjualan.
- id_transaksi – Primary key
- tanggal, id_user, total, bayar, kembali

### 6. detail_transaksi
Rincian pembelian dalam satu transaksi.
- id_detail – Primary key
- id_transaksi, id_produk
- harga, qty, diskon, subtotal

---

## Cara Import Database

1. Buka aplikasi database seperti *phpMyAdmin* atau *MySQL Workbench*
2. Buat database baru dengan nama db_kasir
3. Import file database.sql yang ada di repo ini
4. Selesai! Database siap digunakan

---

## Identitas

- *Nama*: Mohammad Fredimas
- *NIM* : 23.02.0.0015
- *Kelas*: Sistem Informasi 4A
- *Mata Kuliah*: Basis Data Lanjut

---

## Catatan Tambahan

- Tabel diskon memungkinkan sistem untuk menetapkan potongan otomatis berdasarkan jumlah pembelian.
- Sudah disediakan *sample data* untuk semua tabel agar mudah diuji.
- Struktur ini dirancang agar bisa dikembangkan ke aplikasi kasir berbasis web atau desktop.

---