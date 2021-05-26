-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 24, 2021 at 08:44 PM
-- Server version: 10.2.33-MariaDB-cll-lve
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mnjerpco_akutansi`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggaran_tk`
--

CREATE TABLE `anggaran_tk` (
  `id_anggaran` int(11) NOT NULL,
  `id_tk` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggaran_tk`
--

INSERT INTO `anggaran_tk` (`id_anggaran`, `id_tk`, `keterangan`, `qty`, `harga`, `total`) VALUES
(1, 1, 'Bahan Baku Kertas', 4, 1, 4),
(2, 1, 'Bahan Baku Tinta', 2, 1, 2),
(3, 1, 'Bahan Pendukung', 1, 1, 1),
(4, 1, 'Bahan Overhead', 1, 3, 3),
(5, 2, 'Bahan Baku', 5, 1, 5),
(6, 2, 'Tenaga Kerja', 2, 1, 2),
(7, 2, 'Overhead', 3, 1, 3),
(8, 2, 'Lain-lain', 1, 1, 1),
(9, 3, 'Bahan Baku', 2, 200000, 400000),
(10, 3, 'Tenaga Kerja', 1, 100000, 100000),
(11, 3, 'Overhead', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bahan_baku`
--

CREATE TABLE `bahan_baku` (
  `kodebb` varchar(255) NOT NULL,
  `kodesup` varchar(255) NOT NULL,
  `bahan` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_gaji`
--

CREATE TABLE `data_gaji` (
  `id_gaji` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `no_rekening` int(20) NOT NULL,
  `jumlah_gaji` int(100) NOT NULL,
  `jam_lembur` int(11) NOT NULL,
  `uang_lembur` int(100) NOT NULL,
  `bulan` varchar(25) NOT NULL,
  `status_pembayaran` varchar(100) NOT NULL,
  `waktu_pembayaran` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_gaji`
--

INSERT INTO `data_gaji` (`id_gaji`, `id_admin`, `no_rekening`, `jumlah_gaji`, `jam_lembur`, `uang_lembur`, `bulan`, `status_pembayaran`, `waktu_pembayaran`) VALUES
(1, 13, 123456789, 7500000, 2, 50000, 'Mei', 'Sudah Dibayarkan', '2021-05-17 11:58:44'),
(2, 34, 6666666, 30000000, 5, 50000, 'Mei', 'Sudah Dibayarkan', '2021-05-18 03:17:56');

-- --------------------------------------------------------

--
-- Table structure for table `detail_bpjs`
--

CREATE TABLE `detail_bpjs` (
  `id_detail_bpjs` int(11) NOT NULL,
  `no_peserta_bpjs` bigint(20) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `kelas_bpjs` int(11) NOT NULL,
  `biaya` int(11) NOT NULL,
  `status_pembayaran` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_bpjs`
--

INSERT INTO `detail_bpjs` (`id_detail_bpjs`, `no_peserta_bpjs`, `id_admin`, `kelas_bpjs`, `biaya`, `status_pembayaran`) VALUES
(1, 2344676557, 35, 1, 100000, 'Sudah Dibayarkan'),
(2, 126542, 34, 1, 100000, 'Sudah Dibayarkan');

-- --------------------------------------------------------

--
-- Table structure for table `detail_karyawan`
--

CREATE TABLE `detail_karyawan` (
  `id_detail_karyawan` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `id_divisi_karyawan` int(11) NOT NULL,
  `id_detail_bpjs` int(11) NOT NULL,
  `id_gaji` int(11) NOT NULL,
  `gaji_utama` int(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_karyawan`
--

INSERT INTO `detail_karyawan` (`id_detail_karyawan`, `id_admin`, `id_divisi_karyawan`, `id_detail_bpjs`, `id_gaji`, `gaji_utama`) VALUES
(1, 35, 1, 1, 1, 6500000),
(2, 34, 3, 2, 2, 25000000);

-- --------------------------------------------------------

--
-- Table structure for table `detail_penyelesaian_tk`
--

CREATE TABLE `detail_penyelesaian_tk` (
  `id_woc_detail` int(11) NOT NULL,
  `id_woc` int(11) NOT NULL,
  `nama` text NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_penyelesaian_tk`
--

INSERT INTO `detail_penyelesaian_tk` (`id_woc_detail`, `id_woc`, `nama`, `qty`, `harga`, `total`) VALUES
(2, 2, 'Buku Yasin 2', 9, 2, 18),
(3, 3, 'Jus Coklat', 2, 50000, 100000),
(4, 4, 'Jus Coklat', 3, 50000, 150000);

-- --------------------------------------------------------

--
-- Table structure for table `divisi_karyawan`
--

CREATE TABLE `divisi_karyawan` (
  `id_divisi_karyawan` int(11) NOT NULL,
  `divisi` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `divisi_karyawan`
--

INSERT INTO `divisi_karyawan` (`id_divisi_karyawan`, `divisi`) VALUES
(1, 'Produksi(Pembuatan Produk)'),
(2, 'Pemasaran(Promosi & Penjualan)'),
(3, 'Personalia(Ketenagakerjaan)'),
(4, 'Pembelanjaan'),
(5, 'Divisi Umum');

-- --------------------------------------------------------

--
-- Table structure for table `history_backup`
--

CREATE TABLE `history_backup` (
  `id_backup` int(15) NOT NULL,
  `nama_file` varchar(50) NOT NULL,
  `tanggal_backup` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `history_produk`
--

CREATE TABLE `history_produk` (
  `id_stok` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `masuk` int(11) NOT NULL,
  `keluar` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_produk`
--

INSERT INTO `history_produk` (`id_stok`, `id_produk`, `masuk`, `keluar`, `date`) VALUES
(20, 11, 0, 20000, '2021-05-19 04:06:33'),
(19, 15, 100000, 0, '2021-05-19 00:26:51'),
(18, 15, 3000, 0, '2021-05-19 00:26:31'),
(17, 15, 7000, 0, '2021-05-19 00:26:22'),
(16, 15, 5000, 0, '2021-05-19 00:26:14'),
(15, 15, 15000, 0, '2021-05-19 00:26:05'),
(14, 15, 19950, 0, '2021-05-19 00:25:54'),
(13, 15, 100000, 0, '2021-05-19 00:25:45'),
(12, 15, 50, 0, '2021-05-18 10:10:14');

-- --------------------------------------------------------

--
-- Table structure for table `history_spp_detail`
--

CREATE TABLE `history_spp_detail` (
  `id_spp_detail` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_spp` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_spp_detail`
--

INSERT INTO `history_spp_detail` (`id_spp_detail`, `id_produk`, `id_spp`, `harga`, `qty`, `total`) VALUES
(1, 15, 1, 100, 100000, 10000000),
(2, 15, 2, 100, 20000, 2000000),
(3, 15, 3, 100, 5000, 500000),
(4, 15, 4, 100, 15000, 1500000),
(5, 15, 5, 100, 7000, 700000),
(6, 15, 6, 100, 3000, 300000),
(7, 15, 7, 100, 100000, 10000000),
(8, 15, 8, 100, 1000, 100000),
(9, 15, 9, 100, 1000, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `history_sp_detail`
--

CREATE TABLE `history_sp_detail` (
  `id_sp_detail` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_sp` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_sp_detail`
--

INSERT INTO `history_sp_detail` (`id_sp_detail`, `id_produk`, `id_sp`, `harga`, `qty`, `total`) VALUES
(1, 11, 1, 200, 20000, 4000000);

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_keluar`
--

CREATE TABLE `jurnal_keluar` (
  `nomor_jurnal` int(15) NOT NULL,
  `kode_transaksi` varchar(15) NOT NULL,
  `tanggal_selesai` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_umum`
--

CREATE TABLE `jurnal_umum` (
  `nomor_jurnal` int(15) NOT NULL,
  `kode_transaksi` varchar(15) NOT NULL,
  `tanggal_selesai` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id_kendaraan` int(11) NOT NULL,
  `kode_kendaraan` varchar(255) NOT NULL,
  `indeks` int(11) NOT NULL,
  `nama_kendaraan` varchar(255) NOT NULL,
  `plat_nomor` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`id_kendaraan`, `kode_kendaraan`, `indeks`, `nama_kendaraan`, `plat_nomor`) VALUES
(8, 'KDR0004', 4, 'DC 10 TON', 'L 1234 HH'),
(9, 'KDR0005', 5, 'DT 30 TON', 'W 1223 KH'),
(11, 'KDR0006', 6, 'DUMP TRONTON', 'W 9389 UM'),
(12, 'KDR0007', 7, 'DUMP TRONTON ', 'W 9390 UM'),
(13, 'KDR0008', 8, 'DUMP TRONTON', 'W 9391 UM'),
(14, 'KDR0009', 9, 'DUMP COLD DIESEL ', 'W 9203 UG'),
(15, 'KDR0010', 10, 'DUMP COLD DIESEL ', 'W 9204 UG'),
(16, 'KDR0011', 11, 'BOX TRONTON', 'W 6761 UA'),
(17, 'KDR0012', 12, 'DUTRO', 'W 9354 UM');

-- --------------------------------------------------------

--
-- Table structure for table `manual_book`
--

CREATE TABLE `manual_book` (
  `id_manual` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manual_book`
--

INSERT INTO `manual_book` (`id_manual`, `keterangan`) VALUES
(1, '<p style=\"text-align: justify;\">selamat datang di MNJ</p><p style=\"text-align: justify; \"></p>');

-- --------------------------------------------------------

--
-- Table structure for table `order_android`
--

CREATE TABLE `order_android` (
  `id_order` int(11) NOT NULL,
  `kode_orderpo` varchar(50) NOT NULL,
  `kodesup` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `kodepl` varchar(50) NOT NULL,
  `id_user_an` int(11) NOT NULL,
  `manifest_pengumpulan` varchar(255) NOT NULL,
  `manifest_pemanfaat` varchar(255) NOT NULL,
  `ket_order` text NOT NULL,
  `status` int(11) NOT NULL,
  `tanggal_order` date NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_android`
--

INSERT INTO `order_android` (`id_order`, `kode_orderpo`, `kodesup`, `ongkir`, `kodepl`, `id_user_an`, `manifest_pengumpulan`, `manifest_pemanfaat`, `ket_order`, `status`, `tanggal_order`) VALUES
(1, '001/MNJ-PH/V/2021', 'SUP0002', 1000000, 'CST0002', 7, 'KLHK0001234', 'KLHK0012346', 'Po revisi 1 kali', 2, '2021-05-18'),
(2, '002/MNJ-PH/V/2021', 'SUP0004', 2000000, 'CST0003', 9, 'KLHK0001234', 'KLHK0012347', '', 2, '2021-05-18'),
(3, '003/MNJ-PH/V/2021', 'SUP0002', 1000000, 'CST0003', 7, 'KLHK0001234', 'KLHK0012347', '', 2, '2021-05-18'),
(4, '004/MNJ-PH/V/2021', 'SUP0004', 0, '', 10, '', '', '', 0, '2021-05-18'),
(5, '005/MNJ-PH/V/2021', 'SUP0004', 500000, '', 9, 'KLHK0001234', 'KLHK0012346', '', 2, '2021-05-18'),
(6, '006/MNJ-PH/V/2021', 'SUP0004', 300000, '', 9, 'KLHK0001234', 'KLHK0012347', '', 2, '2021-05-18'),
(7, '007/MNJ-PH/V/2021', 'SUP0004', 700000, '', 9, 'KLHK0001234', 'KLHK0012347', '', 2, '2021-05-18'),
(8, '008/MNJ-PH/V/2021', 'SUP0001', 1500000, '', 6, 'KLHK0001234', 'KLHK0012347', '', 2, '2021-05-19'),
(9, '009/MNJ-PH/V/2021', 'SUP0002', 0, '', 7, '', '', '', 1, '2021-05-19'),
(10, '010/MNJ-PH/V/2021', 'SUP0003', 0, '', 8, '', '', '', 1, '2021-05-19'),
(11, '011/MNJ-PH/V/2021', 'SUP0003', 0, '', 8, '', '', '', 3, '2021-05-19'),
(12, '012/MNJ-PH/V/2021', 'SUP0001', 1100000, 'CST0002', 6, '', 'KLHK 0000002', 'po fly ash ', 2, '2021-05-19'),
(13, '013/MNJ-PH/V/2021', 'SUP0001', 0, '', 6, '', '', '', 3, '2021-05-19'),
(14, '014/MNJ-PH/V/2021', 'SUP0001', 0, '', 6, '', '', '', 3, '2021-05-19'),
(15, '015/MNJ-PH/V/2021', 'SUP0001', 0, '', 6, '', '', '', 1, '2021-05-22'),
(16, '016/MNJ-PH/V/2021', 'SUP0001', 0, '', 6, '', '', '', 2, '2021-05-23');

-- --------------------------------------------------------

--
-- Table structure for table `order_android_acccount`
--

CREATE TABLE `order_android_acccount` (
  `id_order_android_account` int(11) NOT NULL,
  `kode_rekening` varchar(100) NOT NULL,
  `id_order` int(11) NOT NULL,
  `nominal` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_android_detail`
--

CREATE TABLE `order_android_detail` (
  `id_order_detail` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `quantity_order` int(11) NOT NULL,
  `quantity_penghasil` int(11) NOT NULL,
  `quantity_tujuan` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_android_detail`
--

INSERT INTO `order_android_detail` (`id_order_detail`, `id_order`, `produk_id`, `quantity_order`, `quantity_penghasil`, `quantity_tujuan`, `id_satuan`) VALUES
(1, 1, 11, 90, 89, 88, 10),
(2, 2, 9, 120, 118, 119, 11),
(3, 3, 11, 30000, 29000, 28000, 8),
(4, 4, 11, 120, 0, 0, 5),
(5, 5, 11, 30, 29, 28, 10),
(6, 6, 11, 90, 88, 87, 10),
(7, 7, 11, 70, 69, 68, 10),
(8, 8, 11, 60, 59, 58, 10),
(9, 9, 11, 30000, 0, 0, 8),
(10, 10, 13, 90000, 0, 0, 10),
(11, 11, 11, 30, 0, 0, 10),
(12, 12, 11, 60000, 32000, 31950, 8),
(13, 13, 11, 120, 0, 0, 10),
(14, 14, 11, 90, 0, 0, 10),
(15, 15, 11, 30, 0, 0, 10),
(16, 16, 8, 20, 0, 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `order_android_kendaraan`
--

CREATE TABLE `order_android_kendaraan` (
  `id_order_android_kendaraan` int(11) NOT NULL,
  `id_kendaraan` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `driver` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_android_kendaraan`
--

INSERT INTO `order_android_kendaraan` (`id_order_android_kendaraan`, `id_kendaraan`, `id_order`, `driver`) VALUES
(1, 8, 1, 'Joko'),
(2, 8, 2, 'Imam'),
(3, 8, 3, 'Jumadi'),
(4, 9, 5, 'JOKO'),
(5, 9, 6, 'Imam'),
(6, 9, 7, 'Jumadi'),
(7, 9, 8, 'hari'),
(8, 13, 12, 'Joko'),
(9, 12, 12, 'Agus'),
(10, 16, 16, 'joko');

-- --------------------------------------------------------

--
-- Table structure for table `order_po`
--

CREATE TABLE `order_po` (
  `id_order_po` int(11) NOT NULL,
  `kode_orderpo` varchar(255) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `alamat_koresponden` varchar(50) NOT NULL,
  `no_telp` varchar(50) NOT NULL,
  `nama_staff` varchar(50) NOT NULL,
  `jenis_limbah` varchar(50) NOT NULL,
  `jumlah_limbah` int(11) NOT NULL,
  `kemasan_limbah` varchar(50) NOT NULL,
  `kapasitas_limbah` int(11) NOT NULL,
  `kode_festronik` varchar(50) NOT NULL,
  `id_user_an` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_so`
--

CREATE TABLE `order_so` (
  `id_order_so` int(11) NOT NULL,
  `kode_orderso` varchar(255) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `alamat_koresponden` varchar(50) NOT NULL,
  `no_telp` varchar(50) NOT NULL,
  `nama_staff` varchar(50) NOT NULL,
  `jenis_limbah` varchar(50) NOT NULL,
  `jumlah_limbah` int(11) NOT NULL,
  `kemasan_limbah` varchar(50) NOT NULL,
  `kapasitas_limbah` int(11) NOT NULL,
  `kode_festronik` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_so_android`
--

CREATE TABLE `order_so_android` (
  `id_order_so_an` int(11) NOT NULL,
  `kode_orderso` varchar(50) NOT NULL,
  `kodesup` varchar(255) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `qty_awal` int(11) NOT NULL,
  `qty_penghasil` int(11) NOT NULL,
  `qty_pemanfaat` int(11) NOT NULL,
  `nokode_dok_penghasil` varchar(255) NOT NULL,
  `nokode_dok_pemanfaat` varchar(255) NOT NULL,
  `id_kendaraan` int(11) NOT NULL,
  `kodepl` varchar(50) NOT NULL,
  `id_user_an` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `kodepl` varchar(50) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `Kota` varchar(50) NOT NULL,
  `Telepon` varchar(50) NOT NULL,
  `KTP` varchar(50) NOT NULL,
  `saldo` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`kodepl`, `Nama`, `Alamat`, `Kota`, `Telepon`, `KTP`, `saldo`) VALUES
('CST0006', 'PT. PRIMERGY SOLUSION', 'GRESIK', 'GRESIK', '0841345545', '123', 0),
('CST0007', 'PT. PENGOLAHAN LIMBAH INDUSTRI BEKASI', 'BEKASI', 'BEKASI', '0841345545', '123', 0),
('CST0005', 'PT. SOLUSI BANGUN INDONESIA', 'TUBAN', 'TUBAN', '0841345545', '123', 0),
('CST0004', 'PT. LANCAR ABADI INDONESIA', 'SIDOARJO', 'SIDOARJO', '0841345545', '123', 0),
('CST0003', 'PT. ECCOOILS JAYA INDONESIA', 'GRESIK', 'GRESIK', '0841345545', '123', 0),
('CST0002', 'PT. SEMEN INDONESIA PABRIK REMBANG', 'REMBANG', 'REMBANG', '0841345545', '123', 0),
('CST0001', 'PT. SEMEN INDONESIA PABRIK TUBAN', 'tes', 'TUBAN', '123', '123', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `kode_pem` varchar(255) NOT NULL,
  `kodepl` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_inv` varchar(255) NOT NULL,
  `jenis_transaksi` varchar(255) NOT NULL,
  `total_pem` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`kode_pem`, `kodepl`, `tanggal`, `kode_inv`, `jenis_transaksi`, `total_pem`, `keterangan`, `status`) VALUES
('001/PAY-PPP/02/2020', 'CST0001', '2020-02-04', '001/INV-PPP/02/2020', '', 100, 'Pembayaran 001/INV-PPP/02/2020', 1),
('002/PAY-PPP/02/2020', 'CST0005', '2020-01-07', '022/INV-PPP/02/2020', '020/BBM-PPP/1/2020', 1005144, 'Pembayaran 022/INV-PPP/02/2020', 1),
('003/PAY-PPP/02/2020', 'CST0005', '2002-01-07', '005/INV-PPP/02/2020', '020/BBM-PPP/1/2020', 26547656, 'Pembayaran 005/INV-PPP/02/2020', 1),
('004/PAY-PPP/02/2020', 'CST0005', '2020-01-09', '023/INV-PPP/02/2020', '028/BBM-PPP/1/2020', 24047568, 'Pembayaran 023/INV-PPP/02/2020', 1),
('005/PAY-PPP/03/2020', 'CST0001', '2020-03-15', '002/INV-PPP/02/2020', '013/BBM-PPP/1/2020', 1000, 'Pembayaran 002/INV-PPP/02/2020', 1),
('006/PAY-PPP/06/2020', 'CST0018', '2020-06-16', '084/INV-PPP/6/2020', '013/BBM-PPP/1/2020', 50000, 'Pembayaran 084/INV-PPP/6/2020', 0),
('007/PAY-PPP/07/2020', 'CST0003', '2020-07-23', '016/INV-PPP/02/2020', '013/BBM-PPP/1/2020', 20000000, 'Pembayaran 016/INV-PPP/02/2020', 0);

-- --------------------------------------------------------

--
-- Table structure for table `penyelesaian_tk`
--

CREATE TABLE `penyelesaian_tk` (
  `id_woc` int(11) NOT NULL,
  `id_tk` int(11) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `sales` varchar(50) NOT NULL,
  `kodepl` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penyelesaian_tk`
--

INSERT INTO `penyelesaian_tk` (`id_woc`, `id_tk`, `kode`, `sales`, `kodepl`, `tanggal`, `status`) VALUES
(2, 2, '001/WOC-PPP/2/2020', 'Rofiq', 'CST0001', '2020-02-02', 1),
(3, 3, '002/WOC-PPP/3/2020', 'Arif', 'CST0006', '2020-03-09', 0),
(4, 3, '003/WOC-PPP/3/2020', 'Arif', 'CST0006', '2020-03-09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `persediaan`
--

CREATE TABLE `persediaan` (
  `id_persediaan` int(11) NOT NULL,
  `no_pol` varchar(50) NOT NULL,
  `tgl_berangkat` date NOT NULL,
  `tgl_pulang` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `persediaan`
--

INSERT INTO `persediaan` (`id_persediaan`, `no_pol`, `tgl_berangkat`, `tgl_pulang`) VALUES
(1, 'snck', '2021-05-05', '2021-05-05'),
(2, 'nopol1', '2021-05-09', '2021-05-10');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL,
  `kode_produk` varchar(255) NOT NULL,
  `indeks` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_satuan`, `kode_produk`, `indeks`, `nama_produk`, `harga_produk`, `harga_beli`, `status`) VALUES
(11, 8, 'PRO0007', 7, 'B410 Bottom Ash', 200, 300, 1),
(10, 8, 'PRO0006', 6, 'B105d  Minyak Pelumas Bekas', 250, 350, 1),
(8, 8, 'PRO0004', 4, 'A102d Aki/baterai bekas', 150, 250, 1),
(9, 8, 'PRO0005', 5, 'A108d Limbah Terkontaminasi B3', 0, 0, 1),
(12, 8, 'PRO0008', 8, 'B409  Fly Ash', 0, 0, 1),
(13, 8, 'PRO0009', 9, 'B413 Spent Bleaching Earth', 0, 0, 1),
(14, 8, 'PRO0010', 10, 'B413 Spent Bleaching Earth Process', 0, 0, 1),
(15, 14, 'PRO0011', 11, 'Jasa Transporter Limbah', 100, 50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `retur`
--

CREATE TABLE `retur` (
  `id_rt` int(11) NOT NULL,
  `kode_rt` varchar(255) NOT NULL,
  `kode_sp` varchar(255) NOT NULL,
  `kode_sj` varchar(255) NOT NULL,
  `kode_inv` varchar(255) NOT NULL,
  `kodepl` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `retur_detail`
--

CREATE TABLE `retur_detail` (
  `id_retur_detail` int(11) NOT NULL,
  `id_retur` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id_satuan` int(11) NOT NULL,
  `nama_satuan` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id_satuan`, `nama_satuan`) VALUES
(5, 'Batang'),
(6, 'PCS'),
(7, 'PACK'),
(8, 'Kg'),
(9, 'Drum'),
(10, 'Ton'),
(11, 'Curah'),
(12, 'Liter'),
(13, 'ibc'),
(14, 'Rp');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `kodesup` varchar(50) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `Kota` varchar(50) NOT NULL,
  `Telepon` varchar(50) NOT NULL,
  `NPWP` varchar(50) NOT NULL,
  `saldo` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`kodesup`, `Nama`, `Alamat`, `Kota`, `Telepon`, `NPWP`, `saldo`) VALUES
('SUP0001', 'PT KARUNIA ALAM SEGAR', 'GRESIK', 'GRESIK', '0811231236', '786866666768', 0),
('SUP0002', 'PT BATARA ELOK SEMESTA TERPADU', 'GRESIK', 'GRESIK', '0841345545', '657577565', 0),
('SUP0003', 'PT. KARYA INDAH ALAM SEJAHTERA', 'GRESIK', 'GRESIK', '0841345545', '75756755852', 0),
('SUP0004', 'PT. ECOOILS JAYA INDONESIA', 'GRESIK', 'GRESIK', '0841345545', '75756755852', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_admin`
--

CREATE TABLE `tabel_admin` (
  `id_admin` int(4) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_admin`
--

INSERT INTO `tabel_admin` (`id_admin`, `nama`, `username`, `password`, `tanggal`, `status`) VALUES
(1, 'Super admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2021-05-24 19:12:48', 1),
(36, 'caca', 'caca', '827ccb0eea8a706c4c34a16891f84e7b', '2021-05-19 12:08:30', 3),
(35, 'Anto', 'antodmi', '827ccb0eea8a706c4c34a16891f84e7b', '', 1),
(34, 'Hari Budi', 'hari budi', '827ccb0eea8a706c4c34a16891f84e7b', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_master`
--

CREATE TABLE `tabel_master` (
  `kode_rekening` varchar(10) NOT NULL DEFAULT '',
  `nama_rekening` varchar(100) NOT NULL,
  `tanggal_awal` date NOT NULL,
  `awal_debet` bigint(20) NOT NULL,
  `awal_kredit` bigint(20) NOT NULL,
  `mut_debet` bigint(20) NOT NULL,
  `mut_kredit` bigint(20) NOT NULL,
  `sisa_debet` bigint(20) NOT NULL,
  `sisa_kredit` bigint(20) NOT NULL,
  `rl_debet` bigint(20) NOT NULL,
  `rl_kredit` bigint(20) NOT NULL,
  `nrc_debet` bigint(20) NOT NULL,
  `nrc_kredit` bigint(20) NOT NULL,
  `posisi` varchar(15) NOT NULL,
  `normal` varchar(10) NOT NULL,
  `subacct` varchar(12) NOT NULL,
  `option` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_master`
--

INSERT INTO `tabel_master` (`kode_rekening`, `nama_rekening`, `tanggal_awal`, `awal_debet`, `awal_kredit`, `mut_debet`, `mut_kredit`, `sisa_debet`, `sisa_kredit`, `rl_debet`, `rl_kredit`, `nrc_debet`, `nrc_kredit`, `posisi`, `normal`, `subacct`, `option`) VALUES
('1101.00', 'K A S', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 1),
('1101.01', 'Kas Besar', '0000-00-00', 0, 0, 66000, 0, 66000, 0, 0, 0, 66000, 0, 'Neraca', 'Debit', 'Kas dan Seta', 1),
('1101.02', 'Kas Kecil', '0000-00-00', 0, 0, 10500, 0, 10500, 0, 0, 0, 10500, 0, 'Neraca', 'Debit', 'Kas dan Seta', 1),
('1102.00', 'BANK ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1102.01', 'Bank BCA', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1102.02', 'Bank Mandiri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1102.03', 'Bank Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1102.04', 'Bank BNI', '0000-00-00', 0, 0, 15000000, 0, 15000000, 0, 0, 0, 15000000, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1102.05', 'Bank BRI', '0000-00-00', 0, 0, 172500, 0, 172500, 0, 0, 0, 172500, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1102.06', 'Bank Harda', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1102.07', 'Bank Danamon', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1102.08', 'Bank Saudara', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1102.09', 'Bank CIMB Niaga', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1103.00', 'BANK VALUTA ASING', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1103.01', 'Bank BCA', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1103.02', 'Bank Mandiri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1103.03', 'Bank Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1103.04', 'Bank BNI', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1103.05', 'Bank BRI', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1104.00', 'DEPOSITO', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 0),
('1104.01', 'Bank BCA', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1104.02', 'Bank Mandiri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1104.03', 'Bank Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1104.04', 'Bank BNI', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1104.05', 'Bank BRI', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1104.06', 'Bank Harda', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1104.07', 'Bank Danamon', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1104.08', 'Bank Saudara', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1104.09', 'Bank CIMB Niaga', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Kas dan Seta', 2),
('1105.00', 'PIUTANG USAHA ', '0000-00-00', 0, 0, 17500000, 0, 17500000, 0, 0, 0, 17500000, 0, 'Neraca', 'Debit', 'Piutang Usah', 0),
('1106.00', 'Penyisihan Piutang usaha tak tertagih', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Piutang Usah', 0),
('1107.01', 'Piutang karyawan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Piutang Usah', 0),
('1107.02', 'Piutang pihak ke III', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Piutang Usah', 0),
('1107.03', 'Uang Jaminan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Piutang Usah', 0),
('1107.04', 'Piutang Bon Sementara', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Piutang Usah', 0),
('1107.05', 'Pendapatan Yang masih akan diterima', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Piutang Usah', 0),
('1107.50', 'Piutang lain-lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Piutang Lain', 0),
('1107.99', 'Penyisihan piutang lain-lain tak tertagih', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Piutang Lain', 0),
('1108.00', 'PERSEDIAAN', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Persediaan', 0),
('1108.01', 'Persediaan barang dagangan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Persediaan', 0),
('1108.02', 'Persediaan barang jadi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Persediaan', 0),
('1108.03', 'Persediaan barang dalam proses', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Persediaan', 0),
('1108.04', 'Persediaan bahan baku siap pakai', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Persediaan', 0),
('1108.05', 'Persediaan bahan baku          ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Persediaan', 0),
('1108.06', 'Persediaan bahan pembantu', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Persediaan', 0),
('1108.07', 'Persediaan alat-alat', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Persediaan', 0),
('1108.08', 'Persediaan spare part', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Persediaan', 0),
('1108.09', 'Persediaan Tanah', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Persediaan', 0),
('1108.10', 'Persediaan Makanan Hotel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Persediaan', 0),
('1108.11', 'Persediaan Minuman Hotel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Persediaan', 0),
('1108.99', 'Persediaan lain-lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Persediaan', 0),
('1112.00', 'Uang muka pembelian', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka Pe', 0),
('1113.00', 'UANG MUKA PAJAK', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka Pa', 0),
('1113.01', 'Uang muka PPN Masukan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka Pa', 0),
('1113.02', 'Uang muka PPH ps. 21', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka Pa', 0),
('1113.03', 'Uang muka PPH ps. 22', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka Pa', 0),
('1113.04', 'Uang muka PPH ps. 23', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka Pa', 0),
('1113.05', 'Uang muka PPH ps. 25', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka Pa', 0),
('1114.00', 'UANG MUKA BIAYA', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka Bi', 0),
('1114.01', 'Asuransi dibayar dimuka', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka Bi', 0),
('1114.02', 'Sewa dibayar dimuka', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka Bi', 0),
('1114.03', 'Uang muka pengobatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka Bi', 0),
('1114.04', 'Uang muka pesanan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka Bi', 0),
('1114.05', 'Uang muka proyek', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka Bi', 0),
('1114.06', 'Uang muka pelaksanaan order', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka Bi', 0),
('1114.07', 'Uang muka Deviden (PAD)', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka Bi', 0),
('1114.08', 'Uang muka biaya audit / konsultan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka Bi', 0),
('1114.99', 'Uang muka lain-lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka Bi', 0),
('1199.01', 'Bank garansi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Bank Garansi', 2),
('1199.02', 'Titipan hipotik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Titipan hipo', 0),
('1201.01', 'Piutang kerjasama operasional jangka panjang', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Piutang Lain', 0),
('1202.01', 'Piutang leasing jangka panjang', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Piutang Leas', 0),
('1301.01', 'Investasi jangka panjang - Saham', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Surat-surat ', 0),
('1301.02', 'Investasi jangka panjang - Obligasi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Surat-surat ', 0),
('1301.03', 'Investasi jangka panjang - Surat berharga lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Surat-surat ', 0),
('1301.04', 'Investasi jangka panjang - Modal penyertaan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Surat-surat ', 0),
('1302.00', 'Aktiva Pajak Tangguhan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Aktiva Pajak', 0),
('1303.00', 'R/K PENYERTAAN - ANAK PERUSAHAAN', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Penyertaan', 0),
('1303.01', 'PT. Kasa Husada Wira Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Penyertaan', 0),
('1303.02', 'PT. Karet Ngagel Wira Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Penyertaan', 0),
('1303.03', 'PT. Loka Refractories Wira Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Penyertaan', 0),
('1303.04', 'PT. Moya Kasri Wira Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Penyertaan', 0),
('1303.05', 'PT. Carma Wira Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Penyertaan', 0),
('1303.06', 'PT. Pabrik Es Wira Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Penyertaan', 0),
('1303.07', 'PT. Puri Panca Pujibangun', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Penyertaan', 0),
('1303.08', 'PT. Industrial Estate Wira Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Penyertaan', 0),
('1303.09', 'PT. Gedung Expo Wira Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Penyertaan', 0),
('1303.10', 'PT. Jatim Husada Farma', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Penyertaan', 0),
('1401.00', 'AKTIVA TETAP', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Aktiva Tetap', 0),
('1401.01', 'Harga perolehan Tanah', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1402.01', 'Harga perolehan Bangunan Pabrik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1402.02', 'Harga perolehan Bangunan Rumah Dinas', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1402.03', 'Harga perolehan Bangunan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1402.04', 'Harga perolehan Emplasemen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1402.51', 'Akumulasi penyusutan Bangunan Pabrik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1402.52', 'Akumulasi penyusutan Bangunan Rumah Dinas', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1402.53', 'Akumulasi penyusutan Bangunan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1402.54', 'Akumulasi penyusutan Emplasemen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1403.01', 'Harga perolehan Mesin produksi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1403.02', 'Harga perolehan Mesin Pembangkit', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1403.03', 'Harga perolehan Mesin produksi pembakaran/tungku', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1403.51', 'Akum. Peny. Mesin produksi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1403.52', 'Akum. Peny. Mesin pembangkit', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1403.53', 'Akum. Peny. Mesin produksi pembakaran/tungku', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1404.01', 'Harga Perolehan Kendaraan Pabrik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1404.02', 'Harga Perolehan Kendaraan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1404.51', 'Akm. Peny. Kendaraan Pabrik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1404.52', 'Akm. Peny. Kendaraan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1405.01', 'Harga Perolehan Peralatan/Inventaris Pabrik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1405.02', 'Harga Perolehan/Inventaris Peralatan Kantor', '0000-00-00', 0, 0, 0, 10000000, 0, 10000000, 0, 0, 0, 10000000, 'Neraca', 'Debit', 'Harga Perole', 0),
('1405.51', 'Akm. Peny. Peralatan/Inventaris Pabrik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1405.52', 'Akm. Peny. Peralatan/Inventaris Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1500.00', 'AKTIVA TETAP - PROPERTY INVESTASI', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Aktiva Tetap', 0),
('1501.01', 'Harga Perolehan Tanah', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1502.01', 'Harga Perolehan Bangunan Exhibition', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1502.02', 'Harga Perolehan Bangunan Kantor/Gudang', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1502.03', 'Harga Perolehan Bangunan Hotel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1502.51', 'Akm. Peny. Bangunan Exhibition', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1502.52', 'Akm. Peny. Bangunan Kantor/Gudang', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1502.53', 'Akm. Peny. Bangunan Hotel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1503.01', 'Harga Perolehan Mesin Produksi ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1503.02', 'Harga Perolehan Mesin Pembangkit ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1503.03', 'Harga Perolehan Mesin Produksi Pembakaran/tungku', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1503.51', 'Akm. Peny. Mesin Produksi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1503.52', 'Akm. Peny. Mesin Pembangkit', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1503.53', 'Akm. Peny. Mesin Produksi Pembakaran/tungku', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1504.01', 'Harga Perolehan Kendaraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1504.51', 'Akm. Peny. Kendaraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1505.01', 'Harga Perolehan Peralatan Hotel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1505.02', 'Harga Perolehan Inventaris Hotel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1505.51', 'Akm. Peny. Peralatan Hotel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1506.01', 'Harga Perolehan Interior Hotel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1506.51', 'Akm. Peny. Interior Hotel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1601.01', 'Harga Perolehan Goodwill', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1601.51', 'Akm. Peny. Goodwill', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1602.01', 'Harga Perolehan Hak Patent', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1602.51', 'Akm. Peny. Hak Patent', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1603.01', 'Harga Perolehan Merk Dagang', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Harga Perole', 0),
('1603.51', 'Akm. Peny. Merk Dagang', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'akumulasi Pe', 0),
('1604.01', 'Hak Sewa Guna Usaha', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Sewa Guna Us', 0),
('1604.02', 'Hak Sewa Guna Bangunan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Sewa Guna Us', 0),
('1604.51', 'Akumulasi Amortisasi Hak Sewa Guna', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Akumulasi Am', 0),
('1701.00', 'AKTIVA DALAM PELAKSANAAN', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Aktiva Dalam', 0),
('1701.01', 'Tanah', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Aktiva dalam', 0),
('1701.02', 'Bangunan Pabrik dalam pelaksanaan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Aktiva dalam', 0),
('1701.03', 'Bangunan Kantor dalam pelaksanaan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Aktiva dalam', 0),
('1701.04', 'Bangunan Perumahan dalam pelaksanaan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Aktiva dalam', 0),
('1701.05', 'Pemasangan Mesin dalam pelaksanaan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Aktiva dalam', 0),
('1701.06', 'Pemasangan Pembangkit Tenaga dalam pelaksanaan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Aktiva dalam', 0),
('1702.00', 'AKTIVA TETAP NON PRODUKTIF', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Aktiva Lain-', 0),
('1702.01', 'Tanah ( Non Produktif )', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Aktiva Lain-', 0),
('1702.02', 'Bangunan ( Non Produktif )', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Aktiva Lain-', 0),
('1702.03', 'Mesin ( Non Produktif )', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Aktiva Lain-', 0),
('1702.04', 'Perabot Kantor ( Non Produktif )', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Aktiva Lain-', 0),
('1702.99', 'Cadangan Penurunan Nilai Aktiva Tetap Non Produktif', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Aktiva Lain-', 0),
('1703.00', 'UANG MUKA LAIN-LAIN', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka La', 0),
('1703.01', 'Jaminan PLN', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka La', 0),
('1703.02', 'Jaminan Telepon', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka La', 0),
('1703.03', 'Jaminan PDAM', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka La', 0),
('1703.04', 'Jaminan Bank', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka La', 0),
('1703.05', 'Jaminan Askes', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka La', 0),
('1703.99', 'Jaminan Biaya Lain-lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Uang Muka La', 0),
('1704.01', 'Biaya Pendirian yang ditangguhkan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Biaya di tan', 0),
('1704.99', 'Beban Lain-lain yang ditangguhkan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Biaya di tan', 0),
('1705.01', 'Persediaan lain-lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Persediaan L', 0),
('1705.99', 'Cadangan penurunan Persediaan lain-lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Persediaan L', 0),
('1706.01', 'Piutang Usaha Macet ( Ragu-ragu )', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Piutang Ragu', 0),
('1706.02', 'Piutang lain-lain macet', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit', 'Piutang Ragu', 0),
('1706.51', 'Cad. Penurunan Piutang Usaha Macet ( Ragu-ragu )', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Cadangan Pen', 0),
('1706.52', 'Cad. Penurunan Piutang lain-lain macet', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Cadangan Pen', 0),
('2100.00', 'KEWAJIBAN LANCAR', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'KEWAJIBAN LA', 0),
('2101.00', 'HUTANG KREDIT MODAL KERJA BANK', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang KMK', 0),
('2101.01', 'Hutang Kredit Modal Kerja Bank - Bank Central Asia', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang KMK', 0),
('2101.02', 'Hutang Kredit Modal Kerja Bank - Bank Mandiri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang KMK', 0),
('2101.03', 'Hutang Kredit Modal Kerja Bank - Bank Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang KMK', 0),
('2101.04', 'Hutang Kredit Modal Kerja Bank - Bank Negara Indosnesia', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang KMK', 0),
('2101.05', 'Hutang Kredit Modal Kerja Bank - Bank Rakyat Indonesia', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang KMK', 0),
('2101.06', 'Hutang Kredit Modal Kerja Bank - Bank Harda', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang KMK', 0),
('2101.07', 'Hutang Kredit Modal Kerja Bank - Bank Danamon', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang KMK', 0),
('2101.08', 'Hutang Kredit Modal Kerja Bank - Bank Saudara', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang KMK', 0),
('2101.09', 'Hutang Kredit Modal Kerja Bank - Bank CIMB Niaga', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang KMK', 0),
('2103.00', 'Hutang Usaha ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutanhg Usah', 0),
('2104.00', 'BEBAN BIAYA YMH DIBAYAR', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Beban YMH di', 0),
('2104.01', 'Beban biaya ymh dibayar - Gaji', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Biaya YMH di', 0),
('2104.02', 'Beban biaya ymh dibayar - Pesangon', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Biaya YMH di', 0),
('2104.03', 'Beban biaya ymh dibayar - Akuntan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Biaya YMH di', 0),
('2104.04', 'Beban biaya ymh dibayar - Utility (Listrik/Telpon/PDAM dll)', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Biaya YMH di', 0),
('2104.05', 'Beban biaya ymh dibayar - Aktiva tetap', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Biaya YMH di', 0),
('2104.06', 'Beban biaya ymh dibayar - Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Biaya YMH di', 0),
('2104.07', 'Beban biaya ymh dibayar - Perjalanan Dinas', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Biaya YMH di', 0),
('2104.08', 'Beban biaya ymh dibayar - Handling', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Biaya YMH di', 0),
('2104.09', 'Beban biaya ymh dibayar - Iklan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Biaya YMH di', 0),
('2104.10', 'Beban biaya ymh dibayar - Order/pesanan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Biaya YMH di', 0),
('2104.11', 'Beban biaya ymh dibayar - Perijinan/Konsultan/Audit', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Biaya YMH di', 0),
('2104.12', 'Beban biaya ymh dibayar - Administrasi bank', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Biaya YMH di', 0),
('2104.99', 'Beban biaya ymh dibayar - Lain-lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Biaya YMH di', 0),
('2105.00', 'HUTANG PAJAK', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'HUTANG PAJAK', 0),
('2105.01', 'Hutang PPN Keluaran', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Pajak', 0),
('2105.02', 'Hutang PPh Ps. 21 / PPh Ps. 23', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Pajak', 0),
('2105.03', 'Hutang PPh Ps. 25', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Pajak', 0),
('2105.04', 'Hutang PBB / IPEDA', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Pajak', 0),
('2105.05', 'Hutang PPs. 21 /ppd 17', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Pajak', 0),
('2105.06', 'Hutang DPD / PAD', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang PAD', 0),
('2106.00', 'Uang Muka Penjualan Hasil Produksi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Uang Muka Pe', 0),
('2107.01', 'Hutang Jangka Panjang Bank yang akan jatuh tempo', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Bank ', 0),
('2107.02', 'Hutang Leasing Jangka panjang yang akan jatuh tempo', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Leasi', 0),
('2108.01', 'Hutang deviden', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Devid', 0),
('2198.01', 'Hutang pembelian aktiva tetap', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Lain-', 0),
('2198.03', 'Hutang kepada Pihak Ke III', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Pihak', 0),
('2198.04', 'Pendapatan Yang diterima Dimuka ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Pendapatan d', 0),
('2198.50', 'Hutang Lain-lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Lain-', 0),
('2200.00', 'KEWAJIBAN TIDAK LANCAR', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'KEWAJIBAN TI', 0),
('2201.01', 'Hutang Kredit Investasi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Jk Pa', 0),
('2202.01', 'Hutang Kerjasama Operasional', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Jk Pa', 0),
('2203.00', 'Hutang Bank', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Bank', 0),
('2203.01', 'Hutang Bank - Bank Central Asia', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Bank', 0),
('2203.02', 'Hutang Bank - Bank Mandiri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Bank', 0),
('2203.03', 'Hutang Bank - Bank Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Bank', 0),
('2203.04', 'Hutang Bank - Bank Negara Indonesia', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Bank', 0),
('2203.05', 'Hutang Bank - Bank Rakyat Indonesia', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Bank', 0),
('2203.06', 'Hutang Bank - Bank Harda', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Bank', 0),
('2203.07', 'Hutang Bank - Bank Danamon', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Bank', 0),
('2203.08', 'Hutang Bank - Bank Saudara', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Bank', 0),
('2203.09', 'Hutang Bank - Bank CIMB Niaga', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Bank', 0),
('2205.01', 'Pendapatan Yang diterima Dimuka ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Pendapatan d', 0),
('2205.02', 'Kewajiban Beban Manfaat', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Beban Manfaa', 0),
('3101.00', 'MODAL', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Modal', 0),
('3101.01', 'Modal Dasar - Saham Preferen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Modal Saham ', 0),
('3101.02', 'Modal Dasar - Saham Biasa', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Modal Saham ', 0),
('3101.03', 'Modal lainnya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Modal Lainya', 0),
('3102.01', 'Penyertaan Anak Perusahaan / Akun Kantor Direksi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Penyertaan A', 0),
('3102.02', 'Modal Belum disetor - saham biasa', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Penyertaan A', 0),
('3103.01', 'Modal Ditempatkan dan Disetor Penuh - Saham Preferen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Penyertaan A', 0),
('3103.02', 'Modal Ditempatkan dan Disetor Penuh - Saham Biasa', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Penyertaan A', 0),
('3104.01', 'Modal Disetor dimuka - Saham Preferen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Penyertaan A', 0),
('3104.02', 'Modal Disetor dimuka - Saham Biasa', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Penyertaan A', 0),
('3201.01', 'Agio Saham Preferen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Agio Saham', 0),
('3201.02', 'Agio Saham Biasa', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Agio Saham', 0),
('3202.01', 'Disagio Saham Preferen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Disagio Saha', 0),
('3202.02', 'Disagio Saham Biasa', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Disagio Saha', 0),
('3203.01', 'Modal Penyesuaian - Saham Preferen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Modal Penyes', 0),
('3301.01', 'Cadangan Bertujuan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Cadangan', 0),
('3302.01', 'Cadangan Umum', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Cadangan', 0),
('3303.01', 'Cadangan Jasa Produksi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Cadangan', 0),
('3304.01', 'Cadangan Sosial Produksi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Cadangan', 0),
('3400.00', 'LABA ( RUGI )', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Laba Rugi', 0),
('3401.01', 'Laba ( rugi ) Tahun-tahun sebelumnya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Laba ( rugi ', 0),
('3402.01', 'Laba ( rugi ) Tahun berjalan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Laba ( rugi ', 0),
('3901.01', 'Ikhtisar Laba - Rugi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Ikhtisar Lab', 0),
('4101.00', 'PENJUALAN PRODUKSI', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Penjualan', 0),
('4101.01', 'Penjualan Produksi - PT. Kasa Husada', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Penjualan', 0),
('4101.02', 'Penjualan Produksi - PT. Karet Ngagel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Penjualan', 0),
('4101.03', 'Penjualan Produksi - PT. Loka Refractories', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Penjualan', 0),
('4101.04', 'Penjualan Produksi - PT. Moya Kasri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Penjualan', 0),
('4101.05', 'Penjualan Produksi - PT. Carma', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Penjualan', 0),
('4101.06', 'Penjualan Produksi - PT. Puri Panca Pujibangun', '0000-00-00', 0, 0, 0, 7500000, 0, 7500000, 0, 7500000, 0, 885165833, 'Laba Rugi', 'Kredit', 'Penjualan', 0),
('4101.07', 'Penjualan Produksi - PT. Industrial Estate ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Penjualan', 0),
('4101.08', 'Penjualan Produksi - PT. Gedung Expo', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Penjualan', 0),
('4101.09', 'Penjualan Produksi - PT. Jatim Husada Farma', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Penjualan', 0),
('4401.00', 'RETUR PENJUALAN', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4401.01', 'Retur Penjualan - PT. Kasa Husada', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4401.02', 'Retur Penjualan - PT. Karet Ngagel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4401.03', 'Retur Penjualan - PT. Loka Refractories', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4401.04', 'Retur Penjualan - PT. Moya Kasri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4401.05', 'Retur Penjualan - PT. Carma', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4401.06', 'Retur Penjualan - PT. Puri Panca Pujibangun', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4401.07', 'Retur Penjualan - PT. Industrial Estate ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4401.08', 'Retur Penjualan - PT. Gedung Expo', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4401.09', 'Retur Penjualan - PT. Jatim Husada Farma', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4401.10', 'Retur Penjualan - PT. PWU Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4501.00', 'POTONGAN PENJUALAN', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4501.01', 'Potongan  Penjualan - PT. Kasa Husada', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4501.02', 'Potongan  Penjualan - PT. Karet Ngagel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4501.03', 'Potongan  Penjualan - PT. Loka Refractories', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4501.04', 'Potongan  Penjualan - PT. Moya Kasri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4501.05', 'Potongan  Penjualan - PT. Carma', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4501.06', 'Potongan  Penjualan - PT. Puri Panca Pujibangun', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4501.07', 'Potongan  Penjualan - PT. Industrial Estate ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4501.08', 'Potongan  Penjualan - PT. Gedung Expo', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4501.09', 'Potongan  Penjualan - PT. Jatim Husada Farma', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('4501.10', 'Potongan  Penjualan - PT. PWU Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('5101', 'Beban Pokok Persediaan Dalam Proses Awal', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5102', 'Beban Pokok Persediaan Dalam Proses Akhir', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5103', 'Beban Pokok Persediaan Barang Jadi Awal', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5104', 'Beban Pokok Persediaan Barang Jadi Akhir', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5200', 'BEBAN LANSUNG USAHA', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 6221200, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5300', 'BEBAN PEMAKAIAN BAHAN BAKU', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 3426200, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5400', 'BEBAN TENAGA KERJA LANGSUNG', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5401', 'Gaji / Upah', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 76667125, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5402', 'Honorarium', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5403', 'Lembur', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 1590201, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5404', 'Biaya Pengobatan / Kesejahteraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5405', 'Biaya Konsumsi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 4248500, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5406', 'Tunjangan Kesejahteraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5407', 'Tunjangan Astek', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5408', 'Tunjangan Jabatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5409', 'Tunjangan Pajak', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5410', 'Tunjangan Hari Raya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5411', 'Premi Kerja Pegawai/bonus/tantiem', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5412', 'THT & PHT', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5413', 'Premi Pensiun', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5414', 'Pesangon / beban manfaat karyawan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5415', 'Training', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5500', 'BIAYA PEMAKAIAN BAHAN PEMBANTU', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 47500, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5600', 'BEBAN TENAGA KERJA TAK LANGSUNG', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5601', 'Gaji / Upah', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5602', 'Honorarium', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5603', 'Lembur', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5604', 'Biaya Pengobatan / Kesejahteraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5605', 'Biaya Konsumsi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5606', 'Tunjangan Kesejahteraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5607', 'Tunjangan Astek', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5608', 'Tunjangan Jabatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5609', 'Tunjangan Pajak', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5610', 'Tunjangan Hari Raya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5611', 'Premi Kerja Pegawai/bonus/tantiem', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5612', 'THT & PHT', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5613', 'Premi Pensiun', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5614', 'Pesangon / beban manfaat karyawan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5615', 'Training', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5700', 'BEBAN AKTIVA TETAP TAK LANGSUNG', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Poko P', 0),
('5701', 'Asuransi Aktiva Tetap', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5702', 'Perbaikan & Pemeliharaan Bangunan ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5703', 'Perbaikan & Pemeliharaan Emplasemen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5704', 'Perbaikan & Pemeliharaan Mesin Produksi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 150000, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5705', 'Perbaikan & Pemeliharaan Mesin Pembangkit', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5706', 'Perbaikan & Pemeliharaan Mesin Produksi Pembangkit / tungku', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5707', 'Perbaikan & Pemeliharaan Kendaraan ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 180000, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5708', 'Perbaikan & Pemeliharaan Peralatan ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5709', 'Perbaikan & Pemeliharaan Inventaris ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 480000, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5710', 'Perbaikan & Pemeliharaan Jalan ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5711', 'Penyusutan Bangunan ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5712', 'Penyusutan Emplasemen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5713', 'Penyusutan Mesin Produksi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5714', 'Penyusutan Mesin Pembangkit', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5715', 'Penyusutan Mesin Produksi Pembangkit / tungku', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5716', 'Penyusutan Kendaraan ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5717', 'Penyusutan Peralatan ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5718', 'Penyusutan Inventaris ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5719', 'Biaya Lingkungan Hidup', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5720', 'Biaya Pajak Bumi dan Bangunan (PBB)', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5721', 'Telepon, Telex, Interlokal, VHF', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5722', 'Cetakan Alat Tulis', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5723', 'Tenaga Listrik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5724', 'Air PDAM', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5725', 'Bahan Bakar / pelumas', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 895542, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5726', 'Pemakaian Peralatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5727', 'Biaya Sewa', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('5728', 'Biaya Utility lainnya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 1379500, 0, 'Laba Rugi', 'Debit', 'Beban Pokok ', 0),
('6100', 'BEBAN TENAGA KERJA PENJUALAN', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6101', 'Gaji / Upah', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 71692000, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6102', 'Honorarium', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6103', 'Lembur', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6104', 'Biaya Pengobatan / Kesejahteraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6105', 'Biaya Konsumsi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 247000, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6106', 'Tunjangan Kesejahteraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6107', 'Tunjangan Astek', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6108', 'Tunjangan Jabatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6109', 'Tunjangan Pajak', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6110', 'Tunjangan Hari Raya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6111', 'Premi Kerja Pegawai / Bonus', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6112', 'THT & PHT', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6113', 'Premi Pensiun', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6114', 'Pesangon / beban manfaat karyawan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6115', 'Training', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 1400000, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6200', 'BEBAN UTILITY PENJUALAN ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6201', 'Tenaga Listrik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6202', 'Air PDAM', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6203', 'Bahan Bakar / pelumas', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 67000, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6204', 'Pemakaian Peralatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6205', 'Biaya Sewa', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6206', 'Biaya Utility lainnya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6300', 'BEBAN AKTIVA TETAP PENJUALAN ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6301', 'Beban Asuransi Aktiva Tetap Kantor Pemasaran', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6302', 'Pemeliharaan Kendaraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6303', 'Pemeliharaan Peralatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6304', 'Pemeliharaan Inventaris', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6305', 'Penyusutan Kendaraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6306', 'Penyusutan Peralatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6307', 'Penyusutan Inventaris', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6308', 'Beban Aktiva tetap lain-lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6400', 'BEBAN KANTOR PENJUALAN ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6401', 'Telepon, Telex, Interlokal, VHF', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6402', 'Cetakan Alat Tulis', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 2654500, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6403', 'Benda-benda pos', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 406750, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6404', 'Beban penyisihan piutang tak tertagih', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6405', 'Bahan Bakar Kendaraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 115000, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6406', 'Perjalanan dalam kota', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6407', 'Perjalanan Luar Kota', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 40108915, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6408', 'Biaya angkutan barang jadi / packing', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 14951000, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6409', 'Iklan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6410', 'Promosi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 18217320, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6411', 'Tender penjualan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6412', 'Pencarian order', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6413', 'Pengurusan penagihan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('6414', 'Biaya klaim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Penjua', 0),
('7100', 'BEBAN TENAGA KERJA ADMINISTRASI DAN UMUM', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7101', 'Gaji / Upah', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7102', 'Honorarium', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7103', 'Lembur', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 242300, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7104', 'Biaya Pengobatan / Kesejahteraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 642500, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7105', 'Biaya Konsumsi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 1784637, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7106', 'Tunjangan Kesejahteraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0);
INSERT INTO `tabel_master` (`kode_rekening`, `nama_rekening`, `tanggal_awal`, `awal_debet`, `awal_kredit`, `mut_debet`, `mut_kredit`, `sisa_debet`, `sisa_kredit`, `rl_debet`, `rl_kredit`, `nrc_debet`, `nrc_kredit`, `posisi`, `normal`, `subacct`, `option`) VALUES
('7107', 'Tunjangan Astek', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 23791211, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7108', 'Tunjangan Jabatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7109', 'Tunjangan Pajak', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7110', 'Tunjangan Hari Raya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7111', 'Premi Kerja Pegawai / Bonus', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7112', 'Tunjangan Hari Tua & PHT', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7113', 'Premi Pensiun', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7114', 'Pesangon / beban manfaat karyawan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7115', 'Training', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 20496500, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7200', 'BEBAN UTILITY ADMINISTRASI DAN UMUM', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7201', 'Tenaga Listrik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 7897891, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7202', 'Air PDAM', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 1271100, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7203', 'Bahan Bakar / pelumas', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 254000, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7204', 'Pemakaian Peralatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 60000, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7205', 'Biaya Sewa', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7206', 'Biaya Utility lainnya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 3398500, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7300', 'BEBAN AKTIVA TETAP ADMINISTRASI DAN UMUM', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7301', 'Beban Asuransi Aktiva Tetap Kantor Administrasi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7302', 'Perbaikan & Pemeliharaan Bangunan Rumah Dinas', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7303', 'Perbaikan & Pemeliharaan Bangunan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7304', 'Perbaikan & Pemeliharaan Kendaraan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7305', 'Perbaikan & Pemeliharaan Peralatan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 1064000, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7306', 'Perbaikan & Pemeliharaan Inventaris Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 385000, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7307', 'Penyusutan Bangunan Rumah Dinas', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7308', 'Penyusutan Bangunan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7309', 'Penyusutan Kendaraan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7310', 'Penyusutan Peralatan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7311', 'Penyusutan Inventaris Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7400', 'BEBAN KANTOR ADMINISTRASI DAN UMUM', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7401', 'Beban Lingkungan Hidup', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7402', 'Beban Amortisasi Goodwill', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7403', 'Beban Amortisasi Hak Patent', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7404', 'Beban Amortisasi Merk Dagang', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7405', 'Beban Amortisasi Hak Sewa Guna', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7406', 'Telepon, Telex, Interlokal, VHF', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 449637, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7407', 'Cetakan Alat Tulis', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 231000, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7408', 'Majalah, Koran', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7409', 'Benda-benda pos', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 96000, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7410', 'Representasi, Sumbangan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 1825000, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7411', 'Pajak Bumi Bangunan (PBB)', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7412', 'Beban Kantor lainnya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 27256500, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7413', 'Bahan Bakar Kendaraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7414', 'Perjalanan dinas dalam kota', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7415', 'Perjalanan dinas luar Kota', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7416', 'Perjalanan dinas luar negeri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 10000000, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7417', 'Iuran / sumbangan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 500000, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7418', 'Beban Pengawas/keamanan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7419', 'Beban Konsultan ( Audit, perpajakan, dll )', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('7420', 'Beban perijinan ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Umum d', 0),
('8100', 'PENDAPATAN DILUAR USAHA', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Pendapatan L', 0),
('8101', 'Jasa Giro', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Pendapatan L', 0),
('8102', 'Bunga Bank', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Pendapatan L', 0),
('8103', 'Pendapatan Bunga', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 90283, 'Laba Rugi', 'Kredit', 'Pendapatan L', 0),
('8104', 'Pendapatan sewa lahan dan bangunan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Pendapatan L', 0),
('8105', 'Benda pos', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Pendapatan L', 0),
('8106', 'Laba penjualan aktiva tetap', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Pendapatan L', 0),
('8107', 'Pendapatan deviden', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Pendapatan L', 0),
('8108', 'Pendapatan investasi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Pendapatan L', 0),
('8199', 'Pendapatan diluar usaha lainnya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 5760000, 'Laba Rugi', 'Kredit', 'Pendapatan L', 0),
('8200', 'BEBAN DILUAR USAHA', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Lain-l', 0),
('8201', 'Beban Administrasi Bank', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 138000, 0, 'Laba Rugi', 'Debit', 'Beban Lain-l', 0),
('8202', 'Beban Pendidikan dan latihan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Lain-l', 0),
('8203', 'Fee Dewan Komisaris', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Lain-l', 0),
('8204', 'Management Fee', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Lain-l', 0),
('8205', 'Penyusutan aktiva non produktif', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Lain-l', 0),
('8206', 'Beban bunga bank', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 20000000, 0, 'Laba Rugi', 'Debit', 'Beban Lain-l', 0),
('8207', 'Beban bunga ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Lain-l', 0),
('8208', 'Rugi penjualan aktiva tetap', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Lain-l', 0),
('8209', 'Beban investasi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Lain-l', 0),
('8210', 'Beda Kas', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Lain-l', 0),
('8211', 'Beban pajak', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 18056, 0, 'Laba Rugi', 'Debit', 'Beban Lain-l', 0),
('8212', 'Beban Tantiem', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Lain-l', 0),
('8213', 'Beban CSR', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Lain-l', 0),
('8299', 'Beban diluar usaha lainnya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Beban Lain-l', 0),
('1102.10', 'Bank UMKM JATIM', '2020-02-17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'debet', 'Aset Lancar', 2),
('2203.10', 'Hutang Bank - Bank UMKM JATIM', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit', 'Hutang Bank', 0),
('50005', 'Pembelian Brg / Jasa \r\n', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('15002', 'PPN Masukan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('2101.10', 'GL - Intersection - Acct', '0000-00-00', 0, 0, 0, 15249000, 0, 15249000, 0, 15249000, 0, 0, 'Laba Rugi', 'Kredit', 'Penjualan', 0),
('21111', 'GL - Intersection - Finance', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Penjualan', 0),
('22223', 'Hutang Pajak PPH 23', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Penjualan', 0),
('22224', 'Hutang Pajak PPH Psl 4 Ayat 2', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Penjualan', 0),
('13333', 'GL - Intersection - Purchase', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('20008', 'UU -  PT SYNNEX METRODATA IND.', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Penjualan', 0),
('11111', 'GL - Intersection - Acct', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit', 'Penjualan', 0),
('10001', 'Bank Mandiri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit', 'Penjualan', 2),
('1101.03', 'Kas Para', '2021-03-23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'debet', 'Penjualan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_neraca`
--

CREATE TABLE `tabel_neraca` (
  `kode_rekening` varchar(10) NOT NULL DEFAULT '',
  `nama_rekening` varchar(100) NOT NULL,
  `tanggal_awal` varchar(12) NOT NULL,
  `awal_debet` int(15) NOT NULL,
  `awal_kredit` int(15) NOT NULL,
  `mut_debet` int(15) NOT NULL,
  `mut_kredit` int(15) NOT NULL,
  `sisa_debet` int(15) NOT NULL,
  `sisa_kredit` int(15) NOT NULL,
  `rl_debet` int(15) NOT NULL,
  `rl_kredit` int(15) NOT NULL,
  `nrc_debet` int(15) NOT NULL,
  `nrc_kredit` int(15) NOT NULL,
  `posisi` varchar(15) NOT NULL,
  `normal` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_neraca`
--

INSERT INTO `tabel_neraca` (`kode_rekening`, `nama_rekening`, `tanggal_awal`, `awal_debet`, `awal_kredit`, `mut_debet`, `mut_kredit`, `sisa_debet`, `sisa_kredit`, `rl_debet`, `rl_kredit`, `nrc_debet`, `nrc_kredit`, `posisi`, `normal`) VALUES
('1101.00', 'K A S', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1101.01', 'Kas Besar', '0000-00-00', 0, 0, 66000, 0, 66000, 0, 0, 0, 66000, 0, 'Neraca', 'Debit'),
('1101.02', 'Kas Kecil', '0000-00-00', 0, 0, 10500, 0, 10500, 0, 0, 0, 10500, 0, 'Neraca', 'Debit'),
('1102.00', 'BANK ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1102.01', 'Bank BCA', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1102.02', 'Bank Mandiri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1102.03', 'Bank Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1102.04', 'Bank BNI', '0000-00-00', 0, 0, 15000000, 0, 15000000, 0, 0, 0, 15000000, 0, 'Neraca', 'Debit'),
('1102.05', 'Bank BRI', '0000-00-00', 0, 0, 172500, 0, 172500, 0, 0, 0, 172500, 0, 'Neraca', 'Debit'),
('1102.06', 'Bank Harda', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1102.07', 'Bank Danamon', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1102.08', 'Bank Saudara', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1102.09', 'Bank CIMB Niaga', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1103.00', 'BANK VALUTA ASING', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1103.01', 'Bank BCA', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1103.02', 'Bank Mandiri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1103.03', 'Bank Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1103.04', 'Bank BNI', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1103.05', 'Bank BRI', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1104.00', 'DEPOSITO', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1104.01', 'Bank BCA', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1104.02', 'Bank Mandiri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1104.03', 'Bank Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1104.04', 'Bank BNI', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1104.05', 'Bank BRI', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1104.06', 'Bank Harda', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1104.07', 'Bank Danamon', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1104.08', 'Bank Saudara', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1104.09', 'Bank CIMB Niaga', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1105.00', 'PIUTANG USAHA ', '0000-00-00', 0, 0, 17500000, 0, 17500000, 0, 0, 0, 17500000, 0, 'Neraca', 'Debit'),
('1106.00', 'Penyisihan Piutang usaha tak tertagih', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1107.01', 'Piutang karyawan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1107.02', 'Piutang pihak ke III', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1107.03', 'Uang Jaminan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1107.04', 'Piutang Bon Sementara', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1107.05', 'Pendapatan Yang masih akan diterima', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1107.50', 'Piutang lain-lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1107.99', 'Penyisihan piutang lain-lain tak tertagih', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1108.00', 'PERSEDIAAN', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1108.01', 'Persediaan barang dagangan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1108.02', 'Persediaan barang jadi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1108.03', 'Persediaan barang dalam proses', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1108.04', 'Persediaan bahan baku siap pakai', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1108.05', 'Persediaan bahan baku          ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1108.06', 'Persediaan bahan pembantu', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1108.07', 'Persediaan alat-alat', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1108.08', 'Persediaan spare part', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1108.09', 'Persediaan Tanah', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1108.10', 'Persediaan Makanan Hotel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1108.11', 'Persediaan Minuman Hotel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1108.99', 'Persediaan lain-lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1112.00', 'Uang muka pembelian', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1113.00', 'UANG MUKA PAJAK', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1113.01', 'Uang muka PPN Masukan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1113.02', 'Uang muka PPH ps. 21', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1113.03', 'Uang muka PPH ps. 22', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1113.04', 'Uang muka PPH ps. 23', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1113.05', 'Uang muka PPH ps. 25', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1114.00', 'UANG MUKA BIAYA', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1114.01', 'Asuransi dibayar dimuka', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1114.02', 'Sewa dibayar dimuka', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1114.03', 'Uang muka pengobatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1114.04', 'Uang muka pesanan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1114.05', 'Uang muka proyek', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1114.06', 'Uang muka pelaksanaan order', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1114.07', 'Uang muka Deviden (PAD)', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1114.08', 'Uang muka biaya audit / konsultan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1114.99', 'Uang muka lain-lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1199.01', 'Bank garansi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1199.02', 'Titipan hipotik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1201.01', 'Piutang kerjasama operasional jangka panjang', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1202.01', 'Piutang leasing jangka panjang', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1301.01', 'Investasi jangka panjang - Saham', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1301.02', 'Investasi jangka panjang - Obligasi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1301.03', 'Investasi jangka panjang - Surat berharga lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1301.04', 'Investasi jangka panjang - Modal penyertaan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1302.00', 'Aktiva Pajak Tangguhan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1303.00', 'R/K PENYERTAAN - ANAK PERUSAHAAN', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1303.01', 'PT. Kasa Husada Wira Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1303.02', 'PT. Karet Ngagel Wira Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1303.03', 'PT. Loka Refractories Wira Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1303.04', 'PT. Moya Kasri Wira Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1303.05', 'PT. Carma Wira Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1303.06', 'PT. Pabrik Es Wira Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1303.07', 'PT. Puri Panca Pujibangun', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1303.08', 'PT. Industrial Estate Wira Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1303.09', 'PT. Gedung Expo Wira Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1303.10', 'PT. Jatim Husada Farma', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1401.00', 'AKTIVA TETAP', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1401.01', 'Harga perolehan Tanah', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1402.01', 'Harga perolehan Bangunan Pabrik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1402.02', 'Harga perolehan Bangunan Rumah Dinas', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1402.03', 'Harga perolehan Bangunan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1402.04', 'Harga perolehan Emplasemen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1402.51', 'Akumulasi penyusutan Bangunan Pabrik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1402.52', 'Akumulasi penyusutan Bangunan Rumah Dinas', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1402.53', 'Akumulasi penyusutan Bangunan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1402.54', 'Akumulasi penyusutan Emplasemen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1403.01', 'Harga perolehan Mesin produksi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1403.02', 'Harga perolehan Mesin Pembangkit', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1403.03', 'Harga perolehan Mesin produksi pembakaran/tungku', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1403.51', 'Akum. Peny. Mesin produksi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1403.52', 'Akum. Peny. Mesin pembangkit', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1403.53', 'Akum. Peny. Mesin produksi pembakaran/tungku', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1404.01', 'Harga Perolehan Kendaraan Pabrik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1404.02', 'Harga Perolehan Kendaraan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1404.51', 'Akm. Peny. Kendaraan Pabrik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1404.52', 'Akm. Peny. Kendaraan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1405.01', 'Harga Perolehan Peralatan/Inventaris Pabrik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1405.02', 'Harga Perolehan/Inventaris Peralatan Kantor', '0000-00-00', 0, 0, 0, 10000000, 0, 10000000, 0, 0, 0, 10000000, 'Neraca', 'Debit'),
('1405.51', 'Akm. Peny. Peralatan/Inventaris Pabrik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1405.52', 'Akm. Peny. Peralatan/Inventaris Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1500.00', 'AKTIVA TETAP - PROPERTY INVESTASI', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1501.01', 'Harga Perolehan Tanah', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1502.01', 'Harga Perolehan Bangunan Exhibition', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1502.02', 'Harga Perolehan Bangunan Kantor/Gudang', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1502.03', 'Harga Perolehan Bangunan Hotel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1502.51', 'Akm. Peny. Bangunan Exhibition', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1502.52', 'Akm. Peny. Bangunan Kantor/Gudang', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1502.53', 'Akm. Peny. Bangunan Hotel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1503.01', 'Harga Perolehan Mesin Produksi ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1503.02', 'Harga Perolehan Mesin Pembangkit ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1503.03', 'Harga Perolehan Mesin Produksi Pembakaran/tungku', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1503.51', 'Akm. Peny. Mesin Produksi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1503.52', 'Akm. Peny. Mesin Pembangkit', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1503.53', 'Akm. Peny. Mesin Produksi Pembakaran/tungku', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1504.01', 'Harga Perolehan Kendaraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1504.51', 'Akm. Peny. Kendaraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1505.01', 'Harga Perolehan Peralatan Hotel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1505.02', 'Harga Perolehan Inventaris Hotel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1505.51', 'Akm. Peny. Peralatan Hotel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1506.01', 'Harga Perolehan Interior Hotel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1506.51', 'Akm. Peny. Interior Hotel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1601.01', 'Harga Perolehan Goodwill', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1601.51', 'Akm. Peny. Goodwill', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1602.01', 'Harga Perolehan Hak Patent', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1602.51', 'Akm. Peny. Hak Patent', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1603.01', 'Harga Perolehan Merk Dagang', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1603.51', 'Akm. Peny. Merk Dagang', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1604.01', 'Hak Sewa Guna Usaha', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1604.02', 'Hak Sewa Guna Bangunan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1604.51', 'Akumulasi Amortisasi Hak Sewa Guna', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1701.00', 'AKTIVA DALAM PELAKSANAAN', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1701.01', 'Tanah', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1701.02', 'Bangunan Pabrik dalam pelaksanaan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1701.03', 'Bangunan Kantor dalam pelaksanaan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1701.04', 'Bangunan Perumahan dalam pelaksanaan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1701.05', 'Pemasangan Mesin dalam pelaksanaan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1701.06', 'Pemasangan Pembangkit Tenaga dalam pelaksanaan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1702.00', 'AKTIVA TETAP NON PRODUKTIF', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1702.01', 'Tanah ( Non Produktif )', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1702.02', 'Bangunan ( Non Produktif )', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1702.03', 'Mesin ( Non Produktif )', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1702.04', 'Perabot Kantor ( Non Produktif )', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1702.99', 'Cadangan Penurunan Nilai Aktiva Tetap Non Produktif', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1703.00', 'UANG MUKA LAIN-LAIN', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1703.01', 'Jaminan PLN', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1703.02', 'Jaminan Telepon', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1703.03', 'Jaminan PDAM', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1703.04', 'Jaminan Bank', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1703.05', 'Jaminan Askes', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1703.99', 'Jaminan Biaya Lain-lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1704.01', 'Biaya Pendirian yang ditangguhkan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1704.99', 'Beban Lain-lain yang ditangguhkan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1705.01', 'Persediaan lain-lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1705.99', 'Cadangan penurunan Persediaan lain-lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1706.01', 'Piutang Usaha Macet ( Ragu-ragu )', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1706.02', 'Piutang lain-lain macet', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Debit'),
('1706.51', 'Cad. Penurunan Piutang Usaha Macet ( Ragu-ragu )', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1706.52', 'Cad. Penurunan Piutang lain-lain macet', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2100.00', 'KEWAJIBAN LANCAR', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2101.00', 'HUTANG KREDIT MODAL KERJA BANK', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2101.01', 'Hutang Kredit Modal Kerja Bank - Bank Central Asia', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2101.02', 'Hutang Kredit Modal Kerja Bank - Bank Mandiri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2101.03', 'Hutang Kredit Modal Kerja Bank - Bank Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2101.04', 'Hutang Kredit Modal Kerja Bank - Bank Negara Indosnesia', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2101.05', 'Hutang Kredit Modal Kerja Bank - Bank Rakyat Indonesia', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2101.06', 'Hutang Kredit Modal Kerja Bank - Bank Harda', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2101.07', 'Hutang Kredit Modal Kerja Bank - Bank Danamon', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2101.08', 'Hutang Kredit Modal Kerja Bank - Bank Saudara', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2101.09', 'Hutang Kredit Modal Kerja Bank - Bank CIMB Niaga', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2103.00', 'Hutang Usaha ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2104.00', 'BEBAN BIAYA YMH DIBAYAR', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2104.01', 'Beban biaya ymh dibayar - Gaji', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2104.02', 'Beban biaya ymh dibayar - Pesangon', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2104.03', 'Beban biaya ymh dibayar - Akuntan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2104.04', 'Beban biaya ymh dibayar - Utility (Listrik/Telpon/PDAM dll)', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2104.05', 'Beban biaya ymh dibayar - Aktiva tetap', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2104.06', 'Beban biaya ymh dibayar - Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2104.07', 'Beban biaya ymh dibayar - Perjalanan Dinas', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2104.08', 'Beban biaya ymh dibayar - Handling', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2104.09', 'Beban biaya ymh dibayar - Iklan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2104.10', 'Beban biaya ymh dibayar - Order/pesanan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2104.11', 'Beban biaya ymh dibayar - Perijinan/Konsultan/Audit', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2104.12', 'Beban biaya ymh dibayar - Administrasi bank', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2104.99', 'Beban biaya ymh dibayar - Lain-lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2105.00', 'HUTANG PAJAK', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2105.01', 'Hutang PPN Keluaran', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2105.02', 'Hutang PPh Ps. 21 / PPh Ps. 23', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2105.03', 'Hutang PPh Ps. 25', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2105.04', 'Hutang PBB / IPEDA', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2105.05', 'Hutang PPs. 21 /ppd 17', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2105.06', 'Hutang DPD / PAD', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2106.00', 'Uang Muka Penjualan Hasil Produksi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2107.01', 'Hutang Jangka Panjang Bank yang akan jatuh tempo', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2107.02', 'Hutang Leasing Jangka panjang yang akan jatuh tempo', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2108.01', 'Hutang deviden', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2198.01', 'Hutang pembelian aktiva tetap', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2198.03', 'Hutang kepada Pihak Ke III', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2198.04', 'Pendapatan Yang diterima Dimuka ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2198.50', 'Hutang Lain-lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2200.00', 'KEWAJIBAN TIDAK LANCAR', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2201.01', 'Hutang Kredit Investasi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2202.01', 'Hutang Kerjasama Operasional', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2203.00', 'Hutang Bank', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2203.01', 'Hutang Bank - Bank Central Asia', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2203.02', 'Hutang Bank - Bank Mandiri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2203.03', 'Hutang Bank - Bank Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2203.04', 'Hutang Bank - Bank Negara Indonesia', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2203.05', 'Hutang Bank - Bank Rakyat Indonesia', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2203.06', 'Hutang Bank - Bank Harda', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2203.07', 'Hutang Bank - Bank Danamon', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2203.08', 'Hutang Bank - Bank Saudara', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2203.09', 'Hutang Bank - Bank CIMB Niaga', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2205.01', 'Pendapatan Yang diterima Dimuka ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('2205.02', 'Kewajiban Beban Manfaat', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3101.00', 'MODAL', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3101.01', 'Modal Dasar - Saham Preferen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3101.02', 'Modal Dasar - Saham Biasa', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3101.03', 'Modal lainnya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3102.01', 'Penyertaan Anak Perusahaan / Akun Kantor Direksi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3102.02', 'Modal Belum disetor - saham biasa', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3103.01', 'Modal Ditempatkan dan Disetor Penuh - Saham Preferen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3103.02', 'Modal Ditempatkan dan Disetor Penuh - Saham Biasa', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3104.01', 'Modal Disetor dimuka - Saham Preferen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3104.02', 'Modal Disetor dimuka - Saham Biasa', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3201.01', 'Agio Saham Preferen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3201.02', 'Agio Saham Biasa', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3202.01', 'Disagio Saham Preferen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3202.02', 'Disagio Saham Biasa', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3203.01', 'Modal Penyesuaian - Saham Preferen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3301.01', 'Cadangan Bertujuan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3302.01', 'Cadangan Umum', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3303.01', 'Cadangan Jasa Produksi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3304.01', 'Cadangan Sosial Produksi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3400.00', 'LABA ( RUGI )', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3401.01', 'Laba ( rugi ) Tahun-tahun sebelumnya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3402.01', 'Laba ( rugi ) Tahun berjalan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('3901.01', 'Ikhtisar Laba - Rugi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1102.10', 'Bank UMKM JATIM', '2020-02-17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'debet'),
('2203.10', 'Hutang Bank - Bank UMKM JATIM', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neraca', 'Kredit'),
('1101.03', 'Kas Para', '2021-03-23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'debet');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_profil`
--

CREATE TABLE `tabel_profil` (
  `nama_perusahaan` varchar(30) NOT NULL,
  `gedung` varchar(30) NOT NULL,
  `jalan` varchar(30) NOT NULL,
  `kelurahan` varchar(30) NOT NULL,
  `kecamatan` varchar(30) NOT NULL,
  `propinsi` varchar(15) NOT NULL,
  `negara` varchar(15) NOT NULL,
  `telpon` varchar(12) NOT NULL,
  `fax` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `website` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_rugi_laba`
--

CREATE TABLE `tabel_rugi_laba` (
  `kode_rekening` varchar(10) NOT NULL DEFAULT '',
  `nama_rekening` varchar(100) NOT NULL,
  `tanggal_awal` varchar(12) NOT NULL,
  `awal_debet` int(15) NOT NULL,
  `awal_kredit` int(15) NOT NULL,
  `mut_debet` int(15) NOT NULL,
  `mut_kredit` int(15) NOT NULL,
  `sisa_debet` int(15) NOT NULL,
  `sisa_kredit` int(15) NOT NULL,
  `rl_debet` int(15) NOT NULL,
  `rl_kredit` int(15) NOT NULL,
  `nrc_debet` int(15) NOT NULL,
  `nrc_kredit` int(15) NOT NULL,
  `posisi` varchar(15) NOT NULL,
  `normal` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_rugi_laba`
--

INSERT INTO `tabel_rugi_laba` (`kode_rekening`, `nama_rekening`, `tanggal_awal`, `awal_debet`, `awal_kredit`, `mut_debet`, `mut_kredit`, `sisa_debet`, `sisa_kredit`, `rl_debet`, `rl_kredit`, `nrc_debet`, `nrc_kredit`, `posisi`, `normal`) VALUES
('4101.00', 'PENJUALAN PRODUKSI', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('4101.01', 'Penjualan Produksi - PT. Kasa Husada', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('4101.02', 'Penjualan Produksi - PT. Karet Ngagel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('4101.03', 'Penjualan Produksi - PT. Loka Refractories', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('4101.04', 'Penjualan Produksi - PT. Moya Kasri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('4101.05', 'Penjualan Produksi - PT. Carma', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('4101.06', 'Penjualan Produksi - PT. Puri Panca Pujibangun', '0000-00-00', 0, 0, 0, 7500000, 0, 7500000, 0, 7500000, 0, 885165833, 'Laba Rugi', 'Kredit'),
('4101.07', 'Penjualan Produksi - PT. Industrial Estate ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('4101.08', 'Penjualan Produksi - PT. Gedung Expo', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('4101.09', 'Penjualan Produksi - PT. Jatim Husada Farma', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('4401.00', 'RETUR PENJUALAN', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4401.01', 'Retur Penjualan - PT. Kasa Husada', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4401.02', 'Retur Penjualan - PT. Karet Ngagel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4401.03', 'Retur Penjualan - PT. Loka Refractories', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4401.04', 'Retur Penjualan - PT. Moya Kasri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4401.05', 'Retur Penjualan - PT. Carma', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4401.06', 'Retur Penjualan - PT. Puri Panca Pujibangun', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4401.07', 'Retur Penjualan - PT. Industrial Estate ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4401.08', 'Retur Penjualan - PT. Gedung Expo', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4401.09', 'Retur Penjualan - PT. Jatim Husada Farma', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4401.10', 'Retur Penjualan - PT. PWU Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4501.00', 'POTONGAN PENJUALAN', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4501.01', 'Potongan  Penjualan - PT. Kasa Husada', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4501.02', 'Potongan  Penjualan - PT. Karet Ngagel', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4501.03', 'Potongan  Penjualan - PT. Loka Refractories', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4501.04', 'Potongan  Penjualan - PT. Moya Kasri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4501.05', 'Potongan  Penjualan - PT. Carma', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4501.06', 'Potongan  Penjualan - PT. Puri Panca Pujibangun', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4501.07', 'Potongan  Penjualan - PT. Industrial Estate ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4501.08', 'Potongan  Penjualan - PT. Gedung Expo', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4501.09', 'Potongan  Penjualan - PT. Jatim Husada Farma', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('4501.10', 'Potongan  Penjualan - PT. PWU Jatim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5101', 'Beban Pokok Persediaan Dalam Proses Awal', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5102', 'Beban Pokok Persediaan Dalam Proses Akhir', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5103', 'Beban Pokok Persediaan Barang Jadi Awal', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5104', 'Beban Pokok Persediaan Barang Jadi Akhir', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5200', 'BEBAN LANSUNG USAHA', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 6221200, 0, 'Laba Rugi', 'Debit'),
('5300', 'BEBAN PEMAKAIAN BAHAN BAKU', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 3426200, 0, 'Laba Rugi', 'Debit'),
('5400', 'BEBAN TENAGA KERJA LANGSUNG', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5401', 'Gaji / Upah', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 76667125, 0, 'Laba Rugi', 'Debit'),
('5402', 'Honorarium', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5403', 'Lembur', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 1590201, 0, 'Laba Rugi', 'Debit'),
('5404', 'Biaya Pengobatan / Kesejahteraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5405', 'Biaya Konsumsi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 4248500, 0, 'Laba Rugi', 'Debit'),
('5406', 'Tunjangan Kesejahteraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5407', 'Tunjangan Astek', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5408', 'Tunjangan Jabatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5409', 'Tunjangan Pajak', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5410', 'Tunjangan Hari Raya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5411', 'Premi Kerja Pegawai/bonus/tantiem', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5412', 'THT & PHT', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5413', 'Premi Pensiun', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5414', 'Pesangon / beban manfaat karyawan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5415', 'Training', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5500', 'BIAYA PEMAKAIAN BAHAN PEMBANTU', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 47500, 0, 'Laba Rugi', 'Debit'),
('5600', 'BEBAN TENAGA KERJA TAK LANGSUNG', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5601', 'Gaji / Upah', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5602', 'Honorarium', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5603', 'Lembur', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5604', 'Biaya Pengobatan / Kesejahteraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5605', 'Biaya Konsumsi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5606', 'Tunjangan Kesejahteraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5607', 'Tunjangan Astek', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5608', 'Tunjangan Jabatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5609', 'Tunjangan Pajak', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5610', 'Tunjangan Hari Raya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5611', 'Premi Kerja Pegawai/bonus/tantiem', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5612', 'THT & PHT', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5613', 'Premi Pensiun', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5614', 'Pesangon / beban manfaat karyawan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5615', 'Training', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5700', 'BEBAN AKTIVA TETAP TAK LANGSUNG', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5701', 'Asuransi Aktiva Tetap', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5702', 'Perbaikan & Pemeliharaan Bangunan ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5703', 'Perbaikan & Pemeliharaan Emplasemen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5704', 'Perbaikan & Pemeliharaan Mesin Produksi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 150000, 0, 'Laba Rugi', 'Debit'),
('5705', 'Perbaikan & Pemeliharaan Mesin Pembangkit', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5706', 'Perbaikan & Pemeliharaan Mesin Produksi Pembangkit / tungku', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5707', 'Perbaikan & Pemeliharaan Kendaraan ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 180000, 0, 'Laba Rugi', 'Debit'),
('5708', 'Perbaikan & Pemeliharaan Peralatan ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5709', 'Perbaikan & Pemeliharaan Inventaris ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 480000, 0, 'Laba Rugi', 'Debit'),
('5710', 'Perbaikan & Pemeliharaan Jalan ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5711', 'Penyusutan Bangunan ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5712', 'Penyusutan Emplasemen', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5713', 'Penyusutan Mesin Produksi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5714', 'Penyusutan Mesin Pembangkit', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5715', 'Penyusutan Mesin Produksi Pembangkit / tungku', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5716', 'Penyusutan Kendaraan ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5717', 'Penyusutan Peralatan ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5718', 'Penyusutan Inventaris ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5719', 'Biaya Lingkungan Hidup', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5720', 'Biaya Pajak Bumi dan Bangunan (PBB)', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5721', 'Telepon, Telex, Interlokal, VHF', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5722', 'Cetakan Alat Tulis', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5723', 'Tenaga Listrik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5724', 'Air PDAM', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5725', 'Bahan Bakar / pelumas', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 895542, 0, 'Laba Rugi', 'Debit'),
('5726', 'Pemakaian Peralatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5727', 'Biaya Sewa', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('5728', 'Biaya Utility lainnya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 1379500, 0, 'Laba Rugi', 'Debit'),
('6100', 'BEBAN TENAGA KERJA PENJUALAN', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6101', 'Gaji / Upah', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 71692000, 0, 'Laba Rugi', 'Debit'),
('6102', 'Honorarium', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6103', 'Lembur', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6104', 'Biaya Pengobatan / Kesejahteraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6105', 'Biaya Konsumsi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 247000, 0, 'Laba Rugi', 'Debit'),
('6106', 'Tunjangan Kesejahteraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6107', 'Tunjangan Astek', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6108', 'Tunjangan Jabatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6109', 'Tunjangan Pajak', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6110', 'Tunjangan Hari Raya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6111', 'Premi Kerja Pegawai / Bonus', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6112', 'THT & PHT', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6113', 'Premi Pensiun', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6114', 'Pesangon / beban manfaat karyawan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6115', 'Training', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 1400000, 0, 'Laba Rugi', 'Debit'),
('6200', 'BEBAN UTILITY PENJUALAN ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6201', 'Tenaga Listrik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6202', 'Air PDAM', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6203', 'Bahan Bakar / pelumas', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 67000, 0, 'Laba Rugi', 'Debit'),
('6204', 'Pemakaian Peralatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6205', 'Biaya Sewa', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6206', 'Biaya Utility lainnya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6300', 'BEBAN AKTIVA TETAP PENJUALAN ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6301', 'Beban Asuransi Aktiva Tetap Kantor Pemasaran', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6302', 'Pemeliharaan Kendaraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6303', 'Pemeliharaan Peralatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6304', 'Pemeliharaan Inventaris', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6305', 'Penyusutan Kendaraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6306', 'Penyusutan Peralatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6307', 'Penyusutan Inventaris', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6308', 'Beban Aktiva tetap lain-lain', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6400', 'BEBAN KANTOR PENJUALAN ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6401', 'Telepon, Telex, Interlokal, VHF', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6402', 'Cetakan Alat Tulis', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 2654500, 0, 'Laba Rugi', 'Debit'),
('6403', 'Benda-benda pos', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 406750, 0, 'Laba Rugi', 'Debit'),
('6404', 'Beban penyisihan piutang tak tertagih', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6405', 'Bahan Bakar Kendaraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 115000, 0, 'Laba Rugi', 'Debit'),
('6406', 'Perjalanan dalam kota', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6407', 'Perjalanan Luar Kota', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 40108915, 0, 'Laba Rugi', 'Debit'),
('6408', 'Biaya angkutan barang jadi / packing', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 14951000, 0, 'Laba Rugi', 'Debit'),
('6409', 'Iklan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6410', 'Promosi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 18217320, 0, 'Laba Rugi', 'Debit'),
('6411', 'Tender penjualan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6412', 'Pencarian order', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6413', 'Pengurusan penagihan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('6414', 'Biaya klaim', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7100', 'BEBAN TENAGA KERJA ADMINISTRASI DAN UMUM', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7101', 'Gaji / Upah', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7102', 'Honorarium', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7103', 'Lembur', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 242300, 0, 'Laba Rugi', 'Debit'),
('7104', 'Biaya Pengobatan / Kesejahteraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 642500, 0, 'Laba Rugi', 'Debit'),
('7105', 'Biaya Konsumsi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 1784637, 0, 'Laba Rugi', 'Debit'),
('7106', 'Tunjangan Kesejahteraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7107', 'Tunjangan Astek', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 23791211, 0, 'Laba Rugi', 'Debit'),
('7108', 'Tunjangan Jabatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7109', 'Tunjangan Pajak', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7110', 'Tunjangan Hari Raya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7111', 'Premi Kerja Pegawai / Bonus', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7112', 'Tunjangan Hari Tua & PHT', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7113', 'Premi Pensiun', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7114', 'Pesangon / beban manfaat karyawan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7115', 'Training', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 20496500, 0, 'Laba Rugi', 'Debit'),
('7200', 'BEBAN UTILITY ADMINISTRASI DAN UMUM', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7201', 'Tenaga Listrik', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 7897891, 0, 'Laba Rugi', 'Debit'),
('7202', 'Air PDAM', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 1271100, 0, 'Laba Rugi', 'Debit'),
('7203', 'Bahan Bakar / pelumas', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 254000, 0, 'Laba Rugi', 'Debit'),
('7204', 'Pemakaian Peralatan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 60000, 0, 'Laba Rugi', 'Debit'),
('7205', 'Biaya Sewa', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7206', 'Biaya Utility lainnya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 3398500, 0, 'Laba Rugi', 'Debit'),
('7300', 'BEBAN AKTIVA TETAP ADMINISTRASI DAN UMUM', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7301', 'Beban Asuransi Aktiva Tetap Kantor Administrasi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7302', 'Perbaikan & Pemeliharaan Bangunan Rumah Dinas', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7303', 'Perbaikan & Pemeliharaan Bangunan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7304', 'Perbaikan & Pemeliharaan Kendaraan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7305', 'Perbaikan & Pemeliharaan Peralatan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 1064000, 0, 'Laba Rugi', 'Debit'),
('7306', 'Perbaikan & Pemeliharaan Inventaris Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 385000, 0, 'Laba Rugi', 'Debit'),
('7307', 'Penyusutan Bangunan Rumah Dinas', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7308', 'Penyusutan Bangunan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7309', 'Penyusutan Kendaraan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7310', 'Penyusutan Peralatan Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7311', 'Penyusutan Inventaris Kantor', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7400', 'BEBAN KANTOR ADMINISTRASI DAN UMUM', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7401', 'Beban Lingkungan Hidup', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7402', 'Beban Amortisasi Goodwill', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7403', 'Beban Amortisasi Hak Patent', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7404', 'Beban Amortisasi Merk Dagang', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7405', 'Beban Amortisasi Hak Sewa Guna', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7406', 'Telepon, Telex, Interlokal, VHF', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 449637, 0, 'Laba Rugi', 'Debit'),
('7407', 'Cetakan Alat Tulis', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 231000, 0, 'Laba Rugi', 'Debit'),
('7408', 'Majalah, Koran', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7409', 'Benda-benda pos', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 96000, 0, 'Laba Rugi', 'Debit'),
('7410', 'Representasi, Sumbangan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 1825000, 0, 'Laba Rugi', 'Debit'),
('7411', 'Pajak Bumi Bangunan (PBB)', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7412', 'Beban Kantor lainnya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 27256500, 0, 'Laba Rugi', 'Debit'),
('7413', 'Bahan Bakar Kendaraan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7414', 'Perjalanan dinas dalam kota', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7415', 'Perjalanan dinas luar Kota', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7416', 'Perjalanan dinas luar negeri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 10000000, 0, 'Laba Rugi', 'Debit'),
('7417', 'Iuran / sumbangan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 500000, 0, 'Laba Rugi', 'Debit'),
('7418', 'Beban Pengawas/keamanan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7419', 'Beban Konsultan ( Audit, perpajakan, dll )', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('7420', 'Beban perijinan ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('8100', 'PENDAPATAN DILUAR USAHA', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('8101', 'Jasa Giro', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('8102', 'Bunga Bank', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('8103', 'Pendapatan Bunga', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 90283, 'Laba Rugi', 'Kredit'),
('8104', 'Pendapatan sewa lahan dan bangunan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('8105', 'Benda pos', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('8106', 'Laba penjualan aktiva tetap', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('8107', 'Pendapatan deviden', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('8108', 'Pendapatan investasi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('8199', 'Pendapatan diluar usaha lainnya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 5760000, 'Laba Rugi', 'Kredit'),
('8200', 'BEBAN DILUAR USAHA', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('8201', 'Beban Administrasi Bank', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 138000, 0, 'Laba Rugi', 'Debit'),
('8202', 'Beban Pendidikan dan latihan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('8203', 'Fee Dewan Komisaris', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('8204', 'Management Fee', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('8205', 'Penyusutan aktiva non produktif', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('8206', 'Beban bunga bank', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 20000000, 0, 'Laba Rugi', 'Debit'),
('8207', 'Beban bunga ', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('8208', 'Rugi penjualan aktiva tetap', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('8209', 'Beban investasi', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('8210', 'Beda Kas', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('8211', 'Beban pajak', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 18056, 0, 'Laba Rugi', 'Debit'),
('8212', 'Beban Tantiem', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('8213', 'Beban CSR', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('8299', 'Beban diluar usaha lainnya', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('50005', 'Pembelian Brg / Jasa \r\n', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('15002', 'PPN Masukan', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('2101.10', 'GL - Intersection - Acct', '0000-00-00', 0, 0, 0, 15249000, 0, 15249000, 0, 15249000, 0, 0, 'Laba Rugi', 'Kredit'),
('21111', 'GL - Intersection - Finance', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('22223', 'Hutang Pajak PPH 23', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('22224', 'Hutang Pajak PPH Psl 4 Ayat 2', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('13333', 'GL - Intersection - Purchase', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('20008', 'UU -  PT SYNNEX METRODATA IND.', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('11111', 'GL - Intersection - Acct', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Debit'),
('10001', 'Bank Mandiri', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laba Rugi', 'Kredit'),
('III', 'JUMLAH PENDAPATAN', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
('IV', 'JUMLAH BIAYA', '', 0, 0, 0, 0, 0, 0, 22749000, 0, 0, 0, '', ''),
('V', 'Sisa Hasil Usaha Tahun Berjalan', '', 0, 0, 0, 0, 0, 0, -22749000, 0, 0, 0, '', ''),
('VI', 'Total Balance', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
('VII', 'TAHUN PERIODE', '2021', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_spp_acccount`
--

CREATE TABLE `tabel_spp_acccount` (
  `id_spp_account` int(11) NOT NULL,
  `kodesup` varchar(50) NOT NULL,
  `kode_rekening` varchar(100) NOT NULL,
  `id_spp` int(11) NOT NULL,
  `nominal` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_spp_acccount`
--

INSERT INTO `tabel_spp_acccount` (`id_spp_account`, `kodesup`, `kode_rekening`, `id_spp`, `nominal`) VALUES
(1, 'SUP0002', '1101.01', 1, 1000000),
(2, 'SUP0004', '1102.01', 2, 2000000),
(3, 'SUP0004', '1101.01', 3, 500000),
(4, 'SUP0001', '1102.01', 4, 1500000),
(5, 'SUP0004', '1102.04', 5, 700000),
(6, 'SUP0004', '1102.05', 6, 300000),
(7, 'SUP0002', '1102.07', 7, 1000000),
(8, 'SUP0001', '1101.01', 8, 1100000),
(9, 'SUP0001', '1102.01', 9, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_sp_acccount`
--

CREATE TABLE `tabel_sp_acccount` (
  `id_sp_account` int(11) NOT NULL,
  `kode_rekening` varchar(100) NOT NULL,
  `id_sp` int(11) NOT NULL,
  `nominal` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_sp_acccount`
--

INSERT INTO `tabel_sp_acccount` (`id_sp_account`, `kode_rekening`, `id_sp`, `nominal`) VALUES
(1, '1102.04', 1, 15000000);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_transaksi`
--

CREATE TABLE `tabel_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `kode_transaksi` varchar(20) NOT NULL,
  `kode_rekening` varchar(10) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `jenis_transaksi` varchar(20) NOT NULL,
  `keterangan_transaksi` text NOT NULL,
  `debet` int(15) NOT NULL,
  `kredit` int(15) NOT NULL,
  `tanggal_posting` date NOT NULL,
  `keterangan_posting` varchar(10) NOT NULL,
  `Kode_Pelanggan` varchar(15) NOT NULL,
  `id_admin` int(4) NOT NULL,
  `penanggung` varchar(100) NOT NULL,
  `timestamps` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_transaksi`
--

INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`, `penanggung`, `timestamps`) VALUES
(1, '002/BBK-PPP/1/2020', '1102.02', '2020-01-02', '002/BBK-PPP/1/2020', 'Biaya Admin Bank Mandiri', 0, 31000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(2, '002/BBK-PPP/1/2020', '8201', '2020-01-02', '002/BBK-PPP/1/2020', 'Biaya Admin Bank Mandiri', 31000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(3, '003/BKM-PPP/1/2020', '1101.01', '2020-01-07', '003/BKM-PPP/1/2020', 'Terima Dari Pembayaran Kopkar (P.BKKBN)', 5000000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(4, '003/BKM-PPP/1/2020', '1105.00', '2020-01-07', '003/BKM-PPP/1/2020', 'Terima Dari Pembayaran Kopkar (P.BKKBN)', 0, 5000000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(371, '066/BBK-PPP/1/2020', '1102.02', '2020-01-15', '066/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Temprint', 0, 50000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(372, '066/BBK-PPP/1/2020', '2198.50', '2020-01-15', '066/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Temprint', 50000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(7, '004/BKK-PPP/1/2020', '1101.01', '2020-01-07', '004/BKK-PPP/1/2020', 'Bayar Perjalanan SPJ Perdin Bp Moh Nasir', 0, 555600, '0000-00-00', 'Post', '', 1, '', '2020-02-26 08:57:40'),
(8, '004/BKK-PPP/1/2020', '6407', '2020-01-07', '004/BKK-PPP/1/2020', 'Bayar Perjalanan SPJ Perdin Bp Moh Nasir', 555600, 0, '0000-00-00', 'Post', '', 1, '', '2020-02-26 08:57:40'),
(9, '001/BBK-PPP/1/2020', '1102.02', '2020-01-02', '001/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Temprint', 0, 7000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(10, '001/BBK-PPP/1/2020', '2198.50', '2020-01-02', '001/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Temprint', 7000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(11, '005/BBK-PPP/1/2020', '1102.02', '2020-01-02', '005/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Temprint', 0, 200000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(12, '005/BBK-PPP/1/2020', '2198.50', '2020-01-02', '005/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Temprint', 200000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(13, '005/BBK-PPP/1/2020', '1102.02', '2020-01-02', '005/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Balebat', 0, 200000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(14, '005/BBK-PPP/1/2020', '2198.50', '2020-01-02', '005/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Balebat', 200000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(15, '007/BBK-PPP/1/2020', '1102.02', '2020-01-07', '007/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Balebat', 0, 100000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(16, '007/BBK-PPP/1/2020', '2198.50', '2020-01-07', '007/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Balebat', 100000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(17, '007/BBK-PPP/1/2020', '1102.02', '2020-01-07', '007/BBK-PPP/1/2020', 'Pelunasan Biaya Pelatihan Karyawan ( Raker Pacet )', 0, 1400000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(18, '006/BBK-PPP/1/2020', '1102.02', '2020-01-06', '006/BBK-PPP/1/2020', 'Pembayaran DP Pelatihan Karyawan ( Raker Pacet )', 0, 1400000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(19, '006/BBK-PPP/1/2020', '6115', '2020-01-06', '006/BBK-PPP/1/2020', 'Pembayaran DP Pelatihan Karyawan ( Raker Pacet )', 1400000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(20, '007/BBK-PPP/1/2020', '1102.02', '2020-01-07', '007/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Temprint', 0, 100000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(21, '007/BBK-PPP/1/2020', '6115', '2020-01-07', '007/BBK-PPP/1/2020', 'Pelunasan Biaya Pelatihan Karyawan ( Raker Pacet )', 1400000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(22, '007/BBK-PPP/1/2020', '2198.50', '2020-01-07', '007/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Temprint', 100000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(23, '008/BBK-PPP/1/2020', '1102.02', '2020-01-09', '008/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Balebat', 0, 50000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(24, '008/BBK-PPP/1/2020', '2198.50', '2020-01-09', '008/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Balebat', 50000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(25, '008/BBK-PPP/1/2020', '1102.02', '2020-01-09', '008/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Temprint', 0, 50000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(26, '008/BBK-PPP/1/2020', '2198.50', '2020-01-09', '008/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Temprint', 50000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(27, '009/BBK-PPP/1/2020', '1102.02', '2020-01-09', '009/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Balebat', 0, 50000000, '0000-00-00', 'Post', '', 1, '', '2020-02-26 08:57:40'),
(28, '009/BBK-PPP/1/2020', '2198.50', '2020-01-09', '009/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Balebat', 50000000, 0, '0000-00-00', 'Post', '', 1, '', '2020-02-26 08:57:40'),
(29, '043/BBK-PPP/1/2020', '1102.02', '2020-01-09', '043/BBK-PPP/1/2020', 'Bayar BPJS Ketenagakerjaan', 0, 11371438, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(30, '043/BBK-PPP/1/2020', '7107', '2020-01-09', '043/BBK-PPP/1/2020', 'Bayar BPJS Ketenagakerjaan', 11371438, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(31, '043/BBK-PPP/1/2020', '1102.02', '2020-01-09', '043/BBK-PPP/1/2020', 'Biaya Kirim Buku Ke Medan ( Xpdc Mulyono )', 0, 14000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(32, '043/BBK-PPP/1/2020', '6408', '2020-01-09', '043/BBK-PPP/1/2020', 'Biaya Kirim Buku Ke Medan ( Xpdc Mulyono )', 14000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(33, '043/BBK-PPP/1/2020', '1102.02', '2020-01-09', '043/BBK-PPP/1/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(34, '043/BBK-PPP/1/2020', '8201', '2020-01-09', '043/BBK-PPP/1/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(35, '011/BBK-PPP/1/2020', '1102.02', '2020-01-13', '011/BBK-PPP/1/2020', 'Biaya Ambil STNK Mobil Pengurusan Kecelakaan', 0, 1000000, '0000-00-00', 'Post', '', 1, 'heri', '2020-02-26 08:57:40'),
(36, '011/BBK-PPP/1/2020', '7206', '2020-01-13', '011/BBK-PPP/1/2020', 'Biaya Ambil STNK Mobil Pengurusan Kecelakaan', 1000000, 0, '0000-00-00', 'Post', '', 1, 'heri', '2020-02-26 08:57:40'),
(37, '011/BBK-PPP/1/2020', '1102.02', '2020-01-13', '011/BBK-PPP/1/2020', ' Bayar Hutang Plate Country', 0, 10000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(38, '011/BBK-PPP/1/2020', '2103.00', '2020-01-13', '011/BBK-PPP/1/2020', ' Bayar Hutang Plate Country', 10000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(39, '011/BBK-PPP/1/2020', '1102.02', '2020-01-13', '011/BBK-PPP/1/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(40, '011/BBK-PPP/1/2020', '8201', '2020-01-13', '011/BBK-PPP/1/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(41, '011/BBK-PPP/1/2020', '1102.02', '2020-01-13', '011/BBK-PPP/1/2020', 'Bayar Hutang Plate Victory', 0, 10000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(42, '011/BBK-PPP/1/2020', '2103.00', '2020-01-13', '011/BBK-PPP/1/2020', 'Bayar Hutang Plate Victory', 10000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(43, '011/BBK-PPP/1/2020', '1102.02', '2020-01-13', '011/BBK-PPP/1/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(44, '011/BBK-PPP/1/2020', '8201', '2020-01-13', '011/BBK-PPP/1/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(45, '010/BKK-PPP/1/2020', '1101.01', '2020-01-07', '010/BKK-PPP/1/2020', 'Beli Bensin Oprs Pick Up', 0, 324500, '0000-00-00', 'Post', '', 1, 'alif', '2020-02-26 08:57:40'),
(46, '010/BKK-PPP/1/2020', '6408', '2020-01-07', '010/BKK-PPP/1/2020', 'Beli Bensin Oprs Pick Up', 324500, 0, '0000-00-00', 'Post', '', 1, 'alif', '2020-02-26 08:57:40'),
(47, '010/BKK-PPP/1/2020', '1101.01', '2020-01-07', '010/BKK-PPP/1/2020', 'Bayar Konsumsi Loading Buku', 0, 180000, '0000-00-00', 'Post', '', 1, 'alif', '2020-02-26 08:57:40'),
(48, '010/BKK-PPP/1/2020', '5405', '2020-01-07', '010/BKK-PPP/1/2020', 'Bayar Konsumsi Loading Buku', 180000, 0, '0000-00-00', 'Post', '', 1, 'alif', '2020-02-26 08:57:40'),
(49, '010/BKK-PPP/1/2020', '1101.01', '2020-01-07', '010/BKK-PPP/1/2020', 'Bayar Perbaikan AC R.mrktg, Keu', 0, 385000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(50, '010/BKK-PPP/1/2020', '7306', '2020-01-07', '010/BKK-PPP/1/2020', 'Bayar Perbaikan AC R.mrktg, Keu', 385000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(51, '010/BKK-PPP/1/2020', '1101.01', '2020-01-07', '010/BKK-PPP/1/2020', 'Bayar Konsumsi Perbaikan AC', 0, 28000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(52, '010/BKK-PPP/1/2020', '5405', '2020-01-07', '010/BKK-PPP/1/2020', 'Bayar Konsumsi Perbaikan AC', 28000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(53, '010/BKK-PPP/1/2020', '1101.01', '2020-01-07', '010/BKK-PPP/1/2020', 'Bayar Go Car Mrketing', 0, 40000, '0000-00-00', 'Post', '', 1, 'hendy', '2020-02-26 08:57:40'),
(54, '010/BKK-PPP/1/2020', '6405', '2020-01-07', '010/BKK-PPP/1/2020', 'Bayar Go Car Mrketing', 40000, 0, '0000-00-00', 'Post', '', 1, 'hendy', '2020-02-26 08:57:40'),
(55, '010/BKK-PPP/1/2020', '1101.01', '2020-01-07', '010/BKK-PPP/1/2020', 'Bayar Kirim Dok Ke Jombang, Bogor, Bekasi', 0, 50000, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(56, '010/BKK-PPP/1/2020', '6403', '2020-01-07', '010/BKK-PPP/1/2020', 'Bayar Kirim Dok Ke Jombang, Bogor, Bekasi', 50000, 0, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(57, '010/BKK-PPP/1/2020', '1101.01', '2020-01-07', '010/BKK-PPP/1/2020', 'Beli Solar Forklift', 0, 65000, '0000-00-00', 'Post', '', 1, 'alif', '2020-02-26 08:57:40'),
(58, '010/BKK-PPP/1/2020', '5725', '2020-01-07', '010/BKK-PPP/1/2020', 'Beli Solar Forklift', 65000, 0, '0000-00-00', 'Post', '', 1, 'alif', '2020-02-26 08:57:40'),
(59, '010/BKK-PPP/1/2020', '1101.01', '2020-01-07', '010/BKK-PPP/1/2020', 'Beli Paku Utk P.BKKBN', 0, 47500, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(60, '010/BKK-PPP/1/2020', '5500', '2020-01-07', '010/BKK-PPP/1/2020', 'Beli Paku Utk P.BKKBN', 47500, 0, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(61, '012/BBK-PPP/1/2020', '1102.02', '2020-01-14', '012/BBK-PPP/1/2020', 'Bayar Hutang XPDC Xpressindo', 0, 26723000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(62, '012/BBK-PPP/1/2020', '2103.00', '2020-01-14', '012/BBK-PPP/1/2020', 'Bayar Hutang XPDC Xpressindo', 26723000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(63, '012/BBK-PPP/1/2020', '1102.02', '2020-01-14', '012/BBK-PPP/1/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(64, '012/BBK-PPP/1/2020', '8201', '2020-01-14', '012/BBK-PPP/1/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(65, '012/BBK-PPP/1/2020', '1102.02', '2020-01-14', '012/BBK-PPP/1/2020', 'Biaya Pengurusan Kecelakan Sewa Towing', 0, 1800000, '0000-00-00', 'Post', '', 1, 'heri', '2020-02-26 08:57:40'),
(66, '012/BBK-PPP/1/2020', '7206', '2020-01-14', '012/BBK-PPP/1/2020', 'Biaya Pengurusan Kecelakan Sewa Towing', 1800000, 0, '0000-00-00', 'Post', '', 1, 'heri', '2020-02-26 08:57:40'),
(67, '012/BBK-PPP/1/2020', '1102.02', '2020-01-14', '012/BBK-PPP/1/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(68, '012/BBK-PPP/1/2020', '8201', '2020-01-14', '012/BBK-PPP/1/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(69, '012/BBK-PPP/1/2020', '1102.02', '2020-01-14', '012/BBK-PPP/1/2020', 'Biaya Perjalanan Dinas Pak Nasir', 0, 5000000, '0000-00-00', 'Post', '', 1, 'Nasir', '2020-02-26 08:57:40'),
(70, '012/BBK-PPP/1/2020', '6407', '2020-01-14', '012/BBK-PPP/1/2020', 'Biaya Perjalanan Dinas Pak Nasir', 5000000, 0, '0000-00-00', 'Post', '', 1, 'Nasir', '2020-02-26 08:57:40'),
(71, '012/BBK-PPP/1/2020', '1102.02', '2020-01-14', '012/BBK-PPP/1/2020', 'Biaya Pemasaran Pak Nasir', 0, 15000000, '0000-00-00', 'Post', '', 1, 'Nasir', '2020-02-26 08:57:40'),
(72, '012/BBK-PPP/1/2020', '6410', '2020-01-14', '012/BBK-PPP/1/2020', 'Biaya Pemasaran Pak Nasir', 15000000, 0, '0000-00-00', 'Post', '', 1, 'Nasir', '2020-02-26 08:57:40'),
(73, '013/BBM-PPP/1/2020', '1102.02', '2020-01-02', '013/BBM-PPP/1/2020', 'Terima Pembayaran Piutang Dari Bambang Sudjono Cv Zalsa', 30000000, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(74, '013/BBM-PPP/1/2020', '1105.00', '2020-01-02', '013/BBM-PPP/1/2020', 'Terima Pembayaran Piutang Dari Bambang Sudjono Cv Zalsa', 0, 30000000, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(75, '013/BBM-PPP/1/2020', '1102.02', '2020-01-02', '013/BBM-PPP/1/2020', 'Terima Pembayaran Piutang Dari Munadi Yasin', 57800000, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(76, '013/BBM-PPP/1/2020', '1105.00', '2020-01-02', '013/BBM-PPP/1/2020', 'Terima Pembayaran Piutang Dari Munadi Yasin', 0, 57800000, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(77, '013/BBM-PPP/1/2020', '1102.02', '2020-01-02', '013/BBM-PPP/1/2020', 'Terima Pembayaran Piutang Dari Pak Imron Rosadi Amza', 200000000, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(78, '013/BBM-PPP/1/2020', '1105.00', '2020-01-02', '013/BBM-PPP/1/2020', 'Terima Pembayaran Piutang Dari Pak Imron Rosadi Amza', 0, 200000000, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(79, '014/BBM-PPP/1/2020', '1102.02', '2020-01-03', '014/BBM-PPP/1/2020', 'Terima Pembayaran Piutang Dari Pak Supolo', 7106280, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(80, '014/BBM-PPP/1/2020', '1105.00', '2020-01-03', '014/BBM-PPP/1/2020', 'Terima Pembayaran Piutang Dari Pak Supolo', 0, 7106280, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(81, '015/BBM-PPP/1/2020', '1102.02', '2020-01-05', '015/BBM-PPP/1/2020', 'Terima Pembayaran Piutang Dari Edi Rianto', 20560800, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(82, '015/BBM-PPP/1/2020', '1105.00', '2020-01-05', '015/BBM-PPP/1/2020', 'Terima Pembayaran Piutang Dari Edi Rianto', 0, 20560800, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(83, '016/BBM-PPP/1/2020', '1102.02', '2020-01-05', '016/BBM-PPP/1/2020', 'Terima Pembayaran Piutang Dari Pak Edi Rianto', 12816000, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(84, '016/BBM-PPP/1/2020', '1105.00', '2020-01-05', '016/BBM-PPP/1/2020', 'Terima Pembayaran Piutang Dari Pak Edi Rianto', 0, 12816000, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(85, '017/BBM-PPP/1/2020', '1102.02', '2020-01-06', '017/BBM-PPP/1/2020', 'Terima Pembayaran Piutang Dari Metro Medika Indonesia', 9570000, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(86, '017/BBM-PPP/1/2020', '1105.00', '2020-01-06', '017/BBM-PPP/1/2020', 'Terima Pembayaran Piutang Dari Metro Medika Indonesia', 0, 9570000, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(87, '018/BBM-PPP/1/2020', '1102.02', '2020-01-06', '018/BBM-PPP/1/2020', 'Terima Pembayaran Piutang Dari Pak Agus Widodo', 40320000, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(88, '018/BBM-PPP/1/2020', '1105.00', '2020-01-06', '018/BBM-PPP/1/2020', 'Terima Pembayaran Piutang Dari Pak Agus Widodo', 0, 40320000, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(89, '019/BBM-PPP/1/2020', '1102.02', '2020-01-06', '019/BBM-PPP/1/2020', 'Gagal TF Biaya Pelatihan Karyawan ( Raker Pacet )', 1400000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(90, '019/BBM-PPP/1/2020', '6115', '2020-01-06', '019/BBM-PPP/1/2020', 'Gagal TF Biaya Pelatihan Karyawan ( Raker Pacet )', 0, 1400000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(91, '020/BBM-PPP/1/2020', '1102.02', '2020-01-07', '020/BBM-PPP/1/2020', '	Terima Pembayaran Piutang Dari Bu Citra', 27552800, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(92, '020/BBM-PPP/1/2020', '1105.00', '2020-01-07', '020/BBM-PPP/1/2020', '	Terima Pembayaran Piutang Dari Bu Citra', 0, 27552800, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(93, '021/BBM-PPP/1/2020', '1102.02', '2020-01-07', '021/BBM-PPP/1/2020', '	Terima Pembayaran Piutang Dari Pak Edi Rianto', 50000000, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(94, '021/BBM-PPP/1/2020', '1105.00', '2020-01-07', '021/BBM-PPP/1/2020', '	Terima Pembayaran Piutang Dari Pak Edi Rianto', 0, 50000000, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(95, '022/BBM-PPP/1/2020', '1102.02', '2020-01-07', '022/BBM-PPP/1/2020', '	Terima Pembayaran Piutang Dari Pak Supolo', 3271320, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(96, '022/BBM-PPP/1/2020', '1105.00', '2020-01-07', '022/BBM-PPP/1/2020', '	Terima Pembayaran Piutang Dari Pak Supolo', 0, 3271320, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(97, '023/BBM-PPP/1/2020', '1102.02', '2020-01-07', '023/BBM-PPP/1/2020', '	Terima Pembayaran Piutang Dari Pak Imron Amza', 100000000, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(98, '023/BBM-PPP/1/2020', '1105.00', '2020-01-07', '023/BBM-PPP/1/2020', '	Terima Pembayaran Piutang Dari Pak Imron Amza', 0, 100000000, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(99, '024/BBM-PPP/1/2020', '1102.02', '2020-01-07', '024/BBM-PPP/1/2020', 'Terima Pembayaran Pencetakan Contoh Dummy', 2728000, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(100, '024/BBM-PPP/1/2020', '8199', '2020-01-07', '024/BBM-PPP/1/2020', 'Terima Pembayaran Pencetakan Contoh Dummy', 0, 2728000, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(101, '025/BBM-PPP/1/2020', '1102.02', '2020-01-08', '025/BBM-PPP/1/2020', '	Terima Pembayaran Piutang Dari Ahmad Yudi', 4342520, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(102, '025/BBM-PPP/1/2020', '1105.00', '2020-01-08', '025/BBM-PPP/1/2020', '	Terima Pembayaran Piutang Dari Ahmad Yudi', 0, 4342520, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(103, '026/BBM-PPP/1/2020', '1102.02', '2020-01-08', '026/BBM-PPP/1/2020', '	Terima Pembayaran Piutang Dari Pak Agus Widodo', 48719520, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(104, '026/BBM-PPP/1/2020', '1105.00', '2020-01-08', '026/BBM-PPP/1/2020', '	Terima Pembayaran Piutang Dari Pak Agus Widodo', 0, 48719520, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(105, '027/BBM-PPP/1/2020', '1102.02', '2020-01-08', '027/BBM-PPP/1/2020', 'Pendapatan Dari Penjualan Aval', 2260000, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(106, '027/BBM-PPP/1/2020', '8199', '2020-01-08', '027/BBM-PPP/1/2020', 'Pendapatan Dari Penjualan Aval', 0, 2260000, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(107, '028/BBM-PPP/1/2020', '1102.02', '2020-01-09', '028/BBM-PPP/1/2020', '	Terima Pembayaran Piutang Dari Bu Citra', 24047568, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(108, '028/BBM-PPP/1/2020', '1105.00', '2020-01-09', '028/BBM-PPP/1/2020', '	Terima Pembayaran Piutang Dari Bu Citra', 0, 24047568, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(109, '029/BBM-PPP/1/2020', '1102.02', '2020-01-09', '029/BBM-PPP/1/2020', '	Terima Pembayaran Piutang Dari Bu Citra', 11143880, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(110, '029/BBM-PPP/1/2020', '1105.00', '2020-01-09', '029/BBM-PPP/1/2020', '	Terima Pembayaran Piutang Dari Bu Citra', 0, 11143880, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(111, '030/BBM-PPP/1/2020', '1102.02', '2020-01-09', '030/BBM-PPP/1/2020', '	Terima Pembayaran Piutang Dari Pak Surya', 84609000, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(112, '030/BBM-PPP/1/2020', '1105.00', '2020-01-09', '030/BBM-PPP/1/2020', '	Terima Pembayaran Piutang Dari Pak Surya', 0, 84609000, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(113, '031/BKK-PPP/1/2020', '1101.01', '2020-01-07', '031/BKK-PPP/1/2020', 'Bayar Bensin, Parkir, Tambal Ban', 0, 57000, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(114, '031/BKK-PPP/1/2020', '5725', '2020-01-07', '031/BKK-PPP/1/2020', 'Bayar Bensin, Parkir, Tambal Ban', 57000, 0, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(115, '031/BKK-PPP/1/2020', '1101.01', '2020-01-07', '031/BKK-PPP/1/2020', 'Bayar Kirim Dok Ke PT Macanan, BIN Klaten', 0, 33000, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(116, '031/BKK-PPP/1/2020', '6403', '2020-01-07', '031/BKK-PPP/1/2020', 'Bayar Kirim Dok Ke PT Macanan, BIN Klaten', 33000, 0, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(117, '031/BKK-PPP/1/2020', '1101.01', '2020-01-07', '031/BKK-PPP/1/2020', 'Beli Staples, Paku, Wreaping, Lem Rajawali BKKBN', 0, 300000, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(118, '031/BKK-PPP/1/2020', '5200', '2020-01-07', '031/BKK-PPP/1/2020', 'Beli Staples, Paku, Wreaping, Lem Rajawali BKKBN', 300000, 0, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(119, '031/BKK-PPP/1/2020', '1101.01', '2020-01-07', '031/BKK-PPP/1/2020', 'Beli Bensin pick up (kirim buku, kasa)', 0, 116500, '0000-00-00', 'Post', '', 1, '', '2020-02-26 08:57:40'),
(120, '031/BKK-PPP/1/2020', '6408', '2020-01-07', '031/BKK-PPP/1/2020', 'Beli Bensin pick up (kirim buku, kasa)', 116500, 0, '0000-00-00', 'Post', '', 1, '', '2020-02-26 08:57:40'),
(121, '031/BKK-PPP/1/2020', '1101.01', '2020-01-07', '031/BKK-PPP/1/2020', 'Biaya Kebutuhan Ktr, Konsumsi Meeting', 0, 178600, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(122, '031/BKK-PPP/1/2020', '7105', '2020-01-07', '031/BKK-PPP/1/2020', 'Biaya Kebutuhan Ktr, Konsumsi Meeting', 178600, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(123, '031/BKK-PPP/1/2020', '1101.01', '2020-01-07', '031/BKK-PPP/1/2020', 'Bayar Konsumsi Loading ', 0, 110000, '0000-00-00', 'Post', '', 1, 'alif', '2020-02-26 08:57:40'),
(124, '031/BKK-PPP/1/2020', '5405', '2020-01-07', '031/BKK-PPP/1/2020', 'Bayar Konsumsi Loading ', 110000, 0, '0000-00-00', 'Post', '', 1, 'alif', '2020-02-26 08:57:40'),
(125, '031/BKK-PPP/1/2020', '1101.01', '2020-01-07', '031/BKK-PPP/1/2020', 'Beli Peralatan Berang Pangkas Pohon', 0, 60000, '0000-00-00', 'Post', '', 1, 'heru', '2020-02-26 08:57:40'),
(126, '031/BKK-PPP/1/2020', '7204', '2020-01-07', '031/BKK-PPP/1/2020', 'Beli Peralatan Berang Pangkas Pohon', 60000, 0, '0000-00-00', 'Post', '', 1, 'heru', '2020-02-26 08:57:40'),
(375, '067/BBK-PPP/1/2020', '1102.02', '2020-01-15', '067/BBK-PPP/1/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(376, '067/BBK-PPP/1/2020', '8201', '2020-01-15', '067/BBK-PPP/1/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(129, '032/BKM-PPP/1/2020', '1101.01', '2020-01-07', '032/BKM-PPP/1/2020', 'Terima Dr Pembayaran DN PT Kasa Husada', 1050000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(130, '032/BKM-PPP/1/2020', '1105.00', '2020-01-07', '032/BKM-PPP/1/2020', 'Terima Dr Pembayaran DN PT Kasa Husada', 0, 1050000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(131, '033/BKK-PPP/1/2020', '1101.01', '2020-01-07', '033/BKK-PPP/1/2020', 'Beli Bensin Oprs, Toll, Parkir', 0, 75000, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(132, '033/BKK-PPP/1/2020', '6405', '2020-01-07', '033/BKK-PPP/1/2020', 'Beli Bensin Oprs, Toll, Parkir', 75000, 0, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(133, '033/BKK-PPP/1/2020', '1101.01', '2020-01-07', '033/BKK-PPP/1/2020', 'Beli Lem Rajawali, Staples BKKBN', 0, 610000, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(134, '033/BKK-PPP/1/2020', '5200', '2020-01-07', '033/BKK-PPP/1/2020', 'Beli Lem Rajawali, Staples BKKBN', 610000, 0, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(135, '033/BKK-PPP/1/2020', '1101.01', '2020-01-07', '033/BKK-PPP/1/2020', 'Beli Materai, Kirim Tiki', 0, 75000, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(136, '033/BKK-PPP/1/2020', '6403', '2020-01-07', '033/BKK-PPP/1/2020', 'Beli Materai, Kirim Tiki', 75000, 0, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(137, '033/BKK-PPP/1/2020', '1101.01', '2020-01-07', '033/BKK-PPP/1/2020', 'Beli Tinta Kasa Eco Green', 0, 1206200, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(138, '033/BKK-PPP/1/2020', '2103.00', '2020-01-07', '033/BKK-PPP/1/2020', 'Beli Tinta Kasa Eco Green', 1206200, 0, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(139, '033/BKK-PPP/1/2020', '1101.01', '2020-01-07', '033/BKK-PPP/1/2020', 'Beli Solar Forklift', 0, 50000, '0000-00-00', 'Post', '', 1, 'alif', '2020-02-26 08:57:40'),
(140, '033/BKK-PPP/1/2020', '5725', '2020-01-07', '033/BKK-PPP/1/2020', 'Beli Solar Forklift', 50000, 0, '0000-00-00', 'Post', '', 1, 'alif', '2020-02-26 08:57:40'),
(141, '034/BKM-PPP/1/2020', '1101.01', '2020-01-07', '034/BKM-PPP/1/2020', 'Kas Dr Pengambilan Cek Mandiri HV 815002', 27862000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(142, '034/BKM-PPP/1/2020', '1102.02', '2020-01-07', '034/BKM-PPP/1/2020', 'Kas Dr Pengambilan Cek Mandiri HV 815002', 0, 27862000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(143, '035/BKK-PPP/1/2020', '1101.01', '2020-01-09', '035/BKK-PPP/1/2020', 'Bayar Pengembalian Hutang Kpd Kopkar', 0, 15000000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(144, '035/BKK-PPP/1/2020', '2198.50', '2020-01-09', '035/BKK-PPP/1/2020', 'Bayar Pengembalian Hutang Kpd Kopkar', 15000000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(145, '036/BKK-PPP/1/2020', '1101.01', '2020-01-09', '036/BKK-PPP/1/2020', 'Bayar Rapat Kerja Management Puri Di Pacet', 0, 4166500, '0000-00-00', 'Post', '', 1, '', '2020-02-26 08:57:40'),
(146, '036/BKK-PPP/1/2020', '7115', '2020-01-09', '036/BKK-PPP/1/2020', 'Bayar Rapat Kerja Management Puri Di Pacet', 4166500, 0, '0000-00-00', 'Post', '', 1, '', '2020-02-26 08:57:40'),
(147, '037/BKK-PPP/1/2020', '1101.01', '2020-01-09', '037/BKK-PPP/1/2020', 'Bayar Tiket BIN Dan Jamuan Tamu', 0, 4986500, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(148, '037/BKK-PPP/1/2020', '2104.07', '2020-01-09', '037/BKK-PPP/1/2020', 'Bayar Tiket BIN Dan Jamuan Tamu', 4986500, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(149, '038/BKK-PPP/1/2020', '1101.01', '2020-01-09', '038/BKK-PPP/1/2020', 'Bayar Cetak Penggandaan Buku Pegangan (Aceh) ', 0, 2728000, '0000-00-00', 'Post', '', 1, '', '2020-02-26 08:57:40'),
(150, '038/BKK-PPP/1/2020', '8199', '2020-01-09', '038/BKK-PPP/1/2020', 'Bayar Cetak Penggandaan Buku Pegangan (Aceh) ', 2728000, 0, '0000-00-00', 'Post', '', 1, '', '2020-02-26 08:57:40'),
(151, '039/BKM-PPP/1/2020', '1101.01', '2020-01-09', '039/BKM-PPP/1/2020', 'Terima Dr Pembayaran Bpk Edy Riyanto', 15000000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(152, '039/BKM-PPP/1/2020', '1105.00', '2020-01-09', '039/BKM-PPP/1/2020', 'Terima Dr Pembayaran Bpk Edy Riyanto', 0, 15000000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(153, '040/BKK-PPP/1/2020', '1101.01', '2020-01-09', '040/BKK-PPP/1/2020', 'Beli Kuas, Isi Staples (BKKBN)', 0, 137500, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(154, '040/BKK-PPP/1/2020', '5200', '2020-01-09', '040/BKK-PPP/1/2020', 'Beli Kuas, Isi Staples (BKKBN)', 137500, 0, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(155, '040/BKK-PPP/1/2020', '1101.01', '2020-01-09', '040/BKK-PPP/1/2020', 'Beli Bensin Oprs, Parkir', 0, 42000, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(156, '040/BKK-PPP/1/2020', '5725', '2020-01-09', '040/BKK-PPP/1/2020', 'Beli Bensin Oprs, Parkir', 42000, 0, '0000-00-00', 'Post', '', 1, 'chudori', '2020-02-26 08:57:40'),
(157, '040/BKK-PPP/1/2020', '1101.01', '2020-01-09', '040/BKK-PPP/1/2020', 'Beli Jamuan Tamu (PWU)', 0, 509300, '0000-00-00', 'Post', '', 1, 'heru', '2020-02-26 08:57:40'),
(158, '040/BKK-PPP/1/2020', '7105', '2020-01-09', '040/BKK-PPP/1/2020', 'Beli Jamuan Tamu (PWU)', 509300, 0, '0000-00-00', 'Post', '', 1, 'heru', '2020-02-26 08:57:40'),
(159, '040/BKK-PPP/1/2020', '1101.01', '2020-01-09', '040/BKK-PPP/1/2020', 'Beli Konsumsi Loading', 0, 165000, '0000-00-00', 'Post', '', 1, 'alif', '2020-02-26 08:57:40'),
(160, '040/BKK-PPP/1/2020', '5405', '2020-01-09', '040/BKK-PPP/1/2020', 'Beli Konsumsi Loading', 165000, 0, '0000-00-00', 'Post', '', 1, 'alif', '2020-02-26 08:57:40'),
(161, '040/BKK-PPP/1/2020', '1101.01', '2020-01-09', '040/BKK-PPP/1/2020', 'Beli Solar Forklift', 0, 100000, '0000-00-00', 'Post', '', 1, 'alif', '2020-02-26 08:57:40'),
(162, '040/BKK-PPP/1/2020', '5725', '2020-01-09', '040/BKK-PPP/1/2020', 'Beli Solar Forklift', 100000, 0, '0000-00-00', 'Post', '', 1, 'alif', '2020-02-26 08:57:40'),
(163, '040/BKK-PPP/1/2020', '1101.01', '2020-01-09', '040/BKK-PPP/1/2020', 'Beli Kulkas Utk SUmbangan CSR', 0, 1625000, '0000-00-00', 'Post', '', 1, 'Bp Nasir', '2020-02-26 08:57:40'),
(164, '040/BKK-PPP/1/2020', '7410', '2020-01-09', '040/BKK-PPP/1/2020', 'Beli Kulkas Utk SUmbangan CSR', 1625000, 0, '0000-00-00', 'Post', '', 1, 'Bp Nasir', '2020-02-26 08:57:40'),
(165, '040/BKK-PPP/1/2020', '1101.01', '2020-01-09', '040/BKK-PPP/1/2020', 'Beli Bensin Oprs Pick Up', 0, 200000, '0000-00-00', 'Post', '', 1, 'alif', '2020-02-26 08:57:40'),
(166, '040/BKK-PPP/1/2020', '6408', '2020-01-09', '040/BKK-PPP/1/2020', 'Beli Bensin Oprs Pick Up', 200000, 0, '0000-00-00', 'Post', '', 1, 'alif', '2020-02-26 08:57:40'),
(167, '040/BKK-PPP/1/2020', '1101.01', '2020-01-09', '040/BKK-PPP/1/2020', 'Beli Bahan Pembuatan Lobby Atas Yg Rusak', 0, 480000, '0000-00-00', 'Post', '', 1, 'adrian', '2020-02-26 08:57:40'),
(168, '040/BKK-PPP/1/2020', '5709', '2020-01-09', '040/BKK-PPP/1/2020', 'Beli Bahan Pembuatan Lobby Atas Yg Rusak', 480000, 0, '0000-00-00', 'Post', '', 1, 'adrian', '2020-02-26 08:57:40'),
(169, '041/BKK-PPP/1/2020', '1101.01', '2020-01-12', '041/BKK-PPP/1/2020', 'Biaya Kecelakaan (Accident) Mrketing Di Tol Caruban Perdi Ke Jateng', 0, 1379500, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(170, '041/BKK-PPP/1/2020', '5728', '2020-01-12', '041/BKK-PPP/1/2020', 'Biaya Kecelakaan (Accident) Mrketing Di Tol Caruban Perdi Ke Jateng', 1379500, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(171, '042/BKK-PPP/1/2020', '1101.01', '2020-01-14', '042/BKK-PPP/1/2020', 'Beli Toner Refill HP 79 A, Toner Xerox (BKKBN)', 0, 600000, '0000-00-00', 'Post', '', 1, 'trisula', '2020-02-26 08:57:40'),
(172, '042/BKK-PPP/1/2020', '5300', '2020-01-14', '042/BKK-PPP/1/2020', 'Beli Toner Refill HP 79 A, Toner Xerox (BKKBN)', 600000, 0, '0000-00-00', 'Post', '', 1, 'trisula', '2020-02-26 08:57:40'),
(173, '044/BKK-PPP/1/2020', '1101.01', '2020-01-15', '044/BKK-PPP/1/2020', 'Beli Kardus PO 002 Kpd PT Temprina', 0, 1440000, '0000-00-00', 'Post', '', 1, '', '2020-02-26 08:57:40'),
(174, '044/BKK-PPP/1/2020', '5300', '2020-01-15', '044/BKK-PPP/1/2020', 'Beli Kardus PO 002 Kpd PT Temprina', 1440000, 0, '0000-00-00', 'Post', '', 1, '', '2020-02-26 08:57:40'),
(179, '045/BKK-PPP/1/2020', '1101.01', '2020-01-15', '045/BKK-PPP/1/2020', 'Biaya Kirim Dokumen Ke Semarang', 0, 75750, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(180, '045/BKK-PPP/1/2020', '6403', '2020-01-15', '045/BKK-PPP/1/2020', 'Biaya Kirim Dokumen Ke Semarang', 75750, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(181, '045/BKK-PPP/1/2020', '1101.01', '2020-01-15', '045/BKK-PPP/1/2020', 'Beli Bensin Operasional', 0, 20000, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(182, '045/BKK-PPP/1/2020', '5725', '2020-01-15', '045/BKK-PPP/1/2020', 'Beli Bensin Operasional', 20000, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(183, '045/BKK-PPP/1/2020', '1101.01', '2020-01-15', '045/BKK-PPP/1/2020', 'Beli Printer Pemasaran & Pengiriman', 0, 1769000, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(184, '045/BKK-PPP/1/2020', '6402', '2020-01-15', '045/BKK-PPP/1/2020', 'Beli Printer Pemasaran & Pengiriman', 1769000, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(185, '045/BKK-PPP/1/2020', '1101.01', '2020-01-15', '045/BKK-PPP/1/2020', 'Beli Atk Pemasaran', 0, 364700, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(186, '045/BKK-PPP/1/2020', '6402', '2020-01-15', '045/BKK-PPP/1/2020', 'Beli Atk Pemasaran', 364700, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(187, '045/BKK-PPP/1/2020', '1101.01', '2020-01-15', '045/BKK-PPP/1/2020', 'Beli Kertas SIDU Untuk BKKBN', 0, 180000, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(188, '045/BKK-PPP/1/2020', '5300', '2020-01-15', '045/BKK-PPP/1/2020', 'Beli Kertas SIDU Untuk BKKBN', 180000, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(189, '045/BKK-PPP/1/2020', '1101.01', '2020-01-15', '045/BKK-PPP/1/2020', 'Biaya Pembuatan Kartu Nama Dan Bensin', 0, 217320, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(190, '045/BKK-PPP/1/2020', '6410', '2020-01-15', '045/BKK-PPP/1/2020', 'Biaya Pembuatan Kartu Nama Dan Bensin', 217320, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(191, '045/BKK-PPP/1/2020', '1101.01', '2020-01-15', '045/BKK-PPP/1/2020', 'Biaya Cetak Rk Mandiri', 0, 72500, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(192, '045/BKK-PPP/1/2020', '7206', '2020-01-15', '045/BKK-PPP/1/2020', 'Biaya Cetak Rk Mandiri', 72500, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(193, '045/BKK-PPP/1/2020', '1101.01', '2020-01-15', '045/BKK-PPP/1/2020', 'Bayar Go Car Ke Mandiri Merr 2 Hari', 0, 276000, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(194, '045/BKK-PPP/1/2020', '7206', '2020-01-15', '045/BKK-PPP/1/2020', 'Bayar Go Car Ke Mandiri Merr 2 Hari', 276000, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(195, '045/BKK-PPP/1/2020', '1101.01', '2020-01-15', '045/BKK-PPP/1/2020', 'Beli Jamuan Tamu', 0, 247000, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(196, '045/BKK-PPP/1/2020', '6105', '2020-01-15', '045/BKK-PPP/1/2020', 'Beli Jamuan Tamu', 247000, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(197, '045/BKK-PPP/1/2020', '1101.01', '2020-01-15', '045/BKK-PPP/1/2020', 'Konsumsi Loading', 0, 121000, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(198, '045/BKK-PPP/1/2020', '5405', '2020-01-15', '045/BKK-PPP/1/2020', 'Konsumsi Loading', 121000, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(373, '066/BBK-PPP/1/2020', '1102.02', '2020-01-15', '066/BBK-PPP/1/2020', 'Biaya Pengurusan Visa', 0, 10000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(374, '066/BBK-PPP/1/2020', '7412', '2020-01-15', '066/BBK-PPP/1/2020', 'Biaya Pengurusan Visa', 10000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(217, '046/BKM-PPP/1/2020', '1101.01', '2020-01-15', '046/BKM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Bp Edy Riyanto', 31000000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(218, '046/BKM-PPP/1/2020', '1105.00', '2020-01-15', '046/BKM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Bp Edy Riyanto', 0, 31000000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(219, '047/BKK-PPP/1/2020', '1101.01', '2020-01-15', '047/BKK-PPP/1/2020', 'Bayar PLN Januari', 0, 7897891, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(220, '047/BKK-PPP/1/2020', '7201', '2020-01-15', '047/BKK-PPP/1/2020', 'Bayar PLN Januari', 7897891, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(221, '047/BKK-PPP/1/2020', '1101.01', '2020-01-15', '047/BKK-PPP/1/2020', 'Bayar PDAM  Januari', 0, 1271100, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(222, '047/BKK-PPP/1/2020', '7202', '2020-01-15', '047/BKK-PPP/1/2020', 'Bayar PDAM  Januari', 1271100, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(223, '047/BKK-PPP/1/2020', '1101.01', '2020-01-15', '047/BKK-PPP/1/2020', 'Bayar Telphon, Speedy', 0, 449637, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(224, '047/BKK-PPP/1/2020', '7406', '2020-01-15', '047/BKK-PPP/1/2020', 'Bayar Telphon, Speedy', 449637, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(225, '048/BKK-PPP/1/2020', '1101.01', '2020-01-15', '048/BKK-PPP/1/2020', 'Bayar Tiket Ke Jakarta', 0, 854197, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(226, '048/BKK-PPP/1/2020', '6407', '2020-01-15', '048/BKK-PPP/1/2020', 'Bayar Tiket Ke Jakarta', 854197, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(227, '048/BKK-PPP/1/2020', '1101.01', '2020-01-15', '048/BKK-PPP/1/2020', 'Beli ATK, Paku, Masker, Majun', 0, 172000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(228, '048/BKK-PPP/1/2020', '5200', '2020-01-15', '048/BKK-PPP/1/2020', 'Beli ATK, Paku, Masker, Majun', 172000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(229, '048/BKK-PPP/1/2020', '1101.01', '2020-01-15', '048/BKK-PPP/1/2020', 'Bayar Perbaikan AC', 0, 185000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(230, '048/BKK-PPP/1/2020', '7305', '2020-01-15', '048/BKK-PPP/1/2020', 'Bayar Perbaikan AC', 185000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(231, '048/BKK-PPP/1/2020', '1101.01', '2020-01-15', '048/BKK-PPP/1/2020', 'Biaya Pengganti Kacamata (kecelakaan)', 0, 250000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(232, '048/BKK-PPP/1/2020', '7206', '2020-01-15', '048/BKK-PPP/1/2020', 'Biaya Pengganti Kacamata (kecelakaan)', 250000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(233, '048/BKK-PPP/1/2020', '1101.01', '2020-01-15', '048/BKK-PPP/1/2020', 'Bayar Sumbangan RT', 0, 200000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(234, '048/BKK-PPP/1/2020', '7410', '2020-01-15', '048/BKK-PPP/1/2020', 'Bayar Sumbangan RT', 200000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(235, '048/BKK-PPP/1/2020', '1101.01', '2020-01-15', '048/BKK-PPP/1/2020', 'Byr Go Car Kanvasing Marktg', 0, 67000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(236, '048/BKK-PPP/1/2020', '6203', '2020-01-15', '048/BKK-PPP/1/2020', 'Byr Go Car Kanvasing Marktg', 67000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(237, '048/BKK-PPP/1/2020', '1101.01', '2020-01-15', '048/BKK-PPP/1/2020', 'Beli Palu, Wreaping', 0, 116000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(238, '048/BKK-PPP/1/2020', '5200', '2020-01-15', '048/BKK-PPP/1/2020', 'Beli Palu, Wreaping', 116000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(239, '048/BKK-PPP/1/2020', '1101.01', '2020-01-15', '048/BKK-PPP/1/2020', 'Bayar Plate Sertifikat/Ijazah', 0, 133000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(240, '048/BKK-PPP/1/2020', '5200', '2020-01-15', '048/BKK-PPP/1/2020', 'Bayar Plate Sertifikat/Ijazah', 133000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(241, '048/BKK-PPP/1/2020', '1101.01', '2020-01-15', '048/BKK-PPP/1/2020', 'Bayar Tiki Pengiriman Ke Metro Medika', 0, 14000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(242, '048/BKK-PPP/1/2020', '6403', '2020-01-15', '048/BKK-PPP/1/2020', 'Bayar Tiki Pengiriman Ke Metro Medika', 14000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(243, '048/BKK-PPP/1/2020', '1101.01', '2020-01-15', '048/BKK-PPP/1/2020', 'Beli Bensin Oprs Pembelian', 0, 59000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(244, '048/BKK-PPP/1/2020', '5725', '2020-01-15', '048/BKK-PPP/1/2020', 'Beli Bensin Oprs Pembelian', 59000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(245, '048/BKK-PPP/1/2020', '1101.01', '2020-01-15', '048/BKK-PPP/1/2020', 'Beli tinta , mouse, kabel USB', 0, 305000, '0000-00-00', 'Post', '', 1, '', '2020-02-26 08:57:40'),
(246, '048/BKK-PPP/1/2020', '6402', '2020-01-15', '048/BKK-PPP/1/2020', 'Beli tinta, mouse, kabel USB', 305000, 0, '0000-00-00', 'Post', '', 1, '', '2020-02-26 08:57:40'),
(247, '003/SJ-PPP/02/2020', '4101.06', '2020-02-10', '003/INV-PPP/02/2020', 'Penjualan 003/INV-PPP/02/2020', 0, 20560800, '0000-00-00', 'Post', 'CST0003', 1, '', '2020-02-26 08:57:40'),
(248, '003/SJ-PPP/02/2020', '1105.00', '2020-02-10', '003/INV-PPP/02/2020', 'Penjualan 003/INV-PPP/02/2020', 20560800, 0, '0000-00-00', 'Post', 'CST0003', 1, '', '2020-02-26 08:57:40'),
(255, '005/SJ-PPP/02/2020', '4101.06', '2020-02-10', '005/INV-PPP/02/2020', 'Penjualan 005/INV-PPP/02/2020', 0, 26547656, '0000-00-00', 'Post', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(256, '005/SJ-PPP/02/2020', '1105.00', '2020-02-10', '005/INV-PPP/02/2020', 'Penjualan 005/INV-PPP/02/2020', 26547656, 0, '0000-00-00', 'Post', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(257, '049/BKK-PPP/1/2020', '1101.01', '2020-01-22', '049/BKK-PPP/1/2020', 'Beli Amplas, Oli Sae, Lem Rajawali, Karung, Thinner', 0, 711000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(253, '004/SJ-PPP/02/2020', '4101.06', '2020-02-10', '004/INV-PPP/02/2020', 'Penjualan 004/INV-PPP/02/2020', 0, 28920000, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(254, '004/SJ-PPP/02/2020', '1105.00', '2020-02-10', '004/INV-PPP/02/2020', 'Penjualan 004/INV-PPP/02/2020', 28920000, 0, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(258, '049/BKK-PPP/1/2020', '5200', '2020-01-22', '049/BKK-PPP/1/2020', 'Beli Amplas, Oli Sae, Lem Rajawali, Karung, Thinner', 711000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(259, '049/BKK-PPP/1/2020', '1101.01', '2020-01-22', '049/BKK-PPP/1/2020', 'Bayar Plate Country', 0, 180000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(260, '049/BKK-PPP/1/2020', '5200', '2020-01-22', '049/BKK-PPP/1/2020', 'Bayar Plate Country', 180000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(261, '049/BKK-PPP/1/2020', '1101.01', '2020-01-22', '049/BKK-PPP/1/2020', 'Beli Bensin Oprs Pick Up Dan Toll, Pembelian', 0, 207000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(262, '049/BKK-PPP/1/2020', '6408', '2020-01-22', '049/BKK-PPP/1/2020', 'Beli Bensin Oprs Pick Up Dan Toll, Pembelian', 207000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(263, '049/BKK-PPP/1/2020', '1101.01', '2020-01-22', '049/BKK-PPP/1/2020', 'Beli Konsumsi Loading, Jamuan Rapat', 0, 309500, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(264, '049/BKK-PPP/1/2020', '5405', '2020-01-22', '049/BKK-PPP/1/2020', 'Beli Konsumsi Loading, Jamuan Rapat', 309500, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(265, '049/BKK-PPP/1/2020', '1101.01', '2020-01-22', '049/BKK-PPP/1/2020', 'Beli Pertalite Utk Mesin, Solar Forklift', 0, 126500, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(266, '049/BKK-PPP/1/2020', '5725', '2020-01-22', '049/BKK-PPP/1/2020', 'Beli Pertalite Utk Mesin, Solar Forklift', 126500, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(267, '049/BKK-PPP/1/2020', '1101.01', '2020-01-22', '049/BKK-PPP/1/2020', 'Bayar Iuran Bulanan RW 03 Karangpilan', 0, 150000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(268, '049/BKK-PPP/1/2020', '7417', '2020-01-22', '049/BKK-PPP/1/2020', 'Bayar Iuran Bulanan RW 03 Karangpilan', 150000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(269, '049/BKK-PPP/1/2020', '1101.01', '2020-01-22', '049/BKK-PPP/1/2020', 'Bayar Cetak Proof Superstar A3', 0, 115000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(270, '049/BKK-PPP/1/2020', '5200', '2020-01-22', '049/BKK-PPP/1/2020', 'Bayar Cetak Proof Superstar A3', 115000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(271, '006/SJ-PPP/02/2020', '4101.06', '2020-02-10', '006/INV-PPP/02/2020', 'Penjualan 006/INV-PPP/02/2020', 0, 4064400, '0000-00-00', 'Post', 'CST0006', 1, '', '2020-02-26 08:57:40'),
(272, '006/SJ-PPP/02/2020', '1105.00', '2020-02-10', '006/INV-PPP/02/2020', 'Penjualan 006/INV-PPP/02/2020', 4064400, 0, '0000-00-00', 'Post', 'CST0006', 1, '', '2020-02-26 08:57:40'),
(273, '007/SJ-PPP/02/2020', '4101.06', '2020-02-10', '007/INV-PPP/02/2020', 'Penjualan 007/INV-PPP/02/2020', 0, 29937880, '0000-00-00', 'Post', 'CST0007', 1, '', '2020-02-26 08:57:40'),
(274, '007/SJ-PPP/02/2020', '1105.00', '2020-02-10', '007/INV-PPP/02/2020', 'Penjualan 007/INV-PPP/02/2020', 29937880, 0, '0000-00-00', 'Post', 'CST0007', 1, '', '2020-02-26 08:57:40'),
(275, '050/BKK-PPP/1/2020', '1101.01', '2020-01-27', '050/BKK-PPP/1/2020', 'Beli Bensin Oprs Pick Up, Tol', 0, 103000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(276, '050/BKK-PPP/1/2020', '6408', '2020-01-27', '050/BKK-PPP/1/2020', 'Beli Bensin Oprs Pick Up, Tol', 103000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(277, '050/BKK-PPP/1/2020', '1101.01', '2020-01-27', '050/BKK-PPP/1/2020', 'Beli Bensin Oprs. Solar Forklift', 0, 148792, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(278, '050/BKK-PPP/1/2020', '5725', '2020-01-27', '050/BKK-PPP/1/2020', 'Beli Bensin Oprs. Solar Forklift', 148792, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(279, '050/BKK-PPP/1/2020', '1101.01', '2020-01-27', '050/BKK-PPP/1/2020', 'Bayar Konsumsi Loading, Transport Ke Kasa', 0, 200000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(280, '050/BKK-PPP/1/2020', '5405', '2020-01-27', '050/BKK-PPP/1/2020', 'Bayar Konsumsi Loading, Transport Ke Kasa', 200000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(281, '050/BKK-PPP/1/2020', '1101.01', '2020-01-27', '050/BKK-PPP/1/2020', 'Beli Sapu, Pembersih Lantai ', 0, 156500, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(282, '050/BKK-PPP/1/2020', '7412', '2020-01-27', '050/BKK-PPP/1/2020', 'Beli Sapu, Pembersih Lantai ', 156500, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(283, '050/BKK-PPP/1/2020', '1101.01', '2020-01-27', '050/BKK-PPP/1/2020', 'Beli Jamuan Tamu', 0, 583737, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(284, '050/BKK-PPP/1/2020', '7105', '2020-01-27', '050/BKK-PPP/1/2020', 'Beli Jamuan Tamu', 583737, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(285, '050/BKK-PPP/1/2020', '1101.01', '2020-01-27', '050/BKK-PPP/1/2020', 'Beli Powder, Minyak Indra, Sewa Aki', 0, 178300, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(286, '050/BKK-PPP/1/2020', '5200', '2020-01-27', '050/BKK-PPP/1/2020', 'Beli Powder, Minyak Indra, Sewa Aki', 178300, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(287, '050/BKK-PPP/1/2020', '1101.01', '2020-01-27', '050/BKK-PPP/1/2020', 'Beli Tinta Green Kasa Husada', 0, 1206200, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(288, '050/BKK-PPP/1/2020', '5300', '2020-01-27', '050/BKK-PPP/1/2020', 'Beli Tinta Green Kasa Husada', 1206200, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(289, '051/BKK-PPP/1/2020', '1101.01', '2020-01-22', '051/BKK-PPP/1/2020', 'Bayar Plate, Hotprint', 0, 1669000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(290, '051/BKK-PPP/1/2020', '5200', '2020-01-22', '051/BKK-PPP/1/2020', 'Bayar Plate, Hotprint', 1669000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(291, '051/BKK-PPP/1/2020', '1101.01', '2020-01-22', '051/BKK-PPP/1/2020', 'Beli Bensin ', 0, 64250, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(292, '051/BKK-PPP/1/2020', '5725', '2020-01-22', '051/BKK-PPP/1/2020', 'Beli Bensin ', 64250, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(293, '051/BKK-PPP/1/2020', '1101.01', '2020-01-22', '051/BKK-PPP/1/2020', 'Beli Tinta Best One Utk Ijazah', 0, 218000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(294, '051/BKK-PPP/1/2020', '5200', '2020-01-22', '051/BKK-PPP/1/2020', 'Beli Tinta Best One Utk Ijazah', 218000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(295, '051/BKK-PPP/1/2020', '1101.01', '2020-01-22', '051/BKK-PPP/1/2020', 'Bayar Go Car Ke BPJS Ketenagakerjaan', 0, 99000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(296, '051/BKK-PPP/1/2020', '7203', '2020-01-22', '051/BKK-PPP/1/2020', 'Bayar Go Car Ke BPJS Ketenagakerjaan', 99000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(297, '051/BKK-PPP/1/2020', '1101.01', '2020-01-22', '051/BKK-PPP/1/2020', 'Bayar Fotocopy , Jilid', 0, 81500, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(298, '051/BKK-PPP/1/2020', '7407', '2020-01-22', '051/BKK-PPP/1/2020', 'Bayar Fotocopy , Jilid', 81500, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(299, '051/BKK-PPP/1/2020', '1101.01', '2020-01-22', '051/BKK-PPP/1/2020', 'Beli Jamuan Tamu Stikom', 0, 33000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40');
INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`, `penanggung`, `timestamps`) VALUES
(300, '051/BKK-PPP/1/2020', '7105', '2020-01-22', '051/BKK-PPP/1/2020', 'Beli Jamuan Tamu Stikom', 33000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(301, '052/BKK-PPP/1/2020', '1101.01', '2020-01-29', '052/BKK-PPP/1/2020', 'Bayar Lembur Produksi', 0, 1, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(302, '052/BKK-PPP/1/2020', '5403', '2020-01-29', '052/BKK-PPP/1/2020', 'Bayar Lembur Produksi', 1, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(303, '052/BKK-PPP/1/2020', '1101.01', '2020-01-29', '052/BKK-PPP/1/2020', 'Bayar Lembur Sekretaris', 0, 242300, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(304, '052/BKK-PPP/1/2020', '7103', '2020-01-29', '052/BKK-PPP/1/2020', 'Bayar Lembur Sekretaris', 242300, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(305, '052/BKK-PPP/1/2020', '1101.01', '2020-01-29', '052/BKK-PPP/1/2020', 'Bayar Uang Makan PKL', 0, 3060000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(306, '052/BKK-PPP/1/2020', '5405', '2020-01-29', '052/BKK-PPP/1/2020', 'Bayar Uang Makan PKL', 3060000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(307, '053/BKK-PPP/1/2020', '1101.01', '2020-01-29', '053/BKK-PPP/1/2020', 'Beli Bensin Oprs Pembelian', 0, 85000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(308, '053/BKK-PPP/1/2020', '5725', '2020-01-29', '053/BKK-PPP/1/2020', 'Beli Bensin Oprs Pembelian', 85000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(309, '053/BKK-PPP/1/2020', '1101.01', '2020-01-29', '053/BKK-PPP/1/2020', 'Beli Rilley 142 Utk Mesin', 0, 150000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(310, '053/BKK-PPP/1/2020', '5704', '2020-01-29', '053/BKK-PPP/1/2020', 'Beli Rilley 142 Utk Mesin', 150000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(311, '053/BKK-PPP/1/2020', '1101.01', '2020-01-29', '053/BKK-PPP/1/2020', 'Beli Tespen, Lem, Flat Socket, Silicon, Abc Wash, Oo Vernish', 0, 826400, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(312, '053/BKK-PPP/1/2020', '5200', '2020-01-29', '053/BKK-PPP/1/2020', 'Beli Tespen, Lem, Flat Socket, Silicon, Abc Wash, Oo Vernish', 826400, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(313, '053/BKK-PPP/1/2020', '1101.01', '2020-01-29', '053/BKK-PPP/1/2020', 'Bayar Perbaikan Motor Pembelian', 0, 180000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(314, '053/BKK-PPP/1/2020', '5707', '2020-01-29', '053/BKK-PPP/1/2020', 'Bayar Perbaikan Motor Pembelian', 180000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(315, '053/BKK-PPP/1/2020', '1101.01', '2020-01-29', '053/BKK-PPP/1/2020', 'Beli ATK Dan Pembuatan Papan Mrktg', 0, 215800, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(316, '053/BKK-PPP/1/2020', '6402', '2020-01-29', '053/BKK-PPP/1/2020', 'Beli ATK Dan Pembuatan Papan Mrktg', 215800, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(317, '053/BKK-PPP/1/2020', '1101.01', '2020-01-29', '053/BKK-PPP/1/2020', 'Bayar Plate Utk Cover Buku, Ijazah', 0, 570000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(318, '053/BKK-PPP/1/2020', '5200', '2020-01-29', '053/BKK-PPP/1/2020', 'Bayar Plate Utk Cover Buku, Ijazah', 570000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(319, '053/BKK-PPP/1/2020', '1101.01', '2020-01-29', '053/BKK-PPP/1/2020', 'Byr Konsumsi Loading Buk, Kasa', 0, 75000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(320, '053/BKK-PPP/1/2020', '5405', '2020-01-29', '053/BKK-PPP/1/2020', 'Byr Konsumsi Loading Buk, Kasa', 75000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(321, '054/BKK-PPP/1/2020', '1101.01', '2020-01-31', '054/BKK-PPP/1/2020', 'Bayar Iuran RT Rw Karpil', 0, 350000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(322, '054/BKK-PPP/1/2020', '7417', '2020-01-31', '054/BKK-PPP/1/2020', 'Bayar Iuran RT Rw Karpil', 350000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(323, '054/BKK-PPP/1/2020', '1101.01', '2020-01-31', '054/BKK-PPP/1/2020', 'Bayar Transport Ke Notaris', 0, 55000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(324, '054/BKK-PPP/1/2020', '7203', '2020-01-31', '054/BKK-PPP/1/2020', 'Bayar Transport Ke Notaris', 55000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(325, '054/BKK-PPP/1/2020', '1101.01', '2020-01-31', '054/BKK-PPP/1/2020', 'Bayar Pelatihan (biaya Akomodasi)', 0, 1330000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(326, '054/BKK-PPP/1/2020', '7115', '2020-01-31', '054/BKK-PPP/1/2020', 'Bayar Pelatihan (biaya Akomodasi)', 1330000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(327, '054/BKK-PPP/1/2020', '1101.01', '2020-01-31', '054/BKK-PPP/1/2020', 'Beli Kabel, Majun, Las, ', 0, 165000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(328, '054/BKK-PPP/1/2020', '5200', '2020-01-31', '054/BKK-PPP/1/2020', 'Beli Kabel, Majun, Las, ', 165000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(329, '054/BKK-PPP/1/2020', '1101.01', '2020-01-31', '054/BKK-PPP/1/2020', 'Beli Beras Koperasi', 0, 480000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(330, '054/BKK-PPP/1/2020', '7105', '2020-01-31', '054/BKK-PPP/1/2020', 'Beli Beras Koperasi', 480000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(331, '054/BKK-PPP/1/2020', '1101.01', '2020-01-31', '054/BKK-PPP/1/2020', 'Bayar Tiki Kirim Ke SUmsel', 0, 159000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(332, '054/BKK-PPP/1/2020', '6403', '2020-01-31', '054/BKK-PPP/1/2020', 'Bayar Tiki Kirim Ke SUmsel', 159000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(333, '054/BKK-PPP/1/2020', '1101.01', '2020-01-31', '054/BKK-PPP/1/2020', 'Beli Bensin Oprs Pembelian, solar forklift', 0, 78000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(334, '054/BKK-PPP/1/2020', '5725', '2020-01-31', '054/BKK-PPP/1/2020', 'Beli Bensin Oprs Pembelian, solar forklift', 78000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(335, '054/BKK-PPP/1/2020', '1101.01', '2020-01-31', '054/BKK-PPP/1/2020', 'Bayar Plate Ijazah', 0, 120000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(336, '054/BKK-PPP/1/2020', '5200', '2020-01-31', '054/BKK-PPP/1/2020', 'Bayar Plate Ijazah', 120000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(337, '054/BKK-PPP/1/2020', '1101.01', '2020-01-31', '054/BKK-PPP/1/2020', 'Bayar Jilid, ATK', 0, 149500, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(338, '054/BKK-PPP/1/2020', '7407', '2020-01-31', '054/BKK-PPP/1/2020', 'Bayar Jilid, ATK', 149500, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(339, '054/BKK-PPP/1/2020', '1101.01', '2020-01-31', '054/BKK-PPP/1/2020', 'Bayar BPJS Kesehatan', 0, 642500, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(340, '054/BKK-PPP/1/2020', '7104', '2020-01-31', '054/BKK-PPP/1/2020', 'Bayar BPJS Kesehatan', 642500, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(341, '055/BKK-PPP/1/2020', '1101.01', '2020-01-31', '055/BKK-PPP/1/2020', 'Biaya Perjalanan Dinas Marketing Bp Aunur Rofiq Ke Bengkulu, Semarang, Jakarta', 0, 2674600, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(342, '055/BKK-PPP/1/2020', '6407', '2020-01-31', '055/BKK-PPP/1/2020', 'Biaya Perjalanan Dinas Marketing Bp Aunur Rofiq Ke Bengkulu, Semarang, Jakarta', 2674600, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(343, '056/BKK-PPP/1/2020', '1101.01', '2020-01-31', '056/BKK-PPP/1/2020', 'Bayar JNE Pengiriman Paspor', 0, 96000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(344, '056/BKK-PPP/1/2020', '7409', '2020-01-31', '056/BKK-PPP/1/2020', 'Bayar JNE Pengiriman Paspor', 96000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(345, '056/BKK-PPP/1/2020', '1101.01', '2020-01-31', '056/BKK-PPP/1/2020', 'Bayar Go Car Ke Pajak Jagir', 0, 100000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(346, '056/BKK-PPP/1/2020', '7203', '2020-01-31', '056/BKK-PPP/1/2020', 'Bayar Go Car Ke Pajak Jagir', 100000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(347, '056/BKK-PPP/1/2020', '1101.01', '2020-01-31', '056/BKK-PPP/1/2020', 'Bayar Perbaikan CCTV Dan Konsumsi', 0, 879000, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(348, '056/BKK-PPP/1/2020', '7305', '2020-01-31', '056/BKK-PPP/1/2020', 'Bayar Perbaikan CCTV Dan Konsumsi', 879000, 0, '0000-00-00', 'Post', '', 1, 'dian', '2020-02-26 08:57:40'),
(349, '057/BBM-PPP/1/2020', '1102.02', '2020-01-09', '057/BBM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Bapak Widodo', 28413600, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(350, '057/BBM-PPP/1/2020', '1105.00', '2020-01-09', '057/BBM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Bapak Widodo', 0, 28413600, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(351, '058/BBM-PPP/1/2020', '1102.02', '2020-01-10', '058/BBM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Bapak Adi Munif Bambang', 5682960, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(352, '058/BBM-PPP/1/2020', '1105.00', '2020-01-10', '058/BBM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Bapak Adi Munif Bambang', 0, 5682960, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(353, '059/BBM-PPP/1/2020', '1102.02', '2020-01-12', '059/BBM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Bapak Widodo', 44655120, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(354, '059/BBM-PPP/1/2020', '1105.00', '2020-01-12', '059/BBM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Bapak Widodo', 0, 44655120, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(355, '060/BBM-PPP/1/2020', '1102.02', '2020-01-13', '060/BBM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Ibu Citra', 16777200, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(356, '060/BBM-PPP/1/2020', '1105.00', '2020-01-13', '060/BBM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Ibu Citra', 0, 16777200, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(357, '061/BBM-PPP/1/2020', '1102.02', '2020-01-14', '061/BBM-PPP/1/2020', 'Pendapatan Affal', 3500000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(358, '061/BBM-PPP/1/2020', '8199', '2020-01-14', '061/BBM-PPP/1/2020', 'Pendapatan Affal', 0, 3500000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(359, '062/BBM-PPP/1/2020', '1102.02', '2020-01-15', '062/BBM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Dari Pak Dilang', 9794250, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(360, '062/BBM-PPP/1/2020', '1105.00', '2020-01-15', '062/BBM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Dari Pak Dilang', 0, 9794250, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(361, '063/BBM-PPP/1/2020', '1102.02', '2020-01-15', '063/BBM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Bapak Widodo', 31062720, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(362, '063/BBM-PPP/1/2020', '1105.00', '2020-01-15', '063/BBM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Bapak Widodo', 0, 31062720, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(363, '063/BBM-PPP/1/2020', '1102.02', '2020-01-15', '063/BBM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Bp Imran Amza', 50000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(364, '063/BBM-PPP/1/2020', '1105.00', '2020-01-15', '063/BBM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Bp Imran Amza', 0, 50000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(365, '063/BBM-PPP/1/2020', '1102.02', '2020-01-15', '063/BBM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Bp Edy Riyanto', 49660960, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(366, '063/BBM-PPP/1/2020', '1105.00', '2020-01-15', '063/BBM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Bp Edy Riyanto', 0, 49660960, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(367, '064/BBK-PPP/1/2020', '1102.02', '2020-01-15', '064/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Balebat', 0, 50000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(368, '064/BBK-PPP/1/2020', '2198.50', '2020-01-15', '064/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Balebat', 50000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(369, '065/BBM-PPP/1/2020', '1102.02', '2020-01-15', '065/BBM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Bp Adi Minif Bambang', 20254800, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(370, '065/BBM-PPP/1/2020', '1105.00', '2020-01-15', '065/BBM-PPP/1/2020', 'Terima Dr Pembayaran Buku K13 Bp Adi Minif Bambang', 0, 20254800, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(377, '068/BBM-PPP/1/2020', '1102.02', '2020-01-15', '068/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Bapak Supolo', 3653100, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(378, '068/BBM-PPP/1/2020', '1105.00', '2020-01-15', '068/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Bapak Supolo', 0, 3653100, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(379, '069/BBK-PPP/1/2020', '1102.02', '2020-01-15', '069/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Balebat', 0, 40000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(380, '069/BBK-PPP/1/2020', '2198.50', '2020-01-15', '069/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Balebat', 40000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(381, '070/BBM-PPP/1/2020', '1102.02', '2020-01-15', '070/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Bapak Edi R', 25000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(382, '070/BBM-PPP/1/2020', '1105.00', '2020-01-15', '070/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Bapak Edi R', 0, 25000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(383, '071/BBM-PPP/1/2020', '1102.02', '2020-01-15', '071/BBM-PPP/1/2020', 'Pengembalian Kelebihan Bayar Best Jaya Sukses', 5228020, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(384, '071/BBM-PPP/1/2020', '2103.00', '2020-01-15', '071/BBM-PPP/1/2020', 'Pengembalian Kelebihan Bayar Best Jaya Sukses', 0, 5228020, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(385, '072/BBK-PPP/1/2020', '1102.02', '2020-01-15', '072/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Balebat', 0, 10000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(386, '072/BBK-PPP/1/2020', '2198.50', '2020-01-15', '072/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Balebat', 10000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(387, '073/BBM-PPP/1/2020', '1102.02', '2020-01-16', '073/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Jaya Madinah', 6642000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(388, '073/BBM-PPP/1/2020', '1105.00', '2020-01-16', '073/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Jaya Madinah', 0, 6642000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(389, '073/BBM-PPP/1/2020', '1102.02', '2020-01-16', '073/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Bapak Widodo', 27578160, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(390, '073/BBM-PPP/1/2020', '1105.00', '2020-01-16', '073/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Bapak Widodo', 0, 27578160, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(391, '074/BBK-PPP/1/2020', '1102.02', '2020-01-16', '074/BBK-PPP/1/2020', 'Biaya Pengurusan Visa', 0, 17100000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(392, '074/BBK-PPP/1/2020', '7412', '2020-01-16', '074/BBK-PPP/1/2020', 'Biaya Pengurusan Visa', 17100000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(393, '075/BBM-PPP/1/2020', '1102.02', '2020-01-17', '075/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari KASA', 14190000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(394, '075/BBM-PPP/1/2020', '1105.00', '2020-01-17', '075/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari KASA', 0, 14190000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(395, '076/BBM-PPP/1/2020', '1102.02', '2020-01-18', '076/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Bapak Widodo', 32222400, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(396, '076/BBM-PPP/1/2020', '1105.00', '2020-01-18', '076/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Bapak Widodo', 0, 32222400, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(397, '077/BBM-PPP/1/2020', '1102.02', '2020-01-20', '077/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Pak Yasin', 17055500, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(398, '077/BBM-PPP/1/2020', '1105.00', '2020-01-20', '077/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Pak Yasin', 0, 17055500, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(399, '078/BBM-PPP/1/2020', '1102.02', '2020-01-20', '078/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Ibu Citra', 14040000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(400, '078/BBM-PPP/1/2020', '1105.00', '2020-01-20', '078/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Ibu Citra', 0, 14040000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(621, '104/BBM-PPP/1/2020', '1102.02', '2020-01-28', '104/BBM-PPP/1/2020', 'Terima Pembayaran Dari Rumah Cetak Kita', 15988280, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 10:02:02'),
(622, '104/BBM-PPP/1/2020', '1105.00', '2020-01-28', '104/BBM-PPP/1/2020', 'Terima Pembayaran Dari Rumah Cetak Kita', 0, 15988280, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 10:02:10'),
(405, '079/BBK-PPP/1/2020', '1102.02', '2020-01-21', '079/BBK-PPP/1/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(406, '079/BBK-PPP/1/2020', '8201', '2020-01-21', '079/BBK-PPP/1/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(407, '080/BBM-PPP/1/2020', '1102.02', '2020-01-21', '080/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Bapak Siswadi', 8000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(408, '080/BBM-PPP/1/2020', '1105.00', '2020-01-21', '080/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Bapak Siswadi', 0, 8000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(409, '081/BBK-PPP/1/2020', '1102.02', '2020-01-22', '081/BBK-PPP/1/2020', 'Bayar Cicilan Leasing Mobil Innova', 0, 5841000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(410, '081/BBK-PPP/1/2020', '2198.50', '2020-01-22', '081/BBK-PPP/1/2020', 'Bayar Cicilan Leasing Mobil Innova', 5841000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(411, '082/BBK-PPP/1/2020', '1102.02', '2020-01-22', '082/BBK-PPP/1/2020', 'Bayar Hutang UV Pak Syaiful', 0, 2797000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(412, '082/BBK-PPP/1/2020', '2103.00', '2020-01-22', '082/BBK-PPP/1/2020', 'Bayar Hutang UV Pak Syaiful', 2797000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(413, '082/BBK-PPP/1/2020', '1102.02', '2020-01-22', '082/BBK-PPP/1/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(414, '082/BBK-PPP/1/2020', '8201', '2020-01-22', '082/BBK-PPP/1/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(415, '041/SJ-PPP/02/2020', '4101.06', '2020-02-13', '041/INV-PPP/02/2020', 'Penjualan 041/INV-PPP/02/2020', 0, 55577100, '0000-00-00', 'Post', 'CST0008', 1, '', '2020-02-26 08:57:40'),
(416, '041/SJ-PPP/02/2020', '1105.00', '2020-02-13', '041/INV-PPP/02/2020', 'Penjualan 041/INV-PPP/02/2020', 55577100, 0, '0000-00-00', 'Post', 'CST0008', 1, '', '2020-02-26 08:57:40'),
(417, '040/SJ-PPP/02/2020', '4101.06', '2020-02-13', '040/INV-PPP/02/2020', 'Penjualan 040/INV-PPP/02/2020', 0, 16650000, '0000-00-00', 'Post', 'CST0008', 1, '', '2020-02-26 08:57:40'),
(418, '040/SJ-PPP/02/2020', '1105.00', '2020-02-13', '040/INV-PPP/02/2020', 'Penjualan 040/INV-PPP/02/2020', 16650000, 0, '0000-00-00', 'Post', 'CST0008', 1, '', '2020-02-26 08:57:40'),
(419, '039/SJ-PPP/02/2020', '4101.06', '2020-02-13', '039/INV-PPP/02/2020', 'Penjualan 039/INV-PPP/02/2020', 0, 30804605, '0000-00-00', 'Post', 'CST0008', 1, '', '2020-02-26 08:57:40'),
(420, '039/SJ-PPP/02/2020', '1105.00', '2020-02-13', '039/INV-PPP/02/2020', 'Penjualan 039/INV-PPP/02/2020', 30804605, 0, '0000-00-00', 'Post', 'CST0008', 1, '', '2020-02-26 08:57:40'),
(421, '038/SJ-PPP/02/2020', '4101.06', '2020-02-13', '038/INV-PPP/02/2020', 'Penjualan 038/INV-PPP/02/2020', 0, 3653100, '0000-00-00', 'Post', 'CST0009', 1, '', '2020-02-26 08:57:40'),
(422, '038/SJ-PPP/02/2020', '1105.00', '2020-02-13', '038/INV-PPP/02/2020', 'Penjualan 038/INV-PPP/02/2020', 3653100, 0, '0000-00-00', 'Post', 'CST0009', 1, '', '2020-02-26 08:57:40'),
(423, '037/SJ-PPP/02/2020', '4101.06', '2020-02-13', '037/INV-PPP/02/2020', 'Penjualan 037/INV-PPP/02/2020', 0, 9794250, '0000-00-00', 'Post', 'CST0014', 1, '', '2020-02-26 08:57:40'),
(424, '037/SJ-PPP/02/2020', '1105.00', '2020-02-13', '037/INV-PPP/02/2020', 'Penjualan 037/INV-PPP/02/2020', 9794250, 0, '0000-00-00', 'Post', 'CST0014', 1, '', '2020-02-26 08:57:40'),
(425, '036/SJ-PPP/02/2020', '4101.06', '2020-02-13', '036/INV-PPP/02/2020', 'Penjualan 036/INV-PPP/02/2020', 0, 14040000, '0000-00-00', 'Post', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(426, '036/SJ-PPP/02/2020', '1105.00', '2020-02-13', '036/INV-PPP/02/2020', 'Penjualan 036/INV-PPP/02/2020', 14040000, 0, '0000-00-00', 'Post', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(427, '035/SJ-PPP/02/2020', '4101.06', '2020-02-13', '035/INV-PPP/02/2020', 'Penjualan 035/INV-PPP/02/2020', 0, 9996750, '0000-00-00', 'Post', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(428, '035/SJ-PPP/02/2020', '1105.00', '2020-02-13', '035/INV-PPP/02/2020', 'Penjualan 035/INV-PPP/02/2020', 9996750, 0, '0000-00-00', 'Post', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(429, '034/SJ-PPP/02/2020', '4101.06', '2020-02-13', '034/INV-PPP/02/2020', 'Penjualan 034/INV-PPP/02/2020', 0, 11143845, '0000-00-00', 'Post', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(430, '034/SJ-PPP/02/2020', '1105.00', '2020-02-13', '034/INV-PPP/02/2020', 'Penjualan 034/INV-PPP/02/2020', 11143845, 0, '0000-00-00', 'Post', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(431, '033/SJ-PPP/02/2020', '4101.06', '2020-02-13', '033/INV-PPP/02/2020', 'Penjualan 033/INV-PPP/02/2020', 0, 19556250, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(432, '033/SJ-PPP/02/2020', '1105.00', '2020-02-13', '033/INV-PPP/02/2020', 'Penjualan 033/INV-PPP/02/2020', 19556250, 0, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(433, '032/SJ-PPP/02/2020', '4101.06', '2020-02-13', '032/INV-PPP/02/2020', 'Penjualan 032/INV-PPP/02/2020', 0, 4984470, '0000-00-00', 'Post', 'CST0014', 1, '', '2020-02-26 08:57:40'),
(434, '032/SJ-PPP/02/2020', '1105.00', '2020-02-13', '032/INV-PPP/02/2020', 'Penjualan 032/INV-PPP/02/2020', 4984470, 0, '0000-00-00', 'Post', 'CST0014', 1, '', '2020-02-26 08:57:40'),
(435, '031/SJ-PPP/02/2020', '4101.06', '2020-02-13', '031/INV-PPP/02/2020', 'Penjualan 031/INV-PPP/02/2020', 0, 25562640, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(436, '031/SJ-PPP/02/2020', '1105.00', '2020-02-13', '031/INV-PPP/02/2020', 'Penjualan 031/INV-PPP/02/2020', 25562640, 0, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(437, '030/SJ-PPP/02/2020', '4101.06', '2020-02-13', '030/INV-PPP/02/2020', 'Penjualan 030/INV-PPP/02/2020', 0, 6840000, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(438, '030/SJ-PPP/02/2020', '1105.00', '2020-02-13', '030/INV-PPP/02/2020', 'Penjualan 030/INV-PPP/02/2020', 6840000, 0, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(439, '029/SJ-PPP/02/2020', '4101.06', '2020-02-13', '029/INV-PPP/02/2020', 'Penjualan 029/INV-PPP/02/2020', 0, 13174000, '0000-00-00', 'Post', 'CST0007', 1, '', '2020-02-26 08:57:40'),
(440, '029/SJ-PPP/02/2020', '1105.00', '2020-02-13', '029/INV-PPP/02/2020', 'Penjualan 029/INV-PPP/02/2020', 13174000, 0, '0000-00-00', 'Post', 'CST0007', 1, '', '2020-02-26 08:57:40'),
(441, '028/SJ-PPP/02/2020', '4101.06', '2020-02-13', '028/INV-PPP/02/2020', 'Penjualan 028/INV-PPP/02/2020', 0, 32222400, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(442, '028/SJ-PPP/02/2020', '1105.00', '2020-02-13', '028/INV-PPP/02/2020', 'Penjualan 028/INV-PPP/02/2020', 32222400, 0, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(443, '027/SJ-PPP/02/2020', '4101.06', '2020-02-13', '027/INV-PPP/02/2020', 'Penjualan 027/INV-PPP/02/2020', 0, 27578160, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(444, '027/SJ-PPP/02/2020', '1105.00', '2020-02-13', '027/INV-PPP/02/2020', 'Penjualan 027/INV-PPP/02/2020', 27578160, 0, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(445, '026/SJ-PPP/02/2020', '4101.06', '2020-02-13', '026/INV-PPP/02/2020', 'Penjualan 026/INV-PPP/02/2020', 0, 11400000, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(446, '026/SJ-PPP/02/2020', '1105.00', '2020-02-13', '026/INV-PPP/02/2020', 'Penjualan 026/INV-PPP/02/2020', 11400000, 0, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(447, '025/SJ-PPP/02/2020', '4101.06', '2020-02-13', '025/INV-PPP/02/2020', 'Penjualan 025/INV-PPP/02/2020', 0, 50968320, '0000-00-00', 'Post', 'CST0003', 1, '', '2020-02-26 08:57:40'),
(448, '025/SJ-PPP/02/2020', '1105.00', '2020-02-13', '025/INV-PPP/02/2020', 'Penjualan 025/INV-PPP/02/2020', 50968320, 0, '0000-00-00', 'Post', 'CST0003', 1, '', '2020-02-26 08:57:40'),
(449, '024/SJ-PPP/02/2020', '4101.06', '2020-02-13', '024/INV-PPP/02/2020', 'Penjualan 024/INV-PPP/02/2020', 0, 3271320, '0000-00-00', 'Post', 'CST0009', 1, '', '2020-02-26 08:57:40'),
(450, '024/SJ-PPP/02/2020', '1105.00', '2020-02-13', '024/INV-PPP/02/2020', 'Penjualan 024/INV-PPP/02/2020', 3271320, 0, '0000-00-00', 'Post', 'CST0009', 1, '', '2020-02-26 08:57:40'),
(451, '023/SJ-PPP/02/2020', '4101.06', '2020-02-13', '023/INV-PPP/02/2020', 'Penjualan 023/INV-PPP/02/2020', 0, 24047568, '0000-00-00', 'Post', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(452, '023/SJ-PPP/02/2020', '1105.00', '2020-02-13', '023/INV-PPP/02/2020', 'Penjualan 023/INV-PPP/02/2020', 24047568, 0, '0000-00-00', 'Post', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(453, '022/SJ-PPP/02/2020', '4101.06', '2020-02-13', '022/INV-PPP/02/2020', 'Penjualan 022/INV-PPP/02/2020', 0, 1005144, '0000-00-00', 'Post', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(454, '022/SJ-PPP/02/2020', '1105.00', '2020-02-13', '022/INV-PPP/02/2020', 'Penjualan 022/INV-PPP/02/2020', 1005144, 0, '0000-00-00', 'Post', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(455, '021/SJ-PPP/02/2020', '4101.06', '2020-02-13', '021/INV-PPP/02/2020', 'Penjualan 021/INV-PPP/02/2020', 0, 34914000, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(456, '021/SJ-PPP/02/2020', '1105.00', '2020-02-13', '021/INV-PPP/02/2020', 'Penjualan 021/INV-PPP/02/2020', 34914000, 0, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(457, '020/SJ-PPP/02/2020', '4101.06', '2020-02-13', '020/INV-PPP/02/2020', 'Penjualan 020/INV-PPP/02/2020', 0, 48834720, '0000-00-00', 'Post', 'CST0003', 1, '', '2020-02-26 08:57:40'),
(458, '020/SJ-PPP/02/2020', '1105.00', '2020-02-13', '020/INV-PPP/02/2020', 'Penjualan 020/INV-PPP/02/2020', 48834720, 0, '0000-00-00', 'Post', 'CST0003', 1, '', '2020-02-26 08:57:40'),
(459, '019/SJ-PPP/02/2020', '4101.06', '2020-02-13', '019/INV-PPP/02/2020', 'Penjualan 019/INV-PPP/02/2020', 0, 4342520, '0000-00-00', 'Post', 'CST0010', 1, '', '2020-02-26 08:57:40'),
(460, '019/SJ-PPP/02/2020', '1105.00', '2020-02-13', '019/INV-PPP/02/2020', 'Penjualan 019/INV-PPP/02/2020', 4342520, 0, '0000-00-00', 'Post', 'CST0010', 1, '', '2020-02-26 08:57:40'),
(461, '018/SJ-PPP/02/2020', '4101.06', '2020-02-13', '018/INV-PPP/02/2020', 'Penjualan 018/INV-PPP/02/2020', 0, 80409375, '0000-00-00', 'Post', 'CST0011', 1, '', '2020-02-26 08:57:40'),
(462, '018/SJ-PPP/02/2020', '1105.00', '2020-02-13', '018/INV-PPP/02/2020', 'Penjualan 018/INV-PPP/02/2020', 80409375, 0, '0000-00-00', 'Post', 'CST0011', 1, '', '2020-02-26 08:57:40'),
(463, '017/SJ-PPP/02/2020', '4101.06', '2020-02-13', '017/INV-PPP/02/2020', 'Penjualan 017/INV-PPP/02/2020', 0, 11143880, '0000-00-00', 'Post', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(464, '017/SJ-PPP/02/2020', '1105.00', '2020-02-13', '017/INV-PPP/02/2020', 'Penjualan 017/INV-PPP/02/2020', 11143880, 0, '0000-00-00', 'Post', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(465, '016/SJ-PPP/02/2020', '4101.06', '2020-02-12', '016/INV-PPP/02/2020', 'Penjualan 016/INV-PPP/02/2020', 0, 43103280, '0000-00-00', 'Post', 'CST0003', 1, '', '2020-02-26 08:57:40'),
(466, '016/SJ-PPP/02/2020', '1105.00', '2020-02-12', '016/INV-PPP/02/2020', 'Penjualan 016/INV-PPP/02/2020', 43103280, 0, '0000-00-00', 'Post', 'CST0003', 1, '', '2020-02-26 08:57:40'),
(467, '009/SJ-PPP/02/2020', '4101.06', '2020-02-12', '009/INV-PPP/02/2020', 'Penjualan 009/INV-PPP/02/2020', 0, 13708950, '0000-00-00', 'Post', 'CST0015', 1, '', '2020-02-26 08:57:40'),
(468, '009/SJ-PPP/02/2020', '1105.00', '2020-02-12', '009/INV-PPP/02/2020', 'Penjualan 009/INV-PPP/02/2020', 13708950, 0, '0000-00-00', 'Post', 'CST0015', 1, '', '2020-02-26 08:57:40'),
(469, '015/SJ-PPP/02/2020', '4101.06', '2020-02-12', '015/INV-PPP/02/2020', 'Penjualan 015/INV-PPP/02/2020', 0, 28413600, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(470, '015/SJ-PPP/02/2020', '1105.00', '2020-02-12', '015/INV-PPP/02/2020', 'Penjualan 015/INV-PPP/02/2020', 28413600, 0, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(471, '014/SJ-PPP/02/2020', '4101.06', '2020-02-12', '014/INV-PPP/02/2020', 'Penjualan 014/INV-PPP/02/2020', 0, 44655120, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(472, '014/SJ-PPP/02/2020', '1105.00', '2020-02-12', '014/INV-PPP/02/2020', 'Penjualan 014/INV-PPP/02/2020', 44655120, 0, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(473, '013/SJ-PPP/02/2020', '4101.06', '2020-02-12', '013/INV-PPP/02/2020', 'Penjualan 013/INV-PPP/02/2020', 0, 16777200, '0000-00-00', 'Post', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(474, '013/SJ-PPP/02/2020', '1105.00', '2020-02-12', '013/INV-PPP/02/2020', 'Penjualan 013/INV-PPP/02/2020', 16777200, 0, '0000-00-00', 'Post', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(475, '012/SJ-PPP/02/2020', '4101.06', '2020-02-12', '012/INV-PPP/02/2020', 'Penjualan 012/INV-PPP/02/2020', 0, 31147200, '0000-00-00', 'Post', 'CST0003', 1, '', '2020-02-26 08:57:40'),
(476, '012/SJ-PPP/02/2020', '1105.00', '2020-02-12', '012/INV-PPP/02/2020', 'Penjualan 012/INV-PPP/02/2020', 31147200, 0, '0000-00-00', 'Post', 'CST0003', 1, '', '2020-02-26 08:57:40'),
(477, '011/SJ-PPP/02/2020', '4101.06', '2020-02-12', '011/INV-PPP/02/2020', 'Penjualan 011/INV-PPP/02/2020', 0, 13805520, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(478, '011/SJ-PPP/02/2020', '1105.00', '2020-02-12', '011/INV-PPP/02/2020', 'Penjualan 011/INV-PPP/02/2020', 13805520, 0, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(479, '010/SJ-PPP/02/2020', '4101.06', '2020-02-12', '010/INV-PPP/02/2020', 'Penjualan 010/INV-PPP/02/2020', 0, 30803520, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(480, '010/SJ-PPP/02/2020', '1105.00', '2020-02-12', '010/INV-PPP/02/2020', 'Penjualan 010/INV-PPP/02/2020', 30803520, 0, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(481, '042/SJ-PPP/02/2020', '4101.06', '2020-02-13', '042/INV-PPP/02/2020', 'Penjualan 042/INV-PPP/02/2020', 0, 440640, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(482, '042/SJ-PPP/02/2020', '1105.00', '2020-02-13', '042/INV-PPP/02/2020', 'Penjualan 042/INV-PPP/02/2020', 440640, 0, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(483, '043/SJ-PPP/02/2020', '4101.06', '2020-02-13', '043/INV-PPP/02/2020', 'Penjualan 043/INV-PPP/02/2020', 0, 182400, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(484, '043/SJ-PPP/02/2020', '1105.00', '2020-02-13', '043/INV-PPP/02/2020', 'Penjualan 043/INV-PPP/02/2020', 182400, 0, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(485, '044/SJ-PPP/02/2020', '4101.06', '2020-02-13', '044/INV-PPP/02/2020', 'Penjualan 044/INV-PPP/02/2020', 0, 183250, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(486, '044/SJ-PPP/02/2020', '1105.00', '2020-02-13', '044/INV-PPP/02/2020', 'Penjualan 044/INV-PPP/02/2020', 183250, 0, '0000-00-00', 'Post', 'CST0004', 1, '', '2020-02-26 08:57:40'),
(487, '001/BKM-PPP/2/2020', '1101.01', '2020-02-01', '001/BKM-PPP/2/2020', 'Terima Dr Pembayaran Buku K13 Bpk Yasin', 8872000, 0, '0000-00-00', '', '', 1, 'dian', '2020-02-26 09:49:38'),
(488, '001/BKM-PPP/2/2020', '1105.00', '2020-02-01', '001/BKM-PPP/2/2020', 'Terima Dr Pembayaran Buku K13 Bpk Yasin', 0, 8872000, '0000-00-00', '', '', 1, 'dian', '2020-02-26 09:49:50'),
(489, '002/BBM-PPP/2/2020', '1102.02', '2020-02-01', '002/BBM-PPP/2/2020', 'Terima Dr Pembayaran Buku  Bp Yasin ', 20000000, 0, '0000-00-00', '', '', 1, 'dian', '2020-02-26 09:50:04'),
(490, '002/BBM-PPP/2/2020', '1105.00', '2020-02-01', '002/BBM-PPP/2/2020', 'Terima Dr Pembayaran Buku  Bp Yasin ', 0, 20000000, '0000-00-00', '', '', 1, 'dian', '2020-02-26 09:50:12'),
(491, '003/BBK-PPP/2/2020', '1102.02', '2020-02-01', '003/BBK-PPP/2/2020', 'Biaya Admin Mandiri', 0, 31000, '0000-00-00', '', '', 1, 'dian', '2020-02-26 09:50:27'),
(492, '003/BBK-PPP/2/2020', '8201', '2020-02-01', '003/BBK-PPP/2/2020', 'Biaya Admin Mandiri', 31000, 0, '0000-00-00', '', '', 1, 'dian', '2020-02-26 09:53:40'),
(493, '004/BBK-PPP/2/2020', '1102.02', '2020-02-01', '004/BBK-PPP/2/2020', 'Bayar Gaji Komisaris', 0, 21600000, '0000-00-00', '', '', 1, 'dian', '2020-02-26 09:53:35'),
(494, '004/BBK-PPP/2/2020', '7101', '2020-02-01', '004/BBK-PPP/2/2020', 'Bayar Gaji Komisaris', 21600000, 0, '0000-00-00', '', '', 1, 'dian', '2020-02-26 09:53:31'),
(495, '005/BBM-PPP/2/2020', '1102.02', '2020-02-03', '005/BBM-PPP/2/2020', 'Terima Dr Pinjaman UMKM Jatim', 785331000, 0, '0000-00-00', '', '', 1, 'dian', '2020-02-26 09:53:25'),
(496, '005/BBM-PPP/2/2020', '2203.03', '2020-02-03', '005/BBM-PPP/2/2020', 'Terima Dr Pinjaman UMKM Jatim', 0, 785331000, '0000-00-00', '', '', 1, 'dian', '2020-02-26 09:53:20'),
(505, '083/BBK-PPP/1/2020', '1102.02', '2020-01-22', '083/BBK-PPP/1/2020', 'Bayar Chemical Ke Dwi Tanggal Jaya', 0, 5405000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(506, '083/BBK-PPP/1/2020', '2103.00', '2020-01-22', '083/BBK-PPP/1/2020', 'Bayar Chemical Ke Dwi Tanggal Jaya', 5405000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(507, '083/BBK-PPP/1/2020', '1102.02', '2020-01-22', '083/BBK-PPP/1/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(508, '083/BBK-PPP/1/2020', '8201', '2020-01-22', '083/BBK-PPP/1/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(509, '006/BBK-PPP/2/2020', '1102.02', '2020-02-03', '006/BBK-PPP/2/2020', 'Bayar 30 Persen Mesin Case Maker', 0, 171000000, '0000-00-00', '', '', 1, 'dian', '2020-02-26 09:53:07'),
(510, '006/BBK-PPP/2/2020', '2198.50', '2020-02-03', '006/BBK-PPP/2/2020', 'Bayar 30 Persen Mesin Case Maker', 171000000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-05 06:28:10'),
(511, '006/BBK-PPP/2/2020', '1102.02', '2020-02-03', '006/BBK-PPP/2/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', '', '', 1, 'dian', '2020-02-26 09:53:00'),
(512, '006/BBK-PPP/2/2020', '8201', '2020-02-03', '006/BBK-PPP/2/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', '', '', 1, 'dian', '2020-02-26 09:52:55'),
(513, '084/BBK-PPP/1/2020', '1102.02', '2020-01-22', '084/BBK-PPP/1/2020', 'Bayar Recover Roll Matrix', 0, 3925228, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(514, '084/BBK-PPP/1/2020', '2103.00', '2020-01-22', '084/BBK-PPP/1/2020', 'Bayar Recover Roll Matrix', 3925228, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(515, '084/BBK-PPP/1/2020', '1102.02', '2020-01-22', '084/BBK-PPP/1/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(516, '084/BBK-PPP/1/2020', '8201', '2020-01-22', '084/BBK-PPP/1/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(517, '085/BBK-PPP/1/2020', '1102.02', '2020-01-22', '085/BBK-PPP/1/2020', 'Bayar Pick Up Ke Pak Heri', 0, 1850000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(518, '085/BBK-PPP/1/2020', '2103.00', '2020-01-22', '085/BBK-PPP/1/2020', 'Bayar Pick Up Ke Pak Heri', 1850000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(519, '085/BBK-PPP/1/2020', '1102.02', '2020-01-22', '085/BBK-PPP/1/2020', 'Bayar Bearing Pt Sentral Laharindo', 0, 429000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(520, '085/BBK-PPP/1/2020', '2103.00', '2020-01-22', '085/BBK-PPP/1/2020', 'Bayar Bearing Pt Sentral Laharindo', 429000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(521, '085/BBK-PPP/1/2020', '1102.02', '2020-01-22', '085/BBK-PPP/1/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(522, '085/BBK-PPP/1/2020', '8201', '2020-01-22', '085/BBK-PPP/1/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(523, '085/BBK-PPP/1/2020', '1102.02', '2020-01-22', '085/BBK-PPP/1/2020', 'Bayar Blanket Ke Bintang Lancar', 0, 12320000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(524, '085/BBK-PPP/1/2020', '2103.00', '2020-01-22', '085/BBK-PPP/1/2020', 'Bayar Blanket Ke Bintang Lancar', 12320000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(525, '085/BBK-PPP/1/2020', '1102.02', '2020-01-22', '085/BBK-PPP/1/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(526, '085/BBK-PPP/1/2020', '8201', '2020-01-22', '085/BBK-PPP/1/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(527, '085/BBK-PPP/1/2020', '1102.02', '2020-01-22', '085/BBK-PPP/1/2020', 'Bayar Chemical Ke Media Prisma Grafika', 0, 7700000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(528, '085/BBK-PPP/1/2020', '2103.00', '2020-01-22', '085/BBK-PPP/1/2020', 'Bayar Chemical Ke Media Prisma Grafika', 7700000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(529, '085/BBK-PPP/1/2020', '1102.02', '2020-01-22', '085/BBK-PPP/1/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(530, '085/BBK-PPP/1/2020', '8201', '2020-01-22', '085/BBK-PPP/1/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(531, '085/BBK-PPP/1/2020', '1102.02', '2020-01-22', '085/BBK-PPP/1/2020', 'Bayar Recover Roll Ke Mirza Teknik', 0, 16220000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(532, '085/BBK-PPP/1/2020', '2103.00', '2020-01-22', '085/BBK-PPP/1/2020', 'Bayar Recover Roll Ke Mirza Teknik', 16220000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(533, '085/BBK-PPP/1/2020', '1102.02', '2020-01-22', '085/BBK-PPP/1/2020', 'Bayar Grease Oli Ke Nabel Sakha', 0, 2415600, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(534, '085/BBK-PPP/1/2020', '2103.00', '2020-01-22', '085/BBK-PPP/1/2020', 'Bayar Grease Oli Ke Nabel Sakha', 2415600, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(535, '086/BBK-PPP/1/2020', '1102.02', '2020-01-22', '086/BBK-PPP/1/2020', 'Bayar Selang Dan Piston Ke Central Dinamika', 0, 3513840, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(536, '086/BBK-PPP/1/2020', '2103.00', '2020-01-22', '086/BBK-PPP/1/2020', 'Bayar Selang Dan Piston Ke Central Dinamika', 3513840, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(537, '086/BBK-PPP/1/2020', '1102.02', '2020-01-22', '086/BBK-PPP/1/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(538, '086/BBK-PPP/1/2020', '8201', '2020-01-22', '086/BBK-PPP/1/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(539, '086/BBK-PPP/1/2020', '1102.02', '2020-01-22', '086/BBK-PPP/1/2020', 'Bayar Lem Ke Polychemie', 0, 10000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(540, '086/BBK-PPP/1/2020', '2103.00', '2020-01-22', '086/BBK-PPP/1/2020', 'Bayar Lem Ke Polychemie', 10000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(541, '086/BBK-PPP/1/2020', '1102.02', '2020-01-22', '086/BBK-PPP/1/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(542, '086/BBK-PPP/1/2020', '8201', '2020-01-22', '086/BBK-PPP/1/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(543, '087/BBK-PPP/1/2020', '1102.02', '2020-01-22', '087/BBK-PPP/1/2020', 'Bayar SPJ Perdin Pak Maulana', 0, 8128200, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(544, '087/BBK-PPP/1/2020', '6407', '2020-01-22', '087/BBK-PPP/1/2020', 'Bayar SPJ Perdin Pak Maulana', 8128200, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(545, '087/BBK-PPP/1/2020', '1102.02', '2020-01-22', '087/BBK-PPP/1/2020', 'Bayar SPJ Perdin Pak Nasir', 0, 1400000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(546, '087/BBK-PPP/1/2020', '6407', '2020-01-22', '087/BBK-PPP/1/2020', 'Bayar SPJ Perdin Pak Nasir', 1400000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(547, '088/BBM-PPP/1/2020', '1102.02', '2020-01-22', '088/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Pak Dilang', 4984470, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(548, '088/BBM-PPP/1/2020', '1105.00', '2020-01-22', '088/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Pak Dilang', 0, 4984470, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(549, '089/BBM-PPP/1/2020', '1102.02', '2020-01-23', '089/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Pak Abu Thalib', 5000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(550, '089/BBM-PPP/1/2020', '1105.00', '2020-01-23', '089/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Pak Abu Thalib', 0, 5000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(551, '089/BBM-PPP/1/2020', '1102.02', '2020-01-23', '089/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Amza', 50000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(552, '089/BBM-PPP/1/2020', '1105.00', '2020-01-23', '089/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Amza', 0, 50000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(553, '090/BBK-PPP/1/2020', '1102.02', '2020-01-23', '090/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Balebat', 0, 125000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(554, '090/BBK-PPP/1/2020', '2198.50', '2020-01-23', '090/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Balebat', 125000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(555, '090/BBK-PPP/1/2020', '1102.02', '2020-01-23', '090/BBK-PPP/1/2020', 'Bayar Tiket Perjalanan Ke Luar Negeri', 0, 2354315, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(556, '090/BBK-PPP/1/2020', '6407', '2020-01-23', '090/BBK-PPP/1/2020', 'Bayar Tiket Perjalanan Ke Luar Negeri', 2354315, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(557, '090/BBK-PPP/1/2020', '1102.02', '2020-01-23', '090/BBK-PPP/1/2020', 'Bayar Tiket Perjalanan Ke Luar Negeri', 0, 8650598, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(558, '090/BBK-PPP/1/2020', '6407', '2020-01-23', '090/BBK-PPP/1/2020', 'Bayar Tiket Perjalanan Ke Luar Negeri', 8650598, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(559, '091/BBM-PPP/1/2020', '1102.02', '2020-01-24', '091/BBM-PPP/1/2020', 'Terima Pembayaran Buku 13 Dari Bu Citra', 11113875, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(560, '091/BBM-PPP/1/2020', '1105.00', '2020-01-24', '091/BBM-PPP/1/2020', 'Terima Pembayaran Buku 13 Dari Bu Citra', 0, 11113875, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(561, '091/BBM-PPP/1/2020', '1102.02', '2020-01-24', '091/BBM-PPP/1/2020', 'Terima Pembayaran Buku 13 Dari Bu Citra', 50000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(562, '091/BBM-PPP/1/2020', '1105.00', '2020-01-24', '091/BBM-PPP/1/2020', 'Terima Pembayaran Buku 13 Dari Bu Citra', 0, 50000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(563, '092/BBK-PPP/1/2020', '1102.02', '2020-01-24', '092/BBK-PPP/1/2020', 'Bayar BPJS Ketenagakerjaan', 0, 12419773, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(564, '092/BBK-PPP/1/2020', '7107', '2020-01-24', '092/BBK-PPP/1/2020', 'Bayar BPJS Ketenagakerjaan', 12419773, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(565, '092/BBK-PPP/1/2020', '1102.02', '2020-01-24', '092/BBK-PPP/1/2020', 'Bayar Tiket Perjalanan Dinas', 0, 5491405, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(566, '092/BBK-PPP/1/2020', '6407', '2020-01-24', '092/BBK-PPP/1/2020', 'Bayar Tiket Perjalanan Dinas', 5491405, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(567, '092/BBK-PPP/1/2020', '1102.02', '2020-01-24', '092/BBK-PPP/1/2020', 'Bayar SPJ Perdin Pak Nasir', 0, 5000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(568, '092/BBK-PPP/1/2020', '6407', '2020-01-24', '092/BBK-PPP/1/2020', 'Bayar SPJ Perdin Pak Nasir', 5000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(569, '093/BBK-PPP/1/2020', '1102.02', '2020-01-24', '093/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Temprint', 0, 40000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(570, '093/BBK-PPP/1/2020', '2198.50', '2020-01-24', '093/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Temprint', 40000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(571, '094/BBM-PPP/1/2020', '1102.02', '2020-01-21', '094/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Rumah Cetak Kita', 16859040, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(572, '094/BBM-PPP/1/2020', '1105.00', '2020-01-21', '094/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Rumah Cetak Kita', 0, 16859040, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(573, '095/BBK-PPP/1/2020', '1102.02', '2020-01-21', '095/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Maraset', 0, 15000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(574, '095/BBK-PPP/1/2020', '2103.00', '2020-01-21', '095/BBK-PPP/1/2020', 'Pembayaran Hutang Ke Maraset', 15000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(575, '096/BBM-PPP/1/2020', '1102.02', '2020-01-26', '096/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Agus Widodo', 32585040, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(576, '096/BBM-PPP/1/2020', '1105.00', '2020-01-26', '096/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Agus Widodo', 0, 32585040, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(577, '096/BBM-PPP/1/2020', '1102.02', '2020-01-26', '096/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Ibu Citra', 9996750, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(578, '096/BBM-PPP/1/2020', '1105.00', '2020-01-26', '096/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Ibu Citra', 0, 9996750, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(579, '096/BBM-PPP/1/2020', '1102.02', '2020-01-26', '096/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Kasa Husada', 8415000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(580, '096/BBM-PPP/1/2020', '1105.00', '2020-01-26', '096/BBM-PPP/1/2020', 'Terima Pembayaran Buku K13 Dari Kasa Husada', 0, 8415000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(581, '097/BBK-PPP/1/2020', '1102.02', '2020-01-28', '097/BBK-PPP/1/2020', 'Biaya Akomodasi Ke Luar Negeri', 0, 10000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(582, '097/BBK-PPP/1/2020', '7416', '2020-01-28', '097/BBK-PPP/1/2020', 'Biaya Akomodasi Ke Luar Negeri', 10000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(583, '097/BBK-PPP/1/2020', '1102.02', '2020-01-28', '097/BBK-PPP/1/2020', 'Bayar Raker Di Novotel', 0, 15000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(584, '097/BBK-PPP/1/2020', '7115', '2020-01-28', '097/BBK-PPP/1/2020', 'Bayar Raker Di Novotel', 15000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(585, '097/BBK-PPP/1/2020', '1102.02', '2020-01-28', '097/BBK-PPP/1/2020', 'Bayar Dp Souvenir', 0, 3000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(586, '097/BBK-PPP/1/2020', '6410', '2020-01-28', '097/BBK-PPP/1/2020', 'Bayar Dp Souvenir', 3000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40');
INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`, `penanggung`, `timestamps`) VALUES
(587, '098/BBM-PPP/1/2020', '1102.02', '2020-01-28', '098/BBM-PPP/1/2020', 'Terima Pembayaran Dari Pak Agus Widodo', 19739500, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(588, '098/BBM-PPP/1/2020', '1105.00', '2020-01-28', '098/BBM-PPP/1/2020', 'Terima Pembayaran Dari Pak Agus Widodo', 0, 19739500, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(589, '098/BBM-PPP/1/2020', '1102.02', '2020-01-28', '098/BBM-PPP/1/2020', 'Terima Pembayaran Dari Pak Siswadi Buku Kemensos', 50000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(590, '098/BBM-PPP/1/2020', '1105.00', '2020-01-28', '098/BBM-PPP/1/2020', 'Terima Pembayaran Dari Pak Siswadi Buku Kemensos', 0, 50000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(591, '098/BBM-PPP/1/2020', '1102.02', '2020-01-28', '098/BBM-PPP/1/2020', 'Terima Pembayaran Dari Pak Siswadi', 5709000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(592, '098/BBM-PPP/1/2020', '1105.00', '2020-01-28', '098/BBM-PPP/1/2020', 'Terima Pembayaran Dari Pak Siswadi', 0, 5709000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(593, '099/BBK-PPP/1/2020', '1102.02', '2020-01-30', '099/BBK-PPP/1/2020', 'Biaya Gaji Outsorc', 0, 76667125, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(594, '099/BBK-PPP/1/2020', '5401', '2020-01-30', '099/BBK-PPP/1/2020', 'Biaya Gaji Outsorc', 76667125, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(595, '100/BBM-PPP/1/2020', '1102.02', '2020-01-30', '100/BBM-PPP/1/2020', 'Terima Pembayaran Dari Pak Faisol Mentari Book', 50000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(596, '100/BBM-PPP/1/2020', '1105.00', '2020-01-30', '100/BBM-PPP/1/2020', 'Terima Pembayaran Dari Pak Faisol Mentari Book', 0, 50000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(597, '101/BBM-PPP/1/2020', '1102.02', '2020-01-31', '101/BBM-PPP/1/2020', 'Pendapatan Bunga Bank', 90283, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(598, '101/BBM-PPP/1/2020', '8103', '2020-01-31', '101/BBM-PPP/1/2020', 'Pendapatan Bunga Bank', 0, 90283, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(599, '102/BBK-PPP/1/2020', '1102.02', '2020-01-31', '102/BBK-PPP/1/2020', 'Bayar Bunga BRI', 0, 20000000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(600, '102/BBK-PPP/1/2020', '8206', '2020-01-31', '102/BBK-PPP/1/2020', 'Bayar Bunga BRI', 20000000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(601, '102/BBK-PPP/1/2020', '1102.02', '2020-01-31', '102/BBK-PPP/1/2020', 'Biaya Gaji Puri', 0, 68492000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(602, '102/BBK-PPP/1/2020', '6101', '2020-01-31', '102/BBK-PPP/1/2020', 'Biaya Gaji Puri', 68492000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(603, '102/BBK-PPP/1/2020', '1102.02', '2020-01-31', '102/BBK-PPP/1/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(604, '102/BBK-PPP/1/2020', '8201', '2020-01-31', '102/BBK-PPP/1/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(605, '102/BBK-PPP/1/2020', '1102.02', '2020-01-31', '102/BBK-PPP/1/2020', 'Bayar Gaji An Erditya', 0, 3200000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(606, '102/BBK-PPP/1/2020', '6101', '2020-01-31', '102/BBK-PPP/1/2020', 'Bayar Gaji An Erditya', 3200000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(607, '102/BBK-PPP/1/2020', '1102.02', '2020-01-31', '102/BBK-PPP/1/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(608, '102/BBK-PPP/1/2020', '8201', '2020-01-31', '102/BBK-PPP/1/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(609, '102/BBK-PPP/1/2020', '1102.02', '2020-01-31', '102/BBK-PPP/1/2020', 'Biaya Adm Bank', 0, 12500, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(610, '102/BBK-PPP/1/2020', '8201', '2020-01-31', '102/BBK-PPP/1/2020', 'Biaya Adm Bank', 12500, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(611, '102/BBK-PPP/1/2020', '1102.02', '2020-01-31', '102/BBK-PPP/1/2020', 'Biaya Saldo Min', 0, 25000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(612, '102/BBK-PPP/1/2020', '8201', '2020-01-31', '102/BBK-PPP/1/2020', 'Biaya Saldo Min', 25000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(613, '102/BBK-PPP/1/2020', '1102.02', '2020-01-31', '102/BBK-PPP/1/2020', 'Biaya Pajak Bank', 0, 18056, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(614, '102/BBK-PPP/1/2020', '8211', '2020-01-31', '102/BBK-PPP/1/2020', 'Biaya Pajak Bank', 18056, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(615, '102/BBK-PPP/1/2020', '1102.02', '2020-01-31', '102/BBK-PPP/1/2020', 'Sweep', 0, 10000, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(616, '102/BBK-PPP/1/2020', '8201', '2020-01-31', '102/BBK-PPP/1/2020', 'Sweep', 10000, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(617, '103/BBK-PPP/1/2020', '1102.02', '2020-01-13', '103/BBK-PPP/1/2020', 'Bayar Kertas Ke Kober Via BG', 0, 119539600, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(618, '103/BBK-PPP/1/2020', '2103.00', '2020-01-13', '103/BBK-PPP/1/2020', 'Bayar Kertas Ke Kober Via BG', 119539600, 0, '0000-00-00', 'Post', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(623, '105/BKK-PPP/1/2020', '1101.01', '2020-01-29', '105/BKK-PPP/1/2020', 'Bayar Lembur Produksi - 052/bkk', 0, 1590200, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(624, '105/BKK-PPP/1/2020', '5403', '2020-01-29', '105/BKK-PPP/1/2020', 'Bayar Lembur Produksi - 052/bkk', 1590200, 0, '0000-00-00', 'Post', '', 1, 'Dian', '2020-02-26 08:57:40'),
(625, '045/SJ-PPP/2/2020', '4101.06', '2020-02-19', '045/INV-PPP/2/2020', 'Penjualan 045/INV-PPP/2/2020', 0, 3041880, '0000-00-00', '', 'CST0006', 1, '', '2020-02-26 08:57:40'),
(626, '045/SJ-PPP/2/2020', '1105.00', '2020-02-19', '045/INV-PPP/2/2020', 'Penjualan 045/INV-PPP/2/2020', 3041880, 0, '0000-00-00', '', 'CST0006', 1, '', '2020-02-26 08:57:40'),
(627, '001/BMM-PPP/1/2020', '5711', '2020-01-31', '001/BMM-PPP/1/2020', 'Biaya Penyusutan Bangunan', 1064376, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(628, '001/BMM-PPP/1/2020', '1402.51', '2020-01-31', '001/BMM-PPP/1/2020', 'Biaya Penyusutan Bangunan', 0, 1064376, '0000-00-00', '', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(629, '001/BMM-PPP/1/2020', '5717', '2020-01-31', '001/BMM-PPP/1/2020', 'Biaya Penyusutan Peralatan Pabrik', 52497, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(630, '001/BMM-PPP/1/2020', '1405.51', '2020-01-31', '001/BMM-PPP/1/2020', 'Biaya Penyusutan Peralatan Pabrik', 0, 52497, '0000-00-00', '', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(631, '001/BMM-PPP/1/2020', '5713', '2020-01-31', '001/BMM-PPP/1/2020', 'Biaya Penyusutan Mesin Produksi', 10645013, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(632, '001/BMM-PPP/1/2020', '1503.51', '2020-01-31', '001/BMM-PPP/1/2020', 'Biaya Penyusutan Mesin Produksi', 0, 10645013, '0000-00-00', '', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(633, '001/BMM-PPP/1/2020', '7310', '2020-01-31', '001/BMM-PPP/1/2020', 'Biaya Penyusutan Peralatan Kantor', 852217, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(634, '001/BMM-PPP/1/2020', '1405.52', '2020-01-31', '001/BMM-PPP/1/2020', 'Biaya Penyusutan Peralatan Kantor', 0, 852217, '0000-00-00', '', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(635, '001/BMM-PPP/1/2020', '5726', '2020-01-31', '001/BMM-PPP/1/2020', 'Biaya Sewa Mesin Intan', 118400000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(636, '001/BMM-PPP/1/2020', '2198.50', '2020-01-31', '001/BMM-PPP/1/2020', 'Biaya Sewa Mesin Intan', 0, 118400000, '0000-00-00', '', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(637, '046/SJ-PPP/2/2020', '4101.06', '2020-02-19', '046/INV-PPP/2/2020', 'Penjualan 046/INV-PPP/2/2020', 0, 25609973, '0000-00-00', '', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(638, '046/SJ-PPP/2/2020', '1105.00', '2020-02-19', '046/INV-PPP/2/2020', 'Penjualan 046/INV-PPP/2/2020', 25609973, 0, '0000-00-00', '', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(639, '047/SJ-PPP/2/2020', '4101.06', '2020-02-19', '047/INV-PPP/2/2020', 'Penjualan 047/INV-PPP/2/2020', 0, 198450, '0000-00-00', '', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(640, '047/SJ-PPP/2/2020', '1105.00', '2020-02-19', '047/INV-PPP/2/2020', 'Penjualan 047/INV-PPP/2/2020', 198450, 0, '0000-00-00', '', 'CST0005', 1, '', '2020-02-26 08:57:40'),
(641, '048/SJ-PPP/2/2020', '4101.06', '2020-02-19', '048/INV-PPP/2/2020', 'Penjualan 048/INV-PPP/2/2020', 0, 298451660, '0000-00-00', '', 'CST0019', 1, '', '2020-02-26 08:57:40'),
(642, '048/SJ-PPP/2/2020', '1105.00', '2020-02-19', '048/INV-PPP/2/2020', 'Penjualan 048/INV-PPP/2/2020', 298451660, 0, '0000-00-00', '', 'CST0019', 1, '', '2020-02-26 08:57:40'),
(643, '049/SJ-PPP/02/2020', '4101.06', '2020-02-20', '049/INV-PPP/2/2020', 'Penjualan 049/INV-PPP/2/2020', 0, 136298955, '0000-00-00', '', 'CST0019', 1, '', '2020-02-26 08:57:40'),
(644, '049/SJ-PPP/02/2020', '1105.00', '2020-02-20', '049/INV-PPP/2/2020', 'Penjualan 049/INV-PPP/2/2020', 136298955, 0, '0000-00-00', '', 'CST0019', 1, '', '2020-02-26 08:57:40'),
(645, '050/SJ-PPP/02/2020', '4101.06', '2020-02-20', '050/INV-PPP/2/2020', 'Penjualan 050/INV-PPP/2/2020', 0, 88000000, '0000-00-00', '', 'CST0017', 1, '', '2020-02-26 08:57:40'),
(646, '050/SJ-PPP/02/2020', '1105.00', '2020-02-20', '050/INV-PPP/2/2020', 'Penjualan 050/INV-PPP/2/2020', 88000000, 0, '0000-00-00', '', 'CST0017', 1, '', '2020-02-26 08:57:40'),
(647, '051/SJ-PPP/02/2020', '4101.06', '2020-02-20', '051/INV-PPP/2/2020', 'Penjualan 051/INV-PPP/2/2020', 0, 3360000, '0000-00-00', '', 'CST0018', 1, '', '2020-02-26 08:57:40'),
(648, '051/SJ-PPP/02/2020', '1105.00', '2020-02-20', '051/INV-PPP/2/2020', 'Penjualan 051/INV-PPP/2/2020', 3360000, 0, '0000-00-00', '', 'CST0018', 1, '', '2020-02-26 08:57:40'),
(649, '052/SJ-PPP/02/2020', '4101.06', '2020-02-20', '052/INV-PPP/2/2020', 'Penjualan 052/INV-PPP/2/2020', 0, 2691000, '0000-00-00', '', 'CST0018', 1, '', '2020-02-26 08:57:40'),
(650, '052/SJ-PPP/02/2020', '1105.00', '2020-02-20', '052/INV-PPP/2/2020', 'Penjualan 052/INV-PPP/2/2020', 2691000, 0, '0000-00-00', '', 'CST0018', 1, '', '2020-02-26 08:57:40'),
(651, '053/SJ-PPP/02/2020', '4101.06', '2020-02-20', '053/INV-PPP/2/2020', 'Penjualan 053/INV-PPP/2/2020', 0, 7080000, '0000-00-00', '', 'CST0016', 1, '', '2020-02-26 08:57:40'),
(652, '053/SJ-PPP/02/2020', '1105.00', '2020-02-20', '053/INV-PPP/2/2020', 'Penjualan 053/INV-PPP/2/2020', 7080000, 0, '0000-00-00', '', 'CST0016', 1, '', '2020-02-26 08:57:40'),
(653, '054/SJ-PPP/02/2020', '4101.06', '2020-02-20', '054/INV-PPP/2/2020', 'Penjualan 054/INV-PPP/2/2020', 0, 88000000, '0000-00-00', '', 'CST0017', 1, '', '2020-02-26 08:57:40'),
(654, '054/SJ-PPP/02/2020', '1105.00', '2020-02-20', '054/INV-PPP/2/2020', 'Penjualan 054/INV-PPP/2/2020', 88000000, 0, '0000-00-00', '', 'CST0017', 1, '', '2020-02-26 08:57:40'),
(655, '055/SJ-PPP/02/2020', '4101.06', '2020-02-20', '055/INV-PPP/2/2020', 'Penjualan 055/INV-PPP/2/2020', 0, 353520, '0000-00-00', '', 'CST0016', 1, '', '2020-02-26 08:57:40'),
(656, '055/SJ-PPP/02/2020', '1105.00', '2020-02-20', '055/INV-PPP/2/2020', 'Penjualan 055/INV-PPP/2/2020', 353520, 0, '0000-00-00', '', 'CST0016', 1, '', '2020-02-26 08:57:40'),
(657, '057/SJ-PPP/02/2020', '4101.06', '2020-02-20', '056/INV-PPP/2/2020', 'Penjualan 056/INV-PPP/2/2020', 0, 11000000, '0000-00-00', '', 'CST0012', 1, '', '2020-02-26 08:57:40'),
(658, '057/SJ-PPP/02/2020', '1105.00', '2020-02-20', '056/INV-PPP/2/2020', 'Penjualan 056/INV-PPP/2/2020', 11000000, 0, '0000-00-00', '', 'CST0012', 1, '', '2020-02-26 08:57:40'),
(659, '056/SJ-PPP/02/2020', '4101.06', '2020-02-20', '057/INV-PPP/2/2020', 'Penjualan 057/INV-PPP/2/2020', 0, 16750000, '0000-00-00', '', 'CST0013', 1, '', '2020-02-26 08:57:40'),
(660, '056/SJ-PPP/02/2020', '1105.00', '2020-02-20', '057/INV-PPP/2/2020', 'Penjualan 057/INV-PPP/2/2020', 16750000, 0, '0000-00-00', '', 'CST0013', 1, '', '2020-02-26 08:57:40'),
(661, '058/SJ-PPP/02/2020', '4101.06', '2020-02-20', '058/INV-PPP/2/2020', 'Penjualan 058/INV-PPP/2/2020', 0, 97885000, '0000-00-00', '', 'CST0015', 1, '', '2020-02-26 08:57:40'),
(662, '058/SJ-PPP/02/2020', '1105.00', '2020-02-20', '058/INV-PPP/2/2020', 'Penjualan 058/INV-PPP/2/2020', 97885000, 0, '0000-00-00', '', 'CST0015', 1, '', '2020-02-26 08:57:40'),
(663, '001/BMM-PPP/1/2020', '5300', '2020-01-31', '001/BMM-PPP/1/2020', 'Biaya Pemakaian Bahan Baku Januari 2020', 228917118, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(664, '001/BMM-PPP/1/2020', '5500', '2020-01-31', '001/BMM-PPP/1/2020', 'Biaya Pemakaian Bahan Pembantu Januari 2020', 6159075, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(665, '001/BMM-PPP/1/2020', '1108.05', '2020-01-31', '001/BMM-PPP/1/2020', 'Biaya Pemakaian Bahan Baku Januari 2020', 0, 228917118, '0000-00-00', '', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(666, '001/BMM-PPP/1/2020', '1108.06', '2020-01-31', '001/BMM-PPP/1/2020', 'Biaya Pemakaian Bahan Pembantu Januari 2020', 0, 6159075, '0000-00-00', '', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(667, '001/BMM-PPP/1/2020', '5200', '2020-01-31', '001/BMM-PPP/1/2020', 'HPP Buku', 1240865411, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(668, '001/BMM-PPP/1/2020', '1108.02', '2020-01-31', '001/BMM-PPP/1/2020', 'HPP Buku', 0, 1240865411, '0000-00-00', '', '', 1, 'Hidayati', '2020-02-26 08:57:40'),
(669, '007/BBK-PPP/2/2020', '1102.02', '2020-02-03', '007/BBK-PPP/2/2020', 'Bayar Gaji Direksi (payroll Mandiri)', 0, 46000000, '0000-00-00', '', '', 1, 'dian', '2020-02-26 09:52:46'),
(670, '007/BBK-PPP/2/2020', '7101', '2020-02-03', '007/BBK-PPP/2/2020', 'Bayar Gaji Direksi (payroll Mandiri)', 46000000, 0, '0000-00-00', '', '', 1, 'dian', '2020-02-26 09:52:40'),
(671, '008/BBK-PPP/2/2020', '1102.02', '2020-02-03', '008/BBK-PPP/2/2020', 'Bayar Pengembalian Pembayaran Kpd Bp Taufik Ardi', 0, 3284136, '0000-00-00', '', '', 1, 'dian', '2020-02-26 09:52:32'),
(672, '008/BBK-PPP/2/2020', '1105.00', '2020-02-03', '008/BBK-PPP/2/2020', 'Bayar Pengembalian Pembayaran Kpd Bp Taufik Ardi', 3284136, 0, '0000-00-00', '', '', 1, 'dian', '2020-02-26 09:52:29'),
(673, '008/BBK-PPP/2/2020', '1102.02', '2020-02-03', '008/BBK-PPP/2/2020', 'Bayar Hologram ', 0, 6187500, '0000-00-00', '', '', 1, 'dian', '2020-03-03 18:00:47'),
(674, '008/BBK-PPP/2/2020', '5200', '2020-02-03', '008/BBK-PPP/2/2020', 'Bayar Hologram ', 6187500, 0, '0000-00-00', '', '', 1, 'dian', '2020-02-26 09:52:21'),
(675, '009/BBK-PPP/2/2020', '8201', '2020-02-01', '009/BBK-PPP/2/2020', 'Biaya Notaris UMKM', 3300000, 0, '0000-00-00', '', '', 1, '', '2020-02-27 06:38:42'),
(676, '009/BBK-PPP/2/2020', '1102.10', '2020-02-01', '009/BBK-PPP/2/2020', 'Biaya Asuransi Jamkrida', 0, 11400000, '0000-00-00', '', '', 1, '', '2020-02-27 06:38:42'),
(677, '009/BBK-PPP/2/2020', '1102.10', '2020-02-01', '009/BBK-PPP/2/2020', 'Biaya Provisi UMKM', 0, 5700000, '0000-00-00', '', '', 1, '', '2020-02-27 06:38:42'),
(678, '009/BBK-PPP/2/2020', '8201', '2020-02-01', '009/BBK-PPP/2/2020', 'Biaya Provisi UMKM', 5700000, 0, '0000-00-00', '', '', 1, '', '2020-02-27 06:38:42'),
(679, '009/BBK-PPP/2/2020', '1102.10', '2020-02-01', '009/BBK-PPP/2/2020', 'Biaya Notaris UMKM', 0, 3300000, '0000-00-00', '', '', 1, '', '2020-02-27 06:38:42'),
(680, '009/BBK-PPP/2/2020', '1102.10', '2020-02-01', '009/BBK-PPP/2/2020', 'Biaya Provisi UMKM', 0, 2800000, '0000-00-00', '', '', 1, '', '2020-02-27 06:38:42'),
(681, '009/BBK-PPP/2/2020', '8201', '2020-02-01', '009/BBK-PPP/2/2020', 'Biaya Provisi UMKM', 2800000, 0, '0000-00-00', '', '', 1, '', '2020-02-27 06:38:42'),
(682, '009/BBK-PPP/2/2020', '1102.10', '2020-02-01', '009/BBK-PPP/2/2020', 'Biaya Notaris UMKM', 0, 3300000, '0000-00-00', '', '', 1, '', '2020-02-27 06:38:42'),
(683, '009/BBK-PPP/2/2020', '8201', '2020-02-01', '009/BBK-PPP/2/2020', 'Biaya Notaris UMKM', 3300000, 0, '0000-00-00', '', '', 1, '', '2020-02-27 06:38:42'),
(684, '009/BBK-PPP/2/2020', '1102.10', '2020-02-01', '009/BBK-PPP/2/2020', 'Biaya Asuransi Jamkrida', 0, 5600000, '0000-00-00', '', '', 1, '', '2020-02-27 06:38:42'),
(685, '009/BBK-PPP/2/2020', '7301', '2020-02-01', '009/BBK-PPP/2/2020', 'Biaya Asuransi Jamkrida', 11400000, 0, '0000-00-00', '', '', 1, '', '2020-02-27 06:38:42'),
(686, '009/BBK-PPP/2/2020', '7301', '2020-02-01', '009/BBK-PPP/2/2020', 'Biaya Asuransi Jamkrida', 5600000, 0, '0000-00-00', '', '', 1, '', '2020-02-27 06:38:42'),
(687, '010/BBM-PPP/2/2020', '1102.10', '2020-02-01', '010/BBM-PPP/2/2020', 'Terima Dr Pinjam Bank UMKM Jatim', 570000000, 0, '0000-00-00', '', '', 1, '', '2020-02-27 07:05:50'),
(688, '010/BBM-PPP/2/2020', '2203.10', '2020-02-01', '010/BBM-PPP/2/2020', 'Terima Dr Pinjam Bank UMKM Jatim', 0, 570000000, '0000-00-00', '', '', 1, '', '2020-02-27 07:05:50'),
(689, '010/BBM-PPP/2/2020', '1102.10', '2020-02-01', '010/BBM-PPP/2/2020', 'Terima Dr Pinjam Bank UMKM Jatim', 280000000, 0, '0000-00-00', '', '', 1, '', '2020-02-27 07:05:50'),
(690, '010/BBM-PPP/2/2020', '2203.10', '2020-02-01', '010/BBM-PPP/2/2020', 'Terima Dr Pinjam Bank UMKM Jatim', 0, 280000000, '0000-00-00', '', '', 1, '', '2020-02-27 07:05:50'),
(691, '011/BBM-PPP/2/2020', '1102.02', '2020-02-03', '011/BBM-PPP/2/2020', 'Terima Dr Pembayaran Bp Tito', 7500000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 06:25:35'),
(692, '011/BBM-PPP/2/2020', '1105.00', '2020-02-03', '011/BBM-PPP/2/2020', 'Terima Dr Pembayaran Bp Tito', 0, 7500000, '0000-00-00', '', '', 1, 'dian', '2020-03-02 06:25:35'),
(693, '012/BBM-PPP/2/2020', '1102.02', '2020-02-07', '012/BBM-PPP/2/2020', 'Terima Dr Pembayaran Uang Muka Cetak Blanko Ijazah Poltek Penerbangan Banyuwangi', 26250000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 07:16:45'),
(694, '012/BBM-PPP/2/2020', '1114.05', '2020-02-07', '012/BBM-PPP/2/2020', 'Terima Dr Pembayaran Uang Muka Cetak Blanko Ijazah Poltek Penerbangan Banyuwangi', 0, 26250000, '0000-00-00', '', '', 1, 'dian', '2020-03-02 07:16:45'),
(695, '013/BKK-PPP/2/2020', '1101.01', '2020-02-11', '013/BKK-PPP/2/2020', 'Bayar Pengiriman Ijazah, Dok Makassar', 0, 509000, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(696, '013/BKK-PPP/2/2020', '6403', '2020-02-11', '013/BKK-PPP/2/2020', 'Bayar Pengiriman Ijazah, Dok Makassar', 509000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(697, '013/BKK-PPP/2/2020', '1101.01', '2020-02-11', '013/BKK-PPP/2/2020', 'Beli Solar Forklift', 0, 100000, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(698, '013/BKK-PPP/2/2020', '5725', '2020-02-11', '013/BKK-PPP/2/2020', 'Beli Solar Forklift', 100000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(699, '013/BKK-PPP/2/2020', '1101.01', '2020-02-11', '013/BKK-PPP/2/2020', 'Byr Las, Bikin As Mesin Sheet', 0, 295000, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(700, '013/BKK-PPP/2/2020', '5704', '2020-02-11', '013/BKK-PPP/2/2020', 'Byr Las, Bikin As Mesin Sheet', 295000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(701, '013/BKK-PPP/2/2020', '1101.01', '2020-02-11', '013/BKK-PPP/2/2020', 'Byr Perbaikan AC Marketing', 0, 550000, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(702, '013/BKK-PPP/2/2020', '7306', '2020-02-11', '013/BKK-PPP/2/2020', 'Byr Perbaikan AC Marketing', 550000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(703, '013/BKK-PPP/2/2020', '1101.01', '2020-02-11', '013/BKK-PPP/2/2020', 'Beli Keb Ktr, Dan ATK Marketing', 0, 258000, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(704, '013/BKK-PPP/2/2020', '6402', '2020-02-11', '013/BKK-PPP/2/2020', 'Beli Keb Ktr, Dan ATK Marketing', 258000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(705, '013/BKK-PPP/2/2020', '1101.01', '2020-02-11', '013/BKK-PPP/2/2020', 'Beli Bensin Oprs Pick Up, Oprs Pembelian, Tol', 0, 276500, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(706, '013/BKK-PPP/2/2020', '5725', '2020-02-11', '013/BKK-PPP/2/2020', 'Beli Bensin Oprs Pick Up, Oprs Pembelian, Tol', 276500, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(707, '013/BKK-PPP/2/2020', '1101.01', '2020-02-11', '013/BKK-PPP/2/2020', 'Beli Konsumsi Loading', 0, 100000, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(708, '013/BKK-PPP/2/2020', '5405', '2020-02-11', '013/BKK-PPP/2/2020', 'Beli Konsumsi Loading', 100000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(709, '013/BKK-PPP/2/2020', '1101.01', '2020-02-11', '013/BKK-PPP/2/2020', 'Byr Sumbangan Duka Cita Dan Sewa Mobil', 0, 1000000, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(710, '013/BKK-PPP/2/2020', '7410', '2020-02-11', '013/BKK-PPP/2/2020', 'Byr Sumbangan Duka Cita Dan Sewa Mobil', 1000000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(711, '013/BKK-PPP/2/2020', '1101.01', '2020-02-11', '013/BKK-PPP/2/2020', 'Bayar Plate, Print Digital, Film Ijazah ', 0, 1055000, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(712, '013/BKK-PPP/2/2020', '5200', '2020-02-11', '013/BKK-PPP/2/2020', 'Bayar Plate, Print Digital, Film Ijazah ', 1055000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(713, '013/BKK-PPP/2/2020', '1101.01', '2020-02-11', '013/BKK-PPP/2/2020', 'Bayar Hotprint Ijazah Tulang Bawang', 0, 350000, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(714, '013/BKK-PPP/2/2020', '5200', '2020-02-11', '013/BKK-PPP/2/2020', 'Bayar Hotprint Ijazah Tulang Bawang', 350000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:10:42'),
(715, '014/BKK-PPP/2/2020', '1101.01', '2020-02-11', '014/BKK-PPP/2/2020', 'Beli Bensin Oprs Marketing', 0, 100000, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:35:17'),
(716, '014/BKK-PPP/2/2020', '6405', '2020-02-11', '014/BKK-PPP/2/2020', 'Beli Bensin Oprs Marketing', 100000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:35:17'),
(717, '014/BKK-PPP/2/2020', '1101.01', '2020-02-11', '014/BKK-PPP/2/2020', 'Beli Solar Forklift, Oprs Pembelian', 0, 138000, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:35:17'),
(718, '014/BKK-PPP/2/2020', '5725', '2020-02-11', '014/BKK-PPP/2/2020', 'Beli Solar Forklift, Oprs Pembelian', 138000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:35:17'),
(719, '014/BKK-PPP/2/2020', '1101.01', '2020-02-11', '014/BKK-PPP/2/2020', 'Beli Materai', 0, 60000, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:35:17'),
(720, '014/BKK-PPP/2/2020', '7409', '2020-02-11', '014/BKK-PPP/2/2020', 'Beli Materai', 60000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:35:17'),
(721, '014/BKK-PPP/2/2020', '1101.01', '2020-02-11', '014/BKK-PPP/2/2020', 'Beli ATK Ktr Dan ATK Mrktg', 0, 136500, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:35:17'),
(722, '014/BKK-PPP/2/2020', '7407', '2020-02-11', '014/BKK-PPP/2/2020', 'Beli ATK Ktr Dan ATK Mrktg', 136500, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:35:17'),
(723, '014/BKK-PPP/2/2020', '1101.01', '2020-02-11', '014/BKK-PPP/2/2020', 'Beli Lampu Ultra, Selang, Spray Powder', 0, 540000, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:35:17'),
(724, '014/BKK-PPP/2/2020', '5200', '2020-02-11', '014/BKK-PPP/2/2020', 'Beli Lampu Ultra, Selang, Spray Powder', 540000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:35:17'),
(725, '014/BKK-PPP/2/2020', '1101.01', '2020-02-11', '014/BKK-PPP/2/2020', 'Bayar Asah Pisau Mesin Potong', 0, 54000, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:35:17'),
(726, '014/BKK-PPP/2/2020', '5709', '2020-02-11', '014/BKK-PPP/2/2020', 'Bayar Asah Pisau Mesin Potong', 54000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:35:17'),
(727, '014/BKK-PPP/2/2020', '1101.01', '2020-02-11', '014/BKK-PPP/2/2020', 'Bayar Pengiriman Dokumen Mrktg', 0, 110000, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:35:17'),
(728, '014/BKK-PPP/2/2020', '6403', '2020-02-11', '014/BKK-PPP/2/2020', 'Bayar Pengiriman Dokumen Mrktg', 110000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:35:17'),
(729, '014/BKK-PPP/2/2020', '1101.01', '2020-02-11', '014/BKK-PPP/2/2020', 'Bayar Plate Country', 0, 510000, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:35:17'),
(730, '014/BKK-PPP/2/2020', '5200', '2020-02-11', '014/BKK-PPP/2/2020', 'Bayar Plate Country', 510000, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 09:35:17'),
(731, '015/BBK-PPP/2/2020', '1102.02', '2020-02-11', '015/BBK-PPP/2/2020', 'Bayar SPJ Perdin Bpk Nasir', 0, 4993200, '0000-00-00', '', '', 1, 'dian', '2020-03-02 10:01:43'),
(732, '015/BBK-PPP/2/2020', '6407', '2020-02-11', '015/BBK-PPP/2/2020', 'Bayar SPJ Perdin Bpk Nasir', 4993200, 0, '0000-00-00', '', '', 1, 'dian', '2020-03-02 10:01:43'),
(733, '001/WOC-PPP/2/2020', '4101.06', '2020-02-01', '059/INV-PPP/2/2020', 'Tugas Kerja 059/INV-PPP/2/2020', 0, 18, '0000-00-00', '', 'CST0001', 1, '', '2020-03-03 17:32:52'),
(734, '001/WOC-PPP/2/2020', '1105.00', '2020-02-01', '059/INV-PPP/2/2020', 'Tugas Kerja 059/INV-PPP/2/2020', 18, 0, '0000-00-00', '', 'CST0001', 1, '', '2020-03-03 17:32:52'),
(735, '068/SJ-PPP/3/2020', '4101.06', '2020-03-04', '060/INV-PPP/3/2020', 'Penjualan 060/INV-PPP/3/2020', 0, 926940, '0000-00-00', '', 'CST0007', 1, '', '2020-03-04 06:07:10'),
(736, '068/SJ-PPP/3/2020', '1105.00', '2020-03-04', '060/INV-PPP/3/2020', 'Penjualan 060/INV-PPP/3/2020', 926940, 0, '0000-00-00', '', 'CST0007', 1, '', '2020-03-04 06:07:10'),
(737, '069/SJ-PPP/3/2020', '4101.06', '2020-03-04', '061/INV-PPP/3/2020', 'Penjualan 061/INV-PPP/3/2020', 0, 21262640, '0000-00-00', '', 'CST0007', 1, '', '2020-03-04 06:07:23'),
(738, '069/SJ-PPP/3/2020', '1105.00', '2020-03-04', '061/INV-PPP/3/2020', 'Penjualan 061/INV-PPP/3/2020', 21262640, 0, '0000-00-00', '', 'CST0007', 1, '', '2020-03-04 06:07:23'),
(739, '070/SJ-PPP/3/2020', '4101.06', '2020-03-04', '062/INV-PPP/3/2020', 'Penjualan 062/INV-PPP/3/2020', 0, 1954400, '0000-00-00', '', 'CST0007', 1, '', '2020-03-04 06:07:32'),
(740, '070/SJ-PPP/3/2020', '1105.00', '2020-03-04', '062/INV-PPP/3/2020', 'Penjualan 062/INV-PPP/3/2020', 1954400, 0, '0000-00-00', '', 'CST0007', 1, '', '2020-03-04 06:07:32'),
(741, '071/SJ-PPP/3/2020', '4101.06', '2020-03-04', '063/INV-PPP/3/2020', 'Penjualan 063/INV-PPP/3/2020', 0, 88000000, '0000-00-00', '', 'CST0017', 1, '', '2020-03-04 06:07:39'),
(742, '071/SJ-PPP/3/2020', '1105.00', '2020-03-04', '063/INV-PPP/3/2020', 'Penjualan 063/INV-PPP/3/2020', 88000000, 0, '0000-00-00', '', 'CST0017', 1, '', '2020-03-04 06:07:39'),
(743, '072/SJ-PPP/3/2020', '4101.06', '2020-03-04', '064/INV-PPP/3/2020', 'Penjualan 064/INV-PPP/3/2020', 0, 38600100, '0000-00-00', '', 'CST0015', 1, '', '2020-03-04 06:07:47'),
(744, '072/SJ-PPP/3/2020', '1105.00', '2020-03-04', '064/INV-PPP/3/2020', 'Penjualan 064/INV-PPP/3/2020', 38600100, 0, '0000-00-00', '', 'CST0015', 1, '', '2020-03-04 06:07:47'),
(745, '073/SJ-PPP/3/2020', '4101.06', '2020-03-04', '065/INV-PPP/3/2020', 'Penjualan 065/INV-PPP/3/2020', 0, 3418800, '0000-00-00', '', 'CST0015', 1, '', '2020-03-04 06:07:54'),
(746, '073/SJ-PPP/3/2020', '1105.00', '2020-03-04', '065/INV-PPP/3/2020', 'Penjualan 065/INV-PPP/3/2020', 3418800, 0, '0000-00-00', '', 'CST0015', 1, '', '2020-03-04 06:07:55'),
(747, '074/SJ-PPP/3/2020', '4101.06', '2020-03-04', '066/INV-PPP/3/2020', 'Penjualan 066/INV-PPP/3/2020', 0, 31924200, '0000-00-00', '', 'CST0015', 1, '', '2020-03-04 06:08:00'),
(748, '074/SJ-PPP/3/2020', '1105.00', '2020-03-04', '066/INV-PPP/3/2020', 'Penjualan 066/INV-PPP/3/2020', 31924200, 0, '0000-00-00', '', 'CST0015', 1, '', '2020-03-04 06:08:00'),
(749, '075/SJ-PPP/3/2020', '4101.06', '2020-03-04', '067/INV-PPP/3/2020', 'Penjualan 067/INV-PPP/3/2020', 0, 7020000, '0000-00-00', '', 'CST0016', 1, '', '2020-03-04 06:08:19'),
(750, '075/SJ-PPP/3/2020', '1105.00', '2020-03-04', '067/INV-PPP/3/2020', 'Penjualan 067/INV-PPP/3/2020', 7020000, 0, '0000-00-00', '', 'CST0016', 1, '', '2020-03-04 06:08:19'),
(751, '067/SJ-PPP/3/2020', '4101.06', '2020-03-04', '068/INV-PPP/3/2020', 'Penjualan 068/INV-PPP/3/2020', 0, 32850860, '0000-00-00', '', 'CST0007', 1, '', '2020-03-04 06:09:16'),
(752, '067/SJ-PPP/3/2020', '1105.00', '2020-03-04', '068/INV-PPP/3/2020', 'Penjualan 068/INV-PPP/3/2020', 32850860, 0, '0000-00-00', '', 'CST0007', 1, '', '2020-03-04 06:09:16'),
(753, '066/SJ-PPP/3/2020', '4101.06', '2020-03-04', '069/INV-PPP/3/2020', 'Penjualan 069/INV-PPP/3/2020', 0, 7974610, '0000-00-00', '', 'CST0007', 1, '', '2020-03-04 06:09:28'),
(754, '066/SJ-PPP/3/2020', '1105.00', '2020-03-04', '069/INV-PPP/3/2020', 'Penjualan 069/INV-PPP/3/2020', 7974610, 0, '0000-00-00', '', 'CST0007', 1, '', '2020-03-04 06:09:28'),
(755, '065/SJ-PPP/3/2020', '4101.06', '2020-03-04', '070/INV-PPP/3/2020', 'Penjualan 070/INV-PPP/3/2020', 0, 10349500, '0000-00-00', '', 'CST0007', 1, '', '2020-03-04 06:09:40'),
(756, '065/SJ-PPP/3/2020', '1105.00', '2020-03-04', '070/INV-PPP/3/2020', 'Penjualan 070/INV-PPP/3/2020', 10349500, 0, '0000-00-00', '', 'CST0007', 1, '', '2020-03-04 06:09:40'),
(757, '064/SJ-PPP/3/2020', '4101.06', '2020-03-04', '071/INV-PPP/3/2020', 'Penjualan 071/INV-PPP/3/2020', 0, 35385000, '0000-00-00', '', 'CST0007', 1, '', '2020-03-04 06:09:50'),
(758, '064/SJ-PPP/3/2020', '1105.00', '2020-03-04', '071/INV-PPP/3/2020', 'Penjualan 071/INV-PPP/3/2020', 35385000, 0, '0000-00-00', '', 'CST0007', 1, '', '2020-03-04 06:09:50'),
(759, '063/SJ-PPP/3/2020', '4101.06', '2020-03-04', '072/INV-PPP/3/2020', 'Penjualan 072/INV-PPP/3/2020', 0, 2276100, '0000-00-00', '', 'CST0021', 1, '', '2020-03-04 06:10:04'),
(760, '063/SJ-PPP/3/2020', '1105.00', '2020-03-04', '072/INV-PPP/3/2020', 'Penjualan 072/INV-PPP/3/2020', 2276100, 0, '0000-00-00', '', 'CST0021', 1, '', '2020-03-04 06:10:04'),
(761, '062/SJ-PPP/3/2020', '4101.06', '2020-03-04', '073/INV-PPP/3/2020', 'Penjualan 073/INV-PPP/3/2020', 0, 95000, '0000-00-00', '', 'CST0020', 1, '', '2020-03-04 06:10:14'),
(762, '062/SJ-PPP/3/2020', '1105.00', '2020-03-04', '073/INV-PPP/3/2020', 'Penjualan 073/INV-PPP/3/2020', 95000, 0, '0000-00-00', '', 'CST0020', 1, '', '2020-03-04 06:10:14'),
(763, '061/SJ-PPP/3/2020', '4101.06', '2020-03-04', '074/INV-PPP/3/2020', 'Penjualan 074/INV-PPP/3/2020', 0, 26250000, '0000-00-00', '', 'CST0023', 1, '', '2020-03-04 06:10:23'),
(764, '061/SJ-PPP/3/2020', '1105.00', '2020-03-04', '074/INV-PPP/3/2020', 'Penjualan 074/INV-PPP/3/2020', 26250000, 0, '0000-00-00', '', 'CST0023', 1, '', '2020-03-04 06:10:23'),
(765, '001/BMM-PPP/2/2020', '1403.01', '2020-02-03', '001/BMM-PPP/2/2020', 'Pembelian Mesin Produksi Ke Mutiara Permata Bangsa', 550000000, 0, '0000-00-00', '', '', 1, 'Maulana', '2020-03-05 06:27:44'),
(766, '001/BMM-PPP/2/2020', '2198.50', '2020-02-03', '001/BMM-PPP/2/2020', 'Pembelian Mesin Produksi Ke Mutiara Permata Bangsa', 0, 550000000, '0000-00-00', '', '', 1, 'Maulana', '2020-03-05 06:27:44'),
(767, '016/BBK-PPP/2/2020', '1102.02', '2020-02-10', '016/BBK-PPP/2/2020', 'Perjalanan Dinas Pak Nasir Ke Jakarta', 0, 3000000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 06:30:34'),
(768, '016/BBK-PPP/2/2020', '6407', '2020-02-10', '016/BBK-PPP/2/2020', 'Perjalanan Dinas Pak Nasir Ke Jakarta', 3000000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 06:30:34'),
(769, '016/BBK-PPP/2/2020', '1102.02', '2020-02-10', '016/BBK-PPP/2/2020', 'Pembayaran Mesin Shewing Ke PT Mutiara Permata Bangsa', 0, 129000000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 06:30:34'),
(770, '016/BBK-PPP/2/2020', '2198.50', '2020-02-10', '016/BBK-PPP/2/2020', 'Pembayaran Mesin Shewing Ke PT Mutiara Permata Bangsa', 129000000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 06:30:34'),
(771, '017/BBK-PPP/2/2020', '1102.02', '2020-02-10', '017/BBK-PPP/2/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 06:31:24'),
(772, '017/BBK-PPP/2/2020', '8201', '2020-02-10', '017/BBK-PPP/2/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 06:31:24'),
(773, '018/BBM-PPP/2/2020', '1102.02', '2020-02-10', '018/BBM-PPP/2/2020', 'Terima Pembayaran Dari Lempuing OKI', 7500000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 06:34:44'),
(774, '018/BBM-PPP/2/2020', '1105.00', '2020-02-10', '018/BBM-PPP/2/2020', 'Terima Pembayaran Dari Lempuing OKI', 0, 7500000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 06:34:44'),
(775, '076/SJ-PPP/3/2020', '4101.06', '2020-03-05', '075/INV-PPP/3/2020', 'Penjualan 075/INV-PPP/3/2020', 0, 6151275, '0000-00-00', '', 'CST0009', 1, '', '2020-03-05 07:32:24'),
(776, '076/SJ-PPP/3/2020', '1105.00', '2020-03-05', '075/INV-PPP/3/2020', 'Penjualan 075/INV-PPP/3/2020', 6151275, 0, '0000-00-00', '', 'CST0009', 1, '', '2020-03-05 07:32:24'),
(777, '019/BBM-PPP/2/2020', '1102.02', '2020-02-11', '019/BBM-PPP/2/2020', 'Terima Pembayaran Dari Amza', 100000000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 07:44:43'),
(778, '019/BBM-PPP/2/2020', '1105.00', '2020-02-11', '019/BBM-PPP/2/2020', 'Terima Pembayaran Dari Amza', 0, 100000000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 07:44:43'),
(779, '020/BBK-PPP/2/2020', '1102.02', '2020-02-11', '020/BBK-PPP/2/2020', 'Bayar DP Biaya Audit Akuntan Publik', 0, 10125000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 08:41:38'),
(780, '020/BBK-PPP/2/2020', '7419', '2020-02-11', '020/BBK-PPP/2/2020', 'Bayar DP Biaya Audit Akuntan Publik', 10125000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 08:41:38'),
(781, '020/BBK-PPP/2/2020', '1102.02', '2020-02-11', '020/BBK-PPP/2/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 08:41:38'),
(782, '020/BBK-PPP/2/2020', '8201', '2020-02-11', '020/BBK-PPP/2/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 08:41:38'),
(783, '020/BBK-PPP/2/2020', '1102.02', '2020-02-11', '020/BBK-PPP/2/2020', 'Pembayaran Hutang Ke Temprint', 0, 50000000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 08:41:38'),
(784, '020/BBK-PPP/2/2020', '2198.50', '2020-02-11', '020/BBK-PPP/2/2020', 'Pembayaran Hutang Ke Temprint', 50000000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 08:41:38'),
(785, '020/BBK-PPP/2/2020', '1102.02', '2020-02-11', '020/BBK-PPP/2/2020', 'Pembayaran Hutang Ke Balebat', 0, 50000000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 08:41:38'),
(786, '020/BBK-PPP/2/2020', '2198.50', '2020-02-11', '020/BBK-PPP/2/2020', 'Pembayaran Hutang Ke Balebat', 50000000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 08:41:38'),
(787, '021/BBM-PPP/2/2020', '1102.02', '2020-02-12', '021/BBM-PPP/2/2020', 'Terima Pembayaran Dari Pak Bambang ( Adi Munif )', 11744100, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 08:58:07'),
(788, '021/BBM-PPP/2/2020', '1105.00', '2020-02-12', '021/BBM-PPP/2/2020', 'Terima Pembayaran Dari Pak Bambang ( Adi Munif )', 0, 11744100, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 08:58:07'),
(789, '021/BBM-PPP/2/2020', '1102.02', '2020-02-12', '021/BBM-PPP/2/2020', 'Terima Pembayaran Dari Jaya Madinah', 7073520, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 08:58:07'),
(790, '021/BBM-PPP/2/2020', '1105.00', '2020-02-12', '021/BBM-PPP/2/2020', 'Terima Pembayaran Dari Jaya Madinah', 0, 7073520, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-05 08:58:07'),
(791, '022/BBK-PPP/2/2020', '1102.02', '2020-02-12', '022/BBK-PPP/2/2020', 'Bayar Hutang Plate Victory', 0, 2500000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:07:59'),
(792, '022/BBK-PPP/2/2020', '2103.00', '2020-02-12', '022/BBK-PPP/2/2020', 'Bayar Hutang Plate Victory', 2500000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:07:59'),
(793, '022/BBK-PPP/2/2020', '1102.02', '2020-02-12', '022/BBK-PPP/2/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:07:59'),
(794, '022/BBK-PPP/2/2020', '8201', '2020-02-12', '022/BBK-PPP/2/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:07:59'),
(795, '022/BBK-PPP/2/2020', '1102.02', '2020-02-12', '022/BBK-PPP/2/2020', 'Bayar Finger Print Ke CV Biometrik Cipta Solusi', 0, 1900000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:07:59'),
(796, '022/BBK-PPP/2/2020', '5726', '2020-02-12', '022/BBK-PPP/2/2020', 'Bayar Finger Print Ke CV Biometrik Cipta Solusi', 1900000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:07:59'),
(797, '022/BBK-PPP/2/2020', '1102.02', '2020-02-12', '022/BBK-PPP/2/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:07:59'),
(798, '022/BBK-PPP/2/2020', '8201', '2020-02-12', '022/BBK-PPP/2/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:07:59'),
(799, '023/BBM-PPP/2/2020', '1102.02', '2020-02-12', '023/BBM-PPP/2/2020', 'Terima Pembayaran Dari Amza', 50000000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:11:13'),
(800, '023/BBM-PPP/2/2020', '1105.00', '2020-02-12', '023/BBM-PPP/2/2020', 'Terima Pembayaran Dari Amza', 0, 50000000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:11:13'),
(801, '024/BBM-PPP/2/2020', '1102.02', '2020-02-12', '024/BBM-PPP/2/2020', 'Terima Pembayaran Dari Pak Imran Mekarsari', 25000000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:13:04'),
(802, '024/BBM-PPP/2/2020', '1105.00', '2020-02-12', '024/BBM-PPP/2/2020', 'Terima Pembayaran Dari Pak Imran Mekarsari', 0, 25000000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:13:04'),
(803, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'Bayar Hutang Plate Country', 0, 16683000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(804, '025/BBK-PPP/2/2020', '2103.00', '2020-02-14', '025/BBK-PPP/2/2020', 'Bayar Hutang Plate Country', 16683000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(805, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(806, '025/BBK-PPP/2/2020', '8201', '2020-02-14', '025/BBK-PPP/2/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(807, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'Bayar Hutang Plate Victory', 0, 25676000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(808, '025/BBK-PPP/2/2020', '2103.00', '2020-02-14', '025/BBK-PPP/2/2020', 'Bayar Hutang Plate Victory', 25676000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(809, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(810, '025/BBK-PPP/2/2020', '8201', '2020-02-14', '025/BBK-PPP/2/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(811, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'Bayar Hutang Plate Multiprint', 0, 5454000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(812, '025/BBK-PPP/2/2020', '2103.00', '2020-02-14', '025/BBK-PPP/2/2020', 'Bayar Hutang Plate Multiprint', 5454000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(813, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(814, '025/BBK-PPP/2/2020', '8201', '2020-02-14', '025/BBK-PPP/2/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(815, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'Bayar Lem Ke Polychemie', 0, 13031250, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(816, '025/BBK-PPP/2/2020', '2103.00', '2020-02-14', '025/BBK-PPP/2/2020', 'Bayar Lem Ke Polychemie', 13031250, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(817, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'Bayar Tinta Ke Maraset', 0, 14557000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(818, '025/BBK-PPP/2/2020', '2103.00', '2020-02-14', '025/BBK-PPP/2/2020', 'Bayar Tinta Ke Maraset', 14557000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(819, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(820, '025/BBK-PPP/2/2020', '8201', '2020-02-14', '025/BBK-PPP/2/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(821, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(822, '025/BBK-PPP/2/2020', '8201', '2020-02-14', '025/BBK-PPP/2/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(823, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'Bayar Recover Roll Ke Mirza Teknik', 0, 23740000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(824, '025/BBK-PPP/2/2020', '2103.00', '2020-02-14', '025/BBK-PPP/2/2020', 'Bayar Recover Roll Ke Mirza Teknik', 23740000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(825, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'Bayar Hutang Ke Expressindo', 0, 20400000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(826, '025/BBK-PPP/2/2020', '2103.00', '2020-02-14', '025/BBK-PPP/2/2020', 'Bayar Hutang Ke Expressindo', 20400000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(827, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(828, '025/BBK-PPP/2/2020', '8201', '2020-02-14', '025/BBK-PPP/2/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(829, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'Bayar Sucker Kaliatamajaya', 0, 1075000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(830, '025/BBK-PPP/2/2020', '5704', '2020-02-14', '025/BBK-PPP/2/2020', 'Bayar Sucker Kaliatamajaya', 1075000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(831, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(832, '025/BBK-PPP/2/2020', '8201', '2020-02-14', '025/BBK-PPP/2/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(833, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'BPJS Kesehatan Karyawan', 0, 4717692, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(834, '025/BBK-PPP/2/2020', '7104', '2020-02-14', '025/BBK-PPP/2/2020', 'BPJS Kesehatan Karyawan', 4717692, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(835, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'Pembayaran Hutang Ke Temprint', 0, 50000000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(836, '025/BBK-PPP/2/2020', '2198.50', '2020-02-14', '025/BBK-PPP/2/2020', 'Pembayaran Hutang Ke Temprint', 50000000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(837, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'Pembayaran Hutang Ke Balebat', 0, 50000000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(838, '025/BBK-PPP/2/2020', '2198.50', '2020-02-14', '025/BBK-PPP/2/2020', 'Pembayaran Hutang Ke Balebat', 50000000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(839, '025/BBK-PPP/2/2020', '1102.02', '2020-02-14', '025/BBK-PPP/2/2020', 'BPJS Kesehatan Karyawan', 0, 12419773, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(840, '025/BBK-PPP/2/2020', '7107', '2020-02-14', '025/BBK-PPP/2/2020', 'BPJS Kesehatan Karyawan', 12419773, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:27:59'),
(841, '026/BBM-PPP/2/2020', '1102.02', '2020-02-14', '026/BBM-PPP/2/2020', 'Pembayaran Piutang Usaha Ibu Citra', 20000000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:29:16'),
(842, '026/BBM-PPP/2/2020', '1105.00', '2020-02-14', '026/BBM-PPP/2/2020', 'Pembayaran Piutang Usaha Ibu Citra', 0, 20000000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:29:16'),
(843, '027/BBK-PPP/2/2020', '1102.02', '2020-02-17', '027/BBK-PPP/2/2020', 'Bayar Hutang Plate Ke Victory', 0, 3000000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:37:52'),
(844, '027/BBK-PPP/2/2020', '2103.00', '2020-02-17', '027/BBK-PPP/2/2020', 'Bayar Hutang Plate Ke Victory', 3000000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:37:52'),
(845, '027/BBK-PPP/2/2020', '1102.02', '2020-02-17', '027/BBK-PPP/2/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:37:52'),
(846, '027/BBK-PPP/2/2020', '8201', '2020-02-17', '027/BBK-PPP/2/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 04:37:52'),
(847, '028/BBM-PPP/2/2020', '1102.02', '2020-02-18', '028/BBM-PPP/2/2020', 'Terima Pembayaran Dari Tulang Bawang', 11750000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:13:32'),
(848, '028/BBM-PPP/2/2020', '1105.00', '2020-02-18', '028/BBM-PPP/2/2020', 'Terima Pembayaran Dari Tulang Bawang', 0, 11750000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:13:32'),
(849, '029/BBK-PPP/2/2020', '1102.02', '2020-02-18', '029/BBK-PPP/2/2020', 'Bayar Kertas Security Ke PNRI', 0, 2578875, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:15:10'),
(850, '029/BBK-PPP/2/2020', '5200', '2020-02-18', '029/BBK-PPP/2/2020', 'Bayar Kertas Security Ke PNRI', 2578875, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:15:10'),
(851, '029/BBK-PPP/2/2020', '1102.02', '2020-02-18', '029/BBK-PPP/2/2020', 'Bayar Hutang Plate Ke Victory', 0, 11711000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:15:10'),
(852, '029/BBK-PPP/2/2020', '2103.00', '2020-02-18', '029/BBK-PPP/2/2020', 'Bayar Hutang Plate Ke Victory', 11711000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:15:10'),
(853, '029/BBK-PPP/2/2020', '1102.02', '2020-02-18', '029/BBK-PPP/2/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:15:10'),
(854, '029/BBK-PPP/2/2020', '8201', '2020-02-18', '029/BBK-PPP/2/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:15:10'),
(855, '030/BBM-PPP/2/2020', '1102.02', '2020-02-19', '030/BBM-PPP/2/2020', 'Terima Pembayaran Dari Pak Yasin', 54166000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:15:57'),
(856, '030/BBM-PPP/2/2020', '1105.00', '2020-02-19', '030/BBM-PPP/2/2020', 'Terima Pembayaran Dari Pak Yasin', 0, 54166000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:15:57'),
(857, '031/BBK-PPP/2/2020', '1102.02', '2020-02-19', '031/BBK-PPP/2/2020', 'Biaya Beli Tiket Perjalanan Ke Inggris Beli Mesin', 0, 17506932, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:26:47'),
(858, '031/BBK-PPP/2/2020', '7416', '2020-02-19', '031/BBK-PPP/2/2020', 'Biaya Beli Tiket Perjalanan Ke Inggris Beli Mesin', 17506932, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:26:47'),
(859, '031/BBK-PPP/2/2020', '1102.02', '2020-02-19', '031/BBK-PPP/2/2020', 'Bayar Perbaikan Baling2 Gudang Ke Pak Sariadji', 0, 3900000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:26:47'),
(860, '031/BBK-PPP/2/2020', '5702', '2020-02-19', '031/BBK-PPP/2/2020', 'Bayar Perbaikan Baling2 Gudang Ke Pak Sariadji', 3900000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:26:47'),
(861, '031/BBK-PPP/2/2020', '1102.02', '2020-02-19', '031/BBK-PPP/2/2020', 'Bayar Bunga Back To Back', 0, 20000000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:26:47'),
(862, '031/BBK-PPP/2/2020', '8206', '2020-02-19', '031/BBK-PPP/2/2020', 'Bayar Bunga Back To Back', 20000000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:26:47'),
(863, '031/BBK-PPP/2/2020', '1102.02', '2020-02-19', '031/BBK-PPP/2/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:26:47'),
(864, '031/BBK-PPP/2/2020', '8201', '2020-02-19', '031/BBK-PPP/2/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:26:47'),
(865, '031/BBK-PPP/2/2020', '1102.02', '2020-02-19', '031/BBK-PPP/2/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:26:47'),
(866, '031/BBK-PPP/2/2020', '8201', '2020-02-19', '031/BBK-PPP/2/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:26:47'),
(867, '031/BBK-PPP/2/2020', '1102.02', '2020-02-19', '031/BBK-PPP/2/2020', 'Tunjangan Makan Karyawan', 0, 7920000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:26:47'),
(868, '031/BBK-PPP/2/2020', '7105', '2020-02-19', '031/BBK-PPP/2/2020', 'Tunjangan Makan Karyawan', 7920000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:26:47'),
(869, '031/BBK-PPP/2/2020', '1102.02', '2020-02-19', '031/BBK-PPP/2/2020', 'Sewa Pick Up Untuk Pengiriman', 0, 2200000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:26:47'),
(870, '031/BBK-PPP/2/2020', '6408', '2020-02-19', '031/BBK-PPP/2/2020', 'Sewa Pick Up Untuk Pengiriman', 2200000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:26:47'),
(871, '031/BBK-PPP/2/2020', '1102.02', '2020-02-19', '031/BBK-PPP/2/2020', 'Tunjangan Makan Karyawan', 0, 660000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:26:47'),
(872, '031/BBK-PPP/2/2020', '7105', '2020-02-19', '031/BBK-PPP/2/2020', 'Tunjangan Makan Karyawan', 660000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:26:47'),
(873, '031/BBK-PPP/2/2020', '1102.02', '2020-02-19', '031/BBK-PPP/2/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:26:47');
INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`, `penanggung`, `timestamps`) VALUES
(874, '031/BBK-PPP/2/2020', '8201', '2020-02-19', '031/BBK-PPP/2/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:26:47'),
(875, '032/BBM-PPP/2/2020', '1102.02', '2020-02-20', '032/BBM-PPP/2/2020', 'Terima Pembayaran Dari Pak Faisol Mentari Book', 40000000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:27:57'),
(876, '032/BBM-PPP/2/2020', '1105.00', '2020-02-20', '032/BBM-PPP/2/2020', 'Terima Pembayaran Dari Pak Faisol Mentari Book', 0, 40000000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:27:57'),
(877, '033/BBK-PPP/2/2020', '1102.02', '2020-02-20', '033/BBK-PPP/2/2020', 'Bayar Pengurusan VISA Karyawan', 0, 3500000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:29:13'),
(878, '033/BBK-PPP/2/2020', '7412', '2020-02-20', '033/BBK-PPP/2/2020', 'Bayar Pengurusan VISA Karyawan', 3500000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:29:13'),
(879, '033/BBK-PPP/2/2020', '1102.02', '2020-02-20', '033/BBK-PPP/2/2020', 'Biaya Kliring', 0, 3500, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:29:13'),
(880, '033/BBK-PPP/2/2020', '8201', '2020-02-20', '033/BBK-PPP/2/2020', 'Biaya Kliring', 3500, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:29:13'),
(881, '034/BBM-PPP/2/2020', '1102.02', '2020-02-20', '034/BBM-PPP/2/2020', 'Terima Pembayaran Dari Pak Yasin', 36346940, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:30:24'),
(882, '034/BBM-PPP/2/2020', '1105.00', '2020-02-20', '034/BBM-PPP/2/2020', 'Terima Pembayaran Dari Pak Yasin', 0, 36346940, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:30:24'),
(883, '035/BBK-PPP/2/2020', '1102.02', '2020-02-20', '035/BBK-PPP/2/2020', 'Pembayaran Hutang Ke Balebat', 0, 50000000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:31:05'),
(884, '035/BBK-PPP/2/2020', '2198.50', '2020-02-20', '035/BBK-PPP/2/2020', 'Pembayaran Hutang Ke Balebat', 50000000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:31:05'),
(885, '036/BBM-PPP/2/2020', '1102.02', '2020-02-20', '036/BBM-PPP/2/2020', 'Terima Pembayaran Dari Pelanggan', 5000000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:32:48'),
(886, '036/BBM-PPP/2/2020', '1105.00', '2020-02-20', '036/BBM-PPP/2/2020', 'Terima Pembayaran Dari Pelanggan', 0, 5000000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:32:48'),
(887, '037/BBK-PPP/2/2020', '1102.02', '2020-02-20', '037/BBK-PPP/2/2020', 'Pembayaran Hutang Ke Temprint', 0, 50000000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:57:22'),
(888, '037/BBK-PPP/2/2020', '2198.50', '2020-02-20', '037/BBK-PPP/2/2020', 'Pembayaran Hutang Ke Temprint', 50000000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:57:22'),
(889, '038/BBK-PPP/2/2020', '1102.02', '2020-02-20', '038/BBK-PPP/2/2020', 'Bayar Tiket Perjalanan Dinas Ke Jkt', 0, 1161800, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:59:04'),
(890, '038/BBK-PPP/2/2020', '6407', '2020-02-20', '038/BBK-PPP/2/2020', 'Bayar Tiket Perjalanan Dinas Ke Jkt', 1161800, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 05:59:04'),
(891, '039/BBK-PPP/2/2020', '1102.02', '2020-02-20', '039/BBK-PPP/2/2020', 'Bayar Angsuran UMKM Ke BPR Jatim', 0, 10150000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 06:47:45'),
(892, '039/BBK-PPP/2/2020', '1102.10', '2020-02-20', '039/BBK-PPP/2/2020', 'Bayar Angsuran UMKM Ke BPR Jatim', 10150000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 06:47:45'),
(893, '039/BBK-PPP/2/2020', '1102.02', '2020-02-20', '039/BBK-PPP/2/2020', 'Bayar Bunga UMKM Ke BPR Jatim', 0, 8550000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 06:47:45'),
(894, '039/BBK-PPP/2/2020', '1102.10', '2020-02-20', '039/BBK-PPP/2/2020', 'Bayar Bunga UMKM Ke BPR Jatim', 8550000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 06:47:45'),
(895, '039/BBK-PPP/2/2020', '1102.02', '2020-02-20', '039/BBK-PPP/2/2020', 'Bayar HUtang Leasing Mobil Innova', 0, 5841000, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 06:47:45'),
(896, '039/BBK-PPP/2/2020', '2198.50', '2020-02-20', '039/BBK-PPP/2/2020', 'Bayar HUtang Leasing Mobil Innova', 5841000, 0, '0000-00-00', '', '', 1, 'Hidayati', '2020-03-06 06:47:45'),
(897, '079/SJ-PPP/3/2020', '4101.06', '2020-03-06', '076/INV-PPP/3/2020', 'Penjualan 076/INV-PPP/3/2020', 0, 107055000, '0000-00-00', '', 'CST0008', 1, '', '2020-03-06 07:24:00'),
(898, '079/SJ-PPP/3/2020', '1105.00', '2020-03-06', '076/INV-PPP/3/2020', 'Penjualan 076/INV-PPP/3/2020', 107055000, 0, '0000-00-00', '', 'CST0008', 1, '', '2020-03-06 07:24:00'),
(899, '081/SJ-PPP/3/2020', '4101.06', '2020-03-06', '077/INV-PPP/3/2020', 'Penjualan 077/INV-PPP/3/2020', 0, 4650000, '0000-00-00', '', 'CST0008', 1, '', '2020-03-06 07:24:06'),
(900, '081/SJ-PPP/3/2020', '1105.00', '2020-03-06', '077/INV-PPP/3/2020', 'Penjualan 077/INV-PPP/3/2020', 4650000, 0, '0000-00-00', '', 'CST0008', 1, '', '2020-03-06 07:24:06'),
(901, '080/SJ-PPP/3/2020', '4101.06', '2020-03-06', '078/INV-PPP/3/2020', 'Penjualan 078/INV-PPP/3/2020', 0, 74025000, '0000-00-00', '', 'CST0008', 1, '', '2020-03-06 07:24:18'),
(902, '080/SJ-PPP/3/2020', '1105.00', '2020-03-06', '078/INV-PPP/3/2020', 'Penjualan 078/INV-PPP/3/2020', 74025000, 0, '0000-00-00', '', 'CST0008', 1, '', '2020-03-06 07:24:18'),
(903, '078/SJ-PPP/3/2020', '4101.06', '2020-03-06', '079/INV-PPP/3/2020', 'Penjualan 079/INV-PPP/3/2020', 0, 42240000, '0000-00-00', '', 'CST0017', 1, '', '2020-03-06 07:24:31'),
(904, '078/SJ-PPP/3/2020', '1105.00', '2020-03-06', '079/INV-PPP/3/2020', 'Penjualan 079/INV-PPP/3/2020', 42240000, 0, '0000-00-00', '', 'CST0017', 1, '', '2020-03-06 07:24:31'),
(905, '082/SJ-PPP/3/2020', '4101.06', '2020-03-06', '080/INV-PPP/3/2020', 'Penjualan 080/INV-PPP/3/2020', 0, 1700000, '0000-00-00', '', 'CST0027', 1, '', '2020-03-06 09:19:18'),
(906, '082/SJ-PPP/3/2020', '1105.00', '2020-03-06', '080/INV-PPP/3/2020', 'Penjualan 080/INV-PPP/3/2020', 1700000, 0, '0000-00-00', '', 'CST0027', 1, '', '2020-03-06 09:19:18'),
(907, '083/SJ-PPP/3/2020', '4101.06', '2020-03-06', '081/INV-PPP/3/2020', 'Penjualan 081/INV-PPP/3/2020', 0, 850000, '0000-00-00', '', 'CST0027', 1, '', '2020-03-06 09:22:35'),
(908, '083/SJ-PPP/3/2020', '1105.00', '2020-03-06', '081/INV-PPP/3/2020', 'Penjualan 081/INV-PPP/3/2020', 850000, 0, '0000-00-00', '', 'CST0027', 1, '', '2020-03-06 09:22:35'),
(909, '082/SJ-PPP/3/2020', '4101.06', '2020-03-06', '082/INV-PPP/3/2020', 'Penjualan 082/INV-PPP/3/2020', 0, 1700000, '0000-00-00', '', 'CST0027', 20, '', '2020-03-06 09:28:32'),
(910, '082/SJ-PPP/3/2020', '1105.00', '2020-03-06', '082/INV-PPP/3/2020', 'Penjualan 082/INV-PPP/3/2020', 1700000, 0, '0000-00-00', '', 'CST0027', 20, '', '2020-03-06 09:28:32'),
(911, '084/SJ-PPP/3/2020', '4101.06', '2020-03-06', '083/INV-PPP/3/2020', 'Penjualan 083/INV-PPP/3/2020', 0, 340000, '0000-00-00', '', 'CST0027', 20, '', '2020-03-06 09:29:47'),
(912, '084/SJ-PPP/3/2020', '1105.00', '2020-03-06', '083/INV-PPP/3/2020', 'Penjualan 083/INV-PPP/3/2020', 340000, 0, '0000-00-00', '', 'CST0027', 20, '', '2020-03-06 09:29:47'),
(913, '085/SJ-PPP/6/2020', '4101.06', '2020-06-16', '084/INV-PPP/6/2020', 'Penjualan 084/INV-PPP/6/2020', 0, 63080, '0000-00-00', '', 'CST0018', 1, '', '2020-06-16 02:26:16'),
(914, '085/SJ-PPP/6/2020', '1105.00', '2020-06-16', '084/INV-PPP/6/2020', 'Penjualan 084/INV-PPP/6/2020', 63080, 0, '0000-00-00', '', 'CST0018', 1, '', '2020-06-16 02:26:16'),
(915, '001/RT-PPP/06/2020', '4401.06', '2020-06-16', '084/INV-PPP/6/2020', 'Retur Penjualan 084/INV-PPP/6/2020', 15770, 0, '0000-00-00', '', 'CST0018', 1, '', '2020-06-16 02:33:51'),
(916, '001/RT-PPP/06/2020', '1105.00', '2020-06-16', '084/INV-PPP/6/2020', 'Retur Penjualan 084/INV-PPP/6/2020', 0, 15770, '0000-00-00', '', 'CST0018', 1, '', '2020-06-16 02:33:51'),
(917, '001/RT-PPP/06/2020', '4401.06', '2020-06-16', '084/INV-PPP/6/2020', 'Retur Penjualan 084/INV-PPP/6/2020', 15770, 0, '0000-00-00', '', 'CST0018', 1, '', '2020-06-16 02:34:21'),
(918, '001/RT-PPP/06/2020', '1105.00', '2020-06-16', '084/INV-PPP/6/2020', 'Retur Penjualan 084/INV-PPP/6/2020', 0, 15770, '0000-00-00', '', 'CST0018', 1, '', '2020-06-16 02:34:21'),
(919, '086/SJ-PPP/6/2020', '4101.06', '2020-06-16', '085/INV-PPP/6/2020', 'Penjualan 085/INV-PPP/6/2020', 0, 17290, '0000-00-00', '', 'CST0018', 1, '', '2020-06-16 02:52:36'),
(920, '086/SJ-PPP/6/2020', '1105.00', '2020-06-16', '085/INV-PPP/6/2020', 'Penjualan 085/INV-PPP/6/2020', 17290, 0, '0000-00-00', '', 'CST0018', 1, '', '2020-06-16 02:52:36'),
(921, '001/SJ-PPP/02/2020', '4101.06', '2021-03-23', '086/INV-PPP/3/2021', 'Penjualan 086/INV-PPP/3/2021', 0, 11250000, '0000-00-00', '', 'CST0018', 16, '', '2021-03-23 14:26:17'),
(922, '001/SJ-PPP/02/2020', '1105.00', '2021-03-23', '086/INV-PPP/3/2021', 'Penjualan 086/INV-PPP/3/2021', 11250000, 0, '0000-00-00', '', 'CST0018', 16, '', '2021-03-23 14:26:17'),
(923, '001/RT-PPP/03/2021', '4401.06', '2021-03-23', '086/INV-PPP/3/2021', 'Retur Penjualan 086/INV-PPP/3/2021', 3750000, 0, '0000-00-00', '', 'CST0018', 16, '', '2021-03-23 15:08:24'),
(924, '001/RT-PPP/03/2021', '1105.00', '2021-03-23', '086/INV-PPP/3/2021', 'Retur Penjualan 086/INV-PPP/3/2021', 0, 3750000, '0000-00-00', '', 'CST0018', 16, '', '2021-03-23 15:08:24'),
(925, '001/RT-PPP/03/2021', '4401.06', '2021-03-23', '086/INV-PPP/3/2021', 'Retur Penjualan 086/INV-PPP/3/2021', 3750000, 0, '0000-00-00', '', 'CST0018', 16, '', '2021-03-23 15:09:33'),
(926, '001/RT-PPP/03/2021', '1105.00', '2021-03-23', '086/INV-PPP/3/2021', 'Retur Penjualan 086/INV-PPP/3/2021', 0, 3750000, '0000-00-00', '', 'CST0018', 16, '', '2021-03-23 15:09:33'),
(927, '001/RT-PPP/03/2021', '4401.06', '2021-03-23', '086/INV-PPP/3/2021', 'Retur Penjualan 086/INV-PPP/3/2021', 3750000, 0, '0000-00-00', '', 'CST0018', 16, '', '2021-03-23 15:09:54'),
(928, '001/RT-PPP/03/2021', '1105.00', '2021-03-23', '086/INV-PPP/3/2021', 'Retur Penjualan 086/INV-PPP/3/2021', 0, 3750000, '0000-00-00', '', 'CST0018', 16, '', '2021-03-23 15:09:54'),
(929, '001/RT-PPP/03/2021', '4401.06', '2021-03-23', '086/INV-PPP/3/2021', 'Retur Penjualan 086/INV-PPP/3/2021', 3750000, 0, '0000-00-00', '', 'CST0018', 16, '', '2021-03-23 15:11:15'),
(930, '001/RT-PPP/03/2021', '1105.00', '2021-03-23', '086/INV-PPP/3/2021', 'Retur Penjualan 086/INV-PPP/3/2021', 0, 3750000, '0000-00-00', '', 'CST0018', 16, '', '2021-03-23 15:11:15'),
(931, '001/RT-PPP/03/2021', '4401.06', '2021-03-23', '086/INV-PPP/3/2021', 'Retur Penjualan 086/INV-PPP/3/2021', 3750000, 0, '0000-00-00', '', 'CST0018', 16, '', '2021-03-23 15:11:44'),
(932, '001/RT-PPP/03/2021', '1105.00', '2021-03-23', '086/INV-PPP/3/2021', 'Retur Penjualan 086/INV-PPP/3/2021', 0, 3750000, '0000-00-00', '', 'CST0018', 16, '', '2021-03-23 15:11:44'),
(933, '001/SH-DO/3/2021', '4101.06', '2021-03-24', '001/SH-INV/III/2021', 'Penjualan 001/SH-INV/III/2021', 0, 950000, '0000-00-00', '', 'CST0010', 1, '', '2021-03-24 00:59:15'),
(934, '001/SH-DO/3/2021', '1105.00', '2021-03-24', '001/SH-INV/III/2021', 'Penjualan 001/SH-INV/III/2021', 950000, 0, '0000-00-00', '', 'CST0010', 1, '', '2021-03-24 00:59:15'),
(935, '001/SH-SO/III/2021', '20000', '0000-00-00', '001/SH-SO/III/2021', 'Penerimaan DP. Pekerjaan 001/SH-SO/III/2021', 0, 7500000, '0000-00-00', 'Post', 'CST0024', 1, '', '2021-03-25 05:27:58'),
(936, '001/SH-SO/III/2021', '1102.01', '0000-00-00', '001/SH-SO/III/2021', 'Penerimaan DP. Pekerjaan 001/SH-SO/III/2021', 7500000, 0, '0000-00-00', 'Post', 'CST0024', 1, '', '2021-03-25 05:27:58'),
(937, '001/SH-SO/III/2021', '20000', '0000-00-00', '001/SH-SO/III/2021', 'Penerimaan DP. Pekerjaan 001/SH-SO/III/2021', 0, 7500000, '0000-00-00', 'Post', 'CST0024', 1, '', '2021-03-25 05:28:33'),
(938, '001/SH-SO/III/2021', '1102.01', '0000-00-00', '001/SH-SO/III/2021', 'Penerimaan DP. Pekerjaan 001/SH-SO/III/2021', 7500000, 0, '0000-00-00', 'Post', 'CST0024', 1, '', '2021-03-25 05:28:33'),
(939, '001/SH-DO/III/2021', '4101.06', '2021-03-25', '001/SH-INV/III/2021', 'Penjualan 001/SH-INV/III/2021', 0, 7500000, '0000-00-00', '', 'CST0024', 1, '', '2021-03-25 05:29:58'),
(940, '001/SH-DO/III/2021', '1105.00', '2021-03-25', '001/SH-INV/III/2021', 'Penjualan 001/SH-INV/III/2021', 7500000, 0, '0000-00-00', '', 'CST0024', 1, '', '2021-03-25 05:29:58'),
(941, '001/SH-DO/III/2021', '4101.06', '2021-03-25', '002/SH-INV/III/2021', 'Penjualan 002/SH-INV/III/2021', 0, 7500000, '0000-00-00', 'Post', 'CST0024', 1, '', '2021-03-30 12:58:44'),
(942, '001/SH-DO/III/2021', '1105.00', '2021-03-25', '002/SH-INV/III/2021', 'Penjualan 002/SH-INV/III/2021', 7500000, 0, '0000-00-00', 'Post', 'CST0024', 1, '', '2021-03-30 12:58:44'),
(943, '002/SH-PO/III/2021', '1405.02', '0000-00-00', '002/SH-PO/III/2021', 'Pembelian Barang 002/SH-PO/III/2021', 0, 45000000, '0000-00-00', '', '', 16, '', '2021-03-25 23:42:24'),
(944, '002/SH-PO/III/2021', '1105.00', '0000-00-00', '002/SH-PO/III/2021', 'Pembelian Barang 002/SH-PO/III/2021', 45000000, 0, '0000-00-00', '', '', 16, '', '2021-03-25 23:42:24'),
(945, '002/SH-PO/III/2021', '1405.02', '0000-00-00', '002/SH-PO/III/2021', 'Pembelian Barang 002/SH-PO/III/2021', 0, 10000000, '0000-00-00', '', '', 16, '', '2021-03-25 23:42:24'),
(946, '002/SH-PO/III/2021', '1105.00', '0000-00-00', '002/SH-PO/III/2021', 'Pembelian Barang 002/SH-PO/III/2021', 10000000, 0, '0000-00-00', '', '', 16, '', '2021-03-25 23:42:24'),
(947, '002/SH-PO/III/2021', '1405.02', '2021-03-26', '002/SH-PO/III/2021', 'Pembelian Barang 002/SH-PO/III/2021', 0, 45000000, '0000-00-00', '', 'SUP0001', 16, '', '2021-03-25 23:43:05'),
(948, '002/SH-PO/III/2021', '1105.00', '2021-03-26', '002/SH-PO/III/2021', 'Pembelian Barang 002/SH-PO/III/2021', 45000000, 0, '0000-00-00', '', 'SUP0001', 16, '', '2021-03-25 23:43:05'),
(949, '002/SH-PO/III/2021', '1405.02', '2021-03-26', '002/SH-PO/III/2021', 'Pembelian Barang 002/SH-PO/III/2021', 0, 10000000, '0000-00-00', 'Post', 'SUP0001', 16, '', '2021-03-30 12:37:25'),
(950, '002/SH-PO/III/2021', '1105.00', '2021-03-26', '002/SH-PO/III/2021', 'Pembelian Barang 002/SH-PO/III/2021', 10000000, 0, '0000-00-00', 'Post', 'SUP0001', 16, '', '2021-03-30 12:37:25'),
(951, '002/SH-SO/IV/2021', '2101.10', '2021-04-02', '002/SH-SO/IV/2021', 'Penerimaan DP. Pekerjaan 002/SH-SO/IV/2021', 0, 172500, '0000-00-00', 'Post', 'CST0008', 1, '', '2021-04-02 14:19:36'),
(952, '002/SH-SO/IV/2021', '1102.05', '2021-04-02', '002/SH-SO/IV/2021', 'Penerimaan DP. Pekerjaan 002/SH-SO/IV/2021', 172500, 0, '0000-00-00', 'Post', 'CST0008', 1, '', '2021-04-02 14:19:36'),
(953, '002/SH-DO/IV/2021', '4101.06', '2021-04-02', '002/SH-INV/IV/2021', 'Penjualan 002/SH-INV/IV/2021', 0, 150000, '0000-00-00', '', 'CST0008', 1, '', '2021-04-02 14:20:43'),
(954, '002/SH-DO/IV/2021', '1105.00', '2021-04-02', '002/SH-INV/IV/2021', 'Penjualan 002/SH-INV/IV/2021', 150000, 0, '0000-00-00', '', 'CST0008', 1, '', '2021-04-02 14:20:43'),
(955, '005/SH-PO/IV/2021', '1405.02', '2021-04-02', '005/SH-PO/IV/2021', 'Pembelian Barang 005/SH-PO/IV/2021', 0, 150000, '0000-00-00', '', 'SUP0001', 1, '', '2021-04-02 14:51:47'),
(956, '005/SH-PO/IV/2021', '7404', '2021-04-02', '005/SH-PO/IV/2021', 'Pembelian Barang 005/SH-PO/IV/2021', 150000, 0, '0000-00-00', '', 'SUP0001', 1, '', '2021-04-02 14:51:47'),
(957, '005/SH-PO/IV/2021', '1405.02', '2021-04-02', '005/SH-PO/IV/2021', 'Pembelian Barang 005/SH-PO/IV/2021', 0, 25000, '0000-00-00', '', 'SUP0002', 1, '', '2021-04-02 14:51:47'),
(958, '005/SH-PO/IV/2021', '7404', '2021-04-02', '005/SH-PO/IV/2021', 'Pembelian Barang 005/SH-PO/IV/2021', 25000, 0, '0000-00-00', '', 'SUP0002', 1, '', '2021-04-02 14:51:47'),
(959, '003/SH-SO/IV/2021', '2101.10', '2021-04-05', '003/SH-SO/IV/2021', 'Penerimaan DP. Pekerjaan 003/SH-SO/IV/2021', 0, 44000, '0000-00-00', 'Post', 'CST0026', 1, '', '2021-04-05 11:29:40'),
(960, '003/SH-SO/IV/2021', '1101.01', '2021-04-05', '003/SH-SO/IV/2021', 'Penerimaan DP. Pekerjaan 003/SH-SO/IV/2021', 44000, 0, '0000-00-00', 'Post', 'CST0026', 1, '', '2021-04-05 11:29:40'),
(961, '003/SH-DO/IV/2021', '4101.06', '2021-04-05', '003/SH-INV/IV/2021', 'Penjualan 003/SH-INV/IV/2021', 0, 40000, '0000-00-00', '', 'CST0026', 1, '', '2021-04-05 11:30:56'),
(962, '003/SH-DO/IV/2021', '1105.00', '2021-04-05', '003/SH-INV/IV/2021', 'Penjualan 003/SH-INV/IV/2021', 40000, 0, '0000-00-00', '', 'CST0026', 1, '', '2021-04-05 11:30:56'),
(963, '004/SH-SO/IV/2021', '2101.10', '2021-04-07', '004/SH-SO/IV/2021', 'Penerimaan DP. Pekerjaan 004/SH-SO/IV/2021', 0, 22000, '0000-00-00', 'Post', 'CST0026', 1, '', '2021-04-07 11:47:15'),
(964, '004/SH-SO/IV/2021', '1101.01', '2021-04-07', '004/SH-SO/IV/2021', 'Penerimaan DP. Pekerjaan 004/SH-SO/IV/2021', 22000, 0, '0000-00-00', 'Post', 'CST0026', 1, '', '2021-04-07 11:47:15'),
(965, '004/SH-DO/IV/2021', '4101.06', '2021-04-07', '004/SH-INV/IV/2021', 'Penjualan 004/SH-INV/IV/2021', 0, 20000, '0000-00-00', '', 'CST0026', 1, '', '2021-04-07 11:50:58'),
(966, '004/SH-DO/IV/2021', '1105.00', '2021-04-07', '004/SH-INV/IV/2021', 'Penjualan 004/SH-INV/IV/2021', 20000, 0, '0000-00-00', '', 'CST0026', 1, '', '2021-04-07 11:50:58'),
(967, '005/SH-SO/IV/2021', '2101.10', '2021-04-08', '005/SH-SO/IV/2021', 'Penerimaan DP. Pekerjaan 005/SH-SO/IV/2021', 0, 0, '0000-00-00', 'Post', 'CST0022', 1, '', '2021-04-08 05:19:45'),
(968, '005/SH-SO/IV/2021', '1102.02', '2021-04-08', '005/SH-SO/IV/2021', 'Penerimaan DP. Pekerjaan 005/SH-SO/IV/2021', 0, 0, '0000-00-00', 'Post', 'CST0022', 1, '', '2021-04-08 05:19:45'),
(969, '006/SH-PO/IV/2021', '1405.02', '2021-04-08', '006/SH-PO/IV/2021', 'Pembelian Barang 006/SH-PO/IV/2021', 0, 30000, '0000-00-00', '', 'SUP0001', 1, '', '2021-04-08 08:19:30'),
(970, '006/SH-PO/IV/2021', '7404', '2021-04-08', '006/SH-PO/IV/2021', 'Pembelian Barang 006/SH-PO/IV/2021', 30000, 0, '0000-00-00', '', 'SUP0001', 1, '', '2021-04-08 08:19:30'),
(971, '016/MNJ-PH/V/2021', '1108.99', '2021-05-17', '016/MNJ-PH/V/2021', 'Ongkos Kirim 016/MNJ-PH/V/2021', 0, 1000000, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-17 12:33:04'),
(972, '016/MNJ-PH/V/2021', '7404', '2021-05-17', '016/MNJ-PH/V/2021', 'Ongkos Kirim 016/MNJ-PH/V/2021', 1000000, 0, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-17 12:33:04'),
(973, '001/SH-PO/V/2021', '1405.02', '2021-05-17', '001/SH-PO/V/2021', 'Pembelian Barang 001/SH-PO/V/2021', 0, 2200, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-17 12:57:31'),
(974, '001/SH-PO/V/2021', '7404', '2021-05-17', '001/SH-PO/V/2021', 'Pembelian Barang 001/SH-PO/V/2021', 2200, 0, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-17 12:57:31'),
(975, '001/SH-PO/V/2021', '1405.02', '2021-05-17', '001/SH-PO/V/2021', 'Pembelian Barang 001/SH-PO/V/2021', 0, 5500, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-17 12:57:31'),
(976, '001/SH-PO/V/2021', '7404', '2021-05-17', '001/SH-PO/V/2021', 'Pembelian Barang 001/SH-PO/V/2021', 5500, 0, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-17 12:57:31'),
(977, '001/SH-PO/V/2021', '1405.02', '2021-05-17', '001/SH-PO/V/2021', 'Pembelian Barang 001/SH-PO/V/2021', 0, 20000, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-17 13:29:47'),
(978, '001/SH-PO/V/2021', '7404', '2021-05-17', '001/SH-PO/V/2021', 'Pembelian Barang 001/SH-PO/V/2021', 20000, 0, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-17 13:29:47'),
(979, '001/SH-SO/V/2021', '2101.10', '2021-05-17', '001/SH-SO/V/2021', 'Penerimaan DP. Pekerjaan 001/SH-SO/V/2021', 0, 10500, '0000-00-00', 'Post', 'CST0006', 1, '', '2021-05-17 13:52:34'),
(980, '001/SH-SO/V/2021', '1101.02', '2021-05-17', '001/SH-SO/V/2021', 'Penerimaan DP. Pekerjaan 001/SH-SO/V/2021', 10500, 0, '0000-00-00', 'Post', 'CST0006', 1, '', '2021-05-17 13:52:34'),
(981, '001/SH-DO/V/2021', '4101.06', '2021-05-17', '001/SH-INV/V/2021', 'Penjualan 001/SH-INV/V/2021', 0, 4500, '0000-00-00', '', 'CST0006', 1, '', '2021-05-17 14:00:56'),
(982, '001/SH-DO/V/2021', '1105.00', '2021-05-17', '001/SH-INV/V/2021', 'Penjualan 001/SH-INV/V/2021', 4500, 0, '0000-00-00', '', 'CST0006', 1, '', '2021-05-17 14:00:56'),
(983, '001/MNJ-PH/V/2021', '1108.99', '2021-05-18', '001/MNJ-PH/V/2021', 'Ongkos Kirim 001/MNJ-PH/V/2021', 0, 1000000, '0000-00-00', '', 'SUP0002', 1, '', '2021-05-17 19:54:42'),
(984, '001/MNJ-PH/V/2021', '7404', '2021-05-18', '001/MNJ-PH/V/2021', 'Ongkos Kirim 001/MNJ-PH/V/2021', 1000000, 0, '0000-00-00', '', 'SUP0002', 1, '', '2021-05-17 19:54:42'),
(985, '001/SH-PO/V/2021', '1405.02', '2021-05-18', '001/SH-PO/V/2021', 'Pembelian Barang 001/SH-PO/V/2021', 0, 10000000, '0000-00-00', '', 'SUP0002', 1, '', '2021-05-17 20:00:50'),
(986, '001/SH-PO/V/2021', '7404', '2021-05-18', '001/SH-PO/V/2021', 'Pembelian Barang 001/SH-PO/V/2021', 10000000, 0, '0000-00-00', '', 'SUP0002', 1, '', '2021-05-17 20:00:50'),
(987, '002/MNJ-PH/V/2021', '1108.99', '2021-05-18', '002/MNJ-PH/V/2021', 'Ongkos Kirim 002/MNJ-PH/V/2021', 0, 2000000, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-17 20:07:04'),
(988, '002/MNJ-PH/V/2021', '7404', '2021-05-18', '002/MNJ-PH/V/2021', 'Ongkos Kirim 002/MNJ-PH/V/2021', 2000000, 0, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-17 20:07:04'),
(989, '002/SH-PO/V/2021', '1405.02', '2021-05-18', '002/SH-PO/V/2021', 'Pembelian Barang 002/SH-PO/V/2021', 0, 2000000, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-17 20:08:10'),
(990, '002/SH-PO/V/2021', '7404', '2021-05-18', '002/SH-PO/V/2021', 'Pembelian Barang 002/SH-PO/V/2021', 2000000, 0, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-17 20:08:10'),
(991, '003/MNJ-PH/V/2021', '1108.99', '2021-05-18', '003/MNJ-PH/V/2021', 'Ongkos Kirim 003/MNJ-PH/V/2021', 0, 1000000, '0000-00-00', '', 'SUP0002', 1, '', '2021-05-18 10:12:23'),
(992, '003/MNJ-PH/V/2021', '7404', '2021-05-18', '003/MNJ-PH/V/2021', 'Ongkos Kirim 003/MNJ-PH/V/2021', 1000000, 0, '0000-00-00', '', 'SUP0002', 1, '', '2021-05-18 10:12:23'),
(993, '005/MNJ-PH/V/2021', '1108.99', '2021-05-18', '005/MNJ-PH/V/2021', 'Ongkos Kirim 005/MNJ-PH/V/2021', 0, 500000, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-18 10:14:57'),
(994, '005/MNJ-PH/V/2021', '7404', '2021-05-18', '005/MNJ-PH/V/2021', 'Ongkos Kirim 005/MNJ-PH/V/2021', 500000, 0, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-18 10:14:57'),
(995, '003/SH-PO/V/2021', '1405.02', '2021-05-18', '003/SH-PO/V/2021', 'Pembelian Barang 003/SH-PO/V/2021', 0, 500000, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-18 10:17:18'),
(996, '003/SH-PO/V/2021', '7404', '2021-05-18', '003/SH-PO/V/2021', 'Pembelian Barang 003/SH-PO/V/2021', 500000, 0, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-18 10:17:18'),
(997, '006/MNJ-PH/V/2021', '1108.99', '2021-05-18', '006/MNJ-PH/V/2021', 'Ongkos Kirim 006/MNJ-PH/V/2021', 0, 300000, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-18 11:50:18'),
(998, '006/MNJ-PH/V/2021', '7404', '2021-05-18', '006/MNJ-PH/V/2021', 'Ongkos Kirim 006/MNJ-PH/V/2021', 300000, 0, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-18 11:50:18'),
(999, '007/MNJ-PH/V/2021', '1108.99', '2021-05-18', '007/MNJ-PH/V/2021', 'Ongkos Kirim 007/MNJ-PH/V/2021', 0, 700000, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-18 11:55:28'),
(1000, '007/MNJ-PH/V/2021', '7404', '2021-05-18', '007/MNJ-PH/V/2021', 'Ongkos Kirim 007/MNJ-PH/V/2021', 700000, 0, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-18 11:55:28'),
(1001, '008/MNJ-PH/V/2021', '1108.99', '2021-05-19', '008/MNJ-PH/V/2021', 'Ongkos Kirim 008/MNJ-PH/V/2021', 0, 1500000, '0000-00-00', '', 'SUP0001', 1, '', '2021-05-19 00:14:50'),
(1002, '008/MNJ-PH/V/2021', '7404', '2021-05-19', '008/MNJ-PH/V/2021', 'Ongkos Kirim 008/MNJ-PH/V/2021', 1500000, 0, '0000-00-00', '', 'SUP0001', 1, '', '2021-05-19 00:14:50'),
(1003, '004/SH-PO/V/2021', '1405.02', '2021-05-19', '004/SH-PO/V/2021', 'Pembelian Barang 004/SH-PO/V/2021', 0, 1500000, '0000-00-00', '', 'SUP0001', 1, '', '2021-05-19 00:16:07'),
(1004, '004/SH-PO/V/2021', '7404', '2021-05-19', '004/SH-PO/V/2021', 'Pembelian Barang 004/SH-PO/V/2021', 1500000, 0, '0000-00-00', '', 'SUP0001', 1, '', '2021-05-19 00:16:07'),
(1005, '005/SH-PO/V/2021', '1405.02', '2021-05-19', '005/SH-PO/V/2021', 'Pembelian Barang 005/SH-PO/V/2021', 0, 700000, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-19 00:17:42'),
(1006, '005/SH-PO/V/2021', '7404', '2021-05-19', '005/SH-PO/V/2021', 'Pembelian Barang 005/SH-PO/V/2021', 700000, 0, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-19 00:17:42'),
(1007, '006/SH-PO/V/2021', '1405.02', '2021-05-19', '006/SH-PO/V/2021', 'Pembelian Barang 006/SH-PO/V/2021', 0, 300000, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-19 00:18:48'),
(1008, '006/SH-PO/V/2021', '7404', '2021-05-19', '006/SH-PO/V/2021', 'Pembelian Barang 006/SH-PO/V/2021', 300000, 0, '0000-00-00', '', 'SUP0004', 1, '', '2021-05-19 00:18:48'),
(1009, '007/SH-PO/V/2021', '1405.02', '2021-05-19', '007/SH-PO/V/2021', 'Pembelian Barang 007/SH-PO/V/2021', 0, 10000000, '0000-00-00', '', 'SUP0002', 1, '', '2021-05-19 00:19:40'),
(1010, '007/SH-PO/V/2021', '7404', '2021-05-19', '007/SH-PO/V/2021', 'Pembelian Barang 007/SH-PO/V/2021', 10000000, 0, '0000-00-00', '', 'SUP0002', 1, '', '2021-05-19 00:19:40'),
(1011, '012/MNJ-PH/V/2021', '1108.99', '2021-05-19', '012/MNJ-PH/V/2021', 'Ongkos Kirim 012/MNJ-PH/V/2021', 0, 1100000, '0000-00-00', '', 'SUP0001', 1, '', '2021-05-19 03:42:42'),
(1012, '012/MNJ-PH/V/2021', '7404', '2021-05-19', '012/MNJ-PH/V/2021', 'Ongkos Kirim 012/MNJ-PH/V/2021', 1100000, 0, '0000-00-00', '', 'SUP0001', 1, '', '2021-05-19 03:42:42'),
(1013, '008/SH-PO/V/2021', '1405.02', '2021-05-19', '008/SH-PO/V/2021', 'Pembelian Barang 008/SH-PO/V/2021', 0, 100000, '0000-00-00', '', 'SUP0001', 1, '', '2021-05-19 03:45:41'),
(1014, '008/SH-PO/V/2021', '7404', '2021-05-19', '008/SH-PO/V/2021', 'Pembelian Barang 008/SH-PO/V/2021', 100000, 0, '0000-00-00', '', 'SUP0001', 1, '', '2021-05-19 03:45:41'),
(1015, '001/SH-SO/V/2021', '2101.10', '2021-05-19', '001/SH-SO/V/2021', 'Penerimaan DP. Pekerjaan 001/SH-SO/V/2021', 0, 15000000, '0000-00-00', 'Post', 'CST0005', 1, '', '2021-05-19 04:05:27'),
(1016, '001/SH-SO/V/2021', '1102.04', '2021-05-19', '001/SH-SO/V/2021', 'Penerimaan DP. Pekerjaan 001/SH-SO/V/2021', 15000000, 0, '0000-00-00', 'Post', 'CST0005', 1, '', '2021-05-19 04:05:27'),
(1017, '001/SH-DO/V/2021', '4101.06', '2021-05-19', '001/SH-INV/V/2021', 'Penjualan 001/SH-INV/V/2021', 0, 4000000, '0000-00-00', '', 'CST0005', 1, '', '2021-05-19 04:06:33'),
(1018, '001/SH-DO/V/2021', '1105.00', '2021-05-19', '001/SH-INV/V/2021', 'Penjualan 001/SH-INV/V/2021', 4000000, 0, '0000-00-00', '', 'CST0005', 1, '', '2021-05-19 04:06:33'),
(1019, '016/MNJ-PH/V/2021', '1108.99', '2021-05-23', '016/MNJ-PH/V/2021', 'Ongkos Kirim 016/MNJ-PH/V/2021', 0, 0, '0000-00-00', '', 'SUP0001', 1, '', '2021-05-23 06:12:08'),
(1020, '016/MNJ-PH/V/2021', '7404', '2021-05-23', '016/MNJ-PH/V/2021', 'Ongkos Kirim 016/MNJ-PH/V/2021', 0, 0, '0000-00-00', '', 'SUP0001', 1, '', '2021-05-23 06:12:08'),
(1021, '009/SH-PO/V/2021', '1405.02', '2021-05-23', '009/SH-PO/V/2021', 'Pembelian Barang 009/SH-PO/V/2021', 0, 100000, '0000-00-00', '', 'SUP0001', 1, '', '2021-05-23 06:13:56'),
(1022, '009/SH-PO/V/2021', '7404', '2021-05-23', '009/SH-PO/V/2021', 'Pembelian Barang 009/SH-PO/V/2021', 100000, 0, '0000-00-00', '', 'SUP0001', 1, '', '2021-05-23 06:13:56');

-- --------------------------------------------------------

--
-- Table structure for table `table_buku`
--

CREATE TABLE `table_buku` (
  `id_buku` int(11) NOT NULL,
  `Kls` varchar(50) NOT NULL,
  `Kode_Buku` varchar(50) NOT NULL,
  `Judul_Buku` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `harga2` varchar(50) NOT NULL,
  `harga3` varchar(50) NOT NULL,
  `harga4` varchar(50) NOT NULL,
  `harga5` varchar(50) NOT NULL,
  `jml_hal` varchar(50) NOT NULL,
  `Semester` varchar(20) NOT NULL,
  `Katern` varchar(20) NOT NULL,
  `oplah` varchar(20) NOT NULL,
  `kg` varchar(20) NOT NULL,
  `Ukuran` varchar(20) NOT NULL,
  `Kode_Produk` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_buku`
--

INSERT INTO `table_buku` (`id_buku`, `Kls`, `Kode_Buku`, `Judul_Buku`, `stok`, `harga`, `harga2`, `harga3`, `harga4`, `harga5`, `jml_hal`, `Semester`, `Katern`, `oplah`, `kg`, `Ukuran`, `Kode_Produk`) VALUES
(1, '1', 'BSK010001', 'Buku Siswa - Tematik Diriku Sd Kelas 1 Tema 1 (K13)', 8000, '14200', '17000', '15400', '16600', '21300', '168', '1', ' 10.5', '1', ' 0.398', '210 x 297', 'SISWA'),
(2, '1', 'BSK010002', 'Buku Siswa - Tematik Kegemaranku Sd Kelas 1 Tema 2 (K13)', 8188, '17200', '20300', '18700', '20100', '25800', '208', '1', ' 13.0 ', '1', ' 0.493', '210 x 297', 'SISWA'),
(3, '1', 'BSK010003', 'Buku Siswa - Tematik Kegiatanku Sd Kelas 1 Tema 3 (K13)', 200, '13600', '16100', '14700', '15900', '20400', '160', '1', '10', '1', '0.37926', '210 x 297', 'SISWA'),
(4, '1', 'BSK010004', 'Buku Siswa - Tematik Keluargaku Sd Kelas 1 Tema 4 (K13)', 0, '16000', '18800', '17300', '18700', '24000', '192', '1', '12', '1', '0.455112', '210 x 297', 'SISWA'),
(5, '1', 'BSK010005', 'Buku Siswa - Tematik Pengalamanku Sd Kelas 1 Tema 5 Semester 2 (K13)', 0, '17800', '21200', '19300', '20800', '26700', '216', '2', '13.5', '1', '0.512001', '210 x 297', 'SISWA'),
(6, '1', 'BSK010006', 'Buku Siswa - Tematik Lingkungan Bersih, Sehat, Dan Asri Sd Kelas 1 Tema 6 Semester 2 (K13)', 0, '14200', '17000', '15400', '16600', '21300', '168', '2', '10.5', '1', '0.398223', '210 x 297', 'SISWA'),
(7, '1', 'BSK010007', 'Buku Siswa - Tematik Benda, Hewan, Dan Tanaman Di Sekitarku Sd Kelas 1 Tema 7 Semester 2 (K13)', 10, '16600', '19800', '18000', '19400', '24900', '200', '2', '12.5', '1', '0.474075', '210 x 297', 'SISWA'),
(8, '1', 'BSK010008', 'Buku Siswa - Tematik Peristiwa Alam Sd Kelas 1 Tema 8 Semester 2 (K13)', 0, '17800', '21200', '19300', '20800', '26700', '216', '2', '13.5', '1', '0.512001', '210 x 297', 'SISWA'),
(9, '1', 'BSK010009', 'Buku Siswa - Agama Islam Sd Kelas 1 (K13)', 0, '8800', '10600', '9500', '10200', '13200', '96', '1 dan 2', '6', '1', '0.227556', '210 x 297', 'SISWA'),
(10, '1', 'BSK010010', 'Buku Siswa - Agama Kristen Sd Kelas 1 (K13)', 0, '10600', '16400', '11500', '12400', '15900', '120', '1 dan 2', '7.5', '1', '0.284445', '210 x 297', 'SISWA'),
(11, '1', 'BSK010011', 'Buku Siswa - Agama Katolik  Sd Kelas 1 (K13)', 0, '11200', '16800', '12100', '13100', '16800', '128', '1 dan 2', '8', '1', '0.303408', '210 x 297', 'SISWA'),
(12, '1', 'BSK010012', 'Buku Siswa - Agama Hindu Sd Kelas 1 (K13)', 19, '11800', '18200', '12800', '13800', '17700', '136', '1 dan 2', '8.5', '1', '0.322371', '210 x 297', 'SISWA'),
(13, '1', 'BSK010013', 'Buku Siswa - Agama Buddha Sd Kelas 1 (K13)', 0, '14800', '22200', '16000', '17300', '22200', '176', '1 dan 2', '11', '1', '0.417186', '210 x 297', 'SISWA'),
(14, '1', 'BSK010014', 'Buku Siswa - Agama Khonghucu Sd Kelas 1 (K13)', 0, '11800', '18200', '12800', '13800', '17700', '136', '1 dan 2', '8.5', '1', '0.322371', '210 x 297', 'SISWA'),
(15, '1', 'BGK010001', 'Buku Guru - Tematik Diriku Sd Kelas 1 Tema 1 (K13)', 0, '15400', '23600', '16700', '18000', '23100', '184', '1', '11.5', '1', '0.436149', '210 x 297', 'GURU'),
(16, '1', 'BGK010002', 'Buku Guru - Tematik Kegemaranku Sd Kelas 1 Tema 2 (K13)', 0, '15400', '23600', '16700', '18000', '23100', '184', '1', '11.5', '1', '0.436149', '210 x 297', 'GURU'),
(17, '1', 'BGK010003', 'Buku Guru - Tematik Kegiatanku Sd Kelas 1 Tema 3 (K13)', 0, '14800', '22200', '16000', '17300', '22200', '176', '1', '11', '1', '0.417186', '210 x 297', 'GURU'),
(18, '1', 'BGK010004', 'Buku Guru - Tematik Keluargaku Sd Kelas 1 Tema 4 (K13)', 0, '15400', '23600', '16700', '18000', '23100', '184', '1', '11.5', '1', '0.436149', '210 x 297', 'GURU'),
(19, '1', 'BGK010005', 'Buku Guru - Tematik Pengalamanku Sd Kelas 1 Tema 5 Semester 2 (K13)', 0, '14800', '22200', '16000', '17300', '22200', '176', '2', '11', '1', '0.417186', '210 x 297', 'GURU'),
(20, '1', 'BGK010006', 'Buku Guru - Tematik Lingkungan Bersih, Sehat, Dan Asri Sd Kelas 1 Tema 6 Semester 2 (K13)', 0, '16000', '24000', '17300', '18700', '24000', '192', '2', '12', '1', '0.455112', '210 x 297', 'GURU'),
(21, '1', 'BGK010007', 'Buku Guru - Tematik Benda, Hewan, Dan Tanaman Di Sekitarku Sd Kelas 1 Tema 7 Semester 2 (K13)', 0, '15400', '23600', '16700', '18000', '23100', '184', '2', '11.5', '1', '0.436149', '210 x 297', 'GURU'),
(22, '1', 'BGK010008', 'Buku Guru - Tematik Peristiwa Alam Sd Kelas 1 Tema 8 Semester 2 (K13)', 0, '17200', '25800', '18700', '20100', '25800', '208', '2', '13', '1', '0.493038', '210 x 297', 'GURU'),
(23, '1', 'BGK010009', 'Buku Guru - Agama Islam Sd Kelas 1 (K13)', 0, '11400', '17500', '12300', '13300', '17000', '152', '1 dan 2', '9.5', '1', '0.360297', '175 x 250', 'GURU'),
(24, '1', 'BGK010010', 'Buku Guru - Agama Kristen Sd Kelas 1 (K13)', 0, '9800', '14600', '10600', '11400', '14600', '128', '1 dan 2', '8', '1', '0.303408', '175 x 250', 'GURU'),
(25, '1', 'BGK010011', 'Buku Guru - Agama Katolik Sd Kelas 1 (K13)', 0, '16200', '24200', '17500', '18800', '24200', '224', '1 dan 2', '14', '1', '0.530964', '175 x 250', 'GURU'),
(26, '1', 'BGK010012', 'Buku Guru - Agama Hindu Sd Kelas 1 (K13)', 0, '15100', '22600', '16400', '17600', '22600', '208', '1 dan 2', '13', '1', '0.493038', '175 x 250', 'GURU'),
(27, '1', 'BGK010013', 'Buku Guru - Agama Buddha Sd Kelas 1 (K13)', 0, '14600', '22200', '15800', '17000', '21800', '200', '1 dan 2', '12.5', '1', '0.474075', '175 x 250', 'GURU'),
(28, '1', 'BGK010014', 'Buku Guru - Agama Khonghucu Sd Kelas 1 (K13)', 0, '18800', '28800', '20400', '22000', '28200', '264', '1 dan 2', '16.5', '1', '0.625779', '175 x 250', 'GURU'),
(29, '2', 'BSK020001', 'Buku Siswa - Tematik Hidup Rukun Sd Kelas 2 Tema 1 (K13)', 6438, '16600', '19800', '18000', '19400', '24900', '200', '1', '12.5', '1', '0.474075', '210 x 297', 'SISWA'),
(30, '2', 'BSK020002', 'Buku Siswa - Tematik Bermain Di Lingkunganku Sd Kelas 2 Tema 2 (K13)', 7526, '20200', '24100', '21900', '23600', '30300', '248', '1', '15.5', '1', '0.587853', '210 x 297', 'SISWA'),
(31, '2', 'BSK020003', 'Buku Siswa - Tematik Tugasku Sehari-Hari Sd Kelas 2 Tema 3 (K13)', 0, '14800', '17500', '16000', '17300', '22200', '176', '1', '11', '1', '0.417186', '210 x 297', 'SISWA'),
(32, '2', 'BSK020004', 'Buku Siswa - Tematik Hidup Bersih Dan Sehat Sd Kelas 2 Tema 4 (K13)', 0, '18400', '21700', '20000', '21500', '27600', '224', '1', '14', '1', '0.530964', '210 x 297', 'SISWA'),
(33, '2', 'BSK020005', 'Buku Siswa - Tematik Pengalamanku Sd Kelas 2 Tema 5 (K13)', 571, '19000', '22700', '20600', '22200', '28500', '232', '2', '14.5', '1', '0.549927', '210 x 297 ', 'SISWA'),
(34, '2', 'BSK020006', 'Buku Siswa - Tematik Merawat Hewan Dan Tumbuhan Kelas 2 Tema 6 (K13)', 0, '19000', '22700', '20600', '22200', '28500', '232', '2', '14.5', '1', '0.549927', '210 x 297 ', 'SISWA'),
(35, '2', 'BSK020007', 'Buku Siswa - Tematik Kebersamaan Kelas 2 Tema 7 (K13)', 0, '19000', '22700', '20600', '22200', '28500', '232', '2', '14.5', '1', '0.549927', '210 x 297 ', 'SISWA'),
(36, '2', 'BSK020008', 'Buku Siswa - Tematik Keselamatan Di Rumah Dan Di Perjalanan Kelas 2 Tema 8 (K13)', 0, '19000', '22700', '20600', '22200', '28500', '232', '2', '14.5', '1', '0.549927', '210 x 297 ', 'SISWA'),
(37, '2', 'BSK020009', 'Buku Siswa - Agama Islam Sd Kelas 2 (K13)', 0, '10000', '12000', '10800', '11700', '15000', '112', '1 dan 2', '7', '1', '0.265482', '210 x 297', 'SISWA'),
(38, '2', 'BSK020010', 'Buku Siswa - Agama Kristen Sd Kelas 2 (K13)', 0, '14200', '21800', '15400', '16600', '21300', '168', '1 dan 2', '10.5', '1', '0.398223', '210 x 297', 'SISWA'),
(39, '2', 'BSK020011', 'Buku Siswa - Agama Katolik  Sd Kelas 2 (K13)', 0, '16600', '25300', '18000', '19400', '24900', '200', '1 dan 2', '12.5', '1', '0.474075', '210 x 297', 'SISWA'),
(40, '2', 'BSK020012', 'Buku Siswa - Agama Hindu Sd Kelas 2 (K13)', 0, '8200', '12800', '8900', '9500', '12300', '88', '1 dan 2', '5.5', '1', '0.208593', '210 x 297', 'SISWA'),
(41, '2', 'BSK020013', 'Buku Siswa - Agama Buddha Sd Kelas 2 (K13)', 0, '20800', '31400', '22600', '24300', '31200', '256', '1 dan 2', '16', '1', '0.606816', '210 x 297', 'SISWA'),
(42, '2', 'BSK020014', 'Buku Siswa - Agama Khonghucu Sd Kelas 2 (K13)', 0, '13000', '20000', '14100', '15200', '19500', '152', '1 dan 2', '9.5', '1', '0.360297', '210 x 297', 'SISWA'),
(43, '2', 'BGK020001', 'Buku Guru - Tematik Hidup Rukun Sd Kelas 2 Tema 1 (K13)', 0, '16000', '24000', '17300', '18700', '24000', '192', '1', '12', '1', '0.455112', '210 x 297', 'GURU'),
(44, '2', 'BGK020002', 'Buku Guru - Tematik Bermain Di Lingkunganku Sd Kelas 2 Tema 2 (K13)', 0, '19600', '29500', '21300', '22900', '29400', '240', '1', '15', '1', '0.56889', '210 x 297', 'GURU'),
(45, '2', 'BGK020003', 'Buku Guru - Tematik Tugasku Sehari-Hari Sd Kelas 2 Tema 3 (K13)', 0, '17800', '27200', '19300', '20800', '26700', '216', '1', '13.5', '1', '0.512001', '210 x 297', 'GURU'),
(46, '2', 'BGK020004', 'Buku Guru - Tematik Hidup Bersih Dan Sehat Sd Kelas 2 Tema 4 (K13)', 0, '17800', '27200', '19300', '20800', '26700', '216', '1', '13.5', '1', '0.512001', '210 x 297', 'GURU'),
(47, '2', 'BGK020005', 'Buku Guru - Tematik Pengalamanku Sd Kelas 2 Tema 5 (K13)', 0, '20200', '30900', '21900', '23600', '30300', '248', '2', '15.5', '1', '0.587853', '210 x 297 ', 'GURU'),
(48, '2', 'BGK020006', 'Buku Guru - Tematik Merawat Hewan Dan Tumbuhan Kelas 2 Tema 6 (K13)', 0, '15400', '23600', '16700', '18000', '23100', '184', '2', '11.5', '1', '0.436149', '210 x 297 ', 'GURU'),
(49, '2', 'BGK020007', 'Buku Guru - Tematik Kebersamaan Kelas 2 Tema 7 (K13)', 0, '19600', '29500', '21300', '22900', '29400', '240', '2', '15', '1', '0.56889', '210 x 297 ', 'GURU'),
(50, '2', 'BGK020008', 'Buku Guru - Tematik Keselamatan Di Rumah Dan Di Perjalanan Kelas 2 Tema 8 (K13)', 0, '19600', '29500', '21300', '22900', '29400', '240', '2', '15', '1', '0.56889', '210 x 297 ', 'GURU'),
(51, '2', 'BGK020009', 'Buku Guru - Agama Islam Sd Kelas 2 (K13)', 0, '13000', '19400', '14000', '15100', '19400', '176', '1 dan 2', '11', '1', '0.417186', '175 x 250', 'GURU'),
(52, '2', 'BGK020010', 'Buku Guru - Agama Kristen Sd Kelas 2 (K13)', 0, '11400', '17500', '12300', '13300', '17000', '152', '1 dan 2', '9.5', '1', '0.360297', '175 x 250', 'GURU'),
(53, '2', 'BGK020011', 'Buku Guru - Agama Katolik Sd Kelas 2 (K13)', 0, '24700', '37300', '26700', '28800', '37000', '352', '1 dan 2', '22', '1', '0.834372', '175 x 250', 'GURU'),
(54, '2', 'BGK020012', 'Buku Guru - Agama Hindu Sd Kelas 2 (K13)', 0, '8700', '13100', '9400', '10200', '13000', '112', '1 dan 2', '7', '1', '0.265482', '175 x 250', 'GURU'),
(55, '2', 'BGK020013', 'Buku Guru - Agama Buddha Sd Kelas 2 (K13)', 0, '23600', '35700', '25600', '27500', '35400', '336', '1 dan 2', '21', '1', '0.796446', '175 x 250', 'GURU'),
(56, '2', 'BGK020014', 'Buku Guru - Agama Khonghucu Sd Kelas 2 (K13)', 0, '18300', '27500', '19800', '21300', '27400', '256', '1 dan 2', '16', '1', '0.606816', '175 x 250', 'GURU'),
(57, '3', 'BSK030001', 'Buku Siswa - Tematik Pertumbuhan Dan Perkembangan Mahluk Hidup Kelas 3 Tema 1 (K13)', 4863, '16500', '20300', '17800', '19200', '24700', '208', '1', '13', '1', '0.493038', '210 x 297', 'SISWA'),
(58, '3', 'BSK030002', 'Buku Siswa - Tematik Menyayangi Tumbuhan Dan Hewan Kelas 3 Tema 2 (K13)', 5227, '17600', '21700', '19100', '20500', '26400', '224', '1', '14', '1', '0.530964', '210 x 297', 'SISWA'),
(59, '3', 'BSK030003', 'Buku Siswa - Tematik Benda Di Sekitarku Kelas 3 Tema 3 (K13)', 0, '19300', '24100', '20900', '22500', '28900', '248', '1', '15.5', '1', '0.587853', '210 x 297', 'SISWA'),
(60, '3', 'BSK030004', 'Buku Siswa - Tematik Kewajiban Dan Hakku Kelas 3 Tema 4 (K13)', 0, '15900', '19800', '17200', '18500', '23800', '200', '1', '12.5', '1', '0.474075', '210 x 297', 'SISWA'),
(61, '3', 'BSK030005', 'Buku Siswa - Tematik Cuaca Kelas 3 Tema 5', 0, '18700', '23100', '20300', '21800', '28100', '240', '2', '15', '1', '0.56889', '210 x 297', 'SISWA'),
(62, '3', 'BSK030006', 'Buku Siswa - Tematik Energi Dan Perubahannya Kelas 3 Tema 6', 3608, '17000', '21200', '18400', '19800', '25500', '216', '2', '13.5', '1', '0.512001', '210 x 297', 'SISWA'),
(63, '3', 'BSK030007', 'Buku Siswa - Tematik Perkembangan Teknologi Kelas 3 Tema 7', 0, '18200', '22700', '19700', '21200', '27200', '232', '2', '14.5', '1', '0.549927', '210 x 297', 'SISWA'),
(64, '3', 'BSK030008', 'Buku Siswa - Tematik Praja Muda Karana Kelas 3 Tema 8', 125, '18200', '22700', '19700', '21200', '27200', '232', '2', '14.5', '1', '0.549927', '210 x 297', 'SISWA'),
(65, '3', 'BSK030009', 'Buku Siswa - Pendidikan Agama Islam Dan Budi Pekerti Kelas 3 (K13)', 0, '15300', '18800', '16600', '17900', '22900', '192', '1 dan 2', '12', '1', '0.455112', '210 x 297', 'SISWA'),
(66, '3', 'BSK030010', 'Buku Siswa - Pendidikan Agama Kristen Dan Budi Pekerti Kelas 3 (K13)', 0, '15900', '25300', '17200', '18500', '23800', '200', '1 dan 2', '12.5', '1', '0.474075', '210 x 297', 'SISWA'),
(67, '3', 'BSK030011', 'Buku Siswa - Pendidikan Agama Katolik Dan Budi Pekerti Kelas 3 (K13)', 0, '14200', '22200', '15300', '16500', '21200', '176', '1 dan 2', '11', '1', '0.417186', '210 x 297', 'SISWA'),
(68, '3', 'BSK030012', 'Buku Siswa - Pendidikan Agama Hindu Dan Budi Pekerti Kelas 3 (K13)', 0, '15900', '25300', '17200', '18500', '23800', '200', '1 dan 2', '12.5', '1', '0.474075', '210 x 297', 'SISWA'),
(69, '3', 'BSK030013', 'Buku Siswa - Pendidikan Agama Buddha Dan Budi Pekerti Kelas 3 (K13)', 0, '22100', '35100', '24000', '25800', '33200', '288', '1 dan 2', '18', '1', '0.682668', '210 x 297', 'SISWA'),
(70, '3', 'BSK030014', 'Buku Siswa - Pendidikan Agama Khonghucu Dan Budi Pekerti Kelas 3 (K13)', 0, '11300', '18200', '12300', '13200', '17000', '136', '1 dan 2', '8.5', '1', '0.322371', '210 x 297', 'SISWA'),
(71, '3', 'BGK030001', 'Buku Guru - Tematik Pertumbuhan Dan Perkembangan Mahluk Hidup Kelas 3 Tema 1 (K13)', 0, '14700', '23600', '16000', '17200', '22100', '184', '1', '11.5', '1', '0.436149', '210 x 297', 'GURU'),
(72, '3', 'BGK030002', 'Buku Guru - Tematik Menyayangi Tumbuhan Dan Hewan Kelas 3 Tema 2 (K13)', 0, '15900', '25300', '17200', '18500', '23800', '200', '1', '12.5', '1', '0.474075', '210 x 297', 'GURU'),
(73, '3', 'BGK030003', 'Buku Guru - Tematik Benda Di Sekitarku Kelas 3 Tema 3 (K13)', 0, '15900', '25300', '17200', '18500', '23800', '200', '1', '12.5', '1', '0.474075', '210 x 297', 'GURU'),
(74, '3', 'BGK030004', 'Buku Guru - Tematik Kewajiban Dan Hakku Kelas 3 Tema 4 (K13)', 0, '17000', '27200', '18400', '19800', '25500', '216', '1', '13.5', '1', '0.512001', '210 x 297', 'GURU'),
(75, '3', 'BGK030005', 'Buku Guru - Tematik Cuaca Kelas 3 Tema 5', 0, '19900', '31400', '21500', '23200', '29800', '256', '2', '16', '1', '0.606816', '210 x 297', 'GURU'),
(76, '3', 'BGK030006', 'Buku Guru - Tematik Energi Dan Perubahannya Kelas 3 Tema 6', 0, '14200', '22200', '15300', '16500', '21200', '176', '2', '11', '1', '0.417186', '210 x 297', 'GURU'),
(77, '3', 'BGK030007', 'Buku Guru - Tematik Perkembangan Teknologi Kelas 3 Tema 7', 0, '16500', '25800', '17800', '19200', '24700', '208', '2', '13', '1', '0.493038', '210 x 297', 'GURU'),
(78, '3', 'BGK030008', 'Buku Guru - Tematik Praja Muda Karana Kelas 3 Tema 8', 0, '15900', '25300', '17200', '18500', '23800', '200', '2', '12.5', '1', '0.474075', '210 x 297', 'GURU'),
(79, '3', 'BGK030009', 'Buku Guru - Pendidikan Agama Islam Dan Budi Pekerti Kelas 3 (K13)', 0, '13400', '21000', '14500', '15700', '20100', '192', '1 dan 2', '12', '1', '0.455112', '175 x 250', 'GURU'),
(80, '3', 'BGK030010', 'Buku Guru - Pendidikan Agama Kristen Dan Budi Pekerti Kelas 3 (K13)', 0, '12900', '20600', '14000', '15100', '19400', '184', '1 dan 2', '11.5', '1', '0.436149', '175 x 250', 'GURU'),
(81, '3', 'BGK030011', 'Buku Guru - Pendidikan Agama Katolik Dan Budi Pekerti Kelas 3 (K13)', 0, '17000', '27100', '18400', '19800', '25400', '248', '1 dan 2', '15.5', '1', '0.587853', '175 x 250', 'GURU'),
(82, '3', 'BGK030012', 'Buku Guru - Pendidikan Agama Hindu Dan Budi Pekerti Kelas 3 (K13)', 0, '15500', '24200', '16700', '18000', '23200', '224', '1 dan 2', '14', '1', '0.530964', '175 x 250', 'GURU'),
(83, '3', 'BGK030013', 'Buku Guru - Pendidikan Agama Buddha Dan Budi Pekerti Kelas 3 (K13)', 0, '20500', '32400', '22200', '23900', '30800', '304', '1 dan 2', '19', '1', '0.720594', '175 x 250', 'GURU'),
(84, '3', 'BGK030014', 'Buku Guru - Pendidikan Agama Khonghucu Dan Budi Pekerti Kelas 3 (K13)', 0, '12400', '19400', '13400', '14500', '18600', '176', '1 dan 2', '11', '1', '0.417186', '175 x 250', 'GURU'),
(85, '4', 'BSK040001', 'Buku Siswa - Tematik Indahnya Kebersamaan Sd Kelas 4 Tema 1 (K13)', 8379, '17200', '20300', '18700', '20100', '25800', '208', '1', '13', '1', '0.493038', '210 x 297', 'SISWA'),
(86, '4', 'BSK040002', 'Buku Siswa - Tematik Selalu Berhemat Energi Sd Kelas 4 Tema 2 (K13)', 8038, '14200', '17000', '15400', '16600', '21300', '168', '1', '10.5', '1', '0.398223', '210 x 297', 'SISWA'),
(87, '4', 'BSK040003', 'Buku Siswa - Tematik Peduli Terhadap Makhluk Hidup Sd Kelas 4 Tema 3 (K13)', 0, '13600', '16100', '14700', '15900', '20400', '160', '1', '10', '1', '0.37926', '210 x 297', 'SISWA'),
(88, '4', 'BSK040004', 'Buku Siswa - Tematik Berbagai Pekerjaan Sd Kelas 4 Tema 4 (K13)', 0, '14200', '17000', '15400', '16600', '21300', '168', '1', '10.5', '1', '0.398223', '210 x 297', 'SISWA'),
(89, '4', 'BSK040005', 'Buku Siswa - Tematik Pahlawanku Sd Kelas 4 Tema 5 (K13)', 0, '14200', '17000', '15400', '16600', '21300', '168', '1', '10.5', '1', '0.398223', '210 x 297', 'SISWA'),
(90, '4', 'BSK040006', 'Buku Siswa - Tematik Cita-Citaku Sd Kelas 4 Tema 6 Semester 2 (K13)', 3357, '16000', '18800', '17300', '18700', '24000', '192', '2', '12', '22400', '10194.5088', '210 x 297', 'SISWA'),
(91, '4', 'BSK040007', 'Buku Siswa - Tematik Indahnya Keragaman Di Negeriku Sd Kelas 4 Tema 7 Semester 2 (K13)', 0, '14800', '17500', '16000', '17300', '22200', '176', '2', '11', '12540', '5231.51244', '210 x 297', 'SISWA'),
(92, '4', 'BSK040008', 'Buku Siswa - Tematik Daerah Tempat Tinggalku Sd Kelas 4 Tema 8 Semester 2 (K13)', 0, '17200', '20300', '18700', '20100', '25800', '208', '2', '13', '12528', '6176.780064', '210 x 297', 'SISWA'),
(93, '4', 'BSK040009', 'Buku Siswa - Tematik Kayanya Negeriku Sd Kelas 4 Tema 9 Semester 2 (K13)', 0, '15400', '18400', '16700', '18000', '23100', '184', '2', '11.5', '12528', '5464.074672', '210 x 297', 'SISWA'),
(94, '4', 'BSK040010', 'Buku Siswa - Agama Islam Sd Kelas 4 (K13)', 0, '11200', '13300', '12100', '13100', '16800', '128', '1 dan 2', '8', '1', '0.303408', '210 x 297', 'SISWA'),
(95, '4', 'BSK040011', 'Buku Siswa - Agama Kristen Sd Kelas 4 (K13)', 0, '9400', '14600', '10200', '10900', '14100', '104', '1 dan 2', '6.5', '1', '0.246519', '210 x 297', 'SISWA'),
(96, '4', 'BSK040012', 'Buku Siswa - Agama Katolik Sd Kelas 4 (K13)', 0, '13600', '20400', '14700', '15900', '20400', '160', '1 dan 2', '10', '1', '0.37926', '210 x 297', 'SISWA'),
(97, '4', 'BSK040013', 'Buku Siswa - Agama Hindu Sd Kelas 4 (K13)', 0, '9400', '14600', '10200', '10900', '14100', '104', '1 dan 2', '6.5', '1', '0.246519', '210 x 297', 'SISWA'),
(98, '4', 'BSK040014', 'Buku Siswa - Agama Buddha Sd Kelas 4 (K13)', 0, '19600', '29500', '21300', '22900', '29400', '240', '1 dan 2', '15', '1', '0.56889', '210 x 297', 'SISWA'),
(99, '4', 'BSK040015', 'Buku Siswa - Agama Khonghucu Sd Kelas 4 (K13)', 0, '15400', '23600', '16700', '18000', '23100', '184', '1 dan 2', '11.5', '1', '0.436149', '210 x 297', 'SISWA'),
(100, '4', 'BGK040001', 'Buku Guru - Tematik Indahnya Kebersamaan Sd Kelas 4 Tema 1 (K13)', 0, '19600', '29500', '21300', '22900', '29400', '240', '1', '15', '1', '0.56889', '210 x 297', 'GURU'),
(101, '4', 'BGK040002', 'Buku Guru - Tematik Selalu Berhemat Energi Sd Kelas 4 Tema 2 (K13)', 0, '16600', '25300', '18000', '19400', '24900', '200', '1', '12.5', '1', '0.474075', '210 x 297', 'GURU'),
(102, '4', 'BGK040003', 'Buku Guru - Tematik Peduli Terhadap Makhluk Hidup Sd Kelas 4 Tema 3 (K13)', 0, '17800', '27200', '19300', '20800', '26700', '216', '1', '13.5', '1', '0.512001', '210 x 297', 'GURU'),
(103, '4', 'BGK040004', 'Buku Guru - Tematik Berbagai Pekerjaan Sd Kelas 4 Tema 4 (K13)', 0, '19600', '29500', '21300', '22900', '29400', '240', '1', '15', '1', '0.56889', '210 x 297', 'GURU'),
(104, '4', 'BGK040005', 'Buku Guru - Tematik Pahlawanku Sd Kelas 4 Tema 5 (K13)', 0, '17200', '25800', '18700', '20100', '25800', '208', '1', '13', '1', '0.493038', '210 x 297', 'GURU'),
(105, '4', 'BGK040006', 'Buku Guru - Tematik Cita-Citaku Sd Kelas 4 Tema 6 Semester 2 (K13)', 0, '13000', '20000', '14100', '15200', '19500', '152', '2', '9.5', '1', '0.360297', '210 x 297', 'GURU'),
(106, '4', 'BGK040007', 'Buku Guru - Tematik Indahnya Keragaman Di Negeriku Sd Kelas 4 Tema 7 Semester 2 (K13)', 0, '11800', '18200', '12800', '13800', '17700', '136', '2', '8.5', '1', '0.322371', '210 x 297', 'GURU'),
(107, '4', 'BGK040008', 'Buku Guru - Tematik Daerah Tempat Tinggalku Sd Kelas 4 Tema 8 Semester 2 (K13)', 0, '22600', '34600', '24500', '26400', '33900', '280', '2', '17.5', '1', '0.663705', '210 x 297', 'GURU'),
(108, '4', 'BGK040009', 'Buku Guru - Tematik Kayanya Negeriku Sd Kelas 4 Tema 9 Semester 2 (K13)', 0, '15400', '23600', '16700', '18000', '23100', '184', '2', '11.5', '1', '0.436149', '210 x 297', 'GURU'),
(109, '4', 'BGK040010', 'Buku Guru - Agama Islam Sd Kelas 4 (K13)', 0, '10300', '15900', '11200', '12000', '15400', '136', '1 dan 2', '8.5', '1', '0.322371', '175 x 250', 'GURU'),
(110, '4', 'BGK040011', 'Buku Guru - Agama Kristen Sd Kelas 4 (K13)', 0, '9800', '14600', '10600', '11400', '14600', '128', '1 dan 2', '8', '1', '0.303408', '175 x 250', 'GURU'),
(111, '4', 'BGK040012', 'Buku Guru - Agama Katolik Sd Kelas 4 (K13)', 0, '17200', '25900', '18700', '20100', '25800', '240', '1 dan 2', '15', '1', '0.56889', '175 x 250', 'GURU'),
(112, '4', 'BGK040013', 'Buku Guru - Agama Hindu Sd Kelas 4 (K13)', 0, '10800', '16200', '11700', '12600', '16200', '144', '1 dan 2', '9', '1', '0.341334', '175 x 250', 'GURU'),
(113, '4', 'BGK040014', 'Buku Guru - Agama Buddha Sd Kelas 4 (K13)', 0, '15100', '22600', '16400', '17600', '22600', '208', '1 dan 2', '13', '1', '0.493038', '175 x 250', 'GURU'),
(114, '4', 'BGK040015', 'Buku Guru - Agama Khonghucu Sd Kelas 4 (K13)', 0, '23100', '35300', '25000', '26900', '34600', '328', '1 dan 2', '20.5', '1', '0.777483', '175 x 250', 'GURU'),
(115, '5', 'BSK050001', 'Buku Siswa - Tematik Organ Gerak Hewan Dan Manusia Sd Kelas 5 Tema 1 (K13)', 7307, '17800', '21200', '19300', '20800', '26700', '216', '1', '13.5', '1', '0.512001', '210 x 297', 'SISWA'),
(116, '5', 'BSK050002', 'Buku Siswa - Tematik Udara Bersih Dan Kesehatan Sd Kelas 5 Tema 2 (K13)', 7617, '13000', '15700', '14100', '15200', '19500', '152', '1', '9.5', '1', '0.360297', '210 x 297', 'SISWA'),
(117, '5', 'BSK050003', 'Buku Siswa - Tematik Makanan Sehat Sd Kelas 5 Tema 3 (K13)', 0, '12400', '14700', '13400', '14500', '18600', '144', '1', '9', '1', '0.341334', '210 x 297', 'SISWA'),
(118, '5', 'BSK050004', 'Buku Siswa - Tematik Sehat Itu Penting Sd Kelas 5 Tema 4 (K13)', 0, '14200', '17000', '15400', '16600', '21300', '168', '1', '10.5', '1', '0.398223', '210 x 297', 'SISWA'),
(119, '5', 'BSK050005', 'Buku Siswa - Tematik Ekosistem Sd Kelas 5 Tema 5 (K13)', 112, '16000', '18800', '17300', '18700', '24000', '192', '1', '12', '1', '0.455112', '210 x 297', 'SISWA'),
(120, '5', 'BSK050006', 'Buku Siswa - Tematik Panas Dan Perpindahannya Kelas 5 Tema 6 (K13)', 10269, '19000', '22700', '20600', '22200', '28500', '232', '2', '14.5', '1', '0.549927', '210 x 297', 'SISWA'),
(121, '5', 'BSK050007', 'Buku Siswa - Tematik Peristiwa Dalam Kehidupan Kelas 5 Tema 7 (K13)', 13063, '19000', '22700', '20600', '22200', '28500', '232', '2', '14.5', '1', '0.549927', '210 x 297', 'SISWA'),
(122, '5', 'BSK050008', 'Buku Siswa - Tematik Lingkungan Sahabat Kita Kelas 5 Tema 8 (K13)', 12217, '14800', '17500', '16000', '17300', '22200', '176', '2', '11', '1', '0.417186', '210 x 297', 'SISWA'),
(123, '5', 'BSK050009', 'Buku Siswa - Tematik Benda-Benda Di Sekitar Kita Kelas 5 Tema 9 (K13)', 16011, '18400', '21700', '20000', '21500', '27600', '224', '2', '14', '1', '0.530964', '210 x 297', 'SISWA'),
(124, '5', 'BSK050010', 'Buku Siswa - Agama Islam Sd Kelas 5 (K13)', 0, '10000', '12000', '10800', '11700', '15000', '112', '1 dan 2', '7', '1', '0.265482', '210 x 297', 'SISWA'),
(125, '5', 'BSK050011', 'Buku Siswa - Agama Kristen Sd Kelas 5 (K13)', 0, '8200', '12800', '8900', '9500', '12300', '88', '1 dan 2', '5.5', '1', '0.208593', '210 x 297', 'SISWA'),
(126, '5', 'BSK050012', 'Buku Siswa - Agama Katolik Sd Kelas 5 (K13)', 0, '11200', '16800', '12100', '13100', '16800', '128', '1 dan 2', '8', '1', '0.303408', '210 x 297', 'SISWA'),
(127, '5', 'BSK050013', 'Buku Siswa - Agama Hindu Sd Kelas 5 (K13)', 0, '13600', '20400', '14700', '15900', '20400', '160', '1 dan 2', '10', '1', '0.37926', '210 x 297', 'SISWA'),
(128, '5', 'BSK050014', 'Buku Siswa - Agama Buddha Sd Kelas 5 (K13)', 0, '18400', '27700', '20000', '21500', '27600', '224', '1 dan 2', '14', '1', '0.530964', '210 x 297', 'SISWA'),
(129, '5', 'BSK050015', 'Buku Siswa - Agama Khonghucu Sd Kelas 5 (K13)', 0, '14800', '22200', '16000', '17300', '22200', '176', '1 dan 2', '11', '1', '0.417186', '210 x 297', 'SISWA'),
(130, '5', 'BGK050001', 'Buku Guru - Tematik Organ Gerak Hewan Dan Manusia Sd Kelas 5 Tema 1 (K13)', 0, '22000', '33200', '23900', '25700', '33000', '272', '1', '17', '1', '0.644742', '210 x 297', 'GURU'),
(131, '5', 'BGK050002', 'Buku Guru - Tematik Udara Bersih Dan Kesehatan Sd Kelas 5 Tema 2 (K13)', 0, '12400', '18600', '13400', '14500', '18600', '144', '1', '9', '1', '0.341334', '210 x 297', 'GURU'),
(132, '5', 'BGK050003', 'Buku Guru - Tematik Makanan Sehat Sd Kelas 5 Tema 3 (K13)', 0, '13600', '20400', '14700', '15900', '20400', '160', '1', '10', '1', '0.37926', '210 x 297', 'GURU'),
(133, '5', 'BGK050004', 'Buku Guru - Tematik Sehat Itu Penting Sd Kelas 5 Tema 4 (K13)', 0, '17800', '27200', '19300', '20800', '26700', '216', '1', '13.5', '1', '0.512001', '210 x 297', 'GURU'),
(134, '5', 'BGK050005', 'Buku Guru - Tematik Ekosistem Sd Kelas 5 Tema 5 (K13)', 0, '15400', '23600', '16700', '18000', '23100', '184', '1', '11.5', '1', '0.436149', '210 x 297', 'GURU'),
(135, '5', 'BGK050006', 'Buku Guru - Tematik Panas Dan Perpindahannya Kelas 5 Tema 6 (K13)', 0, '14800', '22200', '16000', '17300', '22200', '176', '2', '11', '1', '0.417186', '210 x 297 ', 'GURU'),
(136, '5', 'BGK050007', 'Buku Guru - Tematik Peristiwa Dalam Kehidupan Kelas 5 Tema 7 (K13)', 0, '19000', '29100', '20600', '22200', '28500', '232', '2', '14.5', '1', '0.549927', '210 x 297 ', 'GURU'),
(137, '5', 'BGK050008', 'Buku Guru - Tematik Lingkungan Sahabat Kita Kelas 5 Tema 8 (K13)', 0, '13600', '20400', '14700', '15900', '20400', '160', '2', '10', '1', '0.37926', '210 x 297 ', 'GURU'),
(138, '5', 'BGK050009', 'Buku Guru - Tematik Benda-Benda Di Sekitar Kita Kelas 5 Tema 9 (K13)', 0, '22600', '34600', '24500', '26400', '33900', '280', '2', '17.5', '1', '0.663705', '210 x 297 ', 'GURU'),
(139, '5', 'BGK050010', 'Buku Guru - Agama Islam Sd Kelas 5 (K13)', 0, '8700', '13100', '9400', '10200', '13000', '112', '1 dan 2', '7', '1', '0.265482', '175 x 250', 'GURU'),
(140, '5', 'BGK050011', 'Buku Guru - Agama Kristen Sd Kelas 5 (K13)', 0, '9200', '14300', '10000', '10800', '13800', '120', '1 dan 2', '7.5', '1', '0.284445', '175 x 250', 'GURU'),
(141, '5', 'BGK050012', 'Buku Guru - Agama Katolik Sd Kelas 5 (K13)', 0, '15100', '22600', '16400', '17600', '22600', '208', '1 dan 2', '13', '1', '0.493038', '175 x 250', 'GURU'),
(142, '5', 'BGK050013', 'Buku Guru - Agama Hindu Sd Kelas 5 (K13)', 0, '10800', '16200', '11700', '12600', '16200', '144', '1 dan 2', '9', '1', '0.341334', '175 x 250', 'GURU'),
(143, '5', 'BGK050014', 'Buku Guru - Agama Buddha Sd Kelas 5 (K13)', 0, '18300', '27500', '19800', '21300', '27400', '256', '1 dan 2', '16', '1', '0.606816', '175 x 250', 'GURU'),
(144, '5', 'BGK050015', 'Buku Guru - Agama Khonghucu Sd Kelas 5 (K13)', 0, '21000', '32100', '22700', '24400', '31400', '296', '1 dan 2', '18.5', '1', '0.701631', '175 x 250', 'GURU'),
(145, '6', 'BSK060001', 'Buku Siswa - Tematik Selamatkan Mahluk Hidup Kelas 6 Tema 1 (K13)', 5589, '14700', '18400', '16000', '17200', '22100', '184', '1', '11.5', '1', '0.436149', '210 x 297', 'SISWA'),
(146, '6', 'BSK060002', 'Buku Siswa - Tematik  Persatuan Dalam Perbedaan Kelas 6 Tema 2 (K13)', 5112, '14200', '17500', '15300', '16500', '21200', '176', '1', '11', '1', '0.417186', '210 x 297', 'SISWA'),
(147, '6', 'BSK060003', 'Buku Siswa - Tematik Tokoh Dan Penemuan Kelas 6 Tema 3 (K13)', 0, '14700', '18400', '16000', '17200', '22100', '184', '1', '11.5', '1', '0.436149', '210 x 297', 'SISWA'),
(148, '6', 'BSK060004', 'Buku Siswa - Tematik Globalisasi Kelas 6 Tema 4 (K13)', 0, '13600', '17000', '14700', '15900', '20400', '168', '1', '10.5', '1', '0.398223', '210 x 297', 'SISWA'),
(149, '6', 'BSK060005', 'Buku Siswa - Tematik Wirausaha Kelas 6 Tema 5 (K13)', 81, '17000', '21200', '18400', '19800', '25500', '216', '1', '13.5', '1', '0.512001', '210 x 297', 'SISWA'),
(150, '6', 'BSK060006', 'Buku Siswa - Tematik Menuju Masyarakat Sejahtera Kelas 6 Tema 6', 6963, '13000', '16100', '14100', '15200', '19500', '160', '2', '10', '1', '0.35217', '210 x 297', 'SISWA'),
(151, '6', 'BSK060007', 'Buku Siswa - Tematik Kepemimpinan Kelas 6 Tema 7', 4896, '13600', '17000', '14700', '15900', '20400', '168', '2', '10.5', '1', '0.3697785', '210 x 297', 'SISWA'),
(152, '6', 'BSK060008', 'Buku Siswa - Tematik Bumiku Kelas 6 Tema 8', 50, '13000', '16100', '14100', '15200', '19500', '160', '2', '10', '1', '0.35217', '210 x 297', 'SISWA'),
(153, '6', 'BSK060009', 'Buku Siswa - Tematik Menjelajah Angkasa Luar Kelas 6 Tema 9', 10585, '19300', '24100', '20900', '22500', '28900', '248', '2', '15.5', '1', '0.5458635', '210 x 297', 'SISWA'),
(154, '6', 'BSK060010', 'Buku Siswa - Pendidikan Agama Islam Dan Budi Pekerti Kelas 6 (K13)', 0, '11300', '14300', '12300', '13200', '17000', '136', '1 dan 2', '8.5', '1', '0.322371', '210 x 297', 'SISWA'),
(155, '6', 'BSK060011', 'Buku Siswa - Pendidikan Agama Kristen Dan Budi Pekerti Kelas 6 (K13)', 0, '11900', '18600', '12900', '13900', '17800', '144', '1 dan 2', '9', '1', '0.341334', '210 x 297', 'SISWA'),
(156, '6', 'BSK060012', 'Buku Siswa - Pendidikan Agama Katolik Dan Budi Pekerti Kelas 6 (K13)', 0, '12500', '20000', '13500', '14500', '18700', '152', '1 dan 2', '9.5', '1', '0.360297', '210 x 297', 'SISWA'),
(157, '6', 'BSK060013', 'Buku Siswa - Pendidikan Agama Hindu Dan Budi Pekerti Kelas 6 (K13)', 0, '12500', '20000', '13500', '14500', '18700', '152', '1 dan 2', '9.5', '1', '0.360297', '210 x 297', 'SISWA'),
(158, '6', 'BSK060014', 'Buku Siswa - Pendidikan Agama Buddha Dan Budi Pekerti Kelas 6 (K13)', 0, '21600', '34600', '23400', '25200', '32300', '280', '1 dan 2', '17.5', '1', '0.663705', '210 x 297', 'SISWA'),
(159, '6', 'BSK060015', 'Buku Siswa - Pendidikan Agama Khonghucu Dan Budi Pekerti Kelas 6 (K13)', 0, '13000', '20400', '14100', '15200', '19500', '160', '1 dan 2', '10', '1', '0.37926', '210 x 297', 'SISWA'),
(160, '6', 'BGK060001', 'Buku Guru - Tematik Selamatkan Mahluk Hidup Kelas 6 Tema 1 (K13)', 0, '16500', '25800', '17800', '19200', '24700', '208', '1', '13', '1', '0.493038', '210 x 297', 'GURU'),
(161, '6', 'BGK060002', 'Buku Guru - Tematik Persatuan Dalam Perbedaan Kelas 6 Tema 2 (K13)', 0, '15300', '24000', '16600', '17900', '22900', '192', '1', '12', '1', '0.455112', '210 x 297', 'GURU'),
(162, '6', 'BGK060003', 'Buku Guru - Tematik Tokoh Dan Penemuan Kelas 6 Tema 3 (K13)', 0, '15900', '25300', '17200', '18500', '23800', '200', '1', '12.5', '1', '0.474075', '210 x 297', 'GURU'),
(163, '6', 'BGK060004', 'Buku Guru - Tematik Globalisasi Kelas 6 Tema 4 (K13)', 0, '11900', '18600', '12900', '13900', '17800', '144', '1', '9', '1', '0.341334', '210 x 297', 'GURU'),
(164, '6', 'BGK060005', 'Buku Guru - Tematik Wirausaha Kelas 6 Tema 5 (K13)', 0, '17000', '27200', '18400', '19800', '25500', '216', '1', '13.5', '1', '0.512001', '210 x 297', 'GURU'),
(165, '6', 'BGK060006', 'Buku Guru - Tematik Menuju Masyarakat Sejahtera Kelas 6 Tema 6', 0, '21600', '34600', '23400', '25200', '32300', '280', '2', '17.5', '1', '0.663705', '210 x 297', 'GURU'),
(166, '6', 'BGK060007', 'Buku Guru - Tematik Kepemimpinan Kelas 6 Tema 7', 0, '17600', '27700', '19100', '20500', '26400', '224', '2', '14', '1', '0.530964', '210 x 297', 'GURU'),
(167, '6', 'BGK060008', 'Buku Guru - Tematik Bumiku Kelas 6 Tema 8', 0, '11900', '18600', '12900', '13900', '17800', '144', '2', '9', '1', '0.341334', '210 x 297', 'GURU'),
(168, '6', 'BGK060009', 'Buku Guru - Tematik Menjelajah Angkasa Luar Kelas 6 Tema 9', 0, '15300', '24000', '16600', '17900', '22900', '192', '2', '12', '1', '0.455112', '210 x 297', 'GURU'),
(169, '6', 'BGK060010', 'Buku Guru - Pendidikan Agama Islam Dan Budi Pekerti Kelas 6 (K13)', 0, '8900', '14300', '9600', '10300', '13300', '120', '1 dan 2', '7.5', '1', '0.284445', '175 x 250', 'GURU'),
(170, '6', 'BGK060011', 'Buku Guru - Pendidikan Agama Kristen Dan Budi Pekerti Kelas 6 (K13)', 0, '14900', '23900', '16200', '17400', '22400', '216', '1 dan 2', '13.5', '1', '0.512001', '175 x 250', 'GURU'),
(171, '6', 'BGK060012', 'Buku Guru - Pendidikan Agama Katolik Dan Budi Pekerti Kelas 6 (K13)', 0, '18000', '28800', '19500', '21000', '27000', '264', '1 dan 2', '16.5', '1', '0.625779', '175 x 250', 'GURU'),
(172, '6', 'BGK060013', 'Buku Guru - Pendidikan Agama Hindu Dan Budi Pekerti Kelas 6 (K13)', 0, '9900', '15900', '10700', '11500', '14800', '136', '1 dan 2', '8.5', '1', '0.322371', '175 x 250', 'GURU'),
(173, '6', 'BGK060014', 'Buku Guru - Pendidikan Agama Buddha Dan Budi Pekerti Kelas 6 (K13)', 0, '22000', '35300', '23900', '25700', '33000', '328', '1 dan 2', '20.5', '1', '0.777483', '175 x 250', 'GURU'),
(174, '6', 'BGK060015', 'Buku Guru - Pendidikan Agama Khonghucu Dan Budi Pekerti Kelas 6 (K13)', 0, '16500', '25900', '17800', '19200', '24700', '240', '1 dan 2', '15', '1', '0.56889', '175 x 250', 'GURU'),
(175, '7', 'BSK070001', 'Buku Siswa-Kelas 7 Ppkn', 0, '14000', '16900', '15200', '16400', '21000', '200', '1 dan 2', '12.5', '1', '0.3487575', '175 x 250', 'SISWA'),
(176, '7', 'BSK070002', 'Buku Siswa-Kelas 7 Bahasa Indonesia', 0, '21200', '25500', '23000', '24700', '31800', '312', '1 dan 2', '19.5', '1', '0.5440617', '175 x 250', 'SISWA'),
(177, '7', 'BSK070003', 'Buku Siswa-Kelas 7 Matematika (Semester 1)', 36, '23300', '28000', '25200', '27100', '34900', '344', '1', '21.5', '1', '0.5998629', '175 x 250', 'SISWA'),
(178, '7', 'BSK070004', 'Buku Siswa-Kelas 7 Matematika (Semester 2)', 0, '25800', '30900', '28000', '30100', '38700', '384', '2', '24', '1', '0.6696144', '175 x 250', 'SISWA'),
(179, '7', 'BSK070005', 'Buku Siswa-Kelas 7 Ipa (Semester 1)', 0, '16600', '19700', '18000', '19400', '24900', '240', '1', '15', '1', '0.418509', '175 x 250', 'SISWA'),
(180, '7', 'BSK070006', 'Buku Siswa-Kelas 7 Ipa (Semester 2)', 11, '13500', '16000', '14700', '15800', '20300', '192', '2', '12', '1', '0.3348072', '175 x 250', 'SISWA'),
(181, '7', 'BSK070007', 'Buku Siswa-Kelas 7 Ips', 0, '22200', '26800', '24100', '25900', '33300', '328', '1 dan 2', '20.5', '1', '0.5719623', '175 x 250', 'SISWA'),
(182, '7', 'BSK070008', 'Buku Siswa-Kelas 7 Bahasa Inggris', 0, '14000', '16900', '15200', '16400', '21000', '200', '1 dan 2', '12.5', '1', '0.3487575', '175 x 250', 'SISWA'),
(183, '7', 'BSK070009', 'Buku Siswa-Kelas 7 Pjok', 13, '22700', '27100', '24600', '26500', '34100', '336', '1 dan 2', '21', '1', '0.5859126', '175 x 250', 'SISWA'),
(184, '7', 'BSK070010', 'Buku Siswa-Kelas 7 Seni Budaya', 0, '17100', '20600', '18500', '20000', '25600', '248', '1 dan 2', '15.5', '1', '0.4324593', '175 x 250', 'SISWA'),
(185, '7', 'BSK070011', 'Buku Siswa-Kelas 7 Prakarya (Semester 1)', 466, '18100', '21800', '19600', '21200', '27200', '264', '1', '16.5', '1', '0.4603599', '175 x 250', 'SISWA'),
(186, '7', 'BSK070012', 'Buku Siswa-Kelas 7 Prakarya (Semester 2)', 206, '15100', '18100', '16300', '17600', '22600', '216', '2', '13.5', '1', '0.3766581', '175 x 250', 'SISWA'),
(187, '7', 'BSK070013', 'Buku Siswa-Kelas 7 Agama Islam', 0, '16100', '19300', '17400', '18800', '24100', '232', '1 dan 2', '14.5', '1', '0.4045587', '175 x 250', 'SISWA'),
(188, '7', 'BSK070014', 'Buku Siswa-Kelas 7 Agama Kristen', 0, '9400', '14600', '10200', '11000', '14100', '128', '1 dan 2', '8', '1', '0.2232048', '175 x 250', 'SISWA'),
(189, '7', 'BSK070015', 'Buku Siswa-Kelas 7 Agama Katolik', 0, '11500', '17800', '12400', '13400', '17200', '160', '1 dan 2', '10', '1', '0.279006', '175 x 250', 'SISWA'),
(190, '7', 'BSK070016', 'Buku Siswa-Kelas 7 Agama Hindu', 0, '9400', '14600', '10200', '11000', '14100', '128', '1 dan 2', '8', '1', '0.2232048', '175 x 250', 'SISWA'),
(191, '7', 'BSK070017', 'Buku Siswa-Kelas 7 Agama Budha', 0, '8400', '13100', '9100', '9800', '12600', '112', '1 dan 2', '7', '1', '0.1953042', '175 x 250', 'SISWA'),
(192, '7', 'BSK070018', 'Buku Siswa-Kelas 7 Agama Khonghucu', 0, '10500', '16200', '11300', '12200', '15700', '144', '1 dan 2', '9', '1', '0.2511054', '175 x 250', 'SISWA'),
(193, '7', 'BGK070001', 'Buku Guru-Kelas 7 Ppkn', 0, '18100', '18900', '19600', '21200', '27200', '264', '1 dan 2', '16.5', '1', '0.4603599', '175 x 250', 'GURU'),
(194, '7', 'BGK070002', 'Buku Guru-Kelas 7 Bahasa Indonesia', 0, '11000', '11400', '11900', '12800', '16400', '152', '1 dan 2', '9.5', '1', '0.2650557', '175 x 250', 'GURU'),
(195, '7', 'BGK070003', 'Buku Guru-Kelas 7 Matematika', 0, '36100', '37600', '39100', '42100', '54100', '544', '1 dan 2', '34', '1', '0.9486204', '175 x 250', 'GURU'),
(196, '7', 'BGK070004', 'Buku Guru-Kelas 7 Ipa', 0, '20700', '21600', '22400', '24100', '31000', '304', '1 dan 2', '19', '1', '0.5301114', '175 x 250', 'GURU'),
(197, '7', 'BGK070005', 'Buku Guru-Kelas 7 Ips', 0, '15100', '15700', '16300', '17600', '22600', '216', '1 dan 2', '13.5', '1', '0.3766581', '175 x 250', 'GURU'),
(198, '7', 'BGK070006', 'Buku Guru-Kelas 7 Bahasa Inggris', 0, '9900', '10400', '10800', '11600', '14900', '136', '1 dan 2', '8.5', '1', '0.2371551', '175 x 250', 'GURU'),
(199, '7', 'BGK070007', 'Buku Guru-Kelas 7 Pjok', 0, '27900', '29000', '30200', '32500', '41800', '416', '1 dan 2', '26', '1', '0.7254156', '175 x 250', 'GURU'),
(200, '7', 'BGK070008', 'Buku Guru-Kelas 7 Seni Budaya', 0, '12000', '12500', '13000', '14000', '18000', '168', '1 dan 2', '10.5', '1', '0.2929563', '175 x 250', 'GURU'),
(201, '7', 'BGK070009', 'Buku Guru-Kelas 7 Prakarya', 0, '28400', '29600', '30700', '33100', '42500', '424', '1 dan 2', '26.5', '1', '0.7393659', '175 x 250', 'GURU'),
(202, '7', 'BGK070010', 'Buku Guru-Kelas 7 Agama Islam', 0, '13000', '13500', '14000', '15100', '19400', '176', '1 dan 2', '11', '1', '0.3069066', '175 x 250', 'GURU'),
(203, '7', 'BGK070011', 'Buku Guru-Kelas 7 Agama Kristen', 0, '12400', '13000', '13500', '14500', '18600', '168', '1 dan 2', '10.5', '1', '0.2929563', '175 x 250', 'GURU'),
(204, '7', 'BGK070012', 'Buku Guru-Kelas 7 Agama Katolik', 0, '16200', '16800', '17500', '18800', '24200', '224', '1 dan 2', '14', '1', '0.3906084', '175 x 250', 'GURU'),
(205, '7', 'BGK070013', 'Buku Guru-Kelas 7 Agama Hindu', 0, '11400', '11800', '12300', '13300', '17000', '152', '1 dan 2', '9.5', '1', '0.2650557', '175 x 250', 'GURU'),
(206, '7', 'BGK070014', 'Buku Guru-Kelas 7 Agama Budha', 0, '14600', '15200', '15800', '17000', '21800', '200', '1 dan 2', '12.5', '1', '0.3487575', '175 x 250', 'GURU'),
(207, '7', 'BGK070015', 'Buku Guru-Kelas 7 Agama Khonghucu', 0, '11900', '12400', '12900', '13900', '17800', '160', '1 dan 2', '10', '1', '0.279006', '175 x 250', 'GURU'),
(208, '8', 'BSK080001', 'Buku Siswa-Kelas 8 Ppkn', 0, '12500', '14800', '13500', '14600', '18700', '176', '1 dan 2', '11', '1', '0.3069066', '175 x 250', 'SISWA'),
(209, '8', 'BSK080002', 'Buku Siswa-Kelas 8 Bahasa Indonesia', 0, '19700', '23400', '21300', '22900', '29500', '288', '1 dan 2', '18', '1', '0.5022108', '175 x 250', 'SISWA'),
(210, '8', 'BSK080003', 'Buku Siswa-Kelas 8 Matematika (Semester 1)', 0, '19200', '23100', '20800', '22300', '28700', '280', '1', '17.5', '1', '0.4882605', '175 x 250', 'SISWA'),
(211, '8', 'BSK080004', 'Buku Siswa-Kelas 8 Matematika (Semester 2)', 0, '23800', '28400', '25700', '27700', '35600', '352', '2', '22', '1', '0.6138132', '175 x 250', 'SISWA'),
(212, '8', 'BSK080005', 'Buku Siswa-Kelas 8 Ipa (Semester 1)', 0, '23300', '28000', '25200', '27100', '34900', '344', '1', '21.5', '1', '0.5998629', '175 x 250', 'SISWA'),
(213, '8', 'BSK080006', 'Buku Siswa-Kelas 8 Ipa (Semester 2)', 0, '19700', '23400', '21300', '22900', '29500', '288', '2', '18', '1', '0.5022108', '175 x 250', 'SISWA'),
(214, '8', 'BSK080007', 'Buku Siswa-Kelas 8 Ips', 0, '21200', '25500', '23000', '24700', '31800', '312', '1 dan 2', '19.5', '1', '0.5440617', '175 x 250', 'SISWA'),
(215, '8', 'BSK080008', 'Buku Siswa-Kelas 8 Bahasa Inggris', 0, '16600', '19700', '18000', '19400', '24900', '240', '1 dan 2', '15', '1', '0.418509', '175 x 250', 'SISWA'),
(216, '8', 'BSK080009', 'Buku Siswa-Kelas 8 Pjok', 0, '22200', '26800', '24100', '25900', '33300', '328', '1 dan 2', '20.5', '1', '0.5719623', '175 x 250', 'SISWA'),
(217, '8', 'BSK080010', 'Buku Siswa-Kelas 8 Seni Budaya', 0, '17600', '20900', '19100', '20600', '26400', '256', '1 dan 2', '16', '1', '0.4464096', '175 x 250', 'SISWA'),
(218, '8', 'BSK080011', 'Buku Siswa-Kelas 8 Prakarya (Semester 1)', 0, '17100', '20600', '18500', '20000', '25600', '248', '1', '15.5', '1', '0.4324593', '175 x 250', 'SISWA'),
(219, '8', 'BSK080012', 'Buku Siswa-Kelas 8 Prakarya (Semester 2)', 0, '13500', '16000', '14700', '15800', '20300', '192', '2', '12', '1', '0.3348072', '175 x 250', 'SISWA'),
(220, '8', 'BSK080013', 'Buku Siswa-Kelas 8 Agama Islam', 0, '19700', '23400', '21300', '22900', '29500', '288', '1 dan 2', '18', '1', '0.5022108', '175 x 250', 'SISWA'),
(221, '8', 'BSK080014', 'Buku Siswa-Kelas 8 Agama Kristen', 0, '9900', '15900', '10800', '11600', '14900', '136', '1 dan 2', '8.5', '1', '0.2371551', '175 x 250', 'SISWA'),
(222, '8', 'BSK080015', 'Buku Siswa-Kelas 8 Agama Katolik', 0, '11500', '17800', '12400', '13400', '17200', '160', '1 dan 2', '10', '1', '0.279006', '175 x 250', 'SISWA'),
(223, '8', 'BSK080016', 'Buku Siswa-Kelas 8 Agama Hindu', 0, '8400', '13100', '9100', '9800', '12600', '112', '1 dan 2', '7', '1', '0.1953042', '175 x 250', 'SISWA'),
(224, '8', 'BSK080017', 'Buku Siswa-Kelas 8 Agama Budha', 0, '14600', '22600', '15800', '17000', '21800', '208', '1 dan 2', '13', '1', '0.3627078', '175 x 250', 'SISWA'),
(225, '8', 'BSK080018', 'Buku Siswa-Kelas 8 Agama Khonghucu', 0, '12000', '19100', '13000', '14000', '18000', '168', '1 dan 2', '10.5', '1', '0.2929563', '175 x 250', 'SISWA'),
(226, '8', 'BGK080001', 'Buku Guru-Kelas 8 Ppkn', 0, '19200', '20000', '20800', '22300', '28700', '280', '1 dan 2', '17.5', '1', '0.4882605', '175 x 250', 'GURU'),
(227, '8', 'BGK080002', 'Buku Guru-Kelas 8 Bahasa Indonesia', 0, '13500', '14100', '14700', '15800', '20300', '192', '1 dan 2', '12', '1', '0.3348072', '175 x 250', 'GURU'),
(228, '8', 'BGK080003', 'Buku Guru-Kelas 8 Matematika', 0, '28400', '29600', '30700', '33100', '42500', '424', '1 dan 2', '26.5', '1', '0.7393659', '175 x 250', 'GURU'),
(229, '8', 'BGK080004', 'Buku Guru-Kelas 8 Ipa', 0, '30400', '31700', '33000', '35500', '45600', '456', '1 dan 2', '28.5', '1', '0.7951671', '175 x 250', 'GURU'),
(230, '8', 'BGK080005', 'Buku Guru-Kelas 8 Ips', 0, '17600', '18400', '19100', '20600', '26400', '256', '1 dan 2', '16', '1', '0.4464096', '175 x 250', 'GURU'),
(231, '8', 'BGK080006', 'Buku Guru-Kelas 8 Bahasa Inggris', 0, '14000', '14600', '15200', '16400', '21000', '200', '1 dan 2', '12.5', '1', '0.3487575', '175 x 250', 'GURU'),
(232, '8', 'BGK080007', 'Buku Guru-Kelas 8 Pjok', 0, '21200', '22100', '23000', '24700', '31800', '312', '1 dan 2', '19.5', '1', '0.5440617', '175 x 250', 'GURU'),
(233, '8', 'BGK080008', 'Buku Guru-Kelas 8 Seni Budaya', 0, '12000', '12500', '13000', '14000', '18000', '168', '1 dan 2', '10.5', '1', '0.2929563', '175 x 250', 'GURU'),
(234, '8', 'BGK080009', 'Buku Guru-Kelas 8 Prakarya', 0, '26800', '28000', '29100', '31300', '40200', '400', '1 dan 2', '25', '1', '0.697515', '175 x 250', 'GURU'),
(235, '8', 'BGK080010', 'Buku Guru-Kelas 8 Agama Islam', 0, '16200', '16800', '17500', '18800', '24200', '224', '1 dan 2', '14', '1', '0.3906084', '175 x 250', 'GURU'),
(236, '8', 'BGK080011', 'Buku Guru-Kelas 8 Agama Kristen', 0, '15600', '16300', '16900', '18200', '23400', '216', '1 dan 2', '13.5', '1', '0.3766581', '175 x 250', 'GURU'),
(237, '8', 'BGK080012', 'Buku Guru-Kelas 8 Agama Katolik', 0, '17800', '18500', '19200', '20700', '26600', '248', '1 dan 2', '15.5', '1', '0.4324593', '175 x 250', 'GURU'),
(238, '8', 'BGK080013', 'Buku Guru-Kelas 8 Agama Hindu', 0, '10800', '11300', '11700', '12600', '16200', '144', '1 dan 2', '9', '1', '0.2511054', '175 x 250', 'GURU'),
(239, '8', 'BGK080014', 'Buku Guru-Kelas 8 Agama Budha', 0, '19400', '20200', '21000', '22600', '29000', '272', '1 dan 2', '17', '1', '0.4743102', '175 x 250', 'GURU'),
(240, '8', 'BGK080015', 'Buku Guru-Kelas 8 Agama Khonghucu', 0, '18300', '19100', '19800', '21300', '27400', '256', '1 dan 2', '16', '1', '0.4464096', '175 x 250', 'GURU'),
(241, '9', 'BSK090001', 'Buku Siswa-Kelas 9 Ppkn', 7167, '13900', '17200', '15000', '16200', '20800', '208', '1 dan 2', '13', '1', '0.3627078', '175 x 250', 'SISWA'),
(242, '9', 'BSK090002', 'Buku Siswa-Kelas 9 Bahasa Indonesia', 4735, '12400', '15700', '13500', '14500', '18600', '184', '1 dan 2', '11.5', '1', '0.3208569', '175 x 250', 'SISWA'),
(243, '9', 'BSK090003', 'Buku Siswa-Kelas 9 Bahasa Inggris', 5958, '14900', '18500', '16100', '17300', '22300', '224', '1 dan 2', '14', '1', '0.3906084', '175 x 250', 'SISWA'),
(244, '9', 'BSK090004', 'Buku Siswa-Kelas 9 Matematika', 5894, '21700', '27100', '23500', '25300', '32500', '336', '1 dan 2', '21', '1', '0.5859126', '175 x 250', 'SISWA'),
(245, '9', 'BSK090005', 'Buku Siswa-Kelas 9 Ipa (Semester 1)', 3934, '19200', '24300', '20800', '22400', '28800', '296', '1', '18.5', '1', '0.5161611', '175 x 250', 'SISWA'),
(246, '9', 'BSK090006', 'Buku Siswa-Kelas 9 Ipa (Semester 2)', 5653, '19200', '24300', '20800', '22400', '28800', '296', '2', '18.5', '1', '0.5161611', '175 x 250', 'SISWA'),
(247, '9', 'BSK090007', 'Buku Siswa-Kelas 9 Ips', 6436, '20700', '25900', '22400', '24200', '31000', '320', '1 dan 2', '20', '1', '0.558012', '175 x 250', 'SISWA'),
(248, '9', 'BSK090008', 'Buku Siswa-Kelas 9 Seni Budaya', 5001, '21200', '26800', '23000', '24700', '31800', '328', '1 dan 2', '20.5', '1', '0.5719623', '175 x 250', 'SISWA'),
(249, '9', 'BSK090009', 'Buku Siswa-Kelas 9 Pjok', 10447, '15400', '19300', '16600', '17900', '23000', '232', '1 dan 2', '14.5', '1', '0.4045587', '175 x 250', 'SISWA'),
(250, '9', 'BSK090010', 'Buku Siswa-Kelas 9 Prakarya (Semester 1)', 8074, '15800', '19700', '17200', '18500', '23700', '240', '1', '15', '1', '0.418509', '175 x 250', 'SISWA'),
(251, '9', 'BSK090011', 'Buku Siswa-Kelas 9 Prakarya (Semester 2)', 7733, '11900', '14800', '12900', '13900', '17900', '176', '2', '11', '1', '0.3069066', '175 x 250', 'SISWA'),
(252, '9', 'BSK090012', 'Buku Siswa-Kelas 9 Agama Islam', 125, '20200', '25500', '21900', '23600', '30300', '312', '1 dan 2', '19.5', '1', '0.5440617', '175 x 250', 'SISWA'),
(253, '9', 'BSK090013', 'Buku Siswa-Kelas 9 Agama Kristen', 0, '14400', '23900', '15600', '16800', '21500', '216', '1 dan 2', '13.5', '1', '0.3766581', '175 x 250', 'SISWA'),
(254, '9', 'BSK090014', 'Buku Siswa-Kelas 9 Agama Katolik', 0, '10000', '16200', '10800', '11700', '15000', '144', '1 dan 2', '9', '1', '0.2511054', '175 x 250', 'SISWA'),
(255, '9', 'BSK090015', 'Buku Siswa-Kelas 9 Agama Hindu', 0, '8500', '14300', '9200', '10000', '12800', '120', '1 dan 2', '7.5', '1', '0.2092545', '175 x 250', 'SISWA'),
(256, '9', 'BSK090016', 'Buku Siswa-Kelas 9 Agama Budha', 0, '13900', '22600', '15000', '16200', '20800', '208', '1 dan 2', '13', '1', '0.3627078', '175 x 250', 'SISWA'),
(257, '9', 'BSK090017', 'Buku Siswa-Kelas 9 Agama Khonghucu', 0, '13400', '22200', '14500', '15600', '20100', '200', '1 dan 2', '12.5', '1', '0.3487575', '175 x 250', 'SISWA'),
(258, '9', 'BGK090001', 'Buku Guru-Kelas 9 Ppkn', 0, '17800', '18500', '19300', '20700', '26700', '272', '1 dan 2', '17', '1', '0.4743102', '175 x 250', 'GURU'),
(259, '9', 'BGK090002', 'Buku Guru-Kelas 9 Bahasa Indonesia', 0, '7600', '7900', '8200', '8800', '11300', '104', '1 dan 2', '6.5', '1', '0.1813539', '175 x 250', 'GURU'),
(260, '9', 'BGK090003', 'Buku Guru-Kelas 9 Matematika', 0, '13400', '14000', '14500', '15600', '20100', '200', '1 dan 2', '12.5', '1', '0.3487575', '175 x 250', 'GURU'),
(261, '9', 'BGK090004', 'Buku Guru-Kelas 9 Ipa', 0, '31400', '32700', '34000', '36600', '47100', '496', '1 dan 2', '31', '1', '0.8649186', '175 x 250', 'GURU'),
(262, '9', 'BGK090005', 'Buku Guru-Kelas 9 Ips', 0, '25100', '26100', '27200', '29300', '37600', '392', '1 dan 2', '24.5', '1', '0.6835647', '175 x 250', 'GURU'),
(263, '9', 'BGK090006', 'Buku Guru-Kelas 9 Bahasa Inggris', 0, '15800', '16500', '17200', '18500', '23700', '240', '1 dan 2', '15', '1', '0.418509', '175 x 250', 'GURU'),
(264, '9', 'BGK090007', 'Buku Guru-Kelas 9 Pjok', 0, '20200', '21100', '21900', '23600', '30300', '312', '1 dan 2', '19.5', '1', '0.5440617', '175 x 250', 'GURU'),
(265, '9', 'BGK090008', 'Buku Guru-Kelas 9 Seni Budaya', 0, '22200', '23100', '24000', '25900', '33200', '344', '1 dan 2', '21.5', '1', '0.5998629', '175 x 250', 'GURU'),
(266, '9', 'BGK090009', 'Buku Guru-Kelas 9 Prakarya', 0, '19200', '20000', '20800', '22400', '28800', '296', '1 dan 2', '18.5', '1', '0.5161611', '175 x 250', 'GURU'),
(267, '9', 'BGK090010', 'Buku Guru-Kelas 9 Agama Islam', 0, '11900', '12400', '12900', '13900', '17800', '168', '1 dan 2', '10.5', '1', '0.2929563', '175 x 250', 'GURU'),
(268, '9', 'BGK090011', 'Buku Guru-Kelas 9 Agama Kristen', 0, '18500', '19300', '20000', '21600', '27700', '272', '1 dan 2', '17', '1', '0.4743102', '175 x 250', 'GURU'),
(269, '9', 'BGK090012', 'Buku Guru-Kelas 9 Agama Katolik', 0, '18500', '19300', '20000', '21600', '27700', '272', '1 dan 2', '17', '1', '0.4743102', '175 x 250', 'GURU'),
(270, '9', 'BGK090013', 'Buku Guru-Kelas 9 Agama Hindu', 0, '9900', '10300', '10700', '11500', '14800', '136', '1 dan 2', '8.5', '1', '0.2371551', '175 x 250', 'GURU');
INSERT INTO `table_buku` (`id_buku`, `Kls`, `Kode_Buku`, `Judul_Buku`, `stok`, `harga`, `harga2`, `harga3`, `harga4`, `harga5`, `jml_hal`, `Semester`, `Katern`, `oplah`, `kg`, `Ukuran`, `Kode_Produk`) VALUES
(271, '9', 'BGK090014', 'Buku Guru-Kelas 9 Agama Budha', 0, '14400', '15000', '15600', '16800', '21600', '208', '1 dan 2', '13', '1', '0.3627078', '175 x 250', 'GURU'),
(272, '9', 'BGK090015', 'Buku Guru-Kelas 9 Agama Khonghucu', 0, '13900', '14500', '15100', '16200', '20900', '200', '1 dan 2', '12.5', '1', '0.3487575', '175 x 250', 'GURU'),
(273, '10', 'BSK100001', 'Buku Siswa-Kelas 10 Ppkn', 0, '18100', '', '', '', '', '264', '1 dan 2', '16.5', '1', '0.4603599', '', 'SISWA'),
(274, '10', 'BSK100002', 'Buku Siswa-Kelas 10 Bahasa Indonesia', 0, '20200', '', '', '', '', '296', '1 dan 2', '18.5', '1', '0.5161611', '', 'SISWA'),
(275, '10', 'BSK100003', 'Buku Siswa-Kelas 10 Matematika', 0, '15600', '', '', '', '', '224', '1 dan 2', '14', '1', '0.3906084', '', 'SISWA'),
(276, '10', 'BSK100004', 'Buku Siswa-Kelas 10 Bahasa Inggris', 0, '16100', '', '', '', '', '232', '1 dan 2', '14.5', '1', '0.4045587', '', 'SISWA'),
(277, '10', 'BSK100005', 'Buku Siswa-Kelas 10 Pjok', 0, '15600', '', '', '', '', '224', '1 dan 2', '14', '1', '0.3906084', '', 'SISWA'),
(278, '10', 'BSK100006', 'Buku Siswa-Kelas 10 Seni Budaya (Smstr 1)', 0, '16600', '', '', '', '', '240', '1', '15', '1', '0.418509', '', 'SISWA'),
(279, '10', 'BSK100007', 'Buku Siswa-Kelas 10 Seni Budaya (Smstr 2)', 0, '17100', '', '', '', '', '248', '2', '15.5', '1', '0.4324593', '', 'SISWA'),
(280, '10', 'BSK100008', 'Buku Siswa-Kelas 10 Prakarya (Smstr 1)', 0, '10500', '', '', '', '', '144', '1', '9', '1', '0.2511054', '', 'SISWA'),
(281, '10', 'BSK100009', 'Buku Siswa-Kelas 10 Prakarya (Smstr 2)', 0, '10500', '', '', '', '', '144', '2', '9', '1', '0.2511054', '', 'SISWA'),
(282, '10', 'BSK100010', 'Buku Siswa-Kelas 10 Sejarah Indonesia', 0, '19700', '', '', '', '', '288', '1 dan 2', '18', '1', '0.5022108', '', 'SISWA'),
(283, '10', 'BSK100011', 'Buku Siswa-Kelas 10 Agama Islam', 0, '14600', '', '', '', '', '208', '1 dan 2', '13', '1', '0.3627078', '', 'SISWA'),
(284, '10', 'BSK100012', 'Buku Siswa-Kelas 10 Agama Kristen', 0, '14000', '', '', '', '', '200', '1 dan 2', '12.5', '1', '0.3487575', '', 'SISWA'),
(285, '10', 'BSK100013', 'Buku Siswa-Kelas 10 Agama Katolik', 0, '14000', '', '', '', '', '200', '1 dan 2', '12.5', '1', '0.3487575', '', 'SISWA'),
(286, '10', 'BSK100014', 'Buku Siswa-Kelas 10 Agama Hindu', 0, '13500', '', '', '', '', '192', '1 dan 2', '12', '1', '0.3348072', '', 'SISWA'),
(287, '10', 'BSK100015', 'Buku Siswa-Kelas 10 Agama Budha', 0, '14600', '', '', '', '', '208', '1 dan 2', '13', '1', '0.3627078', '', 'SISWA'),
(288, '10', 'BSK100016', 'Buku Siswa-Kelas 10 Agama Khonghucu', 0, '12000', '', '', '', '', '168', '1 dan 2', '10.5', '1', '0.2929563', '', 'SISWA'),
(289, '10', 'BGK100001', 'Buku Guru-Kelas 10 Ppkn', 0, '22200', '', '', '', '', '328', '1 dan 2', '20.5', '1', '0.5719623', '', 'GURU'),
(290, '10', 'BGK100002', 'Buku Guru-Kelas 10 Bahasa Indonesia', 0, '25800', '', '', '', '', '384', '1 dan 2', '24', '1', '0.6696144', '', 'GURU'),
(291, '10', 'BGK100003', 'Buku Guru-Kelas 10 Matematika', 0, '13000', '', '', '', '', '184', '1 dan 2', '11.5', '1', '0.3208569', '', 'GURU'),
(292, '10', 'BGK100004', 'Buku Guru-Kelas 10 Bahasa Inggris', 0, '15600', '', '', '', '', '224', '1 dan 2', '14', '1', '0.3906084', '', 'GURU'),
(293, '10', 'BGK100005', 'Buku Guru-Kelas 10 Pjok', 0, '19200', '', '', '', '', '280', '1 dan 2', '17.5', '1', '0.4882605', '', 'GURU'),
(294, '10', 'BGK100006', 'Buku Guru-Kelas 10 Seni Budaya', 0, '28400', '', '', '', '', '424', '1 dan 2', '26.5', '1', '0.7393659', '', 'GURU'),
(295, '10', 'BGK100007', 'Buku Guru-Kelas 10 Prakarya', 0, '18100', '', '', '', '', '264', '1 dan 2', '16.5', '1', '0.4603599', '', 'GURU'),
(296, '10', 'BGK100008', 'Buku Guru-Kelas 10 Sejarah Indonesia', 0, '26300', '', '', '', '', '392', '1 dan 2', '24.5', '1', '0.6835647', '', 'GURU'),
(297, '10', 'BGK100009', 'Buku Guru-Kelas 10 Agama Islam', 0, '18800', '', '', '', '', '264', '1 dan 2', '16.5', '1', '0.4603599', '', 'GURU'),
(298, '10', 'BGK100010', 'Buku Guru-Kelas 10 Agama Kristen', 0, '17200', '', '', '', '', '240', '1 dan 2', '15', '1', '0.418509', '', 'GURU'),
(299, '10', 'BGK100011', 'Buku Guru-Kelas 10 Agama Katolik', 0, '21500', '', '', '', '', '304', '1 dan 2', '19', '1', '0.5301114', '', 'GURU'),
(300, '10', 'BGK100012', 'Buku Guru-Kelas 10 Agama Hindu', 0, '8200', '', '', '', '', '104', '1 dan 2', '6.5', '1', '0.1813539', '', 'GURU'),
(301, '10', 'BGK100013', 'Buku Guru-Kelas 10 Agama Budha', 0, '24100', '', '', '', '', '344', '1 dan 2', '21.5', '1', '0.5998629', '', 'GURU'),
(302, '10', 'BGK100014', 'Buku Guru-Kelas 10 Agama Khonghucu', 0, '11400', '', '', '', '', '152', '1 dan 2', '9.5', '1', '0.2650557', '', 'GURU'),
(303, '11', 'BSK110001', 'Buku Siswa-Kelas 11 Ppkn', 0, '16600', '', '', '', '', '240', '1 dan 2', '15', '1', '0.418509', '', 'SISWA'),
(304, '11', 'BSK110002', 'Buku Siswa-Kelas 11 Bahasa Indonesia', 0, '21200', '', '', '', '', '312', '1 dan 2', '19.5', '1', '0.5440617', '', 'SISWA'),
(305, '11', 'BSK110003', 'Buku Siswa-Kelas 11 Matematika', 0, '23300', '', '', '', '', '344', '1 dan 2', '21.5', '1', '0.5998629', '', 'SISWA'),
(306, '11', 'BSK110004', 'Buku Siswa-Kelas 11 Bahasa Inggris', 0, '12500', '', '', '', '', '176', '1 dan 2', '11', '1', '0.3069066', '', 'SISWA'),
(307, '11', 'BSK110005', 'Buku Siswa-Kelas 11 Pjok', 0, '20700', '', '', '', '', '304', '1 dan 2', '19', '1', '0.5301114', '', 'SISWA'),
(308, '11', 'BSK110006', 'Buku Siswa-Kelas 11 Seni Budaya (Smstr 1)', 0, '14600', '', '', '', '', '208', '1', '13', '1', '0.3627078', '', 'SISWA'),
(309, '11', 'BSK110007', 'Buku Siswa-Kelas 11 Seni Budaya (Smstr 2)', 0, '9400', '', '', '', '', '128', '2', '8', '1', '0.2232048', '', 'SISWA'),
(310, '11', 'BSK110008', 'Buku Siswa-Kelas 11 Prakarya (Smstr 1)', 0, '17600', '', '', '', '', '256', '1', '16', '1', '0.4464096', '', 'SISWA'),
(311, '11', 'BSK110009', 'Buku Siswa-Kelas 11 Prakarya (Smstr 2)', 0, '15600', '', '', '', '', '224', '2', '14', '1', '0.3906084', '', 'SISWA'),
(312, '11', 'BSK110010', 'Buku Siswa-Kelas 11 Sejarah Indonesia (Smster 1)', 0, '18100', '', '', '', '', '264', '1', '16.5', '1', '0.4603599', '', 'SISWA'),
(313, '11', 'BSK110011', 'Buku Siswa-Kelas 11 Sejarah Indonesia (Smster 2)', 0, '16600', '', '', '', '', '240', '2', '15', '1', '0.418509', '', 'SISWA'),
(314, '11', 'BSK110012', 'Buku Siswa-Kelas 11 Agama Islam', 0, '15100', '', '', '', '', '216', '1 dan 2', '13.5', '1', '0.3766581', '', 'SISWA'),
(315, '11', 'BSK110013', 'Buku Siswa-Kelas 11 Agama Kristen', 0, '11500', '', '', '', '', '160', '1 dan 2', '10', '1', '0.279006', '', 'SISWA'),
(316, '11', 'BSK110014', 'Buku Siswa-Kelas 11 Agama Katolik', 0, '13500', '', '', '', '', '192', '1 dan 2', '12', '1', '0.3348072', '', 'SISWA'),
(317, '11', 'BSK110015', 'Buku Siswa-Kelas 11 Agama Hindu', 0, '28400', '', '', '', '', '424', '1 dan 2', '26.5', '1', '0.7393659', '', 'SISWA'),
(318, '11', 'BSK110016', 'Buku Siswa-Kelas 11 Agama Budha', 0, '21200', '', '', '', '', '312', '1 dan 2', '19.5', '1', '0.5440617', '', 'SISWA'),
(319, '11', 'BSK110017', 'Buku Siswa-Kelas 11 Agama Khonghucu', 0, '14000', '', '', '', '', '200', '1 dan 2', '12.5', '1', '0.3487575', '', 'SISWA'),
(320, '11', 'BGK110001', 'Buku Guru-Kelas 11 Ppkn', 0, '19200', '', '', '', '', '280', '1 dan 2', '17.5', '1', '0.4882605', '', 'GURU'),
(321, '11', 'BGK110002', 'Buku Guru-Kelas 11 Bahasa Indonesia', 0, '29900', '', '', '', '', '448', '1 dan 2', '28', '1', '0.7812168', '', 'GURU'),
(322, '11', 'BGK110003', 'Buku Guru-Kelas 11 Matematika', 0, '17100', '', '', '', '', '248', '1 dan 2', '15.5', '1', '0.4324593', '', 'GURU'),
(323, '11', 'BGK110004', 'Buku Guru-Kelas 11 Bahasa Inggris', 0, '13000', '', '', '', '', '184', '1 dan 2', '11.5', '1', '0.3208569', '', 'GURU'),
(324, '11', 'BGK110005', 'Buku Guru-Kelas 11 Pjok', 0, '10500', '', '', '', '', '144', '1 dan 2', '9', '1', '0.2511054', '', 'GURU'),
(325, '11', 'BGK110006', 'Buku Guru-Kelas 11 Seni Budaya', 0, '14600', '', '', '', '', '208', '1 dan 2', '13', '1', '0.3627078', '', 'GURU'),
(326, '11', 'BGK110007', 'Buku Guru-Kelas 11 Prakarya', 0, '28400', '', '', '', '', '424', '1 dan 2', '26.5', '1', '0.7393659', '', 'GURU'),
(327, '11', 'BGK110008', 'Buku Guru-Kelas 11 Sejarah Indonesia', 0, '27400', '', '', '', '', '408', '1 dan 2', '25.5', '1', '0.7114653', '', 'GURU'),
(328, '11', 'BGK110009', 'Buku Guru-Kelas 11 Agama Islam', 0, '14600', '', '', '', '', '200', '1 dan 2', '12.5', '1', '0.3487575', '', 'GURU'),
(329, '11', 'BGK110010', 'Buku Guru-Kelas 11 Agama Kristen', 0, '13000', '', '', '', '', '176', '1 dan 2', '11', '1', '0.3069066', '', 'GURU'),
(330, '11', 'BGK110011', 'Buku Guru-Kelas 11 Agama Katolik', 0, '23600', '', '', '', '', '336', '1 dan 2', '21', '1', '0.5859126', '', 'GURU'),
(331, '11', 'BGK110012', 'Buku Guru-Kelas 11 Agama Hindu', 0, '14000', '', '', '', '', '192', '1 dan 2', '12', '1', '0.3348072', '', 'GURU'),
(332, '11', 'BGK110013', 'Buku Guru-Kelas 11 Agama Budha', 0, '29500', '', '', '', '', '424', '1 dan 2', '26.5', '1', '0.7393659', '', 'GURU'),
(333, '11', 'BGK110014', 'Buku Guru-Kelas 11 Agama Khonghucu', 0, '12400', '', '', '', '', '168', '1 dan 2', '10.5', '1', '0.2929563', '', 'GURU'),
(334, '12', 'BSK120001', 'Buku Siswa-Kelas 12 Ppkn', 0, '10500', '', '', '', '', '152', '1 dan 2', '9.5', '1', '0.2650557', '', 'SISWA'),
(335, '12', 'BSK120002', 'Buku Siswa-Kelas 12 Bahasa Indonesia', 0, '17300', '', '', '', '', '264', '1 dan 2', '16.5', '1', '0.4603599', '', 'SISWA'),
(336, '12', 'BSK120003', 'Buku Siswa-Kelas 12 Matematika', 0, '17300', '', '', '', '', '264', '1 dan 2', '16.5', '1', '0.4603599', '', 'SISWA'),
(337, '12', 'BSK120004', 'Buku Siswa-Kelas 12 Bahasa Inggris', 0, '12400', '', '', '', '', '184', '1 dan 2', '11.5', '1', '0.3208569', '', 'SISWA'),
(338, '12', 'BSK120005', 'Buku Siswa-Kelas 12 Seni Budaya (Smstr 1)', 0, '14900', '', '', '', '', '224', '1', '14', '1', '0.3906084', '', 'SISWA'),
(339, '12', 'BSK120006', 'Buku Siswa-Kelas 12 Seni Budaya (Smstr 2)', 0, '13900', '', '', '', '', '208', '2', '13', '1', '0.3627078', '', 'SISWA'),
(340, '12', 'BSK120007', 'Buku Siswa-Kelas 12 Sejarah Indonesia', 0, '18300', '', '', '', '', '280', '1 dan 2', '17.5', '1', '0.4882605', '', 'SISWA'),
(341, '12', 'BSK120008', 'Buku Siswa-Kelas 12 Agama Islam', 0, '20200', '', '', '', '', '312', '1 dan 2', '19.5', '1', '0.5440617', '', 'SISWA'),
(342, '12', 'BSK120009', 'Buku Siswa-Kelas 12 Agama Kristen', 0, '13900', '', '', '', '', '208', '1 dan 2', '13', '1', '0.3627078', '', 'SISWA'),
(343, '12', 'BSK120010', 'Buku Siswa-Kelas 12 Agama Katolik', 0, '12400', '', '', '', '', '184', '1 dan 2', '11.5', '1', '0.3208569', '', 'SISWA'),
(344, '12', 'BSK120011', 'Buku Siswa-Kelas 12 Agama Hindu', 0, '20200', '', '', '', '', '312', '1 dan 2', '19.5', '1', '0.5440617', '', 'SISWA'),
(345, '12', 'BSK120012', 'Buku Siswa-Kelas 12 Agama Budha', 0, '15800', '', '', '', '', '240', '1 dan 2', '15', '1', '0.418509', '', 'SISWA'),
(346, '12', 'BSK120013', 'Buku Siswa-Kelas 12 Agama Khonghucu', 0, '10000', '', '', '', '', '144', '1 dan 2', '9', '1', '0.2511054', '', 'SISWA'),
(347, '12', 'BSK120014', 'Buku Siswa-Kelas 12 Pjok', 0, '15800', '', '', '', '', '240', '1 dan 2', '15', '1', '0.418509', '', 'SISWA'),
(348, '12', 'BSK120015', 'Buku Siswa-Kelas 12 Prakarya', 0, '19700', '', '', '', '', '304', '1 dan 2', '19', '1', '0.5301114', '', 'SISWA'),
(349, '12', 'BGK120001', 'Buku Guru-Kelas 12 Ppkn', 0, '13400', '', '', '', '', '200', '1 dan 2', '12.5', '1', '0.3487575', '', 'GURU'),
(350, '12', 'BGK120002', 'Buku Guru-Kelas 12 Bahasa Indonesia', 0, '17300', '', '', '', '', '264', '1 dan 2', '16.5', '1', '0.4603599', '', 'GURU'),
(351, '12', 'BGK120003', 'Buku Guru-Kelas 12 Matematika', 0, '15800', '', '', '', '', '240', '1 dan 2', '15', '1', '0.418509', '', 'GURU'),
(352, '12', 'BGK120004', 'Buku Guru-Kelas 12 Bahasa Inggris', 0, '11900', '', '', '', '', '176', '1 dan 2', '11', '1', '0.3069066', '', 'GURU'),
(353, '12', 'BGK120005', 'Buku Guru-Kelas 12 Pjok', 0, '28000', '', '', '', '', '440', '1 dan 2', '27.5', '1', '0.7672665', '', 'GURU'),
(354, '12', 'BGK120006', 'Buku Guru-Kelas 12 Seni Budaya', 0, '16800', '', '', '', '', '256', '1 dan 2', '16', '1', '0.4464096', '', 'GURU'),
(355, '12', 'BGK120007', 'Buku Guru-Kelas 12 Prakarya', 0, '13400', '', '', '', '', '200', '1 dan 2', '12.5', '1', '0.3487575', '', 'GURU'),
(356, '12', 'BGK120008', 'Buku Guru-Kelas 12 Sejarah Indonesia', 0, '21700', '', '', '', '', '336', '1 dan 2', '21', '1', '0.5859126', '', 'GURU'),
(357, '12', 'BGK120009', 'Buku Guru-Kelas 12 Agama Islam', 0, '18500', '', '', '', '', '272', '1 dan 2', '17', '1', '0.4743102', '', 'GURU'),
(358, '12', 'BGK120010', 'Buku Guru-Kelas 12 Agama Kristen', 0, '20000', '', '', '', '', '296', '1 dan 2', '18.5', '1', '0.5161611', '', 'GURU'),
(359, '12', 'BGK120011', 'Buku Guru-Kelas 12 Agama Katolik', 0, '10400', '', '', '', '', '144', '1 dan 2', '9', '1', '0.2511054', '', 'GURU'),
(360, '12', 'BGK120012', 'Buku Guru-Kelas 12 Agama Hindu', 0, '23100', '', '', '', '', '344', '1 dan 2', '21.5', '1', '0.5998629', '', 'GURU'),
(361, '12', 'BGK120013', 'Buku Guru-Kelas 12 Agama Budha', 0, '8900', '', '', '', '', '120', '1 dan 2', '7.5', '1', '0.2092545', '', 'GURU'),
(362, '12', 'BGK120014', 'Buku Guru-Kelas 12 Agama Khonghucu', 0, '24100', '', '', '', '', '360', '1 dan 2', '22.5', '1', '0.6277635', '', 'GURU'),
(363, '2', 'bsk00022', 'lentera', 1000, '12000', '', '', '', '', '120', '2', '2', '1', '1', '20 x 20', 'SISWA'),
(364, '2', 'MCB', 'lenteraid', 1000, '11000', '12000', '13000', '14000', '15000', '150', '1', '12', '10', '100', '20x50', 'GURU'),
(365, '0', 'JSC000001', 'Ijazah STIQ AN-NUR Lempuing', 0, '55000', '0', '0', '0', '0', '0', '0', '0', '1', '0', '-', 'SISWA'),
(366, '0', 'JSC000002', 'Ijazah STAI Tulang Bawang', 0, '33500', '0', '0', '0', '0', '0', '0', '0', '1', '0', '-', 'SISWA'),
(367, '0', 'JSC000003', 'Majalah Mulia', 500, '120', '0', '0', '0', '0', '0', '0', '0', '1', '0', '15.8 x 24', 'SISWA'),
(368, '0', 'JSC000004', 'Kertas Sulfit 16/16 KH', 0, '176000', '0', '0', '0', '0', '0', '0', '0', '1', '0', '-', 'SISWA'),
(369, '0', 'JSC000005', 'Brosur Produk mitra 10', 0, '420', '0', '0', '0', '0', '0', '0', '0', '1', '0', '-', 'SISWA'),
(370, '0', 'JSC000006', '01.Brosur Produk mitra 10', 0, '598', '0', '0', '0', '0', '0', '0', '0', '1', '0', '-', 'SISWA'),
(371, '0', 'JSC000007', 'Buku Pintar Pengelolaan Keuangan', 0, '4895', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-', 'SISWA'),
(372, '0', 'JSC000008', 'Buku Pintar Kesehatan', 0, '4141', '0', '0', '0', '0', '0', '0', '0', '1', '0', '-', 'SISWA'),
(373, '0', 'JSC000009', 'Kesejahteraan Sosial Disabilitas', 0, '2635', '0', '0', '0', '0', '0', '0', '0', '1', '0', '-', 'SISWA'),
(374, '0', 'JSC000010', 'Pengasuhan Pendidikan Anak', 0, '4141', '0', '0', '0', '0', '0', '0', '0', '1', '0', '-', 'SISWA'),
(375, '0', 'JSC000011', 'Perlindungan Anak', 0, '3765', '0', '0', '0', '0', '0', '0', '0', '1', '0', '-', 'SISWA'),
(376, '0', 'JSC000012', '01. Majalah Mulia', 59000, '132', '0', '0', '0', '0', '0', '0', '0', '1', '0', '15.8 x 24', 'SISWA'),
(377, '0', 'JSC000013', 'Alquran', 30000, '22500', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'B5', 'SISWA'),
(378, '0', 'JSC000014', 'Ijazah API Banyuwangi', 0, '17500', '0', '0', '0', '0', '0', '0', '0', '1500', '0', '0', 'SISWA'),
(379, '0', 'JSC000015', 'Buku Yasin', 15000, '5250', '0', '0', '0', '0', '256', '0', '0', '15000', '0', '-', 'SISWA'),
(380, '0', 'JSC000016', 'Buku Katalog Karet Ngagel', 100, '25000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-', 'SISWA'),
(381, '0', 'JSC000017', 'Brosur A4', 100, '15000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-', 'SISWA'),
(382, '0', 'JSC000018', 'Kop Surat Karet Ngagel', 2500, '700', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-', 'SISWA'),
(383, '0', 'JSC000019', 'Amplop Coklat Kecil Karet Ngagel', 500, '650', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-', 'SISWA'),
(384, '0', 'JSC000020', 'Amplop Coklat Sedang Karet Ngagel', 500, '900', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-', 'SISWA'),
(385, '0', 'JSC000021', 'Amplop Coklat Besar Karet Ngagel', 500, '1100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-', 'SISWA'),
(386, '0', 'JSC000022', 'Ijazah SKIP Bangkalan', 1830, '17000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'SISWA');

-- --------------------------------------------------------

--
-- Table structure for table `table_hutang`
--

CREATE TABLE `table_hutang` (
  `kodehutang` int(11) NOT NULL,
  `kodesup` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text NOT NULL,
  `debet` int(50) NOT NULL,
  `kredit` int(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `table_kodesj`
--

CREATE TABLE `table_kodesj` (
  `id_kode` int(11) NOT NULL,
  `kode_sj` varchar(255) NOT NULL,
  `kode_inv` varchar(255) NOT NULL,
  `id_sj` int(11) NOT NULL,
  `Kode_tk` varchar(50) NOT NULL,
  `tanggal_k` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_kodesj`
--

INSERT INTO `table_kodesj` (`id_kode`, `kode_sj`, `kode_inv`, `id_sj`, `Kode_tk`, `tanggal_k`) VALUES
(1, '001/SH-DO/V/2021', '001/SH-INV/V/2021', 1, '', '2021-05-19');

-- --------------------------------------------------------

--
-- Table structure for table `table_piutang`
--

CREATE TABLE `table_piutang` (
  `kodepiutang` int(11) NOT NULL,
  `kodepl` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text NOT NULL,
  `debet` int(50) NOT NULL,
  `kredit` int(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_piutang`
--

INSERT INTO `table_piutang` (`kodepiutang`, `kodepl`, `tanggal`, `keterangan`, `debet`, `kredit`) VALUES
(1, 'CST0024', '2021-03-25', 'Penjualan 001/SH-INV/III/2021', 7500000, 0),
(2, 'CST0008', '2021-04-02', 'Penjualan 002/SH-INV/IV/2021', 150000, 0),
(3, 'CST0026', '2021-04-05', 'Penjualan 003/SH-INV/IV/2021', 40000, 0),
(4, 'CST0026', '2021-04-07', 'Penjualan 004/SH-INV/IV/2021', 20000, 0),
(5, 'CST0006', '2021-05-17', 'Penjualan 001/SH-INV/V/2021', 4500, 0),
(6, 'CST0005', '2021-05-19', 'Penjualan 001/SH-INV/V/2021', 4000000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `table_pp`
--

CREATE TABLE `table_pp` (
  `id_pp` int(11) NOT NULL,
  `kode_pp` varchar(255) NOT NULL,
  `id_spp` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL,
  `status_gdg` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_pp`
--

INSERT INTO `table_pp` (`id_pp`, `kode_pp`, `id_spp`, `tanggal`, `status`, `status_gdg`) VALUES
(1, '001/SH-PP/V/2021', 1, '2021-05-17 20:02:39', 0, 0),
(2, '002/SH-PP/V/2021', 1, '2021-05-17 20:03:02', 0, 0),
(3, '003/SH-PP/V/2021', 2, '2021-05-17 20:10:29', 0, 0),
(4, '004/SH-PP/V/2021', 2, '2021-05-18 10:10:14', 1, 1),
(5, '005/SH-PP/V/2021', 3, '2021-05-18 10:19:25', 0, 0),
(6, '006/SH-PP/V/2021', 7, '2021-05-19 00:22:21', 0, 0),
(7, '007/SH-PP/V/2021', 7, '2021-05-19 00:23:20', 0, 0),
(8, '008/SH-PP/V/2021', 7, '2021-05-19 00:26:51', 1, 1),
(9, '009/SH-PP/V/2021', 6, '2021-05-19 00:26:31', 1, 1),
(10, '010/SH-PP/V/2021', 5, '2021-05-19 00:26:22', 1, 1),
(11, '011/SH-PP/V/2021', 3, '2021-05-19 00:26:14', 1, 1),
(12, '012/SH-PP/V/2021', 4, '2021-05-19 00:26:05', 1, 1),
(13, '013/SH-PP/V/2021', 2, '2021-05-19 00:25:54', 1, 1),
(14, '014/SH-PP/V/2021', 1, '2021-05-19 00:25:45', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `table_pp_detail`
--

CREATE TABLE `table_pp_detail` (
  `id_pp_detail` int(11) NOT NULL,
  `kodesup` varchar(50) NOT NULL,
  `id_pp` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_pp_detail`
--

INSERT INTO `table_pp_detail` (`id_pp_detail`, `kodesup`, `id_pp`, `id_produk`, `harga`, `qty`, `total`) VALUES
(1, 'SUP0004', 4, 15, 100, 50, 5000),
(2, 'SUP0002', 8, 15, 100, 100000, 10000000),
(3, 'SUP0004', 9, 15, 100, 3000, 300000),
(4, 'SUP0004', 10, 15, 100, 7000, 700000),
(5, 'SUP0004', 11, 15, 100, 5000, 500000),
(6, 'SUP0001', 12, 15, 100, 15000, 1500000),
(7, 'SUP0004', 13, 15, 100, 19950, 1995000),
(8, 'SUP0002', 14, 15, 100, 100000, 10000000);

-- --------------------------------------------------------

--
-- Table structure for table `table_sj`
--

CREATE TABLE `table_sj` (
  `id_sj` int(11) NOT NULL,
  `id_sp` int(11) NOT NULL,
  `kodepl` varchar(50) NOT NULL,
  `tanggal` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `status_gdg` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_sj`
--

INSERT INTO `table_sj` (`id_sj`, `id_sp`, `kodepl`, `tanggal`, `status`, `status_gdg`) VALUES
(1, 1, 'CST0005', '2021-05-19', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `table_sj_detail`
--

CREATE TABLE `table_sj_detail` (
  `id_sj_detail` int(11) NOT NULL,
  `id_sj` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_sj_detail`
--

INSERT INTO `table_sj_detail` (`id_sj_detail`, `id_sj`, `id_produk`, `harga`, `qty`, `total`) VALUES
(1, 1, 11, 200, 20000, 4000000);

-- --------------------------------------------------------

--
-- Table structure for table `table_sp`
--

CREATE TABLE `table_sp` (
  `id_sp` int(11) NOT NULL,
  `kode_sp` varchar(255) NOT NULL,
  `kodepl` varchar(50) NOT NULL,
  `nopo` varchar(255) NOT NULL,
  `diskon` float NOT NULL,
  `tanggal` date NOT NULL,
  `tempo` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `status_mrk` int(11) NOT NULL,
  `ppn` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_sp`
--

INSERT INTO `table_sp` (`id_sp`, `kode_sp`, `kodepl`, `nopo`, `diskon`, `tanggal`, `tempo`, `keterangan`, `status`, `status_mrk`, `ppn`) VALUES
(1, '001/SH-SO/V/2021', 'CST0005', '012', 0, '2021-05-19', 0, '', 1, 0, 400000);

-- --------------------------------------------------------

--
-- Table structure for table `table_spp`
--

CREATE TABLE `table_spp` (
  `id_spp` int(11) NOT NULL,
  `kode_spp` varchar(255) NOT NULL,
  `kodesup` varchar(50) NOT NULL,
  `diskon` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `tempo` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `status` int(11) NOT NULL,
  `pph` int(11) NOT NULL,
  `ppn` int(11) NOT NULL,
  `tgl_terima` datetime NOT NULL,
  `tgl_proses` datetime NOT NULL,
  `tgl_jemput` datetime NOT NULL,
  `tgl_diterima_sampai` datetime NOT NULL,
  `id_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_spp`
--

INSERT INTO `table_spp` (`id_spp`, `kode_spp`, `kodesup`, `diskon`, `tanggal`, `tempo`, `keterangan`, `status`, `pph`, `ppn`, `tgl_terima`, `tgl_proses`, `tgl_jemput`, `tgl_diterima_sampai`, `id_order`) VALUES
(1, '001/SH-PO/V/2021', 'SUP0002', 0, '2021-05-18', 0, '', 1, 1000000, 1000000, '2021-05-18 03:01:20', '2021-05-18 03:01:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(2, '002/SH-PO/V/2021', 'SUP0004', 0, '2021-05-18', 0, '', 1, 200000, 200000, '2021-05-18 03:08:44', '2021-05-18 03:08:47', '2021-05-18 03:08:50', '0000-00-00 00:00:00', 2),
(3, '003/SH-PO/V/2021', 'SUP0004', 0, '2021-05-18', 0, '', 1, 50000, 50000, '2021-05-18 17:17:33', '2021-05-18 17:17:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(4, '004/SH-PO/V/2021', 'SUP0001', 0, '2021-05-19', 0, '', 1, 150000, 150000, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8),
(5, '005/SH-PO/V/2021', 'SUP0004', 0, '2021-05-19', 0, '', 1, 70000, 70000, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7),
(6, '006/SH-PO/V/2021', 'SUP0004', 0, '2021-05-19', 0, '', 1, 30000, 30000, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6),
(7, '007/SH-PO/V/2021', 'SUP0002', 0, '2021-05-19', 0, '', 1, 1000000, 1000000, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3),
(8, '008/SH-PO/V/2021', 'SUP0001', 0, '2021-05-20', 0, '', 1, 10000, 10000, '2021-05-19 10:47:32', '2021-05-19 10:47:36', '2021-05-22 11:35:47', '0000-00-00 00:00:00', 12),
(9, '009/SH-PO/V/2021', 'SUP0001', 0, '2021-05-23', 0, '', 1, 10000, 10000, '2021-05-23 13:14:23', '2021-05-23 13:14:43', '2021-05-23 13:15:07', '0000-00-00 00:00:00', 16);

-- --------------------------------------------------------

--
-- Table structure for table `table_spp_detail`
--

CREATE TABLE `table_spp_detail` (
  `id_spp_detail` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_spp` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_spp_detail`
--

INSERT INTO `table_spp_detail` (`id_spp_detail`, `id_produk`, `id_spp`, `harga`, `qty`, `total`) VALUES
(1, 15, 1, 100, 100000, 10000000),
(2, 15, 2, 100, 20000, 2000000),
(3, 15, 3, 100, 5000, 500000),
(4, 15, 4, 100, 15000, 1500000),
(5, 15, 5, 100, 7000, 700000),
(6, 15, 6, 100, 3000, 300000),
(7, 15, 7, 100, 100000, 10000000),
(8, 15, 8, 100, 1000, 100000),
(9, 15, 9, 100, 1000, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `table_sp_detail`
--

CREATE TABLE `table_sp_detail` (
  `id_sp_detail` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_sp` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_sp_detail`
--

INSERT INTO `table_sp_detail` (`id_sp_detail`, `id_produk`, `id_sp`, `harga`, `qty`, `total`) VALUES
(1, 11, 1, 200, 20000, 4000000);

-- --------------------------------------------------------

--
-- Table structure for table `table_tambahan`
--

CREATE TABLE `table_tambahan` (
  `id_tambahan` int(11) NOT NULL,
  `nama_tbh` varchar(50) NOT NULL,
  `persen_tbh` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_tambahan`
--

INSERT INTO `table_tambahan` (`id_tambahan`, `nama_tbh`, `persen_tbh`) VALUES
(1, 'PPH', 5),
(2, 'PPN', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tk_penjualan`
--

CREATE TABLE `tk_penjualan` (
  `id_penjualan_tk` int(11) NOT NULL,
  `id_tk` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `nama_barang` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tk_penjualan`
--

INSERT INTO `tk_penjualan` (`id_penjualan_tk`, `id_tk`, `qty`, `harga`, `nama_barang`) VALUES
(1, 1, 10, 2, 'Cetak Yasin'),
(2, 2, 10, 2, 'Buku Yasin 2'),
(3, 3, 10, 50000, 'Jus Coklat');

-- --------------------------------------------------------

--
-- Table structure for table `tugas_kerja`
--

CREATE TABLE `tugas_kerja` (
  `id_tk` int(11) NOT NULL,
  `kode_proyek` text NOT NULL,
  `kodepl` text NOT NULL,
  `sales` text NOT NULL,
  `tempo` text NOT NULL,
  `margin` text NOT NULL,
  `tanggal` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tugas_kerja`
--

INSERT INTO `tugas_kerja` (`id_tk`, `kode_proyek`, `kodepl`, `sales`, `tempo`, `margin`, `tanggal`, `status`) VALUES
(1, '001/KTK-PPP/2/2020', 'CST0001', 'Rofiq', '0', '10', '2020-02-01', 0),
(2, '002/KTK-PPP/2/2020', 'CST0001', 'Rofiq', '10', '9', '2020-02-01', 1),
(3, '003/KTK-PPP/3/2020', 'CST0006', 'Arif', '15', '0', '2020-03-09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_android`
--

CREATE TABLE `users_android` (
  `id_user_an` int(11) NOT NULL,
  `kodesup` varchar(50) NOT NULL,
  `nama_user_an` varchar(100) NOT NULL,
  `username_an` varchar(100) NOT NULL,
  `password_an` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_android`
--

INSERT INTO `users_android` (`id_user_an`, `kodesup`, `nama_user_an`, `username_an`, `password_an`) VALUES
(9, 'SUP0004', 'AGASTYA', 'ptecooils', '827ccb0eea8a706c4c34a16891f84e7b'),
(8, 'SUP0003', 'DANIEL ', 'ptkias', '827ccb0eea8a706c4c34a16891f84e7b'),
(7, 'SUP0002', 'PT BATARA', 'batara', '827ccb0eea8a706c4c34a16891f84e7b'),
(6, 'SUP0001', 'PT KAS', 'ptkas', '827ccb0eea8a706c4c34a16891f84e7b'),
(10, 'SUP0004', 'Super Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggaran_tk`
--
ALTER TABLE `anggaran_tk`
  ADD PRIMARY KEY (`id_anggaran`);

--
-- Indexes for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  ADD PRIMARY KEY (`kodebb`);

--
-- Indexes for table `data_gaji`
--
ALTER TABLE `data_gaji`
  ADD PRIMARY KEY (`id_gaji`);

--
-- Indexes for table `detail_bpjs`
--
ALTER TABLE `detail_bpjs`
  ADD PRIMARY KEY (`id_detail_bpjs`);

--
-- Indexes for table `detail_karyawan`
--
ALTER TABLE `detail_karyawan`
  ADD PRIMARY KEY (`id_detail_karyawan`);

--
-- Indexes for table `detail_penyelesaian_tk`
--
ALTER TABLE `detail_penyelesaian_tk`
  ADD PRIMARY KEY (`id_woc_detail`);

--
-- Indexes for table `divisi_karyawan`
--
ALTER TABLE `divisi_karyawan`
  ADD PRIMARY KEY (`id_divisi_karyawan`);

--
-- Indexes for table `history_backup`
--
ALTER TABLE `history_backup`
  ADD PRIMARY KEY (`id_backup`);

--
-- Indexes for table `history_produk`
--
ALTER TABLE `history_produk`
  ADD PRIMARY KEY (`id_stok`);

--
-- Indexes for table `history_spp_detail`
--
ALTER TABLE `history_spp_detail`
  ADD PRIMARY KEY (`id_spp_detail`);

--
-- Indexes for table `history_sp_detail`
--
ALTER TABLE `history_sp_detail`
  ADD PRIMARY KEY (`id_sp_detail`);

--
-- Indexes for table `jurnal_keluar`
--
ALTER TABLE `jurnal_keluar`
  ADD PRIMARY KEY (`nomor_jurnal`);

--
-- Indexes for table `jurnal_umum`
--
ALTER TABLE `jurnal_umum`
  ADD PRIMARY KEY (`nomor_jurnal`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id_kendaraan`);

--
-- Indexes for table `manual_book`
--
ALTER TABLE `manual_book`
  ADD PRIMARY KEY (`id_manual`);

--
-- Indexes for table `order_android`
--
ALTER TABLE `order_android`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `order_android_acccount`
--
ALTER TABLE `order_android_acccount`
  ADD PRIMARY KEY (`id_order_android_account`);

--
-- Indexes for table `order_android_detail`
--
ALTER TABLE `order_android_detail`
  ADD PRIMARY KEY (`id_order_detail`);

--
-- Indexes for table `order_android_kendaraan`
--
ALTER TABLE `order_android_kendaraan`
  ADD PRIMARY KEY (`id_order_android_kendaraan`);

--
-- Indexes for table `order_po`
--
ALTER TABLE `order_po`
  ADD PRIMARY KEY (`id_order_po`);

--
-- Indexes for table `order_so`
--
ALTER TABLE `order_so`
  ADD PRIMARY KEY (`id_order_so`);

--
-- Indexes for table `order_so_android`
--
ALTER TABLE `order_so_android`
  ADD PRIMARY KEY (`id_order_so_an`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`kodepl`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`kode_pem`);

--
-- Indexes for table `penyelesaian_tk`
--
ALTER TABLE `penyelesaian_tk`
  ADD PRIMARY KEY (`id_woc`);

--
-- Indexes for table `persediaan`
--
ALTER TABLE `persediaan`
  ADD PRIMARY KEY (`id_persediaan`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `retur`
--
ALTER TABLE `retur`
  ADD PRIMARY KEY (`id_rt`);

--
-- Indexes for table `retur_detail`
--
ALTER TABLE `retur_detail`
  ADD PRIMARY KEY (`id_retur_detail`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`kodesup`);

--
-- Indexes for table `tabel_admin`
--
ALTER TABLE `tabel_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tabel_master`
--
ALTER TABLE `tabel_master`
  ADD PRIMARY KEY (`kode_rekening`);

--
-- Indexes for table `tabel_neraca`
--
ALTER TABLE `tabel_neraca`
  ADD PRIMARY KEY (`kode_rekening`);

--
-- Indexes for table `tabel_rugi_laba`
--
ALTER TABLE `tabel_rugi_laba`
  ADD PRIMARY KEY (`kode_rekening`);

--
-- Indexes for table `tabel_spp_acccount`
--
ALTER TABLE `tabel_spp_acccount`
  ADD PRIMARY KEY (`id_spp_account`);

--
-- Indexes for table `tabel_sp_acccount`
--
ALTER TABLE `tabel_sp_acccount`
  ADD PRIMARY KEY (`id_sp_account`);

--
-- Indexes for table `tabel_transaksi`
--
ALTER TABLE `tabel_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `table_buku`
--
ALTER TABLE `table_buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `table_hutang`
--
ALTER TABLE `table_hutang`
  ADD PRIMARY KEY (`kodehutang`);

--
-- Indexes for table `table_kodesj`
--
ALTER TABLE `table_kodesj`
  ADD PRIMARY KEY (`id_kode`);

--
-- Indexes for table `table_piutang`
--
ALTER TABLE `table_piutang`
  ADD PRIMARY KEY (`kodepiutang`);

--
-- Indexes for table `table_pp`
--
ALTER TABLE `table_pp`
  ADD PRIMARY KEY (`id_pp`);

--
-- Indexes for table `table_pp_detail`
--
ALTER TABLE `table_pp_detail`
  ADD PRIMARY KEY (`id_pp_detail`);

--
-- Indexes for table `table_sj`
--
ALTER TABLE `table_sj`
  ADD PRIMARY KEY (`id_sj`);

--
-- Indexes for table `table_sj_detail`
--
ALTER TABLE `table_sj_detail`
  ADD PRIMARY KEY (`id_sj_detail`);

--
-- Indexes for table `table_sp`
--
ALTER TABLE `table_sp`
  ADD PRIMARY KEY (`id_sp`);

--
-- Indexes for table `table_spp`
--
ALTER TABLE `table_spp`
  ADD PRIMARY KEY (`id_spp`);

--
-- Indexes for table `table_spp_detail`
--
ALTER TABLE `table_spp_detail`
  ADD PRIMARY KEY (`id_spp_detail`);

--
-- Indexes for table `table_sp_detail`
--
ALTER TABLE `table_sp_detail`
  ADD PRIMARY KEY (`id_sp_detail`);

--
-- Indexes for table `table_tambahan`
--
ALTER TABLE `table_tambahan`
  ADD PRIMARY KEY (`id_tambahan`);

--
-- Indexes for table `tk_penjualan`
--
ALTER TABLE `tk_penjualan`
  ADD PRIMARY KEY (`id_penjualan_tk`);

--
-- Indexes for table `tugas_kerja`
--
ALTER TABLE `tugas_kerja`
  ADD PRIMARY KEY (`id_tk`);

--
-- Indexes for table `users_android`
--
ALTER TABLE `users_android`
  ADD PRIMARY KEY (`id_user_an`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggaran_tk`
--
ALTER TABLE `anggaran_tk`
  MODIFY `id_anggaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `data_gaji`
--
ALTER TABLE `data_gaji`
  MODIFY `id_gaji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detail_bpjs`
--
ALTER TABLE `detail_bpjs`
  MODIFY `id_detail_bpjs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detail_karyawan`
--
ALTER TABLE `detail_karyawan`
  MODIFY `id_detail_karyawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detail_penyelesaian_tk`
--
ALTER TABLE `detail_penyelesaian_tk`
  MODIFY `id_woc_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `divisi_karyawan`
--
ALTER TABLE `divisi_karyawan`
  MODIFY `id_divisi_karyawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `history_backup`
--
ALTER TABLE `history_backup`
  MODIFY `id_backup` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history_produk`
--
ALTER TABLE `history_produk`
  MODIFY `id_stok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `history_spp_detail`
--
ALTER TABLE `history_spp_detail`
  MODIFY `id_spp_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `history_sp_detail`
--
ALTER TABLE `history_sp_detail`
  MODIFY `id_sp_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kendaraan`
--
ALTER TABLE `kendaraan`
  MODIFY `id_kendaraan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `manual_book`
--
ALTER TABLE `manual_book`
  MODIFY `id_manual` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_android`
--
ALTER TABLE `order_android`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_android_acccount`
--
ALTER TABLE `order_android_acccount`
  MODIFY `id_order_android_account` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_android_detail`
--
ALTER TABLE `order_android_detail`
  MODIFY `id_order_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_android_kendaraan`
--
ALTER TABLE `order_android_kendaraan`
  MODIFY `id_order_android_kendaraan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_po`
--
ALTER TABLE `order_po`
  MODIFY `id_order_po` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_so`
--
ALTER TABLE `order_so`
  MODIFY `id_order_so` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_so_android`
--
ALTER TABLE `order_so_android`
  MODIFY `id_order_so_an` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penyelesaian_tk`
--
ALTER TABLE `penyelesaian_tk`
  MODIFY `id_woc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `persediaan`
--
ALTER TABLE `persediaan`
  MODIFY `id_persediaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `retur`
--
ALTER TABLE `retur`
  MODIFY `id_rt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `retur_detail`
--
ALTER TABLE `retur_detail`
  MODIFY `id_retur_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tabel_admin`
--
ALTER TABLE `tabel_admin`
  MODIFY `id_admin` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tabel_spp_acccount`
--
ALTER TABLE `tabel_spp_acccount`
  MODIFY `id_spp_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tabel_sp_acccount`
--
ALTER TABLE `tabel_sp_acccount`
  MODIFY `id_sp_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tabel_transaksi`
--
ALTER TABLE `tabel_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1023;

--
-- AUTO_INCREMENT for table `table_buku`
--
ALTER TABLE `table_buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=387;

--
-- AUTO_INCREMENT for table `table_hutang`
--
ALTER TABLE `table_hutang`
  MODIFY `kodehutang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_kodesj`
--
ALTER TABLE `table_kodesj`
  MODIFY `id_kode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `table_piutang`
--
ALTER TABLE `table_piutang`
  MODIFY `kodepiutang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `table_pp`
--
ALTER TABLE `table_pp`
  MODIFY `id_pp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `table_pp_detail`
--
ALTER TABLE `table_pp_detail`
  MODIFY `id_pp_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `table_sj`
--
ALTER TABLE `table_sj`
  MODIFY `id_sj` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `table_sj_detail`
--
ALTER TABLE `table_sj_detail`
  MODIFY `id_sj_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `table_sp`
--
ALTER TABLE `table_sp`
  MODIFY `id_sp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `table_spp`
--
ALTER TABLE `table_spp`
  MODIFY `id_spp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `table_spp_detail`
--
ALTER TABLE `table_spp_detail`
  MODIFY `id_spp_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `table_sp_detail`
--
ALTER TABLE `table_sp_detail`
  MODIFY `id_sp_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `table_tambahan`
--
ALTER TABLE `table_tambahan`
  MODIFY `id_tambahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tk_penjualan`
--
ALTER TABLE `tk_penjualan`
  MODIFY `id_penjualan_tk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tugas_kerja`
--
ALTER TABLE `tugas_kerja`
  MODIFY `id_tk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_android`
--
ALTER TABLE `users_android`
  MODIFY `id_user_an` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
