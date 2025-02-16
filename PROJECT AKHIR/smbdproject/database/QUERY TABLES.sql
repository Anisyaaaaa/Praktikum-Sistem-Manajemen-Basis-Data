CREATE DATABASE smbdproject;

USE smbdproject;

CREATE TABLE about_us (
  id_about int NOT NULL PRIMARY KEY auto_increment,
  judul text NOT NULL,
  isi text NOT NULL,
  tanggal date NOT NULL
);

INSERT INTO about_us VALUES 
(1, 'About Us', "Selamat Datang di RailTicket! Pesan Tiket Kereta Anda dengan Mudah dan Cepat! Kami adalah platform pemesanan tiket kereta yang memberikan kemudahan, kecepatan, dan keamanan dalam setiap transaksi Anda. Dengan sistem kami yang canggih dan tim yang berdedikasi, kami memastikan bahwa setiap langkah dalam proses pemesanan tiket berjalan lancar dan efisien. Kami berusaha untuk selalu memberikan yang terbaik untuk memastikan kepuasan dan kenyamanan pelanggan kami.", '2024-06-04'),
(2, "Visi", "Menjadi platform pemesanan tiket kereta api terdepan yang memberikan kemudahan, kenyamanan, dan pengalaman terbaik bagi setiap penumpang di Indonesia.", "2024-06-12");

CREATE TABLE admin (
  id int auto_increment NOT NULL primary key,
  username varchar(30) NOT NULL,
  password varchar(10) NOT NULL
);

INSERT INTO admin (id, username, password) VALUES
(1, 'sukma', '123'),
(2, 'anisa', '123'),
(3, 'admin', '123');

CREATE TABLE kereta (
  id_kereta int NOT NULL PRIMARY KEY auto_increment,
  nama_kereta varchar(400) NOT NULL,
  kelas varchar(50) NOT NULL,
  tanggal date NOT NULL,
  jam_berangkat varchar(5) NOT NULL,
  jam_tiba varchar(5) NOT NULL,
  tarif decimal(22,2) NOT NULL,
  status varchar(200) NOT NULL
);

INSERT INTO kereta (nama_kereta, kelas, tanggal, jam_berangkat, jam_tiba, tarif, status) 
VALUES 
('Argo Bromo Anggrek', 'Eksekutif', '2024-06-20', '08:00', '14:00', 250000.00, 'Tersedia'),
('Gajayana', 'Ekonomi', '2024-06-21', '09:30', '15:45', 150000.00, 'Tersedia'),
('Matarmaja', 'Bisnis', '2024-06-22', '07:45', '12:30', 180000.00, 'Tersedia'),
('Mutiara Selatan', 'Eksekutif', '2024-06-23', '11:15', '17:20', 280000.00, 'Tersedia'),
('Jayabaya', 'Bisnis', '2024-06-24', '13:00', '19:30', 200000.00, 'Tersedia');


CREATE TABLE asal_kereta (
  id_asal int(11) NOT NULL,
  asal_kereta text NOT NULL,
  id_kereta int(11) NOT NULL,
  foreign key (id_kereta) references kereta (id_kereta)
);

INSERT INTO asal_kereta (id_asal, asal_kereta, id_kereta) 
VALUES 
(1, 'Stasiun Gambir', 1),
(2, 'Stasiun Bandung', 2),
(3, 'Stasiun Surabaya', 3),
(4, 'Stasiun Jakarta Kota', 4),
(5, 'Stasiun Malang', 5);

CREATE TABLE tujuan (
  id_asal int(11) NOT NULL,
  tujuan text NOT NULL,
  id_kereta int(11) NOT NULL,
  foreign key (id_kereta) references kereta (id_kereta)
);

INSERT INTO tujuan (id_tujuan, tujuan, id_kereta) 
VALUES 
(1, 'Stasiun Surabaya Gubeng', 1),
(2, 'Stasiun Semarang Tawang', 2),
(3, 'Stasiun Yogyakarta Tugu', 3),
(4, 'Stasiun Solo Balapan', 4),
(5, 'Stasiun Malang Kota Lama', 5);

CREATE TABLE gerbong (
  id_gerbong int NOT NULL PRIMARY KEY auto_increment,
  gerbong varchar(2) NOT NULL,
  id_kereta int(11) NOT NULL,
  foreign key (id_kereta) references kereta (id_kereta)
);

INSERT INTO gerbong (gerbong, id_kereta) 
VALUES 
('A', 1),
('B', 2),
('C', 3),
('D', 4),
('E', 5);

-- CREATE TABLE kursi (
--   id_kursi int NOT NULL PRIMARY KEY auto_increment,
--   posisi_kursi varchar(4) NOT NULL,
--   status varchar(8) NOT NULL,
--   kode_booking varchar(10) DEFAULT NULL,
--   id_gerbong int(11) NOT NULL,
--   id_pelanggan int(11) DEFAULT NULL,
--   foreign key (id_gerbong) references gerbong (id_gerbong)
-- );

-- INSERT INTO kursi (posisi_kursi, status, kode_booking, id_gerbong) 
-- VALUES 
-- ('A1', 'Tersedia', NULL, 1),
-- ('B2', 'Tersedia', NULL, 2),
-- ('C3', 'Tersedia', NULL, 3),
-- ('D4', 'Tersedia', NULL, 4),
-- ('E5', 'Tersedia', NULL, 5);

CREATE TABLE pelanggan (
  id_pelanggan int NOT NULL PRIMARY KEY auto_increment,
  id_kereta int(11) NOT NULL,
  no_ktp varchar(25) NOT NULL,
  nama varchar(100) NOT NULL,
  telepon varchar(20) NOT NULL,
  email varchar(90) NOT NULL,
  total_pembayaran decimal(22,2) DEFAULT NULL,
  tgl_pemesanan date DEFAULT NULL,
  FOREIGN KEY (id_kereta) REFERENCES kereta (id_kereta)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO pelanggan (no_ktp, nama, telepon, email, total_pembayaran, tgl_pemesanan, id_kereta) 
VALUES 
('1234567890', 'Ahmad', '08123456789', 'ahmad@example.com', 250000.00, '2024-06-09', 1),
('0987654321', 'Budi', '08567890123', 'budi@example.com', 150000.00, '2024-06-10', 1),
('2345678901', 'Citra', '08901234567', 'citra@example.com', 180000.00, '2024-06-11', 1),
('3456789012', 'Dewi', '08123456789', 'dewi@example.com', 280000.00, '2024-06-08', 2),
('4567890123', 'Eka', '08765432109', 'eka@example.com', 200000.00, '2024-06-07', 3);

