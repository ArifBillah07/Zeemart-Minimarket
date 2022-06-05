-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 17, 2022 at 03:06 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

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
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin1', 'admin1', 'Administrator 1');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Bahan Pokok'),
(2, 'Makanan Ringan'),
(3, 'Minuman'),
(4, 'Peralatan Mandi'),
(5, 'Alat dapur');

-- --------------------------------------------------------

--
-- Table structure for table `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(8) NOT NULL,
  `nama_kecamatan` varchar(100) NOT NULL,
  `tarif` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kecamatan`, `tarif`) VALUES
(1, 'Sumbersari', 7000),
(2, 'Kalisat', 11000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(25) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(1, 'marifbillah524@gmail.com', 'arif123', 'Muhammad Arif Billah', '081234567890', ''),
(2, 'user1@zeemart.com', 'user1', 'User 1', '081234567890', ''),
(4, 'erlinda@user.com', 'erlinda123', 'Erlinda', '089765432156', 'Tuban');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(4, 1, 'Arif', 'BRI', 27000, '2021-12-18', '20211218085107pulpen.jpg'),
(5, 2, 'Arif', 'BRI', 37000, '2021-12-18', '20211218135324pulpen.jpg'),
(6, 3, 'Arif', 'BRI', 47000, '2021-12-18', '20211218135554pulpen.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `alamat_pengiriman` varchar(100) NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'pending',
  `totalberat` int(11) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `distrik` varchar(255) NOT NULL,
  `tipe` varchar(255) NOT NULL,
  `kodepos` varchar(255) NOT NULL,
  `ekspedisi` varchar(255) NOT NULL,
  `paket` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `estimasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `tanggal_pembelian`, `total_pembelian`, `alamat_pengiriman`, `status_pembelian`, `totalberat`, `provinsi`, `distrik`, `tipe`, `kodepos`, `ekspedisi`, `paket`, `ongkir`, `estimasi`) VALUES
(1, 1, '2022-01-16', 1000, 'Perumahan Graha Citra Mas Blok M-28', 'pending', 100, 'DKI Jakarta', 'Jakarta Pusat', 'Kota', '68132', 'jne', 'OKE', 13000, '3-4');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(1, 4, 7, 1, 'Chitato Rasa Sapi Panggang', 6200, 40, 40, 6200),
(2, 0, 7, 1, 'Chitato Rasa Sapi Panggang', 6200, 40, 40, 6200),
(3, 1, 5, 1, 'Barang 3', 1000, 100, 100, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(1, 1, 'Sania Beras Premium', 76000, 5000, 'Beras Sania.jpg', 'Beras Premium persembahan dari Sania, dengan menggunakan pengolahan teknologi Jepang yang membuat beras menjadi pulen, cocok untuk sajian berselera bersama keluarga di rumah.', 100),
(2, 1, 'Gula Gulaku 1kg', 12500, 1000, 'Gulaku.jpg', 'Gulaku 1kg', 100),
(6, 2, 'Taro Net', 7500, 70, '10000753_1.jpg', 'Snack Taro Net adalah teman yang pas untuk hari-hari asyikmu.  Snack Taro Net adalah pelopor snack net di Indonesia.  Taro Net Potato 70gr  adalah salah satu varian snack Taro Net yang telah dikenal luas dari generasi ke generasi. Makanan ringan dengan rasa kentang barbequenya yang lezat ini akan membawamu pada berbagai momen yang tak terlupakan. Kerenyahan istimewa dari Taro Net rasa kentang barbeque ini akan menjadi kesukaan siapa saja yang menikmatinya. Jalani hari-hari serumu bersama teman-teman dengan renyah dan gurihnya  Taro Net Potato Barbeque 70gr .', 100),
(7, 2, 'Chitato Rasa Sapi Panggang', 6200, 40, '20062912_1.jpg', 'Chitato terbuat dari kentang segar yang diiris bergelombang dan dibumbuhi dengan bumbu dari seluruh dunia. Keripik kentang CHITATO dengan beef barbeque. Dibuat dari kentang berkualitas yang menghasilkan rasa gurih. Renyahnya keripik menyatu dengan taburan bumbu spesial. Life is never flat.', 100),
(8, 1, 'Mie Instan Indomie Goreng Spesial', 2500, 125, '1620713851079-indomie.jpg', 'Mie yang disajikan hanya dengan waktu kurang lebih 5 menit ini dapat memberikan semangkuk Mie goreng dengan cita rasa khas Indonesia karena memang semua bumbu dan rempah dalam kemasannya diambil dari hasil alam Indonesia.\r\n\r\nMie yang terbuat dari tepung terigu berkualitas diproses higienis menggunakan standar internasional. Terbukti menjadi salah satu produk Mie Instan favorit orang Indonesia', 3),
(10, 4, 'Sabun lux', 3500, 80, 'LUX.jpg', 'Sabun digunakan untuk membersihkan tubuh, baik dari keringat, kotoran, ataupun debu yang menempel di badan. Oleh karenanya diperlukan sabun mandi yang tidak hanya membersihkan, namun juga memiliki aroma harum, misalnya sabun mandi LUX. Sabun LUX sendiri merupakan sabun mandi yang dirancang untuk membersihkan dan memberikan kelembaban alami pada kulit tubuh agar tetap sehat, lembut, dan cerah sepanjang hari. ', 100),
(11, 4, 'Garnier', 30000, 1, 'Gernier.jpg', 'Garnier Men Power White Foam Sabun Wajah [100 mL] merupakan sabun pembersih wajah untuk membersihkan kotoran dan minyak berlebih yang bekerja ganda sebagai busa pencukur foam pertama untuk pria dari Garnier Men yang dapat digunakan untuk mencukur dan juga untuk membersihkan muka ', 100),
(12, 1, 'Kopi Kapal Api 24 gr x 10 Sachet', 14000, 240, 'Kapal Api.jpg', 'Kapal Api Special Mix 24gr x 10 sachet merupakan kopi bubuk yang terbuat dari biji kopi pilihan. Kapal api menghasilkan kopi yang harum dan lebih enak. Tuangkan satu sendok makan ke dalam cangkir, tambahkan gula secukupnya, kemudian seduh dengan air mendidih 200 ml dan kopi ini siap disajikan.', 100),
(13, 1, 'Sania Minyak Goreng Premium Cooking Oil', 42000, 2000, 'Minyak Sania.jpg', 'Minyak Goreng SANIA Premium Cooking Oil POUCH 2L adalah minyak goreng yang diproses dari buah kelapa sawit pilihan dengan teknologi modern, sehingga dihasilkan minyak goreng premium. Mengandung vitamin E lebih tinggi dibandingkan dengan produk sejenis.', 100),
(14, 1, 'Blue Band Serbaguna Margarin Sachet', 9000, 200, 'Blue band.jpg', 'Blue Band Serbaguna Margarine Sachef 200gr merupakan Margarin pertama di Indonesia yang memiliki kandungan Omega 3 dan Omega 6, dan 6 vitamin (A, D, E, B3, B2, B1). Terbuat dari bahan alami yang dihasilkan dari minyak nabati. Tersedia dalam beragam ukuran \r\nuntuk memenuhi kebutuhan masing-masing rumah tangga, yakni sachet 20 gram, sachet 200 gram, tub 250 gram, dan tin 1 kg.\r\nKandungan tersebut berguna untuk memenuhi \r\nkebutuhan nutrisi harian yang diperlukan anak agar tumbuh kembang optimal. Blue Band Serbaguna dapat digunakan untuk memasak, dioleskan pada roti, dan juga membuat aneka hidangan panggangan.', 100),
(15, 1, 'Sariwangi Teh Celup 25 sachet', 9000, 200, 'Sariwangi.jpg', '100% teh asli pilihan Indonesia, diolah dari daun teh pilihan berkualitas untuk warna yang pas dan rasa yang segar.', 100),
(16, 1, 'Bango Kecap Manis', 19900, 275, 'Bango.jpg', 'Hanya bahan pilihan dari alam ciptakan kecap berkualitas. 4 bahan alami pilihan yaitu : kedelai hitam, gula, garam dan air.\r\n', 100),
(17, 4, 'NUVO FAMILY SABUN BATANG', 2500, 76, 'NUVO.jpg', 'Nuvo Family Sabun Batang adalah sabun mandi yang memberikan perlindungan terpercaya dari berbagai jenis kuman yang tak terlihat. Membersihkan dan melindungi kulit Anda agar terasa higienis, bersih, dan segar setiap hari. Perlindungan setiap hari dari kuman untuk tubuh yang bersih maksimal. ', 100),
(18, 4, 'FRES Sabun batang & natural soap', 2000, 70, 'Fress.jpg', 'SABUN BATANG FRES NATURAL SOAP 70 GR ', 100),
(19, 5, 'Sabun cuci piring Ekonomi jeruk nipis ', 10000, 450, 'CUCI EKONOMI.jpg', 'Ekonomi Power Liquid dengan formulasi lebih kental (konsentrat), lebih banyak busa dan lebih besar dengan formulasi POWER LIQUID. Dengan kandungan siwak yang terbukti sebagai bahan aktif mampu membersihkan dan menghilangkan noda serta sebagai anti bakteri pada peralatan masak dan makan sehari - hari', 100),
(20, 5, 'Soklin so klin softergent', 12500, 530, 'soclin.jpg', 'Kemasan ekonomis sabun cuci Membersihkan pakaian secara maksimal Membuat pakaian menjadi wangi Menjaga warna pakaian tetap cemerlang Kelebihan ', 100),
(21, 4, 'Ponds Facial Foam', 23000, 100, 'ponds.jpg', 'Sabun muka, Facial Wash, Sabun Cuci Muka PONDâ€™S White Beauty Spot-less Rosy White Daily Facial Foam teruji klinis menyamarkan noda hitam dalam 2 minggu. Untuk kulit tampak putih merona noda tersamarkan setiap hari* (*gunakan secara teratur minimal 2 kali sehari) ', 100),
(22, 2, 'Twisko jagung bakar', 7000, 48, 'Twisko.jpg', 'Stick rasa Jagung Bakar renyah yang diproses 100% Roasted tanpa digoreng. Rasanya kekinian banget, sangat cocok untuk teman ngemil disegala suasana dan bisa dibawa kemana-mana.', 100),
(23, 2, 'Pringless', 19000, 107, 'Pringless.jpg', 'Pringles merupakan dari snack berupa keripik kentang dengan berbagai macam rasa yang disukai. Snack pringles ini salah satu merk cemilan asal Amerika Serikat. Banyak kalangan masyarakat menyukai snack pringles ini.\r\n\r\nDengan teksturnya yang tebal dan berbentuk pelana, keripik kentang ini disusun dalam sebuah tabung berlapis alumunium foil yang tertutup rapat sehingga terjaga kerenyahan dan keutuhannya.\r\nAnda akan merasakan kelezatan yang tebal dan utuh dalam setiap tabungnya', 100);

-- --------------------------------------------------------

--
-- Table structure for table `produk_foto`
--

CREATE TABLE `produk_foto` (
  `id_produk_foto` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk_foto` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk_foto`
--

INSERT INTO `produk_foto` (`id_produk_foto`, `id_produk`, `nama_produk_foto`) VALUES
(1, 12, 'Kapal Api.jpg'),
(2, 13, 'Minyak Sania.jpg'),
(3, 14, 'Blue band.jpg'),
(4, 15, 'Sariwangi.jpg'),
(5, 16, 'Bango.jpg'),
(6, 17, 'NUVO.jpg'),
(7, 0, 'CAIR GIV.jpg'),
(8, 18, 'Fress.jpg'),
(9, 19, 'CUCI EKONOMI.jpg'),
(10, 20, 'soclin.jpg'),
(11, 21, 'ponds.jpg'),
(12, 0, 'Lays.jpg'),
(13, 22, 'Twisko.jpg'),
(14, 23, 'Pringless.jpg'),
(15, 0, 'Chikiballs.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `produk_foto`
--
ALTER TABLE `produk_foto`
  ADD PRIMARY KEY (`id_produk_foto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `produk_foto`
--
ALTER TABLE `produk_foto`
  MODIFY `id_produk_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
