CREATE DATABASE Logistik_Pakaian;

USE Logistik_Pakaian;

CREATE TABLE Produk (
	ID_Produk INT(11) NOT NULL PRIMARY KEY,
    Nama_Produk VARCHAR(100),
    Kategori_Produk VARCHAR(50),
    Harga DOUBLE,
    Berat FLOAT
);

INSERT INTO Produk (ID_Produk, Nama_Produk, Kategori_Produk, Harga, Berat) VALUES
	(1, 'Kemeja Putih Polos', 'Kemeja', 150000, 0.3),
	(2, 'Celana Jeans Slim Fit', 'Celana', 250000, 0.5),
	(3, 'Gaun Floral Maxi', 'Gaun', 350000, 0.7),
	(4, 'Kaos Oblong Basic', 'Kaos', 80000, 0.2),
	(5, 'Jaket Denim Washed', 'Jaket', 300000, 0.6),
	(6, 'Rok Midi A-Line', 'Rok', 120000, 0.4),
	(7, 'Hoodie Sweater', 'Sweater', 180000, 0.5),
	(8, 'Kemeja Tartan Flannel', 'Kemeja', 200000, 0.4),
	(9, 'Celana Panjang Chino', 'Celana', 180000, 0.4),
	(10, 'Blazer Formal', 'Blazer', 400000, 0.8);

CREATE TABLE Supplier (
	ID_Supplier INT(11) NOT NULL PRIMARY KEY,
    Nama_Supplier VARCHAR(100),
    Alamat VARCHAR(255),
    Telepon CHAR(15),
    Email VARCHAR(100)
);

INSERT INTO Supplier (ID_Supplier, Nama_Supplier, Alamat, Telepon, Email) VALUES
	(1, 'PT. Amanah Textile', 'Jl. Pahlawan No. 123, Jakarta', '021-12345678', 'info@amanah-textile.com'),
	(2, 'CV. Maju Jaya Garment', 'Jl. Raya Industri No. 45, Bandung', '022-98765432', 'info@maju-jaya-garment.com'),
	(3, 'UD. Bersama Fashion', 'Jl. Merdeka No. 87, Surabaya', '031-56789012', 'info@bersama-fashion.co.id'),
	(4, 'PT. Sentosa Apparel', 'Jl. Pelangi No. 55, Semarang', '024-34567890', 'info@sentosa-apparel.com'),
	(5, 'CV. Makmur Abadi Textile', 'Jl. Jaya No. 10, Solo', '0271-2345678', 'info@makmur-abadi-textile.co.id'),
	(6, 'UD. Sejahtera Garment', 'Jl. Damai No. 20, Medan', '061-7890123', 'info@sejahtera-garment.com'),
	(7, 'PT. Lancar Jaya Fashion', 'Jl. Harmoni No. 30, Malang', '0341-8901234', 'info@lancar-jaya-fashion.com'),
	(8, 'CV. Bahagia Textile', 'Jl. Bahagia No. 5, Makassar', '0411-5678901', 'info@bahagia-textile.co.id'),
	(9, 'PT. Jaya Bersama Apparel', 'Jl. Bersama No. 3, Palembang', '0711-2345678', 'info@jaya-bersama-apparel.com'),
	(10, 'UD. Sukses Fashion', 'Jl. Sukses No. 8, Yogyakarta', '0274-7890123', 'info@sukses-fashion.co.id');

CREATE TABLE Gudang (
	ID_Gudang INT(11) NOT NULL PRIMARY KEY,
    Nama VARCHAR(100),
    Alamat VARCHAR(255)
);

INSERT INTO Gudang (ID_Gudang, Nama, Alamat) VALUES
	(1, 'Gudang Utama', 'Jl. Gatot Subroto No. 123, Jakarta'),
	(2, 'Gudang Pusat', 'Jl. Sudirman No. 45, Bandung'),
	(3, 'Gudang Sentral', 'Jl. Diponegoro No. 87, Surabaya'),
	(4, 'Gudang Logistik', 'Jl. Gajah Mada No. 55, Semarang'),
	(5, 'Gudang Distribusi', 'Jl. Pemuda No. 10, Solo'),
	(6, 'Gudang Amanah', 'Jl. Merdeka No. 20, Medan'),
	(7, 'Gudang Maju', 'Jl. Dipa No. 30, Malang'),
	(8, 'Gudang Bersama', 'Jl. Hasanuddin No. 5, Makassar'),
	(9, 'Gudang Sejahtera', 'Jl. Kapten No. 3, Palembang'),
	(10, 'Gudang Lancar', 'Jl. Pahlawan No. 8, Yogyakarta');

CREATE TABLE Stok (
	ID_Stok INT(11) NOT NULL PRIMARY KEY,
    ID_Produk INT(11),
    ID_Gudang INT(11),
    Jumlah INT(11),
    Tanggal_Update DATETIME,
    FOREIGN KEY (ID_Produk) REFERENCES Produk (ID_Produk),
    FOREIGN KEY (ID_Gudang) REFERENCES Gudang (ID_Gudang)
);

INSERT INTO Stok (ID_Stok, ID_Produk, ID_Gudang, Jumlah, Tanggal_Update) VALUES
	(1, 1, 1, 100, '2024-05-01 09:00:00'),
	(2, 2, 2, 80, '2024-05-02 09:15:00'),
	(3, 3, 3, 50, '2024-05-03 09:30:00'),
	(4, 4, 4, 120, '2024-05-04 09:45:00'),
	(5, 5, 5, 70, '2024-05-05 10:00:00'),
	(6, 6, 6, 90, '2024-05-06 10:15:00'),
	(7, 7, 7, 60, '2024-05-07 10:30:00'),
	(8, 8, 8, 110, '2024-05-08 10:45:00'),
	(9, 9, 9, 85, '2024-05-09 11:00:00'),
	(10, 10, 10, 40, '2024-05-10 11:15:00');

CREATE TABLE Karyawan (
	ID_Karyawan INT(11) NOT NULL PRIMARY KEY,
    ID_Gudang INT(11),
    Nama VARCHAR(100),
    Alamat VARCHAR(255),
    Posisi VARCHAR(50),
    Gaji DOUBLE,
    FOREIGN KEY (ID_Gudang) REFERENCES Gudang (ID_Gudang)
);

INSERT INTO Karyawan (ID_Karyawan, ID_Gudang, Nama, Alamat, Posisi, Gaji) VALUES
(1, 1, 'Budi Santoso', 'Jl. Merdeka No. 1, Jakarta', 'Manajer Gudang', 8000000),
(2, 2, 'Ani Wijaya', 'Jl. Sudirman No. 2, Bandung', 'Staf Gudang', 5000000),
(3, 3, 'Cahyo Nugroho', 'Jl. Diponegoro No. 3, Surabaya', 'Staf Gudang', 5000000),
(4, 4, 'Dewi Kurniawan', 'Jl. Gajah Mada No. 4, Semarang', 'Staf Gudang', 5000000),
(5, 5, 'Eka Setiawan', 'Jl. Pemuda No. 5, Solo', 'Staf Gudang', 5000000),
(6, 6, 'Fita Dewanti', 'Jl. Merdeka No. 6, Medan', 'Staf Gudang', 5000000),
(7, 7, 'Galih Susanto', 'Jl. Dipa No. 7, Malang', 'Staf Gudang', 5000000),
(8, 8, 'Hani Maulana', 'Jl. Hasanuddin No. 8, Makassar', 'Staf Gudang', 5000000),
(9, 9, 'Indra Wibowo', 'Jl. Kapten No. 9, Palembang', 'Staf Gudang', 5000000),
(10, 10, 'Joko Prasetyo', 'Jl. Pahlawan No. 10, Yogyakarta', 'Staf Gudang', 5000000);

CREATE TABLE Transaksi (
	ID_Transaksi INT(11) NOT NULL PRIMARY KEY,
    ID_Produk INT(11),
    ID_Supplier INT(11),
    ID_Karyawan INT(11),
    Jumlah INT(11),
    Total_Harga DOUBLE,
    Tanggal_Transaksi DATETIME,
    FOREIGN KEY (ID_Produk) REFERENCES Produk (ID_Produk),
    FOREIGN KEY (ID_Supplier) REFERENCES Supplier (ID_Supplier),
    FOREIGN KEY (ID_Karyawan) REFERENCES Karyawan (ID_Karyawan)
);

INSERT INTO Transaksi (ID_Transaksi, ID_Produk, ID_Supplier, ID_Karyawan, Jumlah, Total_Harga, Tanggal_Transaksi) VALUES
	(1, 1, 1, 1, 3, 180000, '2024-05-03 09:00:00'),
	(2, 2, 2, 2, 4, 190000, '2024-05-04 09:15:00'),
	(3, 3, 3, 3, 30, 10500000, '2024-05-05 09:30:00'),
	(4, 4, 4, 4, 60, 4800000, '2024-05-06 09:45:00'),
	(5, 5, 5, 5, 45, 13500000, '2024-05-07 10:00:00'),
	(6, 6, 6, 6, 55, 6600000, '2024-05-08 10:15:00'),
	(7, 7, 7, 7, 35, 6300000, '2024-05-09 10:30:00'),
	(8, 8, 8, 8, 70, 14000000, '2024-05-10 10:45:00'),
	(9, 9, 9, 9, 65, 11700000, '2024-05-11 11:00:00'),
	(10, 10, 10, 10, 25, 10000000, '2024-05-12 11:15:00');
    
    

-- Nomor 1
DELIMITER //
CREATE PROCEDURE TotalTransaksi (
    IN Karyawan INT,
    OUT TotalHarga DOUBLE
)
BEGIN
    SELECT SUM(Total_Harga) INTO TotalHarga
    FROM Transaksi
    WHERE ID_Karyawan = Karyawan;
END//
DELIMITER ;

CALL TotalTransaksi(2, @TotalHarga);
SELECT @TotalHarga;


-- Nomor 2
DELIMITER //
CREATE PROCEDURE LamaProduk()
BEGIN
    SELECT P.nama_produk, G.nama, DATEDIFF(CURDATE(), S.tanggal_update) AS Lama_Di_Gudang
    FROM Produk P
    JOIN Stok S ON P.ID_Produk = S.ID_Produk
    JOIN Gudang G ON S.ID_Gudang = G.ID_Gudang;
END //
DELIMITER ;

CALL LamaProduk();


-- Nomor 3
DELIMITER //
CREATE PROCEDURE Hapus_Transaksi()
BEGIN
    DELETE FROM Transaksi
    WHERE Tanggal_Transaksi >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    AND Total_Harga <= 200000;
END //
DELIMITER ;

CALL Hapus_Transaksi();


SELECT * FROM Produk;
SELECT * FROM Supplier;
SELECT * FROM Gudang;
SELECT * FROM Stok;
SELECT * FROM Karyawan;
SELECT * FROM Transaksi;