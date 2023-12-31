-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Agu 2023 pada 05.16
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_hotel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `finance_income`
--

CREATE TABLE `finance_income` (
  `id_finance_income` int(5) NOT NULL,
  `nomor_invoice` varchar(20) NOT NULL,
  `jenis_income` varchar(100) NOT NULL,
  `jumlah` int(20) NOT NULL,
  `tanggal_pembayaran` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(3) NOT NULL,
  `nomor_kamar` int(3) NOT NULL,
  `id_kamar_tipe` int(3) NOT NULL,
  `max_dewasa` int(11) NOT NULL,
  `max_anak` int(11) NOT NULL,
  `status_kamar` varchar(20) NOT NULL DEFAULT 'TERSEDIA'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `nomor_kamar`, `id_kamar_tipe`, `max_dewasa`, `max_anak`, `status_kamar`) VALUES
(8, 101, 2, 1, 1, 'TERPAKAI'),
(9, 102, 3, 1, 2, 'KOTOR'),
(10, 103, 4, 2, 2, 'TERSEDIA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamar_tipe`
--

CREATE TABLE `kamar_tipe` (
  `id_kamar_tipe` int(3) NOT NULL,
  `nama_kamar_tipe` varchar(50) NOT NULL,
  `harga_malam` int(3) NOT NULL,
  `harga_orang` int(3) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kamar_tipe`
--

INSERT INTO `kamar_tipe` (`id_kamar_tipe`, `nama_kamar_tipe`, `harga_malam`, `harga_orang`, `keterangan`) VALUES
(2, 'STANDART', 100000, 25000, ''),
(3, 'SUPERIOR', 500000, 75000, ''),
(4, 'SUITE', 750000, 150000, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan`
--

CREATE TABLE `layanan` (
  `id_layanan` int(3) NOT NULL,
  `nama_layanan` varchar(100) NOT NULL,
  `id_layanan_kategori` int(3) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `harga_layanan` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `layanan`
--

INSERT INTO `layanan` (`id_layanan`, `nama_layanan`, `id_layanan_kategori`, `satuan`, `harga_layanan`) VALUES
(1, 'NASI GORENG', 1, 'Porsi', 25000),
(2, 'MIE GORENG', 1, 'Porsi', 15000),
(3, 'KOPI TUBRUK', 2, 'Pitcher', 85000),
(4, 'HEM', 4, '1', 10000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan_kategori`
--

CREATE TABLE `layanan_kategori` (
  `id_layanan_kategori` int(3) NOT NULL,
  `nama_layanan_kategori` varchar(100) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `layanan_kategori`
--

INSERT INTO `layanan_kategori` (`id_layanan_kategori`, `nama_layanan_kategori`, `keterangan`) VALUES
(1, 'FOOD', 'Produk makanan, snack, sarapan dan lain-lain'),
(2, 'DRINK', 'Produk minuman'),
(3, 'TRANSPORTASI', 'Fasilitas transportasi untuk kebutuhan tamu hotel'),
(4, 'LAUNDRY', 'LAUNDRY');

-- --------------------------------------------------------

--
-- Struktur dari tabel `perusahaan`
--

CREATE TABLE `perusahaan` (
  `id_perusahaan` int(100) NOT NULL,
  `nama_hotel` varchar(100) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `alamat_jalan` text NOT NULL,
  `alamat_kabupaten` varchar(50) NOT NULL,
  `alamat_provinsi` varchar(50) NOT NULL,
  `nomor_telp` varchar(20) NOT NULL,
  `nomor_fax` varchar(20) NOT NULL,
  `website` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `perusahaan`
--

INSERT INTO `perusahaan` (`id_perusahaan`, `nama_hotel`, `nama_perusahaan`, `alamat_jalan`, `alamat_kabupaten`, `alamat_provinsi`, `nomor_telp`, `nomor_fax`, `website`, `email`) VALUES
(1, 'E-DOTEL', 'SMK Abdi Negara Tuban', 'Jalan Alamat Hotel, No. 00', 'TUBAN', 'JAWA TIMUR', '-', '-', '-', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tamu`
--

CREATE TABLE `tamu` (
  `id_tamu` int(3) NOT NULL,
  `prefix` varchar(5) NOT NULL,
  `nama_depan` varchar(100) NOT NULL,
  `nama_belakang` varchar(100) NOT NULL,
  `tipe_identitas` varchar(20) NOT NULL,
  `nomor_identitas` varchar(20) NOT NULL,
  `warga_negara` varchar(100) NOT NULL DEFAULT 'Indonesia',
  `alamat_jalan` text NOT NULL,
  `alamat_kabupaten` varchar(100) NOT NULL,
  `alamat_provinsi` varchar(100) NOT NULL,
  `nomor_telp` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tamu`
--

INSERT INTO `tamu` (`id_tamu`, `prefix`, `nama_depan`, `nama_belakang`, `tipe_identitas`, `nomor_identitas`, `warga_negara`, `alamat_jalan`, `alamat_kabupaten`, `alamat_provinsi`, `nomor_telp`, `email`) VALUES
(4, 'Mr', 'Bagus', 'Prasetya', 'KTP', '5121827187291892', 'WNI', 'Jalan Slamet Riyadi 92', 'Pasuruan', 'Jawa Timur', '085655580445', 'bagusprasetya96@gmail.com'),
(5, 'Mr', 'deni', 'devito', 'KTP', '123213213213213', 'WNI', 'jl kakap', 'bandung', 'jabar', '213213554635464', 'deni@yashoo.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_kamar`
--

CREATE TABLE `transaksi_kamar` (
  `id_transaksi_kamar` int(3) NOT NULL,
  `id_user` int(3) NOT NULL,
  `nomor_invoice` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `id_tamu` int(3) NOT NULL,
  `id_kamar` int(3) NOT NULL,
  `jumlah_dewasa` int(3) NOT NULL,
  `jumlah_anak` int(3) NOT NULL,
  `tanggal_checkin` date NOT NULL,
  `waktu_checkin` time NOT NULL,
  `tanggal_checkout` date NOT NULL,
  `waktu_checkout` time NOT NULL,
  `total_biaya_kamar` int(20) NOT NULL,
  `deposit` int(20) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'CHECK IN'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi_kamar`
--

INSERT INTO `transaksi_kamar` (`id_transaksi_kamar`, `id_user`, `nomor_invoice`, `tanggal`, `id_tamu`, `id_kamar`, `jumlah_dewasa`, `jumlah_anak`, `tanggal_checkin`, `waktu_checkin`, `tanggal_checkout`, `waktu_checkout`, `total_biaya_kamar`, `deposit`, `status`) VALUES
(20, 1, 'INV-20180815-26', '2018-08-15', 4, 7, 1, 1, '2018-08-15', '16:56:00', '2018-07-31', '12:00:00', 1500000, 500000, 'CHECK OUT'),
(21, 1, 'INV-20180815-25', '2018-08-15', 4, 1, 2, 2, '2018-08-15', '16:57:00', '2018-07-31', '12:00:00', 1500000, 500000, 'CHECK OUT'),
(22, 1, 'INV-20180815-90', '2018-08-15', 0, 6, 2, 1, '2018-08-15', '17:31:00', '2018-08-15', '18:00:00', 0, 1500000, 'CHECK IN'),
(23, 4, 'INV-20180815-20', '2018-08-15', 5, 1, 2, 1, '2018-08-15', '20:28:00', '2018-08-16', '12:00:00', 100000, 300000, 'CHECK OUT'),
(24, 1, 'INV-20180815-21', '2018-08-15', 5, 1, 2, 1, '2018-08-15', '20:58:00', '2018-08-16', '12:00:00', 100000, 1000000, 'CHECK OUT'),
(25, 1, 'INV-20230802-74', '2023-08-02', 4, 1, 1, 1, '2023-08-02', '13:36:00', '2023-08-31', '12:00:00', 2900000, 500000, 'CHECK OUT'),
(26, 1, 'INV-20230802-45', '2023-08-02', 4, 8, 1, 2, '2023-08-02', '13:52:00', '2023-08-31', '12:00:00', 2900000, 3000000, 'CHECK IN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_layanan`
--

CREATE TABLE `transaksi_layanan` (
  `id_transaksi_layanan` int(3) NOT NULL,
  `id_user` int(3) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `id_transaksi_kamar` int(3) NOT NULL,
  `id_layanan` int(3) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi_layanan`
--

INSERT INTO `transaksi_layanan` (`id_transaksi_layanan`, `id_user`, `tanggal`, `waktu`, `id_transaksi_kamar`, `id_layanan`, `jumlah`, `total`) VALUES
(30, 1, '2018-08-15', '18:24:00', 20, 3, 1, 85000),
(31, 1, '2018-08-15', '18:24:00', 20, 2, 2, 30000),
(32, 1, '2018-08-15', '18:24:00', 20, 1, 1, 25000),
(33, 1, '2018-08-15', '20:59:00', 24, 4, 5, 50000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(3) NOT NULL,
  `images` varchar(100) NOT NULL DEFAULT 'user.jpg',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `id_user_role` int(5) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `nomor_telp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `images`, `username`, `password`, `nama`, `id_user_role`, `jabatan`, `nomor_telp`) VALUES
(1, 'default.jpg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Nama Administrator', 1, 'Application Developer', '0800 0000 0000'),
(4, 'user.jpg', 'iteung', 'e92ab3bc72b384a3b1e0f7eaee90a863', 'iteung', 4, 'FO', '081565465465465');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id_user_role` int(10) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id_user_role`, `role_name`, `keterangan`) VALUES
(1, 'DEVELOPER', 'Akses khusus untuk pembuat aplikasi'),
(2, 'SUPER ADMINISTRATOR', ''),
(3, 'ADMINISTRATOR', ''),
(4, 'FRONT OFFICE', ''),
(5, 'ROOM SERVICE', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `finance_income`
--
ALTER TABLE `finance_income`
  ADD PRIMARY KEY (`id_finance_income`);

--
-- Indeks untuk tabel `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indeks untuk tabel `kamar_tipe`
--
ALTER TABLE `kamar_tipe`
  ADD PRIMARY KEY (`id_kamar_tipe`);

--
-- Indeks untuk tabel `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id_layanan`);

--
-- Indeks untuk tabel `layanan_kategori`
--
ALTER TABLE `layanan_kategori`
  ADD PRIMARY KEY (`id_layanan_kategori`);

--
-- Indeks untuk tabel `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`id_perusahaan`);

--
-- Indeks untuk tabel `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`id_tamu`);

--
-- Indeks untuk tabel `transaksi_kamar`
--
ALTER TABLE `transaksi_kamar`
  ADD PRIMARY KEY (`id_transaksi_kamar`);

--
-- Indeks untuk tabel `transaksi_layanan`
--
ALTER TABLE `transaksi_layanan`
  ADD PRIMARY KEY (`id_transaksi_layanan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id_user_role`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `finance_income`
--
ALTER TABLE `finance_income`
  MODIFY `id_finance_income` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `kamar_tipe`
--
ALTER TABLE `kamar_tipe`
  MODIFY `id_kamar_tipe` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `layanan`
--
ALTER TABLE `layanan`
  MODIFY `id_layanan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `layanan_kategori`
--
ALTER TABLE `layanan_kategori`
  MODIFY `id_layanan_kategori` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `perusahaan`
--
ALTER TABLE `perusahaan`
  MODIFY `id_perusahaan` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tamu`
--
ALTER TABLE `tamu`
  MODIFY `id_tamu` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transaksi_kamar`
--
ALTER TABLE `transaksi_kamar`
  MODIFY `id_transaksi_kamar` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `transaksi_layanan`
--
ALTER TABLE `transaksi_layanan`
  MODIFY `id_transaksi_layanan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id_user_role` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
