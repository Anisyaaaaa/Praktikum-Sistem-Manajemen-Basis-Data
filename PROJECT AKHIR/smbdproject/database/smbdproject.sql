-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2024 at 05:35 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smbdproject`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`` PROCEDURE `hapus_about` (IN `id_about_param` INT)   BEGIN
    DELETE FROM about_us WHERE id_about = id_about_param;
END$$

CREATE DEFINER=`` PROCEDURE `hapus_kereta` (IN `idk` INT(100))   BEGIN
	DELETE FROM kereta WHERE id_kereta = idk;
END$$

CREATE DEFINER=`` PROCEDURE `looping_gerbong` (IN `new_train_id` INT)   BEGIN
    DECLARE gerbong_num INT DEFAULT 1;
    DECLARE gerbong_code CHAR(1);
    
    WHILE gerbong_num <= 5 DO
        SET gerbong_code = CHAR(64 + gerbong_num); -- Generates 'A', 'B', 'C', 'D', 'E'
        INSERT INTO gerbong (gerbong, id_kereta) VALUES (gerbong_code, new_train_id);
        SET gerbong_num = gerbong_num + 1;
    END WHILE;
END$$

CREATE DEFINER=`` PROCEDURE `tambah_about` (IN `id` INT(100), IN `$judul` VARCHAR(255), IN `$isi` TEXT)   BEGIN
    INSERT INTO about_us VALUES(NULL, $judul, $isi, CURDATE());
END$$

CREATE DEFINER=`` PROCEDURE `tambah_kereta` (IN `id` INT(10), IN `kereta` VARCHAR(100), IN `kls` VARCHAR(50), IN `tgl` DATE, IN `jam_brngkt` VARCHAR(5), IN `jam_tb` VARCHAR(5), IN `harga` DECIMAL(22,2), IN `stts` VARCHAR(50))   BEGIN 
	INSERT INTO kereta (id_kereta, nama_kereta, kelas, tanggal, jam_berangkat, jam_tiba, tarif, status)
    VALUES (id, kereta, kls, tgl, jam_brngkt, jam_tb, harga, stts);
END$$

CREATE DEFINER=`` PROCEDURE `update_pass` (IN `admin_id` INT(100), IN `old_password` VARCHAR(255), IN `new_password` VARCHAR(255))   BEGIN
	 DECLARE pass VARCHAR(255);

  -- Cek apakah password lama sesuai
  SELECT password INTO pass FROM admin WHERE id = admin_id;

  IF pass IS NOT NULL AND pass = old_password THEN
    -- Update password baru
    UPDATE admin SET password = new_password WHERE id = admin_id;
    SELECT 'Password berhasil diperbarui.' AS Message;
  ELSE
    SELECT 'Password lama tidak sesuai.' AS Message;
  END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id_about` int(11) NOT NULL,
  `judul` text NOT NULL,
  `isi` text NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id_about`, `judul`, `isi`, `tanggal`) VALUES
(1, 'About Us', 'Selamat Datang di RailTicket! Pesan Tiket Kereta Anda dengan Mudah dan Cepat! Kami adalah platform pemesanan tiket kereta yang memberikan kemudahan, kecepatan, dan keamanan dalam setiap transaksi Anda. Dengan sistem kami yang canggih dan tim yang berdedikasi, kami memastikan bahwa setiap langkah dalam proses pemesanan tiket berjalan lancar dan efisien. Kami berusaha untuk selalu memberikan yang terbaik untuk memastikan kepuasan dan kenyamanan pelanggan kami.', '2024-06-04'),
(2, 'Visi', 'Menjadi platform pemesanan tiket kereta api terdepan yang memberikan kemudahan, kenyamanan, dan pengalaman terbaik bagi setiap penumpang di Indonesia.', '2024-06-12');

-- --------------------------------------------------------

--
-- Stand-in structure for view `about_view`
-- (See below for the actual view)
--
CREATE TABLE `about_view` (
`id_about` int(11)
,`judul` text
,`isi` text
,`tanggal` date
);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'sukma', '123'),
(2, 'anisa', '123'),
(3, 'admin', '123');

--
-- Triggers `admin`
--
DELIMITER $$
CREATE TRIGGER `after_update_admin_password_log` AFTER UPDATE ON `admin` FOR EACH ROW BEGIN
    IF NEW.password != OLD.password THEN
        INSERT INTO admin_password_log (id_admin, username, old_password, new_password)
        VALUES (OLD.id, OLD.username, OLD.password, NEW.password);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_log`
--

CREATE TABLE `admin_password_log` (
  `id_log` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `old_password` varchar(10) NOT NULL,
  `new_password` varchar(10) NOT NULL,
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_password_log`
--

INSERT INTO `admin_password_log` (`id_log`, `id_admin`, `username`, `old_password`, `new_password`, `changed_at`) VALUES
(1, 2, 'anisa', '123', '12345', '2024-06-09 08:48:11'),
(2, 1, 'sukma', '123', '12345', '2024-06-13 06:45:17'),
(3, 1, 'sukma', '12345', '123', '2024-06-13 15:03:02'),
(4, 2, 'anisa', '12345', '123', '2024-06-13 15:05:36');

-- --------------------------------------------------------

--
-- Table structure for table `asal_kereta`
--

CREATE TABLE `asal_kereta` (
  `id_asal` int(11) NOT NULL,
  `asal_kereta` text NOT NULL,
  `id_kereta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `asal_kereta`
--

INSERT INTO `asal_kereta` (`id_asal`, `asal_kereta`, `id_kereta`) VALUES
(1, 'Stasiun Gambir', 1),
(2, 'Stasiun Bandung', 2),
(3, 'Stasiun Surabaya', 3),
(4, 'Stasiun Jakarta Kota', 4),
(5, 'Stasiun Malang', 5),
(6, 'Stasiun Malang', 6),
(7, 'Stasiun Malang', 7),
(9, 'Stasiun Madura', 92),
(10, 'Stasiun Bromo', 94),
(32, 'Stasiun Bandung', 93),
(33, 'Stasiun Jakarta Kota', 94),
(34, 'Stasiun Malang', 95);

-- --------------------------------------------------------

--
-- Stand-in structure for view `detail_pemesanan_view`
-- (See below for the actual view)
--
CREATE TABLE `detail_pemesanan_view` (
`nama_pelanggan` varchar(100)
,`no_ktp` varchar(25)
,`telepon` varchar(20)
,`total_pembayaran` decimal(22,2)
,`tgl_pemesanan` date
,`nama_kereta` varchar(400)
,`kelas` varchar(50)
,`tanggal` date
,`jam_berangkat` varchar(5)
,`jam_tiba` varchar(5)
,`asal_kereta` text
,`tujuan` text
);

-- --------------------------------------------------------

--
-- Table structure for table `gerbong`
--

CREATE TABLE `gerbong` (
  `id_gerbong` int(11) NOT NULL,
  `gerbong` varchar(2) NOT NULL,
  `id_kereta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `gerbong`
--

INSERT INTO `gerbong` (`id_gerbong`, `gerbong`, `id_kereta`) VALUES
(1, 'A', 1),
(2, 'B', 1),
(3, 'C', 1),
(4, 'D', 1),
(5, 'E', 1),
(6, 'A', 2),
(7, 'B', 2),
(8, 'C', 2),
(9, 'D', 2),
(10, 'E', 2),
(11, 'A', 3),
(12, 'B', 3),
(13, 'C', 3),
(14, 'D', 3),
(15, 'E', 3),
(16, 'A', 4),
(17, 'B', 4),
(18, 'C', 4),
(19, 'D', 4),
(20, 'E', 4),
(21, 'A', 5),
(22, 'B', 5),
(23, 'C', 5),
(24, 'D', 5),
(25, 'E', 5),
(26, 'A', 66),
(27, 'B', 66),
(28, 'C', 66),
(29, 'D', 66),
(30, 'E', 66),
(31, 'A', 68),
(32, 'A', 69),
(33, 'A', 70),
(34, 'A', 71),
(35, 'A', 74),
(36, 'B', 74),
(37, 'C', 74),
(38, 'D', 74),
(39, 'E', 74),
(40, 'A', 75),
(41, 'B', 75),
(42, 'C', 75),
(43, 'D', 75),
(44, 'E', 75),
(45, 'A', 76),
(46, 'B', 76),
(47, 'C', 76),
(48, 'D', 76),
(49, 'E', 76),
(50, 'A', 77),
(51, 'B', 77),
(52, 'C', 77),
(53, 'D', 77),
(54, 'E', 77),
(55, 'A', 78),
(56, 'B', 78),
(57, 'C', 78),
(58, 'D', 78),
(59, 'E', 78),
(60, 'A', 79),
(61, 'B', 79),
(62, 'C', 79),
(63, 'D', 79),
(64, 'E', 79),
(65, 'A', 80),
(66, 'B', 80),
(67, 'C', 80),
(68, 'D', 80),
(69, 'E', 80),
(70, 'A', 81),
(71, 'A', 83),
(72, 'B', 83),
(73, 'C', 83),
(74, 'D', 83),
(75, 'E', 83),
(76, 'A', 84),
(77, 'B', 84),
(78, 'C', 84),
(79, 'D', 84),
(80, 'E', 84),
(81, 'A', 86),
(82, 'B', 86),
(83, 'C', 86),
(84, 'D', 86),
(85, 'E', 86),
(86, 'A', 87),
(87, 'B', 87),
(88, 'C', 87),
(89, 'D', 87),
(90, 'E', 87),
(91, 'A', 88),
(92, 'B', 88),
(93, 'C', 88),
(94, 'D', 88),
(95, 'E', 88),
(96, 'A', 89),
(97, 'B', 89),
(98, 'C', 89),
(99, 'D', 89),
(100, 'E', 89),
(101, 'A', 90),
(102, 'B', 90),
(103, 'C', 90),
(104, 'D', 90),
(105, 'E', 90),
(106, 'A', 91),
(107, 'B', 91),
(108, 'C', 91),
(109, 'D', 91),
(110, 'E', 91),
(111, 'A', 92),
(112, 'B', 92),
(113, 'C', 92),
(114, 'D', 92),
(115, 'E', 92),
(116, 'A', 93),
(117, 'B', 93),
(118, 'C', 93),
(119, 'D', 93),
(120, 'E', 93),
(121, 'A', 94),
(122, 'B', 94),
(123, 'C', 94),
(124, 'D', 94),
(125, 'E', 94),
(126, 'A', 95),
(127, 'B', 95),
(128, 'C', 95),
(129, 'D', 95),
(130, 'E', 95);

-- --------------------------------------------------------

--
-- Stand-in structure for view `informasi_pelanggan_view`
-- (See below for the actual view)
--
CREATE TABLE `informasi_pelanggan_view` (
`id_pelanggan` int(11)
,`no_ktp` varchar(25)
,`nama` varchar(100)
,`telepon` varchar(20)
,`email` varchar(90)
,`total_pembayaran` decimal(22,2)
,`tgl_pemesanan` date
,`nama_kereta` varchar(400)
);

-- --------------------------------------------------------

--
-- Table structure for table `kereta`
--

CREATE TABLE `kereta` (
  `id_kereta` int(11) NOT NULL,
  `nama_kereta` varchar(400) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `jam_berangkat` varchar(5) NOT NULL,
  `jam_tiba` varchar(5) NOT NULL,
  `tarif` decimal(22,2) NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `kereta`
--

INSERT INTO `kereta` (`id_kereta`, `nama_kereta`, `kelas`, `tanggal`, `jam_berangkat`, `jam_tiba`, `tarif`, `status`) VALUES
(1, 'Argo Bromo Anggrek', 'Eksekutif', '2024-06-20', '08:00', '14:00', '250000.00', 'Tersedia'),
(2, 'Gajayana', 'Ekonomi', '2024-06-21', '09:30', '15:45', '150000.00', 'Tersedia'),
(3, 'Matarmaja', 'Bisnis', '2024-06-22', '07:45', '12:30', '180000.00', 'Tersedia'),
(4, 'Mutiara Selatan', 'Eksekutif', '2024-06-23', '11:15', '17:20', '280000.00', 'Tersedia'),
(5, 'Jayabaya', 'Bisnis', '2024-06-24', '13:00', '19:30', '200000.00', 'Tersedia'),
(6, 'Jayabaya', 'Eksekutif', '2024-06-24', '12:00', '14:00', '250000.00', 'Tersedia'),
(7, 'Jayabaya', 'Ekonomi', '2024-06-24', '12:00', '14:00', '180000.00', 'Tersedia'),
(91, 'uuuuuuuu', 'Bisnis', '2024-07-11', '11:00', '12:00', '100000.00', 'Tidak Tersedia'),
(92, 'comuter', 'Ekonomi', '2024-06-29', '13:36', '15:36', '20000.00', 'Tidak Tersedia'),
(93, 'Kereta Api Tut Tut Siapa Hendak Turun', 'Ekonomi', '2024-06-25', '10:00', '15:00', '150000.00', 'Tersedia'),
(94, 'Kereta Sakera', 'Bisnis', '2024-06-19', '12:00', '14:00', '120000.00', 'Tidak Tersedia'),
(95, 'Kereta Marlena', 'Bisnis', '2024-06-26', '13:00', '15:00', '200000.00', 'Tersedia');

--
-- Triggers `kereta`
--
DELIMITER $$
CREATE TRIGGER `before_delete_kereta` BEFORE DELETE ON `kereta` FOR EACH ROW BEGIN
    -- Hapus data terkait di tabel asal_kereta
    DELETE FROM asal_kereta WHERE id_kereta = OLD.id_kereta;

    -- Hapus data terkait di tabel tujuan
    DELETE FROM tujuan WHERE id_kereta = OLD.id_kereta;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `cek_status_tidak_tersedia` BEFORE DELETE ON `kereta` FOR EACH ROW BEGIN
    IF OLD.status = 'Tersedia' THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Tidak dapat menghapus data dari Tabel Kereta. Status masih "Tersedia".';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `cek_tanggal_kereta` BEFORE INSERT ON `kereta` FOR EACH ROW BEGIN
    DECLARE waktu_sekarang TIMESTAMP;
    SET waktu_sekarang = NOW();
    
    IF NEW.tanggal < DATE(waktu_sekarang) OR (NEW.tanggal = DATE(waktu_sekarang) AND NEW.jam_berangkat < TIME(waktu_sekarang)) THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Tidak dapat menambahkan ke dalam Tabel Kereta. Tanggal dan jam harus di atas atau sama dengan waktu saat ini.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `kereta_view`
-- (See below for the actual view)
--
CREATE TABLE `kereta_view` (
`id` int(11)
,`nama_kereta` varchar(400)
,`kelas` varchar(50)
,`tanggal` date
,`jam_berangkat` varchar(5)
,`jam_tiba` varchar(5)
,`tarif` decimal(22,2)
,`status` varchar(200)
,`nama_asal` text
,`nama_tujuan` text
);

-- --------------------------------------------------------

--
-- Table structure for table `kursi`
--

CREATE TABLE `kursi` (
  `id_kursi` int(11) NOT NULL,
  `posisi_kursi` varchar(4) NOT NULL,
  `status` varchar(30) NOT NULL,
  `kode_booking` varchar(10) DEFAULT NULL,
  `id_gerbong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `kursi`
--

INSERT INTO `kursi` (`id_kursi`, `posisi_kursi`, `status`, `kode_booking`, `id_gerbong`) VALUES
(1, '1', 'Tersedia', NULL, 1),
(2, '2', 'Tersedia', NULL, 1),
(3, '3', 'Tersedia', NULL, 1),
(4, '4', 'Tersedia', NULL, 1),
(5, '5', 'Tersedia', NULL, 1),
(6, '6', 'Tersedia', NULL, 1),
(7, '7', 'Tersedia', NULL, 1),
(8, '8', 'Tersedia', NULL, 1),
(9, '9', 'Tersedia', NULL, 1),
(10, '10', 'Tersedia', NULL, 1),
(11, '1', 'Tersedia', NULL, 2),
(12, '2', 'Tersedia', NULL, 2),
(13, '3', 'Tersedia', NULL, 2),
(14, '4', 'Tersedia', NULL, 2),
(15, '5', 'Tersedia', NULL, 2),
(16, '6', 'Tersedia', NULL, 2),
(17, '7', 'Tersedia', NULL, 2),
(18, '8', 'Tersedia', NULL, 2),
(19, '9', 'Tersedia', NULL, 2),
(20, '10', 'Tersedia', NULL, 2),
(21, '1', 'Tersedia', NULL, 3),
(22, '2', 'Tersedia', NULL, 3),
(23, '3', 'Tersedia', NULL, 3),
(24, '4', 'Tersedia', NULL, 3),
(25, '5', 'Tersedia', NULL, 3),
(26, '6', 'Tersedia', NULL, 3),
(27, '7', 'Tersedia', NULL, 3),
(28, '8', 'Tersedia', NULL, 3),
(29, '9', 'Tersedia', NULL, 3),
(30, '10', 'Tersedia', NULL, 3),
(31, '1', 'Tersedia', NULL, 4),
(32, '2', 'Tersedia', NULL, 4),
(33, '3', 'Tersedia', NULL, 4),
(34, '4', 'Tersedia', NULL, 4),
(35, '5', 'Tersedia', NULL, 4),
(36, '6', 'Tersedia', NULL, 4),
(37, '7', 'Tersedia', NULL, 4),
(38, '8', 'Tersedia', NULL, 4),
(39, '9', 'Tersedia', NULL, 4),
(40, '10', 'Tersedia', NULL, 4),
(41, '1', 'Tersedia', NULL, 5),
(42, '2', 'Tersedia', NULL, 5),
(43, '3', 'Tersedia', NULL, 5),
(44, '4', 'Tersedia', NULL, 5),
(45, '5', 'Tersedia', NULL, 5),
(46, '6', 'Tersedia', NULL, 5),
(47, '7', 'Tersedia', NULL, 5),
(48, '8', 'Tersedia', NULL, 5),
(49, '9', 'Tersedia', NULL, 5),
(50, '10', 'Tersedia', NULL, 5),
(51, '1', 'Tersedia', NULL, 26),
(52, '2', 'Tersedia', NULL, 26),
(53, '3', 'Tersedia', NULL, 26),
(54, '4', 'Tersedia', NULL, 26),
(55, '5', 'Tersedia', NULL, 26),
(56, '6', 'Tersedia', NULL, 26),
(57, '7', 'Tersedia', NULL, 26),
(58, '8', 'Tersedia', NULL, 26),
(59, '9', 'Tersedia', NULL, 26),
(60, '10', 'Tersedia', NULL, 26),
(61, '1', 'Tersedia', NULL, 27),
(62, '2', 'Tersedia', NULL, 27),
(63, '3', 'Tersedia', NULL, 27),
(64, '4', 'Tersedia', NULL, 27),
(65, '5', 'Tersedia', NULL, 27),
(66, '6', 'Tersedia', NULL, 27),
(67, '7', 'Tersedia', NULL, 27),
(68, '8', 'Tersedia', NULL, 27),
(69, '9', 'Tersedia', NULL, 27),
(70, '10', 'Tersedia', NULL, 27),
(71, '1', 'Tersedia', NULL, 28),
(72, '2', 'Tersedia', NULL, 28),
(73, '3', 'Tersedia', NULL, 28),
(74, '4', 'Tersedia', NULL, 28),
(75, '5', 'Tersedia', NULL, 28),
(76, '6', 'Tersedia', NULL, 28),
(77, '7', 'Tersedia', NULL, 28),
(78, '8', 'Tersedia', NULL, 28),
(79, '9', 'Tersedia', NULL, 28),
(80, '10', 'Tersedia', NULL, 28),
(81, '1', 'Tersedia', NULL, 29),
(82, '2', 'Tersedia', NULL, 29),
(83, '3', 'Tersedia', NULL, 29),
(84, '4', 'Tersedia', NULL, 29),
(85, '5', 'Tersedia', NULL, 29),
(86, '6', 'Tersedia', NULL, 29),
(87, '7', 'Tersedia', NULL, 29),
(88, '8', 'Tersedia', NULL, 29),
(89, '9', 'Tersedia', NULL, 29),
(90, '10', 'Tersedia', NULL, 29),
(91, '1', 'Tersedia', NULL, 30),
(92, '2', 'Tersedia', NULL, 30),
(93, '3', 'Tersedia', NULL, 30),
(94, '4', 'Tersedia', NULL, 30),
(95, '5', 'Tersedia', NULL, 30),
(96, '6', 'Tersedia', NULL, 30),
(97, '7', 'Tersedia', NULL, 30),
(98, '8', 'Tersedia', NULL, 30),
(99, '9', 'Tersedia', NULL, 30),
(100, '10', 'Tersedia', NULL, 30),
(101, '1', 'Tersedia', NULL, 35),
(102, '2', 'Tersedia', NULL, 35),
(103, '3', 'Tersedia', NULL, 35),
(104, '4', 'Tersedia', NULL, 35),
(105, '5', 'Tersedia', NULL, 35),
(106, '6', 'Tersedia', NULL, 35),
(107, '7', 'Tersedia', NULL, 35),
(108, '8', 'Tersedia', NULL, 35),
(109, '9', 'Tersedia', NULL, 35),
(110, '10', 'Tersedia', NULL, 35),
(111, '1', 'Tersedia', NULL, 36),
(112, '2', 'Tersedia', NULL, 36),
(113, '3', 'Tersedia', NULL, 36),
(114, '4', 'Tersedia', NULL, 36),
(115, '5', 'Tersedia', NULL, 36),
(116, '6', 'Tersedia', NULL, 36),
(117, '7', 'Tersedia', NULL, 36),
(118, '8', 'Tersedia', NULL, 36),
(119, '9', 'Tersedia', NULL, 36),
(120, '10', 'Tersedia', NULL, 36),
(121, '1', 'Tersedia', NULL, 37),
(122, '2', 'Tersedia', NULL, 37),
(123, '3', 'Tersedia', NULL, 37),
(124, '4', 'Tersedia', NULL, 37),
(125, '5', 'Tersedia', NULL, 37),
(126, '6', 'Tersedia', NULL, 37),
(127, '7', 'Tersedia', NULL, 37),
(128, '8', 'Tersedia', NULL, 37),
(129, '9', 'Tersedia', NULL, 37),
(130, '10', 'Tersedia', NULL, 37),
(131, '1', 'Tersedia', NULL, 38),
(132, '2', 'Tersedia', NULL, 38),
(133, '3', 'Tersedia', NULL, 38),
(134, '4', 'Tersedia', NULL, 38),
(135, '5', 'Tersedia', NULL, 38),
(136, '6', 'Tersedia', NULL, 38),
(137, '7', 'Tersedia', NULL, 38),
(138, '8', 'Tersedia', NULL, 38),
(139, '9', 'Tersedia', NULL, 38),
(140, '10', 'Tersedia', NULL, 38),
(141, '1', 'Tersedia', NULL, 39),
(142, '2', 'Tersedia', NULL, 39),
(143, '3', 'Tersedia', NULL, 39),
(144, '4', 'Tersedia', NULL, 39),
(145, '5', 'Tersedia', NULL, 39),
(146, '6', 'Tersedia', NULL, 39),
(147, '7', 'Tersedia', NULL, 39),
(148, '8', 'Tersedia', NULL, 39),
(149, '9', 'Tersedia', NULL, 39),
(150, '10', 'Tersedia', NULL, 39),
(151, '1', 'Tersedia', NULL, 40),
(152, '2', 'Tersedia', NULL, 40),
(153, '3', 'Tersedia', NULL, 40),
(154, '4', 'Tersedia', NULL, 40),
(155, '5', 'Tersedia', NULL, 40),
(156, '6', 'Tersedia', NULL, 40),
(157, '7', 'Tersedia', NULL, 40),
(158, '8', 'Tersedia', NULL, 40),
(159, '9', 'Tersedia', NULL, 40),
(160, '10', 'Tersedia', NULL, 40),
(161, '1', 'Tersedia', NULL, 41),
(162, '2', 'Tersedia', NULL, 41),
(163, '3', 'Tersedia', NULL, 41),
(164, '4', 'Tersedia', NULL, 41),
(165, '5', 'Tersedia', NULL, 41),
(166, '6', 'Tersedia', NULL, 41),
(167, '7', 'Tersedia', NULL, 41),
(168, '8', 'Tersedia', NULL, 41),
(169, '9', 'Tersedia', NULL, 41),
(170, '10', 'Tersedia', NULL, 41),
(171, '1', 'Tersedia', NULL, 42),
(172, '2', 'Tersedia', NULL, 42),
(173, '3', 'Tersedia', NULL, 42),
(174, '4', 'Tersedia', NULL, 42),
(175, '5', 'Tersedia', NULL, 42),
(176, '6', 'Tersedia', NULL, 42),
(177, '7', 'Tersedia', NULL, 42),
(178, '8', 'Tersedia', NULL, 42),
(179, '9', 'Tersedia', NULL, 42),
(180, '10', 'Tersedia', NULL, 42),
(181, '1', 'Tersedia', NULL, 43),
(182, '2', 'Tersedia', NULL, 43),
(183, '3', 'Tersedia', NULL, 43),
(184, '4', 'Tersedia', NULL, 43),
(185, '5', 'Tersedia', NULL, 43),
(186, '6', 'Tersedia', NULL, 43),
(187, '7', 'Tersedia', NULL, 43),
(188, '8', 'Tersedia', NULL, 43),
(189, '9', 'Tersedia', NULL, 43),
(190, '10', 'Tersedia', NULL, 43),
(191, '1', 'Tersedia', NULL, 44),
(192, '2', 'Tersedia', NULL, 44),
(193, '3', 'Tersedia', NULL, 44),
(194, '4', 'Tersedia', NULL, 44),
(195, '5', 'Tersedia', NULL, 44),
(196, '6', 'Tersedia', NULL, 44),
(197, '7', 'Tersedia', NULL, 44),
(198, '8', 'Tersedia', NULL, 44),
(199, '9', 'Tersedia', NULL, 44),
(200, '10', 'Tersedia', NULL, 44),
(201, '1', 'Tersedia', NULL, 45),
(202, '2', 'Tersedia', NULL, 45),
(203, '3', 'Tersedia', NULL, 45),
(204, '4', 'Tersedia', NULL, 45),
(205, '5', 'Tersedia', NULL, 45),
(206, '6', 'Tersedia', NULL, 45),
(207, '7', 'Tersedia', NULL, 45),
(208, '8', 'Tersedia', NULL, 45),
(209, '9', 'Tersedia', NULL, 45),
(210, '10', 'Tersedia', NULL, 45),
(211, '1', 'Tersedia', NULL, 46),
(212, '2', 'Tersedia', NULL, 46),
(213, '3', 'Tersedia', NULL, 46),
(214, '4', 'Tersedia', NULL, 46),
(215, '5', 'Tersedia', NULL, 46),
(216, '6', 'Tersedia', NULL, 46),
(217, '7', 'Tersedia', NULL, 46),
(218, '8', 'Tersedia', NULL, 46),
(219, '9', 'Tersedia', NULL, 46),
(220, '10', 'Tersedia', NULL, 46),
(221, '1', 'Tersedia', NULL, 47),
(222, '2', 'Tersedia', NULL, 47),
(223, '3', 'Tersedia', NULL, 47),
(224, '4', 'Tersedia', NULL, 47),
(225, '5', 'Tersedia', NULL, 47),
(226, '6', 'Tersedia', NULL, 47),
(227, '7', 'Tersedia', NULL, 47),
(228, '8', 'Tersedia', NULL, 47),
(229, '9', 'Tersedia', NULL, 47),
(230, '10', 'Tersedia', NULL, 47),
(231, '1', 'Tersedia', NULL, 48),
(232, '2', 'Tersedia', NULL, 48),
(233, '3', 'Tersedia', NULL, 48),
(234, '4', 'Tersedia', NULL, 48),
(235, '5', 'Tersedia', NULL, 48),
(236, '6', 'Tersedia', NULL, 48),
(237, '7', 'Tersedia', NULL, 48),
(238, '8', 'Tersedia', NULL, 48),
(239, '9', 'Tersedia', NULL, 48),
(240, '10', 'Tersedia', NULL, 48),
(241, '1', 'Tersedia', NULL, 49),
(242, '2', 'Tersedia', NULL, 49),
(243, '3', 'Tersedia', NULL, 49),
(244, '4', 'Tersedia', NULL, 49),
(245, '5', 'Tersedia', NULL, 49),
(246, '6', 'Tersedia', NULL, 49),
(247, '7', 'Tersedia', NULL, 49),
(248, '8', 'Tersedia', NULL, 49),
(249, '9', 'Tersedia', NULL, 49),
(250, '10', 'Tersedia', NULL, 49),
(251, 'A1', 'Tersedia', NULL, 50),
(252, 'A2', 'Tersedia', NULL, 50),
(253, 'A3', 'Tersedia', NULL, 50),
(254, 'A4', 'Tersedia', NULL, 50),
(255, 'A5', 'Tersedia', NULL, 50),
(256, 'A6', 'Tersedia', NULL, 50),
(257, 'A7', 'Tersedia', NULL, 50),
(258, 'A8', 'Tersedia', NULL, 50),
(259, 'A9', 'Tersedia', NULL, 50),
(260, 'A10', 'Tersedia', NULL, 50),
(261, 'B1', 'Tersedia', NULL, 51),
(262, 'B2', 'Tersedia', NULL, 51),
(263, 'B3', 'Tersedia', NULL, 51),
(264, 'B4', 'Tersedia', NULL, 51),
(265, 'B5', 'Tersedia', NULL, 51),
(266, 'B6', 'Tersedia', NULL, 51),
(267, 'B7', 'Tersedia', NULL, 51),
(268, 'B8', 'Tersedia', NULL, 51),
(269, 'B9', 'Tersedia', NULL, 51),
(270, 'B10', 'Tersedia', NULL, 51),
(271, 'C1', 'Tersedia', NULL, 52),
(272, 'C2', 'Tersedia', NULL, 52),
(273, 'C3', 'Tersedia', NULL, 52),
(274, 'C4', 'Tersedia', NULL, 52),
(275, 'C5', 'Tersedia', NULL, 52),
(276, 'C6', 'Tersedia', NULL, 52),
(277, 'C7', 'Tersedia', NULL, 52),
(278, 'C8', 'Tersedia', NULL, 52),
(279, 'C9', 'Tersedia', NULL, 52),
(280, 'C10', 'Tersedia', NULL, 52),
(281, 'D1', 'Tersedia', NULL, 53),
(282, 'D2', 'Tersedia', NULL, 53),
(283, 'D3', 'Tersedia', NULL, 53),
(284, 'D4', 'Tersedia', NULL, 53),
(285, 'D5', 'Tersedia', NULL, 53),
(286, 'D6', 'Tersedia', NULL, 53),
(287, 'D7', 'Tersedia', NULL, 53),
(288, 'D8', 'Tersedia', NULL, 53),
(289, 'D9', 'Tersedia', NULL, 53),
(290, 'D10', 'Tersedia', NULL, 53),
(291, 'E1', 'Tersedia', NULL, 54),
(292, 'E2', 'Tersedia', NULL, 54),
(293, 'E3', 'Tersedia', NULL, 54),
(294, 'E4', 'Tersedia', NULL, 54),
(295, 'E5', 'Tersedia', NULL, 54),
(296, 'E6', 'Tersedia', NULL, 54),
(297, 'E7', 'Tersedia', NULL, 54),
(298, 'E8', 'Tersedia', NULL, 54),
(299, 'E9', 'Tersedia', NULL, 54),
(300, 'E10', 'Tersedia', NULL, 54),
(301, 'A1', 'Tersedia', NULL, 55),
(302, 'A2', 'Tersedia', NULL, 55),
(303, 'A3', 'Tersedia', NULL, 55),
(304, 'A4', 'Tersedia', NULL, 55),
(305, 'A5', 'Tersedia', NULL, 55),
(306, 'A6', 'Tersedia', NULL, 55),
(307, 'A7', 'Tersedia', NULL, 55),
(308, 'A8', 'Tersedia', NULL, 55),
(309, 'A9', 'Tersedia', NULL, 55),
(310, 'A10', 'Tersedia', NULL, 55),
(311, 'B1', 'Tersedia', NULL, 56),
(312, 'B2', 'Tersedia', NULL, 56),
(313, 'B3', 'Tersedia', NULL, 56),
(314, 'B4', 'Tersedia', NULL, 56),
(315, 'B5', 'Tersedia', NULL, 56),
(316, 'B6', 'Tersedia', NULL, 56),
(317, 'B7', 'Tersedia', NULL, 56),
(318, 'B8', 'Tersedia', NULL, 56),
(319, 'B9', 'Tersedia', NULL, 56),
(320, 'B10', 'Tersedia', NULL, 56),
(321, 'C1', 'Tersedia', NULL, 57),
(322, 'C2', 'Tersedia', NULL, 57),
(323, 'C3', 'Tersedia', NULL, 57),
(324, 'C4', 'Tersedia', NULL, 57),
(325, 'C5', 'Tersedia', NULL, 57),
(326, 'C6', 'Tersedia', NULL, 57),
(327, 'C7', 'Tersedia', NULL, 57),
(328, 'C8', 'Tersedia', NULL, 57),
(329, 'C9', 'Tersedia', NULL, 57),
(330, 'C10', 'Tersedia', NULL, 57),
(331, 'D1', 'Tersedia', NULL, 58),
(332, 'D2', 'Tersedia', NULL, 58),
(333, 'D3', 'Tersedia', NULL, 58),
(334, 'D4', 'Tersedia', NULL, 58),
(335, 'D5', 'Tersedia', NULL, 58),
(336, 'D6', 'Tersedia', NULL, 58),
(337, 'D7', 'Tersedia', NULL, 58),
(338, 'D8', 'Tersedia', NULL, 58),
(339, 'D9', 'Tersedia', NULL, 58),
(340, 'D10', 'Tersedia', NULL, 58),
(341, 'E1', 'Tersedia', NULL, 59),
(342, 'E2', 'Tersedia', NULL, 59),
(343, 'E3', 'Tersedia', NULL, 59),
(344, 'E4', 'Tersedia', NULL, 59),
(345, 'E5', 'Tersedia', NULL, 59),
(346, 'E6', 'Tersedia', NULL, 59),
(347, 'E7', 'Tersedia', NULL, 59),
(348, 'E8', 'Tersedia', NULL, 59),
(349, 'E9', 'Tersedia', NULL, 59),
(350, 'E10', 'Tersedia', NULL, 59),
(351, 'A1', 'Tersedia', NULL, 60),
(352, 'A2', 'Tersedia', NULL, 60),
(353, 'A3', 'Tersedia', NULL, 60),
(354, 'A4', 'Tersedia', NULL, 60),
(355, 'A5', 'Tersedia', NULL, 60),
(356, 'A6', 'Tersedia', NULL, 60),
(357, 'A7', 'Tersedia', NULL, 60),
(358, 'A8', 'Tersedia', NULL, 60),
(359, 'A9', 'Tersedia', NULL, 60),
(360, 'A10', 'Tersedia', NULL, 60),
(361, 'B1', 'Tersedia', NULL, 61),
(362, 'B2', 'Tersedia', NULL, 61),
(363, 'B3', 'Tersedia', NULL, 61),
(364, 'B4', 'Tersedia', NULL, 61),
(365, 'B5', 'Tersedia', NULL, 61),
(366, 'B6', 'Tersedia', NULL, 61),
(367, 'B7', 'Tersedia', NULL, 61),
(368, 'B8', 'Tersedia', NULL, 61),
(369, 'B9', 'Tersedia', NULL, 61),
(370, 'B10', 'Tersedia', NULL, 61),
(371, 'C1', 'Tersedia', NULL, 62),
(372, 'C2', 'Tersedia', NULL, 62),
(373, 'C3', 'Tersedia', NULL, 62),
(374, 'C4', 'Tersedia', NULL, 62),
(375, 'C5', 'Tersedia', NULL, 62),
(376, 'C6', 'Tersedia', NULL, 62),
(377, 'C7', 'Tersedia', NULL, 62),
(378, 'C8', 'Tersedia', NULL, 62),
(379, 'C9', 'Tersedia', NULL, 62),
(380, 'C10', 'Tersedia', NULL, 62),
(381, 'D1', 'Tersedia', NULL, 63),
(382, 'D2', 'Tersedia', NULL, 63),
(383, 'D3', 'Tersedia', NULL, 63),
(384, 'D4', 'Tersedia', NULL, 63),
(385, 'D5', 'Tersedia', NULL, 63),
(386, 'D6', 'Tersedia', NULL, 63),
(387, 'D7', 'Tersedia', NULL, 63),
(388, 'D8', 'Tersedia', NULL, 63),
(389, 'D9', 'Tersedia', NULL, 63),
(390, 'D10', 'Tersedia', NULL, 63),
(391, 'E1', 'Tersedia', NULL, 64),
(392, 'E2', 'Tersedia', NULL, 64),
(393, 'E3', 'Tersedia', NULL, 64),
(394, 'E4', 'Tersedia', NULL, 64),
(395, 'E5', 'Tersedia', NULL, 64),
(396, 'E6', 'Tersedia', NULL, 64),
(397, 'E7', 'Tersedia', NULL, 64),
(398, 'E8', 'Tersedia', NULL, 64),
(399, 'E9', 'Tersedia', NULL, 64),
(400, 'E10', 'Tersedia', NULL, 64),
(401, 'A1', 'Tersedia', NULL, 65),
(402, 'A2', 'Tersedia', NULL, 65),
(403, 'A3', 'Tersedia', NULL, 65),
(404, 'A4', 'Tersedia', NULL, 65),
(405, 'A5', 'Tersedia', NULL, 65),
(406, 'A6', 'Tersedia', NULL, 65),
(407, 'A7', 'Tersedia', NULL, 65),
(408, 'A8', 'Tersedia', NULL, 65),
(409, 'A9', 'Tersedia', NULL, 65),
(410, 'A10', 'Tersedia', NULL, 65),
(411, 'B1', 'Tersedia', NULL, 66),
(412, 'B2', 'Tersedia', NULL, 66),
(413, 'B3', 'Tersedia', NULL, 66),
(414, 'B4', 'Tersedia', NULL, 66),
(415, 'B5', 'Tersedia', NULL, 66),
(416, 'B6', 'Tersedia', NULL, 66),
(417, 'B7', 'Tersedia', NULL, 66),
(418, 'B8', 'Tersedia', NULL, 66),
(419, 'B9', 'Tersedia', NULL, 66),
(420, 'B10', 'Tersedia', NULL, 66),
(421, 'C1', 'Tersedia', NULL, 67),
(422, 'C2', 'Tersedia', NULL, 67),
(423, 'C3', 'Tersedia', NULL, 67),
(424, 'C4', 'Tersedia', NULL, 67),
(425, 'C5', 'Tersedia', NULL, 67),
(426, 'C6', 'Tersedia', NULL, 67),
(427, 'C7', 'Tersedia', NULL, 67),
(428, 'C8', 'Tersedia', NULL, 67),
(429, 'C9', 'Tersedia', NULL, 67),
(430, 'C10', 'Tersedia', NULL, 67),
(431, 'D1', 'Tersedia', NULL, 68),
(432, 'D2', 'Tersedia', NULL, 68),
(433, 'D3', 'Tersedia', NULL, 68),
(434, 'D4', 'Tersedia', NULL, 68),
(435, 'D5', 'Tersedia', NULL, 68),
(436, 'D6', 'Tersedia', NULL, 68),
(437, 'D7', 'Tersedia', NULL, 68),
(438, 'D8', 'Tersedia', NULL, 68),
(439, 'D9', 'Tersedia', NULL, 68),
(440, 'D10', 'Tersedia', NULL, 68),
(441, 'E1', 'Tersedia', NULL, 69),
(442, 'E2', 'Tersedia', NULL, 69),
(443, 'E3', 'Tersedia', NULL, 69),
(444, 'E4', 'Tersedia', NULL, 69),
(445, 'E5', 'Tersedia', NULL, 69),
(446, 'E6', 'Tersedia', NULL, 69),
(447, 'E7', 'Tersedia', NULL, 69),
(448, 'E8', 'Tersedia', NULL, 69),
(449, 'E9', 'Tersedia', NULL, 69),
(450, 'E10', 'Tersedia', NULL, 69);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `id_kereta` int(11) NOT NULL,
  `no_ktp` varchar(25) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `email` varchar(90) NOT NULL,
  `total_pembayaran` decimal(22,2) DEFAULT NULL,
  `tgl_pemesanan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `id_kereta`, `no_ktp`, `nama`, `telepon`, `email`, `total_pembayaran`, `tgl_pemesanan`) VALUES
(1, 1, '1234567890', 'Ahmad', '08123456789', 'ahmad@example.com', '250000.00', '2024-06-09'),
(2, 1, '0987654321', 'Budi', '08567890123', 'budi@example.com', '150000.00', '2024-06-10'),
(3, 1, '2345678901', 'Citra', '08901234567', 'citra@example.com', '180000.00', '2024-06-11'),
(4, 2, '3456789012', 'Dewi', '08123456789', 'dewi@example.com', '280000.00', '2024-06-08'),
(5, 3, '4567890123', 'Eka', '08765432109', 'eka@example.com', '200000.00', '2024-06-07'),
(6, 1, '0101010929299123', 'anisasasa', '1223456', 'anisyafaah80147@gmail.com', '250000.00', '2024-06-11'),
(7, 3, '0101010929299123', 'anisasasa', '1223456', 'anisyafaah80147@gmail.com', '360000.00', '2024-06-11'),
(8, 1, '0101010929299123', 'anisasasa', '1223456', 'anisyafaah80147@gmail.com', '500000.00', '2024-06-12'),
(9, 2, '0101010929299124', 'sukma', '122345644', 'sukma@gmail.com', '300000.00', '2024-06-13'),
(10, 4, '3526890378491036', 'yuhuuuu', '0122345644', 'yuhu@gmail.com', '560000.00', '2024-06-13'),
(11, 93, '3526890378491111', 'putri kanjeng', '0122345644', 'putri@gmail.com', '150000.00', '2024-06-13'),
(12, 2, '3526890378491111', 'awksk', '0122345644', 'yyy@gmail.com', '150000.00', '2024-06-13'),
(13, 93, '3526890378491000', 'anisyah', '012234564490', 'user@gmail.com', '150000.00', '2024-06-13');

-- --------------------------------------------------------

--
-- Stand-in structure for view `pendapatan_per_hari_view`
-- (See below for the actual view)
--
CREATE TABLE `pendapatan_per_hari_view` (
`tgl_pemesanan` date
,`total_pendapatan` decimal(44,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ringkasan_pemesanan_view`
-- (See below for the actual view)
--
CREATE TABLE `ringkasan_pemesanan_view` (
`nama_kereta` varchar(400)
,`kelas` varchar(50)
,`jumlah_pelanggan` bigint(21)
,`total_pendapatan` decimal(44,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `tujuan`
--

CREATE TABLE `tujuan` (
  `id_tujuan` int(11) NOT NULL,
  `tujuan` text NOT NULL,
  `id_kereta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tujuan`
--

INSERT INTO `tujuan` (`id_tujuan`, `tujuan`, `id_kereta`) VALUES
(1, 'Stasiun Surabaya Gubeng', 1),
(2, 'Stasiun Semarang Tawang', 2),
(3, 'Stasiun Yogyakarta Tugu', 3),
(4, 'Stasiun Solo Balapan', 4),
(5, 'Stasiun Malang Kota Lama', 5),
(6, 'Stasiun Malang Kota Lama', 6),
(7, 'Stasiun Malang Kota Lama', 7),
(9, 'Stasiun Mars', 92),
(33, 'Stasiun Surabaya Gubeng', 93),
(34, 'Stasiun Surabaya Gubeng', 94),
(35, 'Stasiun Surabaya Gubeng', 95);

-- --------------------------------------------------------

--
-- Structure for view `about_view`
--
DROP TABLE IF EXISTS `about_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `about_view`  AS SELECT `about_us`.`id_about` AS `id_about`, `about_us`.`judul` AS `judul`, `about_us`.`isi` AS `isi`, `about_us`.`tanggal` AS `tanggal` FROM `about_us``about_us`  ;

-- --------------------------------------------------------

--
-- Structure for view `detail_pemesanan_view`
--
DROP TABLE IF EXISTS `detail_pemesanan_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `detail_pemesanan_view`  AS SELECT `p`.`nama` AS `nama_pelanggan`, `p`.`no_ktp` AS `no_ktp`, `p`.`telepon` AS `telepon`, `p`.`total_pembayaran` AS `total_pembayaran`, `p`.`tgl_pemesanan` AS `tgl_pemesanan`, `k`.`nama_kereta` AS `nama_kereta`, `k`.`kelas` AS `kelas`, `k`.`tanggal` AS `tanggal`, `k`.`jam_berangkat` AS `jam_berangkat`, `k`.`jam_tiba` AS `jam_tiba`, `ak`.`asal_kereta` AS `asal_kereta`, `t`.`tujuan` AS `tujuan` FROM (((`pelanggan` `p` join `kereta` `k` on(`p`.`id_kereta` = `k`.`id_kereta`)) join `asal_kereta` `ak` on(`k`.`id_kereta` = `ak`.`id_kereta`)) join `tujuan` `t` on(`k`.`id_kereta` = `t`.`id_kereta`))  ;

-- --------------------------------------------------------

--
-- Structure for view `informasi_pelanggan_view`
--
DROP TABLE IF EXISTS `informasi_pelanggan_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `informasi_pelanggan_view`  AS SELECT `p`.`id_pelanggan` AS `id_pelanggan`, `p`.`no_ktp` AS `no_ktp`, `p`.`nama` AS `nama`, `p`.`telepon` AS `telepon`, `p`.`email` AS `email`, `p`.`total_pembayaran` AS `total_pembayaran`, `p`.`tgl_pemesanan` AS `tgl_pemesanan`, `k`.`nama_kereta` AS `nama_kereta` FROM (`pelanggan` `p` join `kereta` `k` on(`p`.`id_kereta` = `k`.`id_kereta`))  ;

-- --------------------------------------------------------

--
-- Structure for view `kereta_view`
--
DROP TABLE IF EXISTS `kereta_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `kereta_view`  AS SELECT `k`.`id_kereta` AS `id`, `k`.`nama_kereta` AS `nama_kereta`, `k`.`kelas` AS `kelas`, `k`.`tanggal` AS `tanggal`, `k`.`jam_berangkat` AS `jam_berangkat`, `k`.`jam_tiba` AS `jam_tiba`, `k`.`tarif` AS `tarif`, `k`.`status` AS `status`, `a`.`asal_kereta` AS `nama_asal`, `t`.`tujuan` AS `nama_tujuan` FROM ((`kereta` `k` join `asal_kereta` `a` on(`k`.`id_kereta` = `a`.`id_kereta`)) join `tujuan` `t` on(`a`.`id_kereta` = `t`.`id_kereta`))  ;

-- --------------------------------------------------------

--
-- Structure for view `pendapatan_per_hari_view`
--
DROP TABLE IF EXISTS `pendapatan_per_hari_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `pendapatan_per_hari_view`  AS SELECT `pelanggan`.`tgl_pemesanan` AS `tgl_pemesanan`, sum(`pelanggan`.`total_pembayaran`) AS `total_pendapatan` FROM `pelanggan` GROUP BY `pelanggan`.`tgl_pemesanan``tgl_pemesanan`  ;

-- --------------------------------------------------------

--
-- Structure for view `ringkasan_pemesanan_view`
--
DROP TABLE IF EXISTS `ringkasan_pemesanan_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `ringkasan_pemesanan_view`  AS SELECT `k`.`nama_kereta` AS `nama_kereta`, `k`.`kelas` AS `kelas`, count(`p`.`id_pelanggan`) AS `jumlah_pelanggan`, sum(`p`.`total_pembayaran`) AS `total_pendapatan` FROM (`pelanggan` `p` join `kereta` `k` on(`p`.`id_kereta` = `k`.`id_kereta`)) GROUP BY `k`.`nama_kereta`, `k`.`kelas``kelas`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id_about`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_log`
--
ALTER TABLE `admin_password_log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `asal_kereta`
--
ALTER TABLE `asal_kereta`
  ADD PRIMARY KEY (`id_asal`),
  ADD KEY `asal_kereta_ibfk_1` (`id_kereta`);

--
-- Indexes for table `gerbong`
--
ALTER TABLE `gerbong`
  ADD PRIMARY KEY (`id_gerbong`),
  ADD KEY `id_kereta` (`id_kereta`);

--
-- Indexes for table `kereta`
--
ALTER TABLE `kereta`
  ADD PRIMARY KEY (`id_kereta`);

--
-- Indexes for table `kursi`
--
ALTER TABLE `kursi`
  ADD PRIMARY KEY (`id_kursi`),
  ADD KEY `id_gerbong` (`id_gerbong`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD KEY `id_kereta` (`id_kereta`);

--
-- Indexes for table `tujuan`
--
ALTER TABLE `tujuan`
  ADD PRIMARY KEY (`id_tujuan`),
  ADD KEY `id_kereta` (`id_kereta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id_about` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_password_log`
--
ALTER TABLE `admin_password_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `asal_kereta`
--
ALTER TABLE `asal_kereta`
  MODIFY `id_asal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `gerbong`
--
ALTER TABLE `gerbong`
  MODIFY `id_gerbong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `kereta`
--
ALTER TABLE `kereta`
  MODIFY `id_kereta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `kursi`
--
ALTER TABLE `kursi`
  MODIFY `id_kursi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=451;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tujuan`
--
ALTER TABLE `tujuan`
  MODIFY `id_tujuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_password_log`
--
ALTER TABLE `admin_password_log`
  ADD CONSTRAINT `admin_password_log_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id`);

--
-- Constraints for table `asal_kereta`
--
ALTER TABLE `asal_kereta`
  ADD CONSTRAINT `asal_kereta_ibfk_1` FOREIGN KEY (`id_kereta`) REFERENCES `kereta` (`id_kereta`);

--
-- Constraints for table `kursi`
--
ALTER TABLE `kursi`
  ADD CONSTRAINT `kursi_ibfk_2` FOREIGN KEY (`id_gerbong`) REFERENCES `gerbong` (`id_gerbong`);

--
-- Constraints for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `pelanggan_ibfk_1` FOREIGN KEY (`id_kereta`) REFERENCES `kereta` (`id_kereta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
