-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Okt 2023 pada 16.11
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lelangin`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(150) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `harga_awal` int(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `status` enum('ada','lelang') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `image`, `tanggal`, `harga_awal`, `deskripsi`, `status`) VALUES
(23, 'cwcw', 'Logo padeprokan.png', '2023-10-23 20:30:22', 1000, '1222', 'lelang'),
(24, 'kdemkfmr', 'ko.png', '2023-10-23 20:42:38', 44944, 'jncjrncjen', 'lelang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `history`
--

CREATE TABLE `history` (
  `id_history` int(150) NOT NULL,
  `id_lelang` int(150) NOT NULL,
  `id_barang` int(150) NOT NULL,
  `username` varchar(255) NOT NULL,
  `penawaran` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `history`
--

INSERT INTO `history` (`id_history`, `id_lelang`, `id_barang`, `username`, `penawaran`) VALUES
(36, 24, 24, 'abdi', 100000),
(37, 24, 24, 'yono', 2000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE `laporan` (
  `id_laporan` int(150) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `tanggal_lelang` datetime NOT NULL,
  `harga_awal` varchar(255) NOT NULL,
  `harga_akhir` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `laporan`
--

INSERT INTO `laporan` (`id_laporan`, `nama_barang`, `image`, `username`, `tanggal_lelang`, `harga_awal`, `harga_akhir`) VALUES
(9, 'kdemkfmr', 'ko.png', 'yono', '2023-10-23 13:43:44', '44944', '2000000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lelang`
--

CREATE TABLE `lelang` (
  `id_lelang` int(150) NOT NULL,
  `id_barang` int(150) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `tanggal_lelang` datetime NOT NULL DEFAULT current_timestamp(),
  `harga_awal` int(255) NOT NULL,
  `harga_akhir` int(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `username` varchar(255) NOT NULL,
  `username_petugas` varchar(255) NOT NULL,
  `status` enum('dibuka','ditutup') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `lelang`
--

INSERT INTO `lelang` (`id_lelang`, `id_barang`, `nama_barang`, `image`, `tanggal_lelang`, `harga_awal`, `harga_akhir`, `deskripsi`, `username`, `username_petugas`, `status`) VALUES
(23, 23, 'cwcw', 'Logo padeprokan.png', '2023-10-23 20:41:22', 1000, 0, '1222', '', 'zidanpt2', 'dibuka'),
(24, 24, 'kdemkfmr', 'ko.png', '2023-10-23 20:43:44', 44944, 2000000, 'jncjrncjen', 'yono', 'zidanpt2', 'ditutup');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(150) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telp` varchar(40) NOT NULL,
  `level` enum('masyarakat','petugas','admin') NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `telp`, `level`, `token`) VALUES
(11, 'zidan', 'zidan', '123', '12233333', 'admin', '19203871zidan823746'),
(12, 'abdi', 'abdi', '123', '181928', 'masyarakat', ''),
(13, 'zidanpt2', 'zidanpt2', '123', '1122222', 'petugas', ''),
(14, 'yono', 'yono', '123', '1111111', 'masyarakat', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id_history`);

--
-- Indeks untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id_laporan`);

--
-- Indeks untuk tabel `lelang`
--
ALTER TABLE `lelang`
  ADD PRIMARY KEY (`id_lelang`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `history`
--
ALTER TABLE `history`
  MODIFY `id_history` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id_laporan` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `lelang`
--
ALTER TABLE `lelang`
  MODIFY `id_lelang` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
