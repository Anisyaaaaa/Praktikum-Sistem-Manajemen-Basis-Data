CREATE DATABASE SewaMobil;

USE SewaMobil;

CREATE TABLE Pelanggan (
	ID_Pelanggan INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
    Nama VARCHAR(100),
    Alamat TEXT,
    No_Telepon VARCHAR(15),
    Email VARCHAR(50)
);

INSERT INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_Telepon, Email) VALUES
(1, 'Zainal Abidin', 'Jl. Merpati No. 21, Jakarta', '081234567890', 'zainal.abidin@example.com'),
(2, 'Nadia Permata', 'Jl. Cendrawasih No. 12, Bandung', '081234567891', 'nadia.permata@example.com'),
(3, 'Reza Aulia', 'Jl. Rajawali No. 34, Surabaya', '081234567892', 'reza.aulia@example.com'),
(4, 'Siti Rahmawati', 'Jl. Kutilang No. 56, Medan', '081234567893', 'siti.rahmawati@example.com'),
(5, 'Akbar Junaidi', 'Jl. Elang No. 78, Semarang', '081234567894', 'akbar.junaidi@example.com'),
(6, 'Fikri Hakim', 'Jl. Kenari No. 90, Yogyakarta', '081234567895', 'fikri.hakim@example.com'),
(7, 'Rina Kusuma', 'Jl. Merak No. 43, Malang', '081234567896', 'rina.kusuma@example.com'),
(8, 'Galih Saputra', 'Jl. Jalak No. 25, Makassar', '081234567897', 'galih.saputra@example.com'),
(9, 'Lia Puspita', 'Jl. Kakatua No. 67, Balikpapan', '081234567898', 'lia.puspita@example.com'),
(10, 'Farhan Nugraha', 'Jl. Kepodang No. 89, Palembang', '081234567899', 'farhan.nugraha@example.com');


CREATE TABLE Pegawai (
	ID_Pegawai INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Nama VARCHAR(100),
    Jabatan VARCHAR(50),
    No_Telepon VARCHAR(15),
    Email VARCHAR(50)
);

INSERT INTO Pegawai (ID_Pegawai, Nama, Jabatan, No_Telepon, Email) VALUES
(1, 'Firdaus Alam', 'Manager', '081234567801', 'firdaus.alam@example.com'),
(2, 'Rifka Dewi', 'Asisten Manager', '081234567802', 'rifka.dewi@example.com'),
(3, 'Hendra Putra', 'Staff Administrasi', '081234567803', 'hendra.putra@example.com'),
(4, 'Siti Nurhaliza', 'Staff Keuangan', '081234567804', 'siti.nurhaliza@example.com'),
(5, 'Asep Ramadhan', 'Marketing', '081234567805', 'asep.ramadhan@example.com'),
(6, 'Lia Wulandari', 'Customer Service', '081234567806', 'lia.wulandari@example.com'),
(7, 'Rudi Hartono', 'Teknisi', '081234567807', 'rudi.hartono@example.com'),
(8, 'Dian Kartika', 'HRD', '081234567808', 'dian.kartika@example.com'),
(9, 'Eka Pratama', 'Security', '081234567809', 'eka.pratama@example.com'),
(10, 'Gina Setiawati', 'Cleaning Service', '081234567810', 'gina.setiawati@example.com');


CREATE TABLE Mobil (
	ID_Mobil INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Merk VARCHAR(50),
    Model VARCHAR(50),
    Tahun INT(11),
    Warna VARCHAR(20),
    Harga_Sewa DECIMAL(10.2),
    Status ENUM("Tersedia", "Tidak Tersedia")
);

INSERT INTO Mobil (ID_Mobil, Merk, Model, Tahun, Warna, Harga_Sewa, Status) VALUES
(1, 'Toyota', 'Avanza', 2020, 'Putih', 350000.00, 'Tidak Tersedia'),
(2, 'Honda', 'Civic', 2019, 'Hitam', 450000.00, 'Tersedia'),
(3, 'Suzuki', 'Ertiga', 2018, 'Merah', 300000.00, 'Tidak Tersedia'),
(4, 'Mitsubishi', 'Pajero', 2021, 'Silver', 600000.00, 'Tidak Tersedia'),
(5, 'Daihatsu', 'Xenia', 2020, 'Biru', 320000.00, 'Tersedia'),
(6, 'Nissan', 'Juke', 2017, 'Kuning', 400000.00, 'Tidak Tersedia'),
(7, 'Kia', 'Rio', 2019, 'Hijau', 280000.00, 'Tersedia'),
(8, 'Hyundai', 'Tucson', 2021, 'Abu-Abu', 550000.00, 'Tersedia'),
(9, 'Ford', 'Everest', 2020, 'Coklat', 480000.00, 'Tersedia'),
(10, 'Chevrolet', 'Trailblazer', 2018, 'Oranye', 470000.00, 'Tidak Tersedia');

CREATE TABLE Perawatan (
	ID_Perawatan INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ID_Mobil INT(11),
    Tanggal DATE,
    Deskripsi TEXT,
    Biaya DECIMAL,
    FOREIGN KEY (ID_Mobil) REFERENCES Mobil (ID_Mobil)
);

INSERT INTO Perawatan (ID_Perawatan, ID_Mobil, Tanggal, Deskripsi, Biaya) VALUES
(1, 1, '2024-04-01', 'Ganti oli mesin', 300000.00),
(2, 2, '2024-04-02', 'Perbaikan rem', 500000.00),
(3, 3, '2024-04-03', 'Penggantian ban', 800000.00),
(4, 4, '2024-04-04', 'Servis rutin', 600000.00),
(5, 5, '2024-04-05', 'Ganti filter udara', 200000.00),
(6, 6, '2024-04-06', 'Penggantian aki', 700000.00),
(7, 7, '2024-04-07', 'Perbaikan AC', 400000.00),
(8, 8, '2024-04-08', 'Penggantian lampu depan', 150000.00),
(9, 9, '2024-04-09', 'Perbaikan transmisi', 1200000.00),
(10, 10, '2024-04-10', 'Penggantian wiper', 100000.00);


CREATE TABLE Transaksi (
	ID_Transaksi INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ID_Pelanggan INT(11),
    ID_Mobil INT(11),
    ID_Pegawai INT(11),
    Tanggal_Mulai DATE,
    Tanggal_Selesai DATE,
    Total_Biaya DECIMAL(10.2),
    Status_Transaksi ENUM("Selesai", "Belum Selesai"),
    FOREIGN KEY (ID_Pelanggan) REFERENCES Pelanggan (ID_Pelanggan),
    FOREIGN KEY (ID_Mobil) REFERENCES Mobil (ID_Mobil),
    FOREIGN KEY (ID_Pegawai) REFERENCES Pegawai (ID_Pegawai)
);

INSERT INTO Transaksi (ID_Transaksi, ID_Pelanggan, ID_Mobil, ID_Pegawai, Tanggal_Mulai, Tanggal_Selesai, Total_Biaya, Status_Transaksi) VALUES
(1, 1, 1, 1, '2024-05-01', '2024-05-05', 1400000.00, 'Selesai'),
(2, 2, 2, 2, '2024-05-02', '2024-05-06', 1800000.00, 'Selesai'),
(3, 3, 3, 3, '2024-05-03', '2024-05-07', 1200000.00, 'Selesai'),
(4, 4, 4, 4, '2024-05-04', '2024-05-08', 2400000.00, 'Selesai'),
(5, 5, 5, 5, '2024-05-05', '2024-05-09', 1280000.00, 'Selesai'),
(6, 6, 6, 6, '2024-05-06', '2024-05-10', 1600000.00, 'Selesai'),
(7, 7, 7, 7, '2024-05-07', '2024-05-11', 1120000.00, 'Belum Selesai'),
(8, 8, 8, 8, '2024-05-08', '2024-05-12', 2200000.00, 'Belum Selesai'),
(9, 9, 9, 9, '2024-05-09', '2024-05-13', 1920000.00, 'Belum Selesai'),
(10, 10, 10, 10, '2024-05-10', '2024-05-14', 1880000.00, 'Belum Selesai');


CREATE TABLE Pembayaran (
	ID_Pembayaran INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ID_Transaksi INT(11),
    Tanggal_Pembayaran DATE,
    Jumlah_Pembayaran DECIMAL(10.2),
    Metode_Pembayaran VARCHAR(50),
    FOREIGN KEY (ID_Transaksi) REFERENCES Transaksi (ID_Transaksi)
);

INSERT INTO Pembayaran (ID_Pembayaran, ID_Transaksi, Tanggal_Pembayaran, Jumlah_Pembayaran, Metode_Pembayaran) VALUES
(1, 1, '2024-05-05', 1400000.00, 'Transfer Bank'),
(2, 2, '2024-05-06', 1800000.00, 'Kartu Kredit'),
(3, 3, '2024-05-07', 1200000.00, 'Transfer Bank'),
(4, 4, '2024-05-08', 2400000.00, 'Kartu Kredit'),
(5, 5, '2024-05-09', 1280000.00, 'Transfer Bank'),
(6, 6, '2024-05-10', 1600000.00, 'Kartu Kredit'),
(7, 7, '2024-05-11', 1120000.00, 'Transfer Bank'),
(8, 8, '2024-05-12', 2200000.00, 'Kartu Kredit'),
(9, 9, '2024-05-13', 1920000.00, 'Transfer Bank'),
(10, 10, '2024-05-14', 1880000.00, 'Kartu Kredit');


SELECT * FROM Pelanggan;
SELECT * FROM Pegawai;
SELECT * FROM Mobil;
SELECT * FROM Perawatan;
SELECT * FROM Transaksi;
SELECT * FROM Pembayaran;


-- Nomor 1
DELIMITER //
CREATE TRIGGER After_Update_Transaksi
AFTER UPDATE ON Transaksi
FOR EACH ROW
BEGIN
    IF NEW.Status_Transaksi = "Selesai" THEN
		UPDATE Mobil
        SET STATUS = "Tersedia"
        WHERE ID_Mobil = NEW.ID_Mobil;
	END IF;
END //
DELIMITER ;

UPDATE Transaksi SET Status_Transaksi = "Selesai" WHERE ID_Transaksi = 1;
SELECT * FROM Mobil;


-- Nomor 2
CREATE TABLE Log_Pembayaran (
	ID_Log INT AUTO_INCREMENT PRIMARY KEY,
    ID_Pembayaran INT NOT NULL,
    ID_Transaksi INT NOT NULL,
    Tanggal_Pembayaran DATE NOT NULL,
    Jumlah_Pembayaran DECIMAL(10, 2) NOT NULL,
    Metode_Pembayaran VARCHAR(50) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER After_Insert_Pembayaran
AFTER INSERT ON Pembayaran
FOR EACH ROW
BEGIN
	INSERT INTO Log_Pembayaran (ID_Pembayaran, ID_Transaksi, Tanggal_Pembayaran, Jumlah_Pembayaran, Metode_Pembayaran)
    VALUES (NEW.ID_Pembayaran, NEW.ID_Transaksi, NEW.Tanggal_Pembayaran, NEW.Jumlah_Pembayaran, NEW.Metode_Pembayaran);
END //
DELIMITER ;

INSERT INTO Pembayaran (ID_Transaksi, Tanggal_Pembayaran, Jumlah_Pembayaran, Metode_Pembayaran)
VALUES (5, '2024-05-09', 1280000.00, 'Tunai');
SELECT * FROM Pembayaran;
SELECT * FROM Log_Pembayaran;


-- Nomor 3
DELIMITER //
CREATE TRIGGER Before_Insert_Transaksi
BEFORE INSERT ON Transaksi
FOR EACH ROW
BEGIN
	DECLARE Harga_Per_Hari DECIMAL(10,2);
    DECLARE Jumlah_Hari INT;
    SELECT Harga_Sewa INTO Harga_Per_Hari
    FROM Mobil
    WHERE ID_Mobil = NEW.ID_Mobil;
    SET Jumlah_Hari = DATEDIFF(NEW.Tanggal_Selesai, NEW.Tanggal_Mulai);
    SET NEW.Total_Biaya = Harga_Per_Hari * Jumlah_Hari;
END //
DELIMITER ;

INSERT INTO Transaksi (ID_Pelanggan, ID_Mobil, ID_Pegawai, Tanggal_Mulai, Tanggal_Selesai, Status_Transaksi) 
VALUES (9, 6, 1, '2024-06-06', '2024-06-08', 'Selesai');
INSERT INTO Transaksi (ID_Pelanggan, ID_Mobil, ID_Pegawai, Tanggal_Mulai, Tanggal_Selesai, Status_Transaksi) 
VALUES (4, 1, 3, '2024-06-15', '2024-06-21', 'Selesai');
SELECT * FROM Transaksi;


-- Nomor 4
CREATE TABLE Log_Hapus_Transaksi (
    ID_Log INT AUTO_INCREMENT PRIMARY KEY,
    ID_Transaksi INT NOT NULL,
    ID_Pelanggan INT NOT NULL,
    ID_Mobil INT NOT NULL,
    Tanggal_Mulai DATE NOT NULL,
    Tanggal_Selesai DATE NOT NULL,
    Total_Biaya DECIMAL(10, 2) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER After_Delete_Transaksi
AFTER DELETE ON Transaksi
FOR EACH ROW
BEGIN
    INSERT INTO Log_Hapus_Transaksi (ID_Transaksi, ID_Pelanggan, ID_Mobil, Tanggal_Mulai, Tanggal_Selesai, Total_Biaya)
    VALUES (OLD.ID_Transaksi, OLD.ID_Pelanggan, OLD.ID_Mobil, OLD.Tanggal_Mulai, OLD.Tanggal_Selesai, OLD.Total_Biaya);
END //
DELIMITER ;

DELETE FROM Transaksi WHERE ID_Transaksi = 12;
SELECT * FROM Transaksi;
SELECT * FROM Log_Hapus_Transaksi;