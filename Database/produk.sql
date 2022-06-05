-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2021 at 03:44 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_zeemart_coba`
--

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`) VALUES
(1, 'Beras Du\'Anak 25kg', 287000, 25000, 'berasduanak.jpg', 'Beras Du\'Anak 25kg'),
(2, 'Gula Gulaku 1kg', 12500, 1000, 'gulaku.jpg', 'Gulaku 1kg'),
(3, 'Contoh produk 1', 1000, 100, 'a9bfd735d810207c627f5a4676e6a734.jpg', 'Ini adalah contoh produk 1'),
(4, 'barang2', 1, 2, 'foto.jpg', 'contoh barang 2'),
(5, 'Barang 3', 1000, 100, 'christin-hume-Hcfwew744z4-unsplash.jpg', 'Contoh barang 3'),
(6, 'Taro Net', 7500, 70, '10000753_1.jpg', 'Snack Taro Net adalah teman yang pas untuk hari-hari asyikmu.  Snack Taro Net adalah pelopor snack net di Indonesia.  Taro Net Potato 70gr  adalah salah satu varian snack Taro Net yang telah dikenal luas dari generasi ke generasi. Makanan ringan dengan rasa kentang barbequenya yang lezat ini akan membawamu pada berbagai momen yang tak terlupakan. Kerenyahan istimewa dari Taro Net rasa kentang barbeque ini akan menjadi kesukaan siapa saja yang menikmatinya. Jalani hari-hari serumu bersama teman-teman dengan renyah dan gurihnya  Taro Net Potato Barbeque 70gr .'),
(7, 'Chitato Rasa Sapi Panggang', 6200, 40, '20062912_1.jpg', 'Chitato terbuat dari kentang segar yang diiris bergelombang dan dibumbuhi dengan bumbu dari seluruh dunia. Keripik kentang CHITATO dengan beef barbeque. Dibuat dari kentang berkualitas yang menghasilkan rasa gurih. Renyahnya keripik menyatu dengan taburan bumbu spesial. Life is never flat.'),
(8, 'Mie Instan Indomie Goreng Spesial', 2500, 125, '1620713851079-indomie.jpg', 'Mie yang disajikan hanya dengan waktu kurang lebih 5 menit ini dapat memberikan semangkuk Mie goreng dengan cita rasa khas Indonesia karena memang semua bumbu dan rempah dalam kemasannya diambil dari hasil alam Indonesia.\r\n\r\nMie yang terbuat dari tepung terigu berkualitas diproses higienis menggunakan standar internasional. Terbukti menjadi salah satu produk Mie Instan favorit orang Indonesia');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
