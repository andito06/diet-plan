-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2026 at 08:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diet_plan`
--

-- --------------------------------------------------------

--
-- Table structure for table `daily_tracker`
--

CREATE TABLE `daily_tracker` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `hari` varchar(255) DEFAULT NULL,
  `kegiatan` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `reminder` varchar(255) DEFAULT NULL,
  `jam` varchar(255) NOT NULL,
  `notif_awal` varchar(255) NOT NULL,
  `notif_cek` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daily_tracker`
--

INSERT INTO `daily_tracker` (`id`, `user_id`, `hari`, `kegiatan`, `status`, `reminder`, `jam`, `notif_awal`, `notif_cek`) VALUES
(1, NULL, 'Senin', 'Minum air putih setelah bangun tidur', 'Selesai', 'Jangan lupa minum air setelah bangun', '04:30', '', ''),
(2, NULL, 'Senin', 'Sarapan oatmeal dan pisang', 'belum selesai', '10 menit lagi waktunya sarapan', '06:00', '', ''),
(3, NULL, 'Senin', 'Snack buah apel', 'Selesai', 'Waktunya snack sehat', '06:30', '', ''),
(4, NULL, 'Senin', 'Makan siang ayam rebus dan nasi merah', 'Belum selesai', 'Waktunya makan siang sehat', '12:00', '', ''),
(5, NULL, 'Senin', 'Jalan kaki 15 menit', 'Belum selesai', 'Ayo jalan kaki sebentar', '07:00', '', ''),
(6, NULL, 'Senin', 'Workout cardio 30 menit', 'Belum selesai', 'Waktunya olahraga', '16:30', '', ''),
(7, NULL, 'Senin', 'Makan malam salad dan telur', 'Belum selesai', 'Waktunya makan malam rendah kalori', '18:10', '', ''),
(8, NULL, 'Senin', 'Tidur cukup dan hindari begadang', 'Belum selesai', 'Jangan tidur terlalu malam', '21:00', '', ''),
(9, NULL, 'Selasa', 'Minum lemon water', 'Belum selesai', 'Jangan lupa minum lemon water', '08:00', '', ''),
(10, NULL, 'Selasa', 'Yoga pagi 20 menit', 'Belum selesai', 'Waktunya yoga pagi', '06:00', '', ''),
(11, NULL, 'Selasa', 'Sarapan roti gandum dan telur', 'Belum selesai', '10 menit lagi waktunya sarapan', '07:00', '', ''),
(12, NULL, 'Selasa', 'Snack yogurt rendah gula', 'Belum selesai', 'Waktunya snack sehat', '09:00', '', ''),
(13, NULL, 'Selasa', 'Makan siang ikan panggang dan sayur', 'Belum selesai', 'Waktunya makan siang', '12:00', '', ''),
(14, NULL, 'Selasa', 'Jalan santai 20 menit', 'Belum selesai', 'Ayo jalan santai dulu', '17:00', '', ''),
(15, NULL, 'Selasa', 'Workout lower body', 'Belum selesai', 'Waktunya workout', '19:10', '', ''),
(16, NULL, 'Selasa', 'Makan malam sup ayam rendah kalori', 'Belum selesai', 'Waktunya makan malam sehat', '18:10', '', ''),
(17, NULL, 'Rabu', 'Minum air putih setelah bangun tidur', 'Belum selesai', 'Jangan lupa minum air setelah bangun', '06:00', '05:50', '06:15'),
(18, NULL, 'Rabu', 'Sarapan oatmeal dan pisang', 'Belum selesai', '10 menit lagi waktunya sarapan', '07:00', '06:50', '07:15'),
(19, NULL, 'Rabu', 'Makan siang ayam rebus dan nasi merah', 'Belum selesai', 'Waktunya makan siang sehat', '12:00', '11:50', '12:15'),
(20, NULL, 'Rabu', 'Workout cardio 30 menit', 'Belum selesai', 'Waktunya olahraga', '17:00', '16:50', '17:15'),
(21, NULL, 'Rabu', 'Makan malam salad dan telur', 'Belum selesai', 'Waktunya makan malam rendah kalori', '19:00', '18:50', '19:15'),
(22, NULL, 'Kamis', 'Minum lemon water', 'Belum selesai', 'Jangan lupa minum lemon water', '06:00', '05:50', '06:15'),
(23, NULL, 'Kamis', 'Yoga pagi 20 menit', 'Belum selesai', 'Waktunya yoga pagi', '06:30', '06:20', '06:45'),
(24, NULL, 'Kamis', 'Sarapan roti gandum dan telur', 'Belum selesai', '10 menit lagi waktunya sarapan', '07:00', '06:50', '07:15'),
(25, NULL, 'Kamis', 'Makan siang ikan panggang dan sayur', 'Belum selesai', 'Waktunya makan siang', '12:00', '11:50', '12:15'),
(26, NULL, 'Selasa', 'Workout lower body', 'Belum selesai', 'Waktunya workout', '17:00', '16:50', '17:15');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `kegiatan` varchar(255) DEFAULT NULL,
  `waktu` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) NOT NULL,
  `kalori` int(11) NOT NULL,
  `reminder` varchar(255) DEFAULT NULL,
  `hari` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id`, `user_id`, `kegiatan`, `waktu`, `status`, `kategori`, `kalori`, `reminder`, `hari`, `tanggal`) VALUES
(2, 9, 'Makan nasi merah dan ayam', '12:00', 'Selesai', 'Makanan', 650, 'Makannnn', 'Senin', '2026-07-01'),
(3, 9, 'Makan Malam Sehat', '19:00', 'Selesai', 'makan malam', 900, 'Makan Malam sekarang', 'senin', '2026-07-01'),
(6, 9, 'Sarapan Cereal', '06:00', 'Selesai', 'Sarapan', 100, 'Sarapan Pagi Itu Penting', 'Kamis', '2026-07-02'),
(7, 9, 'makan malam', '20:00', 'Selesai', '', 0, 'makna malam bersama', 'Kamis', '2026-07-02'),
(8, 9, 'Minum air putih 2 gelas', '06:00', 'Selesai', 'Hidrasi', 0, 'Ingat minum air setiap 2 jam', 'Senin', '2026-07-13'),
(9, 9, 'Stretching pagi', '06:30', 'Selesai', 'Olahraga', 0, 'Lakukan stretching selama 10 menit', 'Senin', '2026-07-13'),
(10, 9, 'Sarapan oatmeal dan pisang', '07:00', 'Selesai', 'Makanan', 300, 'Sarapan sehat untuk memulai hari', 'Senin', '2026-07-13'),
(11, 9, 'Snack almond dan yogurt', '10:00', 'Selesai', 'Snack', 200, 'Snack sehat untuk menjaga energi', 'Senin', '2026-07-13'),
(12, 9, 'Makan siang ayam rebus dan sayur', '12:00', 'Selesai', 'Makanan', 500, 'Makan siang sehat untuk menjaga energi', 'Senin', '2026-07-13'),
(13, 9, 'Jalan kaki 15 menit', '15:00', 'Selesai', 'Aktivitas', 100, 'Lakukan aktivitas fisik setiap hari', 'Senin', '2026-07-13'),
(14, 9, 'Workout cardio 30 menit', '17:00', 'Selesai', 'Olahraga', 0, 'Lakukan latihan kardio untuk meningkatkan kesehatan jantung', 'Senin', '2026-07-13'),
(15, 9, 'Makan malam salad dan telur', '19:00', 'Selesai', 'Makanan', 400, 'Makan malam sehat untuk menjaga berat badan', 'Senin', '2026-07-13'),
(16, 9, 'Tidur cukup dan hindari begadang', '21:00', 'Selesai', 'Lifestyle', 0, 'Tidur cukup untuk pemulihan tubuh', 'Senin', '2026-07-13'),
(23, 6, 'Sarapan Cereal', '06:00', 'Belum selesai', 'Sarapan', 100, 'Sarapan Pagi Itu Penting', 'Kamis', '2026-07-02'),
(24, 9, 'Sarapan Cereal', '06:00', 'Selesai', 'Sarapan', 100, 'Sarapan Pagi Itu Penting', 'Kamis', '2026-07-02'),
(25, 9, 'Sarapan Cereal', '06:00', 'Selesai', 'Sarapan', 100, 'Sarapan Pagi Itu Penting', 'Kamis', '2026-07-02'),
(26, 9, 'Jalan Pagi 10 menit', '06:20', 'Selesai', 'Olahraga', 0, 'Jalan-jalan yukk', 'Kamis', '2026-07-02'),
(27, 9, 'Snack pagi! Makan buah apel dan jangan lupa air lemon!', '09:00', 'Selesai', 'Makanan', 20, 'Snack pagii, untuk menyegarkan badan!', 'Kamis', '2026-07-02'),
(28, 9, 'Makan Siang! sayur dan lele rebus', '12:00', 'Selesai', 'Makanan', 100, 'Jangan sampai terlambat makan siang!', 'Kamis', '2026-07-02'),
(29, 9, 'jalan sore 30 menit', '16:30', 'Selesai', 'Olahraga', 100, 'Jalan sore untuk menyegarkan pikiran! ', 'Kamis', '2026-07-02'),
(30, 9, 'Makan Malam tanpa nasi', '18:00', 'Selesai', 'Makanan', 50, 'Jangan sampai terlambat makan malam', 'Kamis', '2026-07-02'),
(31, 9, 'Istirahat dan tidur', '21:00', 'Selesai', 'Lifestyle', 0, 'Ingat untuk beristirahat dan tidur cukup', 'Kamis', '2026-07-02'),
(32, 9, 'Bangun dan minum Air Putih!', '05:30', 'Belum selesai', 'lifestyle', 0, 'Minum Air putih segera setelah bangun', 'Jumat', '2026-07-03'),
(33, 9, 'Jalan pagi 15 menit', '05:50', 'Belum selesai', 'Olahraga', 100, 'Olahraga pagi bantu pikiran lebih tenang', 'Jumat', '2026-07-03'),
(34, 9, 'Sarapan bubur dengan protein', '06:30', 'Belum selesai', 'Makanan', 120, 'Sarapann!', 'Jumat', '2026-07-03'),
(35, 9, 'Snack buah-buahan', '09:00', 'Belum selesai', 'Makanan', 10, 'Snacktime!', 'Jumat', '2026-07-03'),
(36, 9, 'Makan siang dengan nasi dan protein juga sayur', '12:00', 'Belum selesai', 'Makanan', 150, 'Nasi boleh, tapi jangan berlebihan yahh ^^', 'Jumat', '2026-07-03'),
(37, 9, 'Workout 25 menit', '17:20', 'Belum selesai', 'Olahraga', 200, 'Ingat untuk olahragaa!', 'Jumat', '2026-07-03'),
(38, 9, 'Makan Malam tanpa nasi', '18:30', 'Belum selesai', 'Makanan', 80, 'Dinner time!', 'Jumat', '2026-07-03'),
(39, 9, 'Istirahat dan segera tidur', '21:00', 'Belum selesai', 'Lifestyle', 0, 'Ingat untuk beristirahat dan jangan begadang', 'Jumat', '2026-07-03'),
(47, 9, 'Sarapan Cereal', '06:00', 'Belum selesai', 'Sarapan', 100, 'Sarapan Pagi Itu Penting', 'Kamis', '2026-07-09'),
(48, 9, 'Jalan Pagi 10 menit', '06:20', 'Belum selesai', 'Olahraga', 0, 'Jalan-jalan yukk', 'Kamis', '2026-07-09'),
(49, 9, 'Snack pagi! Makan buah apel dan jangan lupa air lemon!', '09:00', 'Belum selesai', 'Makanan', 20, 'Snack pagii, untuk menyegarkan badan!', 'Kamis', '2026-07-09'),
(50, 9, 'Makan Siang! sayur dan lele rebus', '12:00', 'Belum selesai', 'Makanan', 100, 'Jangan sampai terlambat makan siang!', 'Kamis', '2026-07-09'),
(51, 9, 'jalan sore 30 menit', '16:30', 'Belum selesai', 'Olahraga', 100, 'Jalan sore untuk menyegarkan pikiran! ', 'Kamis', '2026-07-09'),
(52, 9, 'Makan Malam tanpa nasi', '18:00', 'Belum selesai', 'Makanan', 50, 'Jangan sampai terlambat makan malam', 'Kamis', '2026-07-09'),
(53, 9, 'Istirahat dan tidur', '21:00', 'Belum selesai', 'Lifestyle', 0, 'Ingat untuk beristirahat dan tidur cukup', 'Kamis', '2026-07-09'),
(54, 9, 'Sarapan', '06:00', 'Selesai', '', 0, 'sarapann', 'Selasa', '2026-06-30'),
(55, 9, 'Minum air putih 2 gelas', '06:00', 'Selesai', 'Hidrasi', 0, 'Ingat minum air setiap 2 jam', 'Senin', '2026-02-02'),
(56, 9, 'Stretching pagi', '06:30', 'Belum selesai', 'Olahraga', 0, 'Lakukan stretching selama 10 menit', 'Senin', '2026-02-02'),
(57, 9, 'Sarapan oatmeal dan pisang', '07:00', 'Selesai', 'Makanan', 300, 'Sarapan sehat untuk memulai hari', 'Senin', '2026-02-02'),
(58, 9, 'Snack almond dan yogurt', '10:00', 'Belum selesai', 'Snack', 200, 'Snack sehat untuk menjaga energi', 'Senin', '2026-02-02'),
(59, 9, 'Makan siang ayam rebus dan sayur', '12:00', 'Selesai', 'Makanan', 500, 'Makan siang sehat untuk menjaga energi', 'Senin', '2026-02-02'),
(60, 9, 'Jalan kaki 15 menit', '15:00', 'Belum selesai', 'Aktivitas', 100, 'Lakukan aktivitas fisik setiap hari', 'Senin', '2026-02-02'),
(61, 9, 'Workout cardio 30 menit', '17:00', 'Selesai', 'Olahraga', 0, 'Lakukan latihan kardio untuk meningkatkan kesehatan jantung', 'Senin', '2026-02-02'),
(62, 9, 'Makan malam salad dan telur', '19:00', 'Belum selesai', 'Makanan', 400, 'Makan malam sehat untuk menjaga berat badan', 'Senin', '2026-02-02'),
(63, 9, 'Tidur cukup dan hindari begadang', '21:00', 'Selesai', 'Lifestyle', 0, 'Tidur cukup untuk pemulihan tubuh', 'Senin', '2026-02-02'),
(64, 9, 'Bangun dan minum segelas air', '04:30', 'Belum selesai', 'Lifestyle', 0, 'Ingat untuk minum segeraa!', 'Sabtu', '2026-07-04'),
(65, 9, 'Jalan pagii 40 menit', '05:00', 'Belum selesai', 'Olahraga', 200, 'nikmati pagi sambil bakar kalori!', 'Sabtu', '2026-07-04'),
(66, 9, 'Sarapan ', '06:30', 'Belum selesai', 'Makanan', 100, 'mmm soto pun sedap nie!, mangkok kecil aja yah!', 'Sabtu', '2026-07-04'),
(67, 9, 'sedikit snack', '09:00', 'Belum selesai', 'Makanan', 50, 'Snack agar tetap semangatt', 'sabtu', '2026-07-04'),
(68, 9, 'Makan siang', '12:00', 'Belum selesai', 'Makanan', 150, 'Makan siang bole pakai nasi, tpi no no maruk yah', 'Sabtu', '2026-07-04'),
(69, 9, 'Senam', '17:00', 'Belum selesai', 'Olahraga', 300, 'Time to shine!, Waktunya senam bersama ibu-ibu gaul ituu!', 'Sabtu', '2026-07-04'),
(70, 9, 'Makan Malam dengan sayur bayam dan dada ayam', '18:20', 'Belum selesai', 'Makanan', 100, 'Sudah bersinar, kini saatnya sang bintang ambil piring dan makan!', 'Sabtu', '2026-07-04'),
(71, 9, 'Jalan Malam ', '20:00', 'Belum selesai', 'Lifestyle', 0, 'Saatnya jalan dengan sayang kamu dan bakar habis kalori mu!', 'Sabtu', '2026-07-04'),
(72, 9, 'Tidur', '22:00', 'Belum selesai', 'Lifestyle', 0, 'Saatnya tidurr, ini sudah malamm!', 'Sabtu', '2026-07-04'),
(79, 9, 'Yoga', '05:30', 'Selesai', 'Olahraga', 30, 'Saatnya olahraga dan nikmati hidup', 'Minggu', '2026-07-05'),
(80, 9, 'makan fitbar ', '09:00', 'Selesai', 'makanan', 40, 'Snack timee!', 'Minggu', '2026-07-05'),
(81, 9, 'Makan siang!', '12:00', 'Selesai', 'Makanan', 100, 'Ingat untuk makan, tapi tidak berlebihan!', 'Minggu', '2026-07-05'),
(82, 9, 'Jalan Sore', '16:00', 'Belum selesai', 'Olahraga', 100, 'Waktunya untuk berjalan dan berprogress!', 'Minggu', '2026-07-05'),
(83, 9, 'Istirahat dan tidur', '21:00', 'Belum selesai', 'Lifestyle', 0, 'Tidurlah, kamu sudah bekerja keras untuk hari ini!', 'Minggu', '2026-07-05'),
(86, 9, 'Bangun', '05:00', 'Selesai', 'Lifestyle', 0, 'Wake up and get a drink!', 'Rabu', '2026-02-04'),
(87, 9, 'Jalan Pagi 20 menit', '05:30', 'Selesai', 'Olahraga', 200, 'get a walk!', 'Rabu', '2026-02-04'),
(88, 9, 'Sarapan cereal', '06:00', 'Selesai', 'Makanan', 100, 'selamat makan!', 'Rabu', '2026-02-04'),
(89, 9, 'makan buah-buahan dan sedikit makanan ringan', '09:00', 'Selesai', 'Makanan', 80, 'Istirahat dulu, kita makan camilan!', 'Rabu', '2026-02-04'),
(90, 9, 'Lunch dengan pecel atau salad', '12:00', 'Selesai', 'Makanan', 200, 'waktunya makan sianng!\r\npecel atau salad akan menjadi pilihan yang enak!', 'Rabu', '2026-02-04'),
(91, 9, 'berjalan 15 menit ', '17:00', 'Selesai', 'Olahraga', 100, 'Jalan-jalan sore ^^', 'Rabu', '2026-02-04'),
(92, 9, 'Makan Malam dengan sayur dan protein', '18:00', 'Selesai', 'Makanan', 100, 'Ingat untuk makan malam dan segera istirahat!', 'Rabu', '2026-02-04'),
(93, 9, 'Meditasi dan segera tidurr', '21:00', 'Selesai', 'Lifestyle', 0, 'waktu ideal untuk tidur!', 'Rabu', '2026-02-04'),
(94, 9, 'Minum lemon water', '06:00', 'Belum selesai', 'Hidrasi', 0, 'Minum lemon water untuk hidrasi optimal', 'Selasa', '2026-07-07'),
(95, 9, 'Yoga pagi 20 menit', '06:30', 'Belum selesai', 'Olahraga', 0, 'Lakukan yoga pagi untuk meningkatkan fleksibilitas', 'Selasa', '2026-07-07'),
(96, 9, 'Roti gandum dan telur rebus', '07:00', 'Belum selesai', 'Makanan', 350, 'Sarapan sehat untuk memulai hari', 'Selasa', '2026-07-07'),
(97, 9, 'Buah apel dan almond', '10:00', 'Belum selesai', 'Snack', 150, 'Snack sehat untuk menjaga energi', 'Selasa', '2026-07-07'),
(98, 9, 'Ikan panggang dan nasi merah', '12:00', 'Belum selesai', 'Makanan', 450, 'Makan siang sehat untuk menjaga energi', 'Selasa', '2026-07-07'),
(99, 9, '\nJalan cepat 30 menit', '15:00', 'Belum selesai', 'Aktivitas', 150, 'Lakukan aktivitas fisik setiap hari', 'Selasa', '2026-07-07'),
(100, 9, 'Workout lower body', '17:00', 'Belum selesai', 'Olahraga', 0, 'Lakukan latihan otot tungkai', 'Selasa', '2026-07-07'),
(101, 9, 'Sup sayur dan dada ayam', '19:00', 'Belum selesai', 'Makanan', 300, 'Jangan lupa makan malam sehat untuk menjaga berat badan', 'Selasa', '2026-07-07'),
(102, 9, 'Meditasi dan tidur cukup', '21:00', 'Belum selesai', 'Lifestyle', 0, 'Lakukan meditasi untuk mengurangi stres', 'Selasa', '2026-07-07'),
(103, 9, 'Bangun', '05:00', 'Selesai', 'Lifestyle', 0, 'Wake up and get a drink!', 'Rabu', '2026-07-08'),
(104, 9, 'Jalan Pagi 20 menit', '05:30', 'Selesai', 'Olahraga', 200, 'get a walk!', 'Rabu', '2026-07-08'),
(105, 9, 'Sarapan cereal', '06:00', 'Selesai', 'Makanan', 100, 'selamat makan!', 'Rabu', '2026-07-08'),
(106, 9, 'makan buah-buahan dan sedikit makanan ringan', '09:00', 'Selesai', 'Makanan', 80, 'Istirahat dulu, kita makan camilan!', 'Rabu', '2026-07-08'),
(107, 9, 'Lunch dengan pecel atau salad', '12:00', 'Selesai', 'Makanan', 200, 'waktunya makan sianng!\r\npecel atau salad akan menjadi pilihan yang enak!', 'Rabu', '2026-07-08'),
(108, 9, 'berjalan 15 menit ', '17:00', 'Selesai', 'Olahraga', 100, 'Jalan-jalan sore ^^', 'Rabu', '2026-07-08'),
(109, 9, 'Makan Malam dengan sayur dan protein', '18:00', 'Selesai', 'Makanan', 100, 'Ingat untuk makan malam dan segera istirahat!', 'Rabu', '2026-07-08'),
(110, 9, 'Meditasi dan segera tidurr', '21:00', 'Selesai', 'Lifestyle', 0, 'waktu ideal untuk tidur!', 'Rabu', '2026-07-08'),
(118, 9, 'Bersepeda', '05:03', 'Belum Selesai', '', 0, 'Sepedaan pagi yuks!', 'Kamis', '2026-07-09'),
(119, 9, 'cobain', '22:49', 'Selesai', '', 0, 'cobaa\n', 'Rabu', '2026-07-08'),
(120, 9, 'nyoba lagi', '22:52', 'Belum Selesai', '', 0, 'cobaa\n', 'Rabu', '2026-07-08'),
(121, 9, 'Yoga', '05:30', 'Selesai', 'Olahraga', 30, 'Saatnya olahraga dan nikmati hidup', 'Minggu', '2026-07-12'),
(122, 9, 'makan fitbar ', '09:00', 'Selesai', 'makanan', 40, 'Snack timee!', 'Minggu', '2026-07-12'),
(123, 9, 'Makan siang!', '12:00', 'Selesai', 'Makanan', 100, 'Ingat untuk makan, tapi tidak berlebihan!', 'Minggu', '2026-07-12'),
(124, 9, 'Jalan Sore', '16:00', 'Selesai', 'Olahraga', 100, 'Waktunya untuk berjalan dan berprogress!', 'Minggu', '2026-07-12'),
(125, 9, 'Istirahat dan tidur', '21:00', 'Selesai', 'Lifestyle', 0, 'Tidurlah, kamu sudah bekerja keras untuk hari ini!', 'Minggu', '2026-07-12'),
(128, 9, 'Bersepeda', '22:00', 'Selesai', '', 0, 'sepedaan malam', 'Minggu', '2026-07-12'),
(129, 9, 'cobain', '23:09', 'Selesai', '', 0, '-', 'Minggu', '2026-07-12'),
(130, 9, '-', '23:11', 'Selesai', '', 0, '', 'Minggu', '2026-07-12'),
(131, 9, 'coba', '23:33', 'Selesai', '', 0, 'hehe', 'Minggu', '2026-07-12'),
(132, 9, '-', '23:34', 'Selesai', '', 0, '', 'Minggu', '2026-07-12'),
(133, 9, 'bbb', '23:40', 'Selesai', '', 0, '', 'Minggu', '2026-07-12'),
(134, 9, 'Sarapan', '23:42', 'Selesai', '', 0, '', 'Minggu', '2026-07-12'),
(135, 9, 'hh', '23:44', 'Selesai', '', 0, 'h', 'Minggu', '2026-07-12'),
(136, 9, 'sss', '23:47', 'Selesai', '', 0, 'aa', 'Minggu', '2026-07-12'),
(137, 9, '', '23:49', 'Selesai', '', 0, '', 'Minggu', '2026-07-12'),
(138, 9, 'cobain', '20:11', 'Selesai', '', 0, 'dfdf', 'Senin', '2026-07-13'),
(139, 9, 'Jogging', '22:18', 'Selesai', '', 0, 'ccc', 'Senin', '2026-07-13'),
(140, 14, 'Minum lemon water', '06:00', 'Belum selesai', 'Hidrasi', 0, 'Minum lemon water untuk hidrasi optimal', 'Selasa', '2026-07-14'),
(141, 14, 'Yoga pagi 20 menit', '06:30', 'Belum selesai', 'Olahraga', 0, 'Lakukan yoga pagi untuk meningkatkan fleksibilitas', 'Selasa', '2026-07-14'),
(142, 14, 'Roti gandum dan telur rebus', '07:00', 'Belum selesai', 'Makanan', 350, 'Sarapan sehat untuk memulai hari', 'Selasa', '2026-07-14'),
(143, 14, 'Buah apel dan almond', '10:00', 'Belum selesai', 'Snack', 150, 'Snack sehat untuk menjaga energi', 'Selasa', '2026-07-14'),
(144, 14, 'Ikan panggang dan nasi merah', '12:00', 'Belum selesai', 'Makanan', 450, 'Makan siang sehat untuk menjaga energi', 'Selasa', '2026-07-14'),
(145, 14, '\nJalan cepat 30 menit', '15:00', 'Belum selesai', 'Aktivitas', 150, 'Lakukan aktivitas fisik setiap hari', 'Selasa', '2026-07-14'),
(146, 14, 'Workout lower body', '17:00', 'Belum selesai', 'Olahraga', 0, 'Lakukan latihan otot tungkai', 'Selasa', '2026-07-14'),
(147, 14, 'Sup sayur dan dada ayam', '19:00', 'Belum selesai', 'Makanan', 300, 'Jangan lupa makan malam sehat untuk menjaga berat badan', 'Selasa', '2026-07-14'),
(148, 14, 'Meditasi dan tidur cukup', '21:00', 'Belum selesai', 'Lifestyle', 0, 'Lakukan meditasi untuk mengurangi stres', 'Selasa', '2026-07-14'),
(155, 14, 'Yoga', '06:21', 'Belum Selesai', '', 0, 'Yoga dikit2', 'Selasa', '2026-07-14');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_bulanan`
--

CREATE TABLE `jadwal_bulanan` (
  `id` int(11) NOT NULL,
  `hari_ke` int(11) DEFAULT NULL,
  `jam` varchar(255) DEFAULT NULL,
  `kegiatan` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `kalori` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_bulanan`
--

INSERT INTO `jadwal_bulanan` (`id`, `hari_ke`, `jam`, `kegiatan`, `kategori`, `kalori`) VALUES
(1, 1, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(2, 1, '07:00', 'Oatmeal pisang dan madu', 'Makanan', 350),
(3, 1, '12:00', 'Ayam rebus, nasi merah, dan brokoli', 'Makanan', 500),
(4, 1, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(5, 1, '17:00', 'Stretching dan core workout', 'Olahraga', 0),
(6, 1, '19:00', 'Salad sayur dan telur', 'Makanan', 300),
(7, 2, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(8, 2, '07:00', 'Roti gandum dan telur rebus', 'Makanan', 320),
(9, 2, '12:00', 'Ayam rebus, nasi merah, dan brokoli', 'Makanan', 500),
(10, 2, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(11, 2, '17:00', 'Yoga 20 menit', 'Olahraga', 0),
(12, 2, '19:00', 'Salad sayur dan telur', 'Makanan', 300),
(13, 3, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(14, 3, '07:00', 'Oatmeal pisang dan madu', 'Makanan', 350),
(15, 3, '12:00', 'Ikan panggang dan sayur kukus', 'Makanan', 450),
(16, 3, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(17, 3, '17:00', 'Stretching dan core workout', 'Olahraga', 0),
(18, 3, '19:00', 'Dada ayam dan brokoli', 'Makanan', 350),
(19, 4, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(20, 4, '07:00', 'Smoothie buah rendah gula', 'Makanan', 300),
(21, 4, '12:00', 'Ayam rebus, nasi merah, dan brokoli', 'Makanan', 500),
(22, 4, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(23, 4, '17:00', 'Jogging 20 menit', 'Olahraga', 0),
(24, 4, '19:00', 'Salad sayur dan telur', 'Makanan', 300),
(25, 5, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(26, 5, '07:00', 'Oatmeal pisang dan madu', 'Makanan', 350),
(27, 5, '12:00', 'Ayam rebus, nasi merah, dan brokoli', 'Makanan', 500),
(28, 5, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(29, 5, '17:00', 'Cardio 30 menit', 'Olahraga', 0),
(30, 5, '19:00', 'Tahu kukus dan sayur bening', 'Makanan', 260),
(31, 6, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(32, 6, '07:00', 'Oatmeal pisang dan madu', 'Makanan', 350),
(33, 6, '12:00', 'Salad tuna dan telur', 'Makanan', 430),
(34, 6, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(35, 6, '17:00', 'Jogging 20 menit', 'Olahraga', 0),
(36, 6, '19:00', 'Tahu kukus dan sayur bening', 'Makanan', 260),
(37, 7, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(38, 7, '07:00', 'Roti gandum dan telur rebus', 'Makanan', 320),
(39, 7, '12:00', 'Ikan panggang dan sayur kukus', 'Makanan', 450),
(40, 7, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(41, 7, '17:00', 'Jogging 20 menit', 'Olahraga', 0),
(42, 7, '19:00', 'Salad sayur dan telur', 'Makanan', 300),
(43, 8, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(44, 8, '07:00', 'Greek yogurt dan buah berry', 'Makanan', 280),
(45, 8, '12:00', 'Tumis tahu tempe dan nasi merah', 'Makanan', 480),
(46, 8, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(47, 8, '17:00', 'Yoga 20 menit', 'Olahraga', 0),
(48, 8, '19:00', 'Dada ayam dan brokoli', 'Makanan', 350),
(49, 9, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(50, 9, '07:00', 'Greek yogurt dan buah berry', 'Makanan', 280),
(51, 9, '12:00', 'Ikan panggang dan sayur kukus', 'Makanan', 450),
(52, 9, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(53, 9, '17:00', 'Stretching dan core workout', 'Olahraga', 0),
(54, 9, '19:00', 'Sup ayam rendah kalori', 'Makanan', 280),
(55, 10, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(56, 10, '07:00', 'Oatmeal pisang dan madu', 'Makanan', 350),
(57, 10, '12:00', 'Dada ayam panggang dan kentang rebus', 'Makanan', 520),
(58, 10, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(59, 10, '17:00', 'Jogging 20 menit', 'Olahraga', 0),
(60, 10, '19:00', 'Salad sayur dan telur', 'Makanan', 300),
(61, 11, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(62, 11, '07:00', 'Ubi rebus dan telur', 'Makanan', 330),
(63, 11, '12:00', 'Dada ayam panggang dan kentang rebus', 'Makanan', 520),
(64, 11, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(65, 11, '17:00', 'HIIT ringan 15 menit', 'Olahraga', 0),
(66, 11, '19:00', 'Ikan kukus dan sayuran', 'Makanan', 330),
(67, 12, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(68, 12, '07:00', 'Oatmeal pisang dan madu', 'Makanan', 350),
(69, 12, '12:00', 'Salad tuna dan telur', 'Makanan', 430),
(70, 12, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(71, 12, '17:00', 'Cardio 30 menit', 'Olahraga', 0),
(72, 12, '19:00', 'Tahu kukus dan sayur bening', 'Makanan', 260),
(73, 13, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(74, 13, '07:00', 'Smoothie buah rendah gula', 'Makanan', 300),
(75, 13, '12:00', 'Ayam rebus, nasi merah, dan brokoli', 'Makanan', 500),
(76, 13, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(77, 13, '17:00', 'Stretching dan core workout', 'Olahraga', 0),
(78, 13, '19:00', 'Sup ayam rendah kalori', 'Makanan', 280),
(79, 14, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(80, 14, '07:00', 'Greek yogurt dan buah berry', 'Makanan', 280),
(81, 14, '12:00', 'Dada ayam panggang dan kentang rebus', 'Makanan', 520),
(82, 14, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(83, 14, '17:00', 'Jalan cepat 30 menit', 'Olahraga', 0),
(84, 14, '19:00', 'Dada ayam dan brokoli', 'Makanan', 350),
(85, 15, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(86, 15, '07:00', 'Roti gandum dan telur rebus', 'Makanan', 320),
(87, 15, '12:00', 'Ikan panggang dan sayur kukus', 'Makanan', 450),
(88, 15, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(89, 15, '17:00', 'HIIT ringan 15 menit', 'Olahraga', 0),
(90, 15, '19:00', 'Ikan kukus dan sayuran', 'Makanan', 330),
(91, 16, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(92, 16, '07:00', 'Smoothie buah rendah gula', 'Makanan', 300),
(93, 16, '12:00', 'Tumis tahu tempe dan nasi merah', 'Makanan', 480),
(94, 16, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(95, 16, '17:00', 'Yoga 20 menit', 'Olahraga', 0),
(96, 16, '19:00', 'Ikan kukus dan sayuran', 'Makanan', 330),
(97, 17, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(98, 17, '07:00', 'Ubi rebus dan telur', 'Makanan', 330),
(99, 17, '12:00', 'Dada ayam panggang dan kentang rebus', 'Makanan', 520),
(100, 17, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(101, 17, '17:00', 'Cardio 30 menit', 'Olahraga', 0),
(102, 17, '19:00', 'Ikan kukus dan sayuran', 'Makanan', 330),
(103, 18, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(104, 18, '07:00', 'Oatmeal pisang dan madu', 'Makanan', 350),
(105, 18, '12:00', 'Salad tuna dan telur', 'Makanan', 430),
(106, 18, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(107, 18, '17:00', 'Jogging 20 menit', 'Olahraga', 0),
(108, 18, '19:00', 'Salad sayur dan telur', 'Makanan', 300),
(109, 19, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(110, 19, '07:00', 'Ubi rebus dan telur', 'Makanan', 330),
(111, 19, '12:00', 'Tumis tahu tempe dan nasi merah', 'Makanan', 480),
(112, 19, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(113, 19, '17:00', 'Jalan cepat 30 menit', 'Olahraga', 0),
(114, 19, '19:00', 'Salad sayur dan telur', 'Makanan', 300),
(115, 20, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(116, 20, '07:00', 'Ubi rebus dan telur', 'Makanan', 330),
(117, 20, '12:00', 'Ayam rebus, nasi merah, dan brokoli', 'Makanan', 500),
(118, 20, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(119, 20, '17:00', 'Workout full body', 'Olahraga', 0),
(120, 20, '19:00', 'Tahu kukus dan sayur bening', 'Makanan', 260),
(121, 21, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(122, 21, '07:00', 'Ubi rebus dan telur', 'Makanan', 330),
(123, 21, '12:00', 'Ayam rebus, nasi merah, dan brokoli', 'Makanan', 500),
(124, 21, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(125, 21, '17:00', 'Yoga 20 menit', 'Olahraga', 0),
(126, 21, '19:00', 'Ikan kukus dan sayuran', 'Makanan', 330),
(127, 22, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(128, 22, '07:00', 'Ubi rebus dan telur', 'Makanan', 330),
(129, 22, '12:00', 'Tumis tahu tempe dan nasi merah', 'Makanan', 480),
(130, 22, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(131, 22, '17:00', 'Jogging 20 menit', 'Olahraga', 0),
(132, 22, '19:00', 'Ikan kukus dan sayuran', 'Makanan', 330),
(133, 23, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(134, 23, '07:00', 'Oatmeal pisang dan madu', 'Makanan', 350),
(135, 23, '12:00', 'Ayam rebus, nasi merah, dan brokoli', 'Makanan', 500),
(136, 23, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(137, 23, '17:00', 'Cardio 30 menit', 'Olahraga', 0),
(138, 23, '19:00', 'Dada ayam dan brokoli', 'Makanan', 350),
(139, 24, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(140, 24, '07:00', 'Oatmeal pisang dan madu', 'Makanan', 350),
(141, 24, '12:00', 'Tumis tahu tempe dan nasi merah', 'Makanan', 480),
(142, 24, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(143, 24, '17:00', 'Jogging 20 menit', 'Olahraga', 0),
(144, 24, '19:00', 'Ikan kukus dan sayuran', 'Makanan', 330),
(145, 25, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(146, 25, '07:00', 'Greek yogurt dan buah berry', 'Makanan', 280),
(147, 25, '12:00', 'Ayam rebus, nasi merah, dan brokoli', 'Makanan', 500),
(148, 25, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(149, 25, '17:00', 'Cardio 30 menit', 'Olahraga', 0),
(150, 25, '19:00', 'Tahu kukus dan sayur bening', 'Makanan', 260),
(151, 26, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(152, 26, '07:00', 'Oatmeal pisang dan madu', 'Makanan', 350),
(153, 26, '12:00', 'Tumis tahu tempe dan nasi merah', 'Makanan', 480),
(154, 26, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(155, 26, '17:00', 'Jogging 20 menit', 'Olahraga', 0),
(156, 26, '19:00', 'Ikan kukus dan sayuran', 'Makanan', 330),
(157, 27, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(158, 27, '07:00', 'Smoothie buah rendah gula', 'Makanan', 300),
(159, 27, '12:00', 'Dada ayam panggang dan kentang rebus', 'Makanan', 520),
(160, 27, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(161, 27, '17:00', 'Workout full body', 'Olahraga', 0),
(162, 27, '19:00', 'Ikan kukus dan sayuran', 'Makanan', 330),
(163, 28, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(164, 28, '07:00', 'Greek yogurt dan buah berry', 'Makanan', 280),
(165, 28, '12:00', 'Ikan panggang dan sayur kukus', 'Makanan', 450),
(166, 28, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(167, 28, '17:00', 'Jalan cepat 30 menit', 'Olahraga', 0),
(168, 28, '19:00', 'Salad sayur dan telur', 'Makanan', 300),
(169, 29, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(170, 29, '07:00', 'Ubi rebus dan telur', 'Makanan', 330),
(171, 29, '12:00', 'Dada ayam panggang dan kentang rebus', 'Makanan', 520),
(172, 29, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(173, 29, '17:00', 'HIIT ringan 15 menit', 'Olahraga', 0),
(174, 29, '19:00', 'Tahu kukus dan sayur bening', 'Makanan', 260),
(175, 30, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
(176, 30, '07:00', 'Greek yogurt dan buah berry', 'Makanan', 280),
(177, 30, '12:00', 'Ayam rebus, nasi merah, dan brokoli', 'Makanan', 500),
(178, 30, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
(179, 30, '17:00', 'Stretching dan core workout', 'Olahraga', 0),
(180, 30, '19:00', 'Tahu kukus dan sayur bening', 'Makanan', 260);

-- --------------------------------------------------------

--
-- Table structure for table `menu_diet`
--

CREATE TABLE `menu_diet` (
  `id` int(11) NOT NULL,
  `kategori` enum('sarapan','makan siang','camilan','makan malam') NOT NULL,
  `nama_menu` varchar(255) NOT NULL,
  `kalori` int(11) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_diet`
--

INSERT INTO `menu_diet` (`id`, `kategori`, `nama_menu`, `kalori`, `foto`) VALUES
(1, 'sarapan', 'oatmeal', 150, 'oatmeal.jpg'),
(2, 'sarapan', 'avocado', 160, 'avocado.jpg'),
(3, 'makan siang', 'nasi merah', 250, 'maksi.jpg'),
(4, 'makan siang', 'Ikan bakar', 200, 'ikan.jpg'),
(5, 'camilan', 'yogurt', 190, 'yogurt.jpg'),
(6, 'camilan', 'Mix fruit', 100, 'buah.jpg'),
(7, 'makan malam', 'Salmon panggang', 200, 'salmon.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `progress_berat`
--

CREATE TABLE `progress_berat` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `minggu_ke` int(11) DEFAULT NULL,
  `berat_badan` int(11) DEFAULT NULL,
  `catatan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `progress_berat`
--

INSERT INTO `progress_berat` (`id`, `user_id`, `minggu_ke`, `berat_badan`, `catatan`) VALUES
(1, 9, 1, 42, 'Berat awal program diet'),
(2, 9, 2, 41, 'Mulai ada progress dan badan lebih ringan'),
(3, 9, 3, 40, 'Update berat badan'),
(4, 9, 4, 50, 'Update berat badan'),
(5, 9, 5, 49, 'Update berat badan'),
(6, 9, 6, 50, 'Update berat badan'),
(7, 9, 7, 70, 'Update berat badan'),
(8, 9, 8, 40, 'Update berat badan'),
(9, 9, 9, 41, 'Update berat badan'),
(10, 9, 10, 35, 'Update berat badan'),
(11, 9, 11, 69, 'Update berat badan'),
(12, 9, 12, 35, 'Update berat badan'),
(13, 9, 13, 34, 'Update berat badan'),
(14, 9, 14, 70, 'Update berat badan'),
(15, 14, 1, 56, 'Update berat badan');

-- --------------------------------------------------------

--
-- Table structure for table `rekomendasi_jadwal`
--

CREATE TABLE `rekomendasi_jadwal` (
  `id` int(11) NOT NULL,
  `hari` varchar(255) DEFAULT NULL,
  `jam` varchar(255) DEFAULT NULL,
  `kegiatan` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `kalori` int(11) DEFAULT NULL,
  `reminder` varchar(255) DEFAULT NULL,
  `reminder_awal` varchar(255) DEFAULT NULL,
  `reminder_cek` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rekomendasi_jadwal`
--

INSERT INTO `rekomendasi_jadwal` (`id`, `hari`, `jam`, `kegiatan`, `kategori`, `kalori`, `reminder`, `reminder_awal`, `reminder_cek`) VALUES
(1, 'Senin', '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0, 'Ingat minum air setiap 2 jam', NULL, NULL),
(2, 'Senin', '06:30', 'Stretching pagi', 'Olahraga', 0, 'Lakukan stretching selama 10 menit', NULL, NULL),
(3, 'Senin', '07:00', 'Sarapan oatmeal dan pisang', 'Makanan', 300, 'Sarapan sehat untuk memulai hari', NULL, NULL),
(4, 'Senin', '10:00', 'Snack almond dan yogurt', 'Snack', 200, 'Snack sehat untuk menjaga energi', NULL, NULL),
(5, 'Senin', '12:00', 'Makan siang ayam rebus dan sayur', 'Makanan', 500, 'Makan siang sehat untuk menjaga energi', NULL, NULL),
(6, 'Senin', '15:00', 'Jalan kaki 15 menit', 'Aktivitas', 100, 'Lakukan aktivitas fisik setiap hari', NULL, NULL),
(7, 'Senin', '17:00', 'Workout cardio 30 menit', 'Olahraga', 0, 'Lakukan latihan kardio untuk meningkatkan kesehatan jantung', NULL, NULL),
(8, 'Senin', '19:00', 'Makan malam salad dan telur', 'Makanan', 400, 'Makan malam sehat untuk menjaga berat badan', NULL, NULL),
(9, 'Senin', '21:00', 'Tidur cukup dan hindari begadang', 'Lifestyle', 0, 'Tidur cukup untuk pemulihan tubuh', NULL, NULL),
(10, 'Selasa', '06:00', 'Minum lemon water', 'Hidrasi', 0, 'Minum lemon water untuk hidrasi optimal', NULL, NULL),
(11, 'Selasa', '06:30', 'Yoga pagi 20 menit', 'Olahraga', 0, 'Lakukan yoga pagi untuk meningkatkan fleksibilitas', NULL, NULL),
(12, 'Selasa', '07:00', 'Roti gandum dan telur rebus', 'Makanan', 350, 'Sarapan sehat untuk memulai hari', NULL, NULL),
(13, 'Selasa', '10:00', 'Buah apel dan almond', 'Snack', 150, 'Snack sehat untuk menjaga energi', NULL, NULL),
(14, 'Selasa', '12:00', 'Ikan panggang dan nasi merah', 'Makanan', 450, 'Makan siang sehat untuk menjaga energi', NULL, NULL),
(15, 'Selasa', '15:00', '\nJalan cepat 30 menit', 'Aktivitas', 150, 'Lakukan aktivitas fisik setiap hari', NULL, NULL),
(16, 'Selasa', '17:00', 'Workout lower body', 'Olahraga', 0, 'Lakukan latihan otot tungkai', NULL, NULL),
(17, 'Selasa', '19:00', 'Sup sayur dan dada ayam', 'Makanan', 300, 'Jangan lupa makan malam sehat untuk menjaga berat badan', NULL, NULL),
(18, 'Selasa', '21:00', 'Meditasi dan tidur cukup', 'Lifestyle', 0, 'Lakukan meditasi untuk mengurangi stres', NULL, NULL),
(19, 'Kamis', '06:00', 'Sarapan Cereal', 'Sarapan', 100, 'Sarapan Pagi Itu Penting', NULL, NULL),
(20, 'Kamis', '06:20', 'Jalan Pagi 10 menit', 'Olahraga', 0, 'Jalan-jalan yukk', NULL, NULL),
(21, 'Kamis', '09:00', 'Snack pagi! Makan buah apel dan jangan lupa air lemon!', 'Makanan', 20, 'Snack pagii, untuk menyegarkan badan!', NULL, NULL),
(22, 'Kamis', '12:00', 'Makan Siang! sayur dan lele rebus', 'Makanan', 100, 'Jangan sampai terlambat makan siang!', NULL, NULL),
(23, 'Kamis', '16:30', 'jalan sore 30 menit', 'Olahraga', 100, 'Jalan sore untuk menyegarkan pikiran! ', NULL, NULL),
(24, 'Kamis', '18:00', 'Makan Malam tanpa nasi', 'Makanan', 50, 'Jangan sampai terlambat makan malam', NULL, NULL),
(25, 'Kamis', '21:00', 'Istirahat dan tidur', 'Lifestyle', 0, 'Ingat untuk beristirahat dan tidur cukup', NULL, NULL),
(26, 'Jumat', '05:30', 'Bangun dan minum Air Putih!', 'lifestyle', 0, 'Minum Air putih segera setelah bangun', NULL, NULL),
(27, 'Jumat', '05:50', 'Jalan pagi 15 menit', 'Olahraga', 100, 'Olahraga pagi bantu pikiran lebih tenang', NULL, NULL),
(28, 'Jumat', '06:30', 'Sarapan bubur dengan protein', 'Makanan', 120, 'Sarapann!', NULL, NULL),
(29, 'Jumat', '09:00', 'Snack buah-buahan', 'Makanan', 10, 'Snacktime!', NULL, NULL),
(30, 'Jumat', '12:00', 'Makan siang dengan nasi dan protein juga sayur', 'Makanan', 150, 'Nasi boleh, tapi jangan berlebihan yahh ^^', NULL, NULL),
(31, 'Jumat', '17:20', 'Workout 25 menit', 'Olahraga', 200, 'Ingat untuk olahragaa!', NULL, NULL),
(32, 'Jumat', '18:30', 'Makan Malam tanpa nasi', 'Makanan', 80, 'Dinner time!', NULL, NULL),
(33, 'Jumat', '21:00', 'Istirahat dan segera tidur', 'Lifestyle', 0, 'Ingat untuk beristirahat dan jangan begadang', NULL, NULL),
(34, 'Sabtu', '04:30', 'Bangun dan minum segelas air', 'Lifestyle', 0, 'Ingat untuk minum segeraa!', NULL, NULL),
(35, 'Sabtu', '05:00', 'Jalan pagii 40 menit', 'Olahraga', 200, 'nikmati pagi sambil bakar kalori!', NULL, NULL),
(36, 'Sabtu', '06:30', 'Sarapan ', 'Makanan', 100, 'mmm soto pun sedap nie!, mangkok kecil aja yah!', NULL, NULL),
(37, 'sabtu', '09:00', 'sedikit snack', 'Makanan', 50, 'Snack agar tetap semangatt', NULL, NULL),
(38, 'Sabtu', '12:00', 'Makan siang', 'Makanan', 150, 'Makan siang bole pakai nasi, tpi no no maruk yah', NULL, NULL),
(39, 'Sabtu', '17:00', 'Senam', 'Olahraga', 300, 'Time to shine!, Waktunya senam bersama ibu-ibu gaul ituu!', NULL, NULL),
(40, 'Sabtu', '18:20', 'Makan Malam dengan sayur bayam dan dada ayam', 'Makanan', 100, 'Sudah bersinar, kini saatnya sang bintang ambil piring dan makan!', NULL, NULL),
(41, 'Sabtu', '20:00', 'Jalan Malam ', 'Lifestyle', 0, 'Saatnya jalan dengan sayang kamu dan bakar habis kalori mu!', NULL, NULL),
(42, 'Sabtu', '22:00', 'Tidur', 'Lifestyle', 0, 'Saatnya tidurr, ini sudah malamm!', NULL, NULL),
(43, 'Minggu', '05:30', 'Yoga', 'Olahraga', 30, 'Saatnya olahraga dan nikmati hidup', NULL, NULL),
(44, 'Minggu', '09:00', 'makan fitbar ', 'makanan', 40, 'Snack timee!', NULL, NULL),
(46, 'Minggu', '12:00', 'Makan siang!', 'Makanan', 100, 'Ingat untuk makan, tapi tidak berlebihan!', NULL, NULL),
(47, 'Minggu', '16:00', 'Jalan Sore', 'Olahraga', 100, 'Waktunya untuk berjalan dan berprogress!', NULL, NULL),
(49, 'Minggu', '21:00', 'Istirahat dan tidur', 'Lifestyle', 0, 'Tidurlah, kamu sudah bekerja keras untuk hari ini!', NULL, NULL),
(50, 'Rabu', '05:00', 'Bangun', 'Lifestyle', 0, 'Wake up and get a drink!', NULL, NULL),
(52, 'Rabu', '05:30', 'Jalan Pagi 20 menit', 'Olahraga', 200, 'get a walk!', NULL, NULL),
(53, 'Rabu', '06:00', 'Sarapan cereal', 'Makanan', 100, 'selamat makan!', NULL, NULL),
(54, 'Rabu', '09:00', 'makan buah-buahan dan sedikit makanan ringan', 'Makanan', 80, 'Istirahat dulu, kita makan camilan!', NULL, NULL),
(55, 'Rabu', '12:00', 'Lunch dengan pecel atau salad', 'Makanan', 200, 'waktunya makan sianng!\r\npecel atau salad akan menjadi pilihan yang enak!', NULL, NULL),
(56, 'Rabu', '17:00', 'berjalan 15 menit ', 'Olahraga', 100, 'Jalan-jalan sore ^^', NULL, NULL),
(57, 'Rabu', '18:00', 'Makan Malam dengan sayur dan protein', 'Makanan', 100, 'Ingat untuk makan malam dan segera istirahat!', NULL, NULL),
(58, 'Rabu', '21:00', 'Meditasi dan segera tidurr', 'Lifestyle', 0, 'waktu ideal untuk tidur!', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `target_diet`
--

CREATE TABLE `target_diet` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `target_kg` int(11) DEFAULT NULL,
  `target_kalori` int(11) DEFAULT NULL,
  `rekomendasi` varchar(255) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_target` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `target_diet`
--

INSERT INTO `target_diet` (`id`, `user_id`, `target_kg`, `target_kalori`, `rekomendasi`, `tanggal_mulai`, `tanggal_target`) VALUES
(1, 9, 45, 0, 'Kurangi makanan manis', '2026-05-13', '2026-07-31'),
(4, 14, 50, NULL, NULL, '2026-04-01', '2026-08-31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `berat_badan` int(11) DEFAULT NULL,
  `tinggi_badan` int(11) DEFAULT NULL,
  `foto_profil` varchar(255) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `bb_ideal` int(11) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `berat_badan`, `tinggi_badan`, `foto_profil`, `jenis_kelamin`, `bb_ideal`, `umur`) VALUES
(6, 'Rina', 'rina@gmail.com', '$2b$10$lMJClE600gmisnYeo5G09uA00ocJcA46g/bFSucNPeibk5VCw.40K', 80, 160, '', 'Laki-Laki', NULL, NULL),
(7, 'Rina', 'rina@gmail.com', '$2b$10$lMJClE600gmisnYeo5G09uA00ocJcA46g/bFSucNPeibk5VCw.40K', NULL, NULL, '', 'Laki-Laki', NULL, NULL),
(9, 'halenaaa', 'halenaazaliamirabelfirdiyanto@gmail.com', '$2b$10$0nzMWEJcKuevaTmMOpz47eX56VtUgS1FndeeyMFbW5d7ZngeybU/y', 87, 155, '1783185458913.jpg', 'Perempuan', 47, 18),
(14, 'huruhara', 'huruhara@gmail.com', '$2b$10$JzfEBL8B9Ye7A8WnchMVd.3NvTA.QKxb0ANfmYQC7flL6J/1EV8c2', 60, 170, '1783963261228.jpeg', 'Laki-Laki', 63, 19);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daily_tracker`
--
ALTER TABLE `daily_tracker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tracker_user` (`user_id`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jadwal_user` (`user_id`);

--
-- Indexes for table `jadwal_bulanan`
--
ALTER TABLE `jadwal_bulanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_diet`
--
ALTER TABLE `menu_diet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `progress_berat`
--
ALTER TABLE `progress_berat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_progress_user` (`user_id`);

--
-- Indexes for table `rekomendasi_jadwal`
--
ALTER TABLE `rekomendasi_jadwal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `target_diet`
--
ALTER TABLE `target_diet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_target_user` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daily_tracker`
--
ALTER TABLE `daily_tracker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `jadwal_bulanan`
--
ALTER TABLE `jadwal_bulanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `menu_diet`
--
ALTER TABLE `menu_diet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `progress_berat`
--
ALTER TABLE `progress_berat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `rekomendasi_jadwal`
--
ALTER TABLE `rekomendasi_jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `target_diet`
--
ALTER TABLE `target_diet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daily_tracker`
--
ALTER TABLE `daily_tracker`
  ADD CONSTRAINT `fk_tracker_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `fk_jadwal_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `progress_berat`
--
ALTER TABLE `progress_berat`
  ADD CONSTRAINT `fk_progress_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `target_diet`
--
ALTER TABLE `target_diet`
  ADD CONSTRAINT `fk_target_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
