-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Okt 2020 pada 17.28
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_gorice`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(225) NOT NULL,
  `keterangan` text NOT NULL,
  `icon_kategori` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kategori`
--

INSERT INTO `tb_kategori` (`id_kategori`, `nama_kategori`, `keterangan`, `icon_kategori`) VALUES
(1, 'Beras', 'produk dengan kategori beras', 'beras.png'),
(2, 'Bibit', 'Menyediakan berbagai jenis bibit', 'bibit.png'),
(4, 'Pupuk', 'menyediakan pupuk', 'pupuk.png'),
(5, 'Padi', 'Menjual berbagai jenis padi', '216-2169653_wheat-clipart-bunga-padi-padi-png-removebg-preview.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_keranjang`
--

CREATE TABLE `tb_keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `detail_order` varchar(225) NOT NULL,
  `jumlah_produk` int(11) NOT NULL,
  `total_harga_produk` float NOT NULL,
  `id_status_transaksi` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_keranjang`
--

INSERT INTO `tb_keranjang` (`id_keranjang`, `id_user`, `id_produk`, `detail_order`, `jumlah_produk`, `total_harga_produk`, `id_status_transaksi`, `created_at`) VALUES
(219, 1, 1, '41899', 6, 120000, 2, '2020-10-09 02:19:47'),
(220, 1, 11, '39389', 1, 10000, 2, '2020-10-04 08:35:05'),
(221, 1, 1, '39389', 5, 100000, 2, '2020-10-09 02:19:47'),
(222, 1, 25, '51659', 1, 4000, 2, '2020-10-04 09:07:08'),
(224, 1, 1, '85995', 5, 100000, 2, '2020-10-09 02:19:47'),
(225, 36, 11, '90618', 1, 10000, 2, '2020-10-04 11:07:18'),
(228, 36, 1, '38632', 1, 20000, 2, '2020-10-04 12:02:40'),
(230, 36, 1, '04664', 1, 20000, 2, '2020-10-04 12:03:52'),
(231, 38, 1, '70867', 3, 60000, 2, '2020-10-07 00:13:14'),
(233, 38, 26, '70867', 2, 10000, 2, '2020-10-07 00:13:14'),
(234, 38, 1, '07641', 1, 20000, 2, '2020-10-07 00:17:15'),
(235, 38, 11, '07641', 1, 10000, 2, '2020-10-07 00:17:15'),
(236, 38, 1, '92668', 1, 20000, 2, '2020-10-07 01:01:12'),
(237, 1, 1, '12812', 5, 100000, 2, '2020-10-09 02:19:47'),
(238, 1, 1, '70218', 4, 80000, 2, '2020-10-09 02:19:47'),
(239, 1, 11, '70218', 1, 10000, 2, '2020-10-09 01:58:45'),
(240, 1, 1, '88509', 2, 40000, 2, '2020-10-09 02:20:29'),
(241, 1, 22, '88509', 2, 26000, 2, '2020-10-13 13:07:20'),
(242, 1, 22, '63799', 2, 26000, 2, '2020-10-13 13:07:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_konfirmasi`
--

CREATE TABLE `tb_konfirmasi` (
  `id_konfirmasi` int(11) NOT NULL,
  `id_checkout` int(11) NOT NULL,
  `nama_konsumen` varchar(150) NOT NULL,
  `notelp` varchar(125) NOT NULL,
  `jumlah_transfer` double NOT NULL,
  `image` text NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_konfirmasi`
--

INSERT INTO `tb_konfirmasi` (`id_konfirmasi`, `id_checkout`, `nama_konsumen`, `notelp`, `jumlah_transfer`, `image`, `tanggal`) VALUES
(16, 38399, 'dora', '083736763', 50000, 'image_picker1332887583073578417.jpg', '2020-10-04 09:00:23'),
(17, 39389, 'dora', '08236223', 50000, 'image_picker7374824989365610691.jpg', '2020-10-04 09:02:53'),
(18, 85996, 'dora', '08543245', 40000, 'image_picker1935557440394045505.jpg', '2020-10-04 09:10:02'),
(19, 85885, 'Dora', '08278372', 100000, 'image_picker6816888860404170469.jpg', '2020-10-04 09:11:18'),
(20, 85995, 'Dora', '0823463768292', 40000, 'image_picker3747924347615154286.jpg', '2020-10-04 09:12:43'),
(21, 4664, 'Gorice', '085325974255', 60000, 'image_picker1533235255.jpg', '2020-10-04 12:05:53'),
(22, 8809, 'dora grestya', '082478999', 60000, 'image_picker701144671343027680.jpg', '2020-10-09 02:22:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_konsumen`
--

CREATE TABLE `tb_konsumen` (
  `id_konsumen` int(11) NOT NULL,
  `fullname_konsumen` varchar(150) NOT NULL,
  `email_konsumen` varchar(125) NOT NULL,
  `password_konsumen` text NOT NULL,
  `nohp_konsumen` text NOT NULL,
  `alamat_konsumen` text NOT NULL,
  `photo_konsumen` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_konsumen`
--

INSERT INTO `tb_konsumen` (`id_konsumen`, `fullname_konsumen`, `email_konsumen`, `password_konsumen`, `nohp_konsumen`, `alamat_konsumen`, `photo_konsumen`, `created_at`) VALUES
(1, 'Dora Grestya', 'doragrestyaa@gmail.com', '4297f44b13955235245b2497399d7a93', '0623421362572', 'Solok', 'cv.jpg', '2020-09-25 05:34:05'),
(22, 'Siti', 'siti@gmail.com', '4297f44b13955235245b2497399d7a93', '0623421362572', 'Solok', 'image_picker6901329658289990576.jpg', '2020-09-28 03:50:07'),
(31, 'Oya', 'oya@gmail.com', '4297f44b13955235245b2497399d7a93', '0823652357', '123123', 'icons8-seed-100.png', '2020-09-26 15:53:53'),
(32, 'Dora', 'dorai@gmail.com', '4297f44b13955235245b2497399d7a93', '0623421362572', 'Solok', '', '2020-09-28 03:51:02'),
(36, 'Gorice', 'gorice@gmail.com', '4297f44b13955235245b2497399d7a93', '082356214586', 'Jl.Drs.Moh.Yamin', '', '2020-10-03 03:40:36'),
(37, 'Gorice', 'vina@gmail.com', '1385923e15b60f29c5b27765dda07489', '082356248596', 'Jl.Drs.Moh.Yamin', '', '2020-10-04 11:02:08'),
(38, 'Coba', 'coba@gmail.com', '4297f44b13955235245b2497399d7a93', '082345672929', 'Jl. Raya', '', '2020-10-06 08:15:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_order`
--

CREATE TABLE `tb_order` (
  `id_order` int(11) NOT NULL,
  `tanggal_order` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_user` int(11) NOT NULL,
  `alamat_user` text NOT NULL,
  `order_status` int(11) NOT NULL,
  `order_total` int(11) NOT NULL,
  `id_shipping` int(11) NOT NULL,
  `id_payment` int(11) NOT NULL,
  `id_checkout` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_order`
--

INSERT INTO `tb_order` (`id_order`, `tanggal_order`, `id_user`, `alamat_user`, `order_status`, `order_total`, `id_shipping`, `id_payment`, `id_checkout`) VALUES
(57, '2020-10-04 08:27:53', 1, 'Solok', 5, 40000, 2, 2, 41899),
(58, '2020-10-04 09:02:53', 1, 'Solok', 4, 30000, 2, 2, 39389),
(59, '2020-10-04 09:07:08', 1, 'Solok', 2, 4000, 2, 2, 51659),
(60, '2020-10-04 09:12:43', 1, 'Solok', 3, 33000, 2, 2, 85995),
(61, '2020-10-04 11:07:18', 36, 'Jl.Drs.Moh.Yamin', 2, 36000, 2, 2, 90618),
(62, '2020-10-04 12:06:36', 36, 'Jl.Drs.Moh.Yamin', 5, 59000, 2, 2, 38632),
(63, '2020-10-04 12:08:44', 36, 'Jl.Drs.Moh.Yamin', 4, 20000, 2, 2, 4664),
(64, '2020-10-07 00:16:20', 38, 'Jl. Raya', 5, 70000, 2, 1, 70867),
(65, '2020-10-07 00:17:16', 38, 'Jl. Raya', 2, 30000, 2, 2, 7641),
(66, '2020-10-07 01:01:13', 38, 'Jl. Raya', 2, 20000, 2, 2, 92668),
(67, '2020-10-08 14:25:22', 1, 'Solok', 2, 40000, 2, 2, 12812),
(68, '2020-10-09 01:58:45', 1, 'Solok', 2, 70000, 2, 2, 70218),
(69, '2020-10-09 02:20:29', 1, 'Solok', 2, 53000, 2, 2, 88509),
(70, '2020-10-13 13:07:36', 1, 'Solok', 2, 26000, 2, 2, 63799);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_payment`
--

CREATE TABLE `tb_payment` (
  `id_payment` int(11) NOT NULL,
  `nama_payment` varchar(150) NOT NULL,
  `no_rek` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_payment`
--

INSERT INTO `tb_payment` (`id_payment`, `nama_payment`, `no_rek`) VALUES
(1, 'COD', 'Cash On Delivery'),
(2, 'Bank Transfer', '1231431 a.n Annissa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_produk`
--

CREATE TABLE `tb_produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(150) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `stok_produk` int(11) NOT NULL,
  `gambar_produk` text NOT NULL,
  `detail_produk` varchar(225) NOT NULL,
  `total_jual` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_konsumen` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_produk`
--

INSERT INTO `tb_produk` (`id_produk`, `nama_produk`, `harga_produk`, `stok_produk`, `gambar_produk`, `detail_produk`, `total_jual`, `id_kategori`, `id_konsumen`, `id_satuan`) VALUES
(1, 'Beras Mentik Wangi Susu', 20000, 136, 'mentik_wangi_susu.jpg', 'Beras mentik wangi susu adalah beras organik yang sangat kaya nutrisi dan mineral. Beras mentik susu berwarna putih mirip dengan susu dan bentuknya mirip dengan beras ketan putih. Tekstur beras ini sangat pulen seperti beras ', 67, 1, 1, 1),
(11, 'Beras Hitam', 10000, 98, 'hitam.jpg', 'Beras ini sangat langka, disebabkan aleuron dan endospermia memproduksi antosianin dengan intensitas tinggi sehingga berwarna ungu pekat mendekati hitam. Selain sebagai bahan pangan beras hitam juga berfungsi sebagai obat', 32, 1, 1, 1),
(13, 'Bibit Beras Merah', 10000, 0, 'merah.jpg', 'Beras ini berwarna merah akibat aleuronnya mengandung gen yang memproduksi antosianin yang merupakan sumber warna merah atau ungu. Beras kupas kulit, warna merah pada beras tidak terkelupas sehingga masih banyak vitamin', 12, 2, 1, 1),
(19, 'Beras Pandan Wangi', 10000, 50, 'pandan_wangi.png', 'Ciri khas beras ini terdapat pada aromanya yang berbau wangi daun pandan. Ciri yang lainnya yang bisa membantu agar kita tidak salah pilih, yaitu bentuk beras pandan wangi tidak panjang, tetapi sedikit bulat. Jika terdapat be', 10, 1, 1, 1),
(22, 'Bibit Padi IR64', 13000, 37, 'ir64.png', 'Beras ini harganya yang cukup terjangkau dan banyak disukai oleh masyarakat perkotaan. Normalnya beras jenis ini pulen jika dimasak menjadi nasi, namun jika telah berumur terlalu lama (lebih dari 3 bulan) maka beras ini menja', 28, 2, 1, 1),
(23, 'SA', 25000, 12, 'default.png', 'css', 11, 1, 0, 0),
(25, 'Pupuk Phonska', 4000, 45, 'pupuk-npk-phonska-fungsi-dan-manfaatnya-untuk-tanaman-13.jpg', 'Pupuk NPK Phonska merupakan salah satu jenis pupuk yang disubsidi oleh pemerintah sehingga harganya lebih murah dan terjangkau oleh petani. Pupuk phonska disebut juga dengan sebutan pupuk majemuk NPK yang terdiri dari beberap', 7, 4, 1, 1),
(26, 'Pupuk TSP', 5000, 47, 'download_(1).jpg', 'Pupuk TSP adalah salah satu pupuk sumber hara fosfor pertama yang memiliki hasil analisa kandungan cukup tinggi dan dipakai secara luas di masyarakat. Secara teknis di kenal sebagai calcium dihydrogen phosphate dan juga monoc', 5, 4, 1, 1),
(27, 'Beras Cokelat', 12000, 10, 'download.jpg', 'deskripsi', 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_satuan`
--

CREATE TABLE `tb_satuan` (
  `id_satuan` int(11) NOT NULL,
  `nama_satuan` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_satuan`
--

INSERT INTO `tb_satuan` (`id_satuan`, `nama_satuan`) VALUES
(1, 'kilogram'),
(2, 'kodi'),
(3, 'liter');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_shipping`
--

CREATE TABLE `tb_shipping` (
  `id_shipping` int(11) NOT NULL,
  `nama_shipping` varchar(150) NOT NULL,
  `detail_shipping` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_shipping`
--

INSERT INTO `tb_shipping` (`id_shipping`, `nama_shipping`, `detail_shipping`) VALUES
(2, 'Kurir GoRice', 'Kurir Khusus Aplikasi GoRice');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_slider`
--

CREATE TABLE `tb_slider` (
  `id_slider` int(11) NOT NULL,
  `image_slider` text NOT NULL,
  `keterangan` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_slider`
--

INSERT INTO `tb_slider` (`id_slider`, `image_slider`, `keterangan`) VALUES
(1, 'download.jpg', 'Beras'),
(3, 'hitam.jpg', 'Beras di Indonesia'),
(7, 'homee.png', 'GoRice');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_status_transaksi`
--

CREATE TABLE `tb_status_transaksi` (
  `id_status_transaksi` int(11) NOT NULL,
  `status_transaksi` varchar(150) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_status_transaksi`
--

INSERT INTO `tb_status_transaksi` (`id_status_transaksi`, `status_transaksi`, `keterangan`) VALUES
(1, 'Keranjang', 'Masih dalam keranjang'),
(2, 'OnHold', 'Belum dibayar'),
(3, 'Processing', 'Sedang dalam proses'),
(4, 'Complete', 'Order selesai'),
(5, 'Cancel', 'Order dibatalkan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username_user` varchar(150) NOT NULL,
  `fullname_user` varchar(150) NOT NULL,
  `photo_user` text NOT NULL,
  `nohp_user` text NOT NULL,
  `email_user` varchar(125) NOT NULL,
  `password_user` text NOT NULL,
  `role` enum('admin','customer') NOT NULL DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_login` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username_user`, `fullname_user`, `photo_user`, `nohp_user`, `email_user`, `password_user`, `role`, `created_at`, `update_at`, `last_login`, `is_active`) VALUES
(1, 'admin', 'admin', 'default.jpg', '0768857', 'admin@gmail.com', '$2y$10$Dy4ySqOiDqKisEyoKJEsl.L2psUIjeKMwmp5W3iElRQLKZF0.kKbS', 'admin', '2020-09-17 16:14:23', '2020-09-17 16:14:23', '2020-10-14 02:47:01', 1),
(9, 'oya12', 'oya12', 'download.jpg', '123', 'oya@gmail.com', '1cc39ffd758234422e1f75beadfc5fb2', 'admin', '2020-10-08 23:12:48', '2020-10-08 23:12:48', '2020-10-08 23:12:48', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `tb_keranjang`
--
ALTER TABLE `tb_keranjang`
  ADD PRIMARY KEY (`id_keranjang`);

--
-- Indeks untuk tabel `tb_konfirmasi`
--
ALTER TABLE `tb_konfirmasi`
  ADD PRIMARY KEY (`id_konfirmasi`);

--
-- Indeks untuk tabel `tb_konsumen`
--
ALTER TABLE `tb_konsumen`
  ADD PRIMARY KEY (`id_konsumen`);

--
-- Indeks untuk tabel `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`id_order`);

--
-- Indeks untuk tabel `tb_payment`
--
ALTER TABLE `tb_payment`
  ADD PRIMARY KEY (`id_payment`);

--
-- Indeks untuk tabel `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `tb_satuan`
--
ALTER TABLE `tb_satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indeks untuk tabel `tb_shipping`
--
ALTER TABLE `tb_shipping`
  ADD PRIMARY KEY (`id_shipping`);

--
-- Indeks untuk tabel `tb_slider`
--
ALTER TABLE `tb_slider`
  ADD PRIMARY KEY (`id_slider`);

--
-- Indeks untuk tabel `tb_status_transaksi`
--
ALTER TABLE `tb_status_transaksi`
  ADD PRIMARY KEY (`id_status_transaksi`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tb_keranjang`
--
ALTER TABLE `tb_keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT untuk tabel `tb_konfirmasi`
--
ALTER TABLE `tb_konfirmasi`
  MODIFY `id_konfirmasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `tb_konsumen`
--
ALTER TABLE `tb_konsumen`
  MODIFY `id_konsumen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT untuk tabel `tb_payment`
--
ALTER TABLE `tb_payment`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_produk`
--
ALTER TABLE `tb_produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `tb_satuan`
--
ALTER TABLE `tb_satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_shipping`
--
ALTER TABLE `tb_shipping`
  MODIFY `id_shipping` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_slider`
--
ALTER TABLE `tb_slider`
  MODIFY `id_slider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tb_status_transaksi`
--
ALTER TABLE `tb_status_transaksi`
  MODIFY `id_status_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
