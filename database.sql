-- Membuat database
CREATE DATABASE IF NOT EXISTS db_kasir;
USE db_kasir;

-- Tabel users
CREATE TABLE users (
  id_user INT AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL,
  role ENUM('admin', 'kasir') NOT NULL
);

-- Tabel kategori
CREATE TABLE kategori (
  id_kategori INT AUTO_INCREMENT PRIMARY KEY,
  nama_kategori VARCHAR(50) NOT NULL
);

-- Tabel produk
CREATE TABLE produk (
  id_produk INT AUTO_INCREMENT PRIMARY KEY,
  nama_produk VARCHAR(100) NOT NULL,
  harga INT NOT NULL,
  stok INT NOT NULL,
  id_kategori INT,
  FOREIGN KEY (id_kategori) REFERENCES kategori(id_kategori)
);

-- Tabel diskon
CREATE TABLE diskon (
  id_diskon INT AUTO_INCREMENT PRIMARY KEY,
  id_produk INT,
  minimal_qty INT NOT NULL,
  potongan INT NOT NULL,
  FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

-- Tabel transaksi
CREATE TABLE transaksi (
  id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
  tanggal DATETIME NOT NULL,
  id_user INT,
  total INT NOT NULL,
  bayar INT NOT NULL,
  kembali INT NOT NULL,
  FOREIGN KEY (id_user) REFERENCES users(id_user)
);

-- Tabel detail_transaksi
CREATE TABLE detail_transaksi (
  id_detail INT AUTO_INCREMENT PRIMARY KEY,
  id_transaksi INT,
  id_produk INT,
  harga INT NOT NULL,
  qty INT NOT NULL,
  diskon INT DEFAULT 0,
  subtotal INT NOT NULL,
  FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi),
  FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

-- Sample Data Insert

-- Users
INSERT INTO users (nama, username, password, role) VALUES
('Admin Toko', 'admin', 'admin123', 'admin'),
('Kasir A', 'kasira', 'kasir123', 'kasir');

-- Kategori
INSERT INTO kategori (nama_kategori) VALUES
('Minuman'), ('Makanan');

-- Produk
INSERT INTO produk (nama_produk, harga, stok, id_kategori) VALUES
('Teh Botol', 5000, 50, 1),
('Air Mineral', 3000, 100, 1),
('Roti Coklat', 8000, 30, 2),
('Keripik Kentang', 10000, 25, 2);

-- Diskon
INSERT INTO diskon (id_produk, minimal_qty, potongan) VALUES
(1, 3, 2000), -- Teh Botol: beli ≥3 potong 2000
(3, 2, 1000); -- Roti Coklat: beli ≥2 potong 1000

-- Transaksi
INSERT INTO transaksi (tanggal, id_user, total, bayar, kembali) VALUES
(NOW(), 2, 20000, 25000, 5000);

-- Detail Transaksi
INSERT INTO detail_transaksi (id_transaksi, id_produk, harga, qty, diskon, subtotal) VALUES
(1, 1, 5000, 3, 2000, 13000),
(1, 3, 8000, 1, 0, 8000);